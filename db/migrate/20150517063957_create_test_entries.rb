class CreateTestEntries < ActiveRecord::Migration
  def change
    create_table :test_entries do |t|
      t.string :teacher
      t.string :semester
      t.string :link
      t.belongs_to :className
      t.belongs_to :classTestName

      t.timestamps
    end
  end
end
