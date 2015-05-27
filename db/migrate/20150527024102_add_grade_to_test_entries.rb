class AddGradeToTestEntries < ActiveRecord::Migration
  def change
    add_column :test_entries, :grade, :int
  end
end
