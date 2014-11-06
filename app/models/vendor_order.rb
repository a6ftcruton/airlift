class VendorOrder
  include ItemQuantity

  attr_accessor :vendor, :line_items

  def initialize(order, vendor, line_items)
    @vendor = vendor
    @line_items = line_items
  end

  def line_item_groups
    line_items.group_by(&:item_id)

  end

end
