RSpec.describe VendorOrder, :type => :model do
 let(:vendor_order) { VendorOrder.create(order_id: 1)} 

 describe 'vendor order' do
   it 'is valid' do
     expect(vendor_order).to be_valid
   end

   it 'is associated with an order' do
   end
 end
end
