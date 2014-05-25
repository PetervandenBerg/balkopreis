class Kind < ActiveRecord::Base
  belongs_to :blogs
  belongs_to :pictures

  validates_presence_of :name
end