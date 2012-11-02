class LineItem < ActiveRecord::Base

  attr_accessible :price, :product, :quantity

  belongs_to :cart
  belongs_to :product


  before_create :save_price

  def total_cents
    price.present? ? quantity * price : 0
  end

  private

    def save_price
      self.price = product.price
    end

end
