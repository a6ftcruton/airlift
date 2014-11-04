class VendorOrderItem < ActiveRecord::Base
  belongs_to :vendor_order
  belongs_to :item
end
