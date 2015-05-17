class ClassTestName < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name, :message => 'invalid value'
  has_many :TestEntries
end
