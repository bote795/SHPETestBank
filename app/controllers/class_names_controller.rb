class ClassNamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_class_name, only: [:show, :edit, :update, :destroy]
  before_filter :privileges
  respond_to :html
  
  require 'dropbox_sdk'  

  def index
    @class_names = ClassName.all
    respond_with(@class_names)
  end

  def show
    respond_with(@class_name)
  end

  def new
    @class_name = ClassName.new
    respond_with(@class_name)
    
  end

  def edit
  end

  def create
    @class_name = ClassName.new(params[:class_name])
    @class_name.save
    respond_with(@class_name)
  end

  def update
    @class_name.update_attributes(params[:class_name])
    respond_with(@class_name)
  end

  def destroy
    @class_name.destroy
    respond_with(@class_name)
  end

  def dropbox_import
    dropbox = DropboxClient.new(ENV["dropbox_sdk_token"])
    #puts "LINKED account:", dropbox.account_info().inspect
    #file = open('working-draft.txt')
    #response = client.put_file('/magnum-opus.txt', file)
    #puts "uploaded:", response.inspect

    @courses = Array.new

    #get the path of all the folders inside the test bank
    @root_metadata = dropbox.metadata('/Archive/TEST BANK/Filed/', '25000', 'true')
    @root_metadata["contents"].each do |item|
      @department = dropbox.metadata(item["path"], '25000', 'true')
      
      #get the path of all folders inside courses(department names)
      @department["contents"].each do |child|
        @courses.push(child["path"])
      end     
    end
    

    #strip string into course names
    @parsed_courses = Array.new
    reversed = "/Archive/TEST BANK/Filed/".reverse.upcase
    @courses.each do |item|
      temp = item.reverse!.upcase!.chomp(reversed).reverse!
      @parsed_courses.push(temp.slice(/^\w{4}/) + " "+ temp.slice(/\d{3}/))
    end
     
    #insert courses into database
    @parsed_courses.each do |course|
      if (ClassName.create(name: course))
        database_updated = true
      end
    end
    
    flash[:notice] = "Database has been updated"
    redirect_to class_names_path

  end

  private
    def set_class_name
      @class_name = ClassName.find(params[:id])
    end
end
