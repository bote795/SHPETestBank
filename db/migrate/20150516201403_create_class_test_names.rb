class CreateClassTestNames < ActiveRecord::Migration
  def change
    create_table :class_test_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
