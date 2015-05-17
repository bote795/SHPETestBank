class TestEntry < ActiveRecord::Base
  attr_accessible :link, :semester, :teacher, :className_id , :classTestName_id
  belongs_to :ClassName
  belongs_to :ClassTestName
  validates_presence_of :link, :message => 'blank invalid value'
end
