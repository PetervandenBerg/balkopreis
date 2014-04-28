class Blog < ActiveRecord::Base

  has_many :pictures
  has_many :kinds
  belongs_to :admin

end
