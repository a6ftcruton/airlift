class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  has_one :vendor, through: :item

  validates :item, presence: true
  validates :order, presence: true
end
