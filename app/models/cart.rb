class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  #
  has_many :line_items


  monetize :total_cents

  def total_cents
    line_items.sum(&:total)
  end

end
