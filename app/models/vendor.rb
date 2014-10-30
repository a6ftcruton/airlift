class Vendor < ActiveRecord::Base
  has_many :items
  before_save :set_default_slug

  validates :name, presence: true
  validates :slug, uniqueness: true

  private

  def set_default_slug
    self.slug ||= generate_slug(self.name) 
  end

  def generate_slug(name_to_slug)
    name_to_slug.gsub(/'/, '').parameterize
  end
end
