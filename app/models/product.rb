class Product < ApplicationRecord
  validates :title, :price, stock_quantity: true
end
