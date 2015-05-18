class TestEntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_test_entry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @test_entries = TestEntry.all
    respond_with(@test_entries)
  end

  def totals
    @classes = Hash.new
    #go through each class
    ClassName.all.each do |classn|
      classTests=TestEntry.at_class(classn.id)
      temp=Hash.new
      temp["total"]=classTests.count
      #check how many of each testName there is for that class
      ClassTestName.all.each do |test|
        temp[test]= classTests.at_test(test.id).count
      end
      @classes[classn]=temp
    end
    @ExamNames= ClassTestName.all
    respond_with(@ExamNames, @ExamNames)
  end

  def show
    respond_with(@test_entry)
  end

  def new
    @test_entry = TestEntry.new
    respond_with(@test_entry)
  end

  def edit
  end

  def create
    @test_entry = TestEntry.new(params[:test_entry])
    @test_entry.save
    respond_with(@test_entry)
  end

  def update
    @test_entry.update_attributes(params[:test_entire])
    respond_with(@test_entry)
  end

  def destroy
    @test_entry.destroy
    respond_with(@test_entry)
  end

  private
    def set_test_entry
      @test_entry = TestEntry.find(params[:id])
    end
end
