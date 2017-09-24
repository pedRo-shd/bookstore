class Order < ApplicationRecord

  belongs_to :person
  belongs_to :book

  validates :person, presence: true
  validates :book, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def self.create_by_cart(person_id, book)
    Book.transaction do
      order = Order.create(person_id: person_id, book_id: book.id, quantity: 1,
        value: book.value)
    end
  end
end
