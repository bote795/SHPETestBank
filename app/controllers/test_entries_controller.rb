class TestEntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_test_entry, only: [:show, :edit, :update, :destroy]
  before_filter :privileges, only: [:show, :edit, :update, :destroy, :index, :create, :new]
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

  def detail
    @class_name=ClassName.find(params[:id])
    @tests=TestEntry.at_class(params[:id])
    respond_with(@class_name, @tests)
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

  def batch_insert
    #front end view
  end

  def insert_all
      string_of_TestEntries=params[:test][:tests]
      array_of_TestEntries =string_of_TestEntries.split( /\r?\n/ )
      array_of_TestEntries.each do |line| 
        if not line.blank?
          array_field_test_entry= line.split(',')
          TestEntry.create(link: array_field_test_entry[0], semester: array_field_test_entry[1].strip,
                         teacher: array_field_test_entry[2].strip,
                         grade: array_field_test_entry[3].to_i,
                         className_id: ClassName.at_name(array_field_test_entry[4].strip)[0].id, 
                         classTestName_id: ClassTestName.at_name(array_field_test_entry[5].strip)[0].id
                         )
        end
      end
      redirect_to test_entries_path
  end

  private
    def set_test_entry
      @test_entry = TestEntry.find(params[:id])
    end
end
