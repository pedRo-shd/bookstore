class Book < ApplicationRecord
  include ImageSaver

  validates :title, presence: true, length: { maximum: 100 }
  validates :published_at, presence: true
  validates :text, presence: true
  validates :value, presence: true, numericality: { less_than_or_equal_to: 99999999.99 }
  validates :person, presence: true

  belongs_to :person
  has_and_belongs_to_many :categories
  has_many :order, dependent: :destroy
  has_one :image, dependent: :destroy, as: :imageable

  def self.search(term)
    op = Rails.env.production? ? 'ilike' : 'like'
    where("title #{op} ?", "%#{term}%")
  end

end
