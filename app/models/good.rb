class Good < ApplicationRecord
  belongs_to :category
  validates_presence_of :name
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end

