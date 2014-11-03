#class MenuPdf < Prawn::Document
#  attr_reader :categories,
#              :vegetarian,
#              :url
#
#  def initialize(root_url, reference:)
#    super()
#    @categories = Category.includes(:items)
#    @vegetarian = categories.where(title: "vegetarian").first
#    @url = root_url
#    font("Courier")
#
#    header
#    offer_download unless reference == "pdf"
#    body
#    footer
#  end
#
#  def header
#    image "#{Rails.root}/app/assets/images/caussa_logo_h.png", position: :center, scale: 0.45
#  end
#
#  def offer_download
#    styles = { size: 10, inline_format: true }
#
#    y_position = cursor + 25
#    bounding_box([400, y_position], width: 75, height: 25) do 
#      text "<color rgb='#b03060'><link href='#{url + 'menu.pdf?disposition=attachment&reference=pdf'}'>click here to download</link></color>", styles
#    end
#  end
#
#  def body
#    styles = { size: 12, style: :bold, indent_paragraphs: 20 }
#
#    move_down 10
#    pad_bottom(5) { text "small plates", styles }
#
#    table_content(category_items("small plates"))
#
#    move_down 10
#    pad_bottom(5) { text "soup & salads", styles }
#    table_content(category_items("small plates"))
#
#    move_down 10
#    pad_bottom(5) { text "flat breads", styles }
#    table_content(category_items("small plates"))
#
#    move_down 10
#    pad_bottom(5) { text "entree", styles }
#    table_content(category_items("small plates"))
#  end
#
#  def footer
#    styles = { size: 9, align: :center }
#
#    move_down 10
#    text "call 303.525.5555 to place an order for pickup or delivery", styles
#
#    move_down 5
#    text "Pearl Street, Boulder, CO", styles
#  end
#
#  private
#
#    def category_items(category)
#      categories.where(title: category).first.items
#    end
#
#    def table_content(items)
#      table product_rows(items), position: :center, cell_style: { inline_format: true, padding: 5, borders: [] } do
#        self.row_colors = ['DDDDDD','FFFFFF']
#        self.column_widths = [400, 50]
#      end
#    end
#
#    def product_rows(items)
#      veg_mark = "<color rgb='006600'><b>Vegetarian</b></color>"
#
#      items.map do |item|
#        ["<font size='8'><i>#{item.title}</i>  #{veg_mark if item.vegetarian?}</font>", 
#         "<font size='8'>#{item.price}</font>"
#        ]
#      end
#    end
#
#end
