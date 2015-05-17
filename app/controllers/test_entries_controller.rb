class TestEntriesController < ApplicationController
  before_filter :set_test_entry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @test_entries = TestEntry.all
    respond_with(@test_entries)
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
