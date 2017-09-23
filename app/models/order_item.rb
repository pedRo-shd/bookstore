class OrderItem < ApplicationRecord

  validates :order, presence: true
  validates :book, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :order
  belongs_to :book
end
