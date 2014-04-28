class Kind < ActiveRecord::Base
  belongs_to :blogs
  belongs_to :pictures
end