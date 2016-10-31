class Good < ApplicationRecord
  def status_uncheck
    self.status = nil
    self.save
  end
  has_many :comments, :dependent => :destroy
  belongs_to :user
  belongs_to :category
  validates_presence_of :name
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://pic.pimg.tw/rieszliu/1174375311.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end

