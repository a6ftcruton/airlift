require 'rails_helper'

RSpec.describe Vendor, :type => :model do
  let(:vendor) { create(:vendor) }

  it 'is valid' do
    expect(vendor).to be_valid
  end
  
  it 'is invalid without a name' do
    vendor.name = nil
    expect(vendor).to_not be_valid

    vendor.name = ""
    expect(vendor).to_not be_valid
  end

  it 'is invalid with a duplicate slug' do
    vendor_one = create(:vendor, name: "a", slug: "/a")
    expect(vendor_one).to be_valid
    copy_vendor = vendor_one.dup 
    expect(copy_vendor).to_not be_valid
  end

  it 'receives a default slug based on name' do
    vendor = Vendor.create(name: "Mr. John's Store")
    expect(vendor).to be_valid
    expect(vendor.slug).to eq "mr_johns_store"
  end
end
