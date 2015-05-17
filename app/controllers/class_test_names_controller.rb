class ClassTestNamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_class_test_name, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @class_test_names = ClassTestName.all
    respond_with(@class_test_names)
  end

  def show
    respond_with(@class_test_name)
  end

  def new
    @class_test_name = ClassTestName.new
    respond_with(@class_test_name)
  end

  def edit
  end

  def create
    @class_test_name = ClassTestName.new(params[:class_test_name])
    @class_test_name.save
    respond_with(@class_test_name)
  end

  def update
    @class_test_name.update_attributes(params[:class_test_name])
    respond_with(@class_test_name)
  end

  def destroy
    @class_test_name.destroy
    respond_with(@class_test_name)
  end

  private
    def set_class_test_name
      @class_test_name = ClassTestName.find(params[:id])
    end
end
