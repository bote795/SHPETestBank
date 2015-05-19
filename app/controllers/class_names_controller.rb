class ClassNamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_class_name, only: [:show, :edit, :update, :destroy]
  before_filter :privileges
  respond_to :html

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

  private
    def set_class_name
      @class_name = ClassName.find(params[:id])
    end
end
