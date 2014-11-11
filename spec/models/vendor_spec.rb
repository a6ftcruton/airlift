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
    vendor = Vendor.create(name: "Mr. John's Store", street:"1 A", city: "here", state: "CA", zip: "12345")
    expect(vendor).to be_valid
    expect(vendor.slug).to eq "mr-johns-store"
  end

  it 'is invalid without a street address' do
    vendor.street = nil
    expect(vendor).to_not be_valid
  end
  
  it 'is invalid without a city' do
    vendor.city = nil
    expect(vendor).to_not be_valid
  end

  it 'is invalid without a state' do
    vendor.state = nil
    expect(vendor).to_not be_valid
  end

  it 'is invalid without a zipcode' do
    vendor.zip = nil
    expect(vendor).to_not be_valid
  end

  it 'is invalid without a legitimate state' do
    vendor.state = 'AA'
    expect(vendor).to_not be_valid
  end

  it "is invalid without a proper zip code" do
    vendor.zip = 'abc'
    expect(vendor).to_not be_valid

    vendor.zip = '1234'
    expect(vendor).to_not be_valid
  end

  it 'formats address correctly from supplied address data' do
    address = vendor.set_address
    expect(address).to eq "101 Caramel Lane Raleigh, NC 27519"
  end

end
