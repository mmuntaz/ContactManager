class Contact < ActiveRecord::Base
  has_many :interacts
  belongs_to :user
  validates :caddress, :presence => true
  validates :clname, :presence => true, :uniqueness => { :scope => :cfname }
  validates :cfname, :presence => true
end
