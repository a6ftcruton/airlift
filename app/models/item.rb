class Item < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates :categories, presence: true
  has_many :line_items
  has_many :orders, through: :line_items

	has_many :item_categories
	has_many :categories, through: :item_categories

	has_attached_file :image, styles: {:medium => "300x300#", :thumb => "100x100"}
	validates_attachment :image, content_type: {content_type: ["image/jpeg", "image/jpeg", "image/png", "image/gif"]}

	scope :active, -> {where(active: true)}

	def active?
		self.active == true
	end
end
