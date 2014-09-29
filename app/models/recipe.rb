class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :food_items, through: :ingredients
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :fans, through: :favorites, source: :user
	

	has_attached_file :image, {
			styles: {
				medium: '480x480>',
				square: '480x480#',
				thumb: '100x100>'
			},
			url: "/system/:hash.:extension",
	    hash_secret: "longSecretString" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/	

	accepts_nested_attributes_for :ingredients, 
		allow_destroy: true,
  		reject_if: proc { |attributes| attributes['volume'].blank? }

end
