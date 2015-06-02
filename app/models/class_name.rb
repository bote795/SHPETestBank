class ClassName < ActiveRecord::Base
  scope :at_name, ->(name){ where("name = ?", name)}
  attr_accessible :name
  validates_presence_of :name, :message => 'invalid value'
  has_many :TestEntries
  validates :name, :presence => true, :uniqueness => true
end
