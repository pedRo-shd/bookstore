class Order < ApplicationRecord

  has_many :order_items
  belongs_to :person
  validates :person, presence: true

  def total
    order_items.reduce(0) do |memo, item|
      memo += item.quantity * item.value
      memo
    end
  end
end
