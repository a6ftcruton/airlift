class VendorOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :vendor
  has_many :line_items
  has_many :vendor_order_items
  has_many :items, through: :vendor_order_items

  validates :order_id, presence: true
  validates :vendor_id, presence: true
end
