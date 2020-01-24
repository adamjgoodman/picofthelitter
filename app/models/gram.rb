class Gram < ApplicationRecord
	mount_uploader :picture, PictureUploader
	validates :picture, presence: true
	belongs_to :user
	has_many :comments

end
