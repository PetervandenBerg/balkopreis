class Picture < ActiveRecord::Base
  belongs_to :blog, :dependent => :destroy
  belongs_to :admin

  has_attached_file :image, styles: { medium: "320x240#"}
  validates_attachment :image, presence: true,
                          content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                          size: { less_than: 5.megabytes }
end
