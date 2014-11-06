RSpec.describe VendorOrder, :type => :model do
 let(:vendor_order) { VendorOrder.create(vendor_id: 1, order_id: 1)} 

 describe 'vendor order' do

#   it 'is valid' do
#     expect(vendor_order).to be_valid
#   end
#
#   it 'is invalid without an order_id' do
#     vendor_order.order_id = nil
#     expect(vendor_order).to_not be_valid
#   end
#
#   it 'is invalid without a vendor_id' do
#     vendor = Vendor.create(id: 1, name: 'a store')
#     vendor_order.order_id = 1
#     vendor_order.vendor_id = nil
#     expect(vendor_order).to_not be_valid
#   end
#
#   xit 'is associated with an order' 
#   xit 'is created automatically when an order is created'
#
 end
end
