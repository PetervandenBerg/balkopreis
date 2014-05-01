class Blog < ActiveRecord::Base

  has_many :pictures
  has_many :kinds
  belongs_to :admin


  def kind_name
    Kind.find(self.kind_id).name
  end
end
