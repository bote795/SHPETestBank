class DropboxController < ApplicationController
  require 'dropbox_sdk'  
  
    
  def authorize
    
  end

  def get_tests
  end

  def update_database
    dropbox = DropboxClient.new(ENV["dropbox_sdk_token"])
    
    puts "LINKED account:", dropbox.account_info().inspect

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
    
    @parsed_course = Array.new
    reversed = "/Archive/TEST BANK/Filed/".reverse.upcase
    @courses.each do |item|
      temp = item.reverse!.upcase!.chomp(reversed).reverse!
      @parsed_course.push(temp.slice(/^\w{4}/) + " "+ temp.slice(/\d{3}/))
    end
    
    



    #puts "METADATA:  ", @root_metadata.inspect

    #contents, metadata = client.get_file_and_metadata('/magnum-opus.txt')
    #open('magnum-opus.txt', 'w') {|f| f.puts contents }
  end
end
