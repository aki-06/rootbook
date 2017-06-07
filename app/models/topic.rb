class Topic < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
