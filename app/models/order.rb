class Order < ActiveRecord::Base
  include US
  include ItemQuantity

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :vendor_orders

  validates :items, presence: true, on: :create
  validates :user, presence: true
  validates :status, inclusion: { in: :statuses }
  validates :exchange, inclusion: { in: :exchanges }
  validates :street_number,
            :street,
            :city,
            presence: true, if: :delivery?
  validates :state, inclusion: states, if: :delivery?
  validates :zip, format: { with: /\d{5}\d*/ }, if: :delivery?

  def delivery?
    exchange == 'delivery'
  end

  def statuses
    ['ordered', 'completed', 'cancelled', 'paid']
  end

  def exchanges
    ['pickup', 'delivery']
  end

  def add_item(item_id)
    self.items << Item.find(item_id)
  end

  def update_quantity(item_id, quantity)
    self.items.delete(item_id)
    quantity.to_i.times { add_item(item_id) }
  end

  def populate(cart, current_user)
    cart.items_to_quantities.to_h.each do |item, quantity|
      quantity.times { self.items << item }
    end

	  self.user = current_user
  end

  def group_by_vendor
    self.items.group_by(&:vendor_id)
  end

  def create_vendor_orders
    self.group_by_vendor.each do |vendor_id, items|
      vendor_order = VendorOrder.create(
        vendor_id: vendor_id,
        order_id: self.id, 
        items: items
      )
    end
  end
end
