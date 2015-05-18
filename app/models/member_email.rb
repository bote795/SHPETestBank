class MemberEmail < ActiveRecord::Base
  attr_accessible :email
  validates_presence_of :email, :message => 'blank invalid value'
end
