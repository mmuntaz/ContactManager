class Interact < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
  validates :ititle, :presence => true
  validates :idate, :presence => true
end
