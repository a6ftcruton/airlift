class VendorOrder
  attr_accessor :vendor, :line_items

  def initialize(order, vendor, line_items)
    @vendor = vendor
    @line_items = line_items
  end
end
