class Vendor < ActiveRecord::Base
  include US

  has_many :items
  has_many :vendor_orders

  before_save :set_default_slug

  validates :name, presence: true #, uniqueness: true <- this blows up lots of tests?
  validates :slug, uniqueness: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: states
  validates :zip, presence: true, format: { with: /\d{5}\d*/ } 

  private

  def set_default_slug
    self.slug ||= generate_slug(self.name) 
  end

  def generate_slug(name_to_slug)
    name_to_slug.gsub(/'/, '').parameterize
  end

  def set_address
    #combine address here
    # "#{vendor.street}" + "#{vendor.city}" + "#{vendor.state}" + "#{vendor.zip}" 
  end

  def find_vendor_name(vendor_id)
    Vendor.where(id: vendor_id).first.name  
  end
end
