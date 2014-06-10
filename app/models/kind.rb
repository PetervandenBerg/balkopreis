class Kind < ActiveRecord::Base
  belongs_to :blogs
  belongs_to :pictures

  validates_presence_of :name
  validates :name, format: { without: /\s/ }
end