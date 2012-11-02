class Product < ActiveRecord::Base

  attr_accessible :name, :price

  has_many :line_items

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true

  validates_presence_of :name, :price
  validates_numericality_of :price
  validates_uniqueness_of :name

end
