class Gram < ApplicationRecord
	mount_uploader :picture, PictureUploader
	validates :picture, presence: true

	belongs_to :user
	has_many :comments

	def breeds
		breeds = []
		CSV.foreach('app/assets/breeds/breeds.csv', encoding: 'iso-8859-1:utf-8') do |row|
			breeds << row
		end
		return breeds
	end

end
