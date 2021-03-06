class TestEntry < ActiveRecord::Base
  scope :at_test, ->(test_id){ where("\"classTestName_id\" = ?", test_id)}
  scope :at_class, ->(class_id){ where("\"className_id\" = ?", class_id)}
  scope :at_name, ->(name){ where("name = ?", name)}
  attr_accessible :link, :semester, :teacher, :className_id , :classTestName_id, :grade
  belongs_to :ClassName
  belongs_to :ClassTestName
  validates_presence_of :link, :message => 'blank invalid value'
end
