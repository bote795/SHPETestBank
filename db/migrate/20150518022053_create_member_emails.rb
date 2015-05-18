class CreateMemberEmails < ActiveRecord::Migration
  def change
    create_table :member_emails do |t|
      t.string :email

      t.timestamps
    end
  end
end
