class Person < ApplicationRecord
  include ImageSaver

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, allow_blank: true, allow_nil: true,
                    uniqueness: true,
                    format: { with: /\A[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}\z/ }
  validates :born_at, presence: true
  validate  :age_limit
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }

  scope :admins,    -> { where(admin: true) }
  scope :recent,    ->(days = 7) { where('created_at >= ?', days.days.ago) }
  default_scope     -> { order(:name) }

  has_secure_password

  has_many :books, dependent: :restrict_with_exception
  has_many :categories, -> { distinct }, through: :books
  has_one :image, dependent: :destroy, as: :imageable
  has_many :orders

  def self.auth(email, senha)
    person = Person.where(email: email).first
    person && person.authenticate(senha) ? person : nil
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def age_limit
    if born_at.nil? || Date.current.year - born_at.year < 16
      errors.add(:born_at, "Deve ser maior de 16 anos")
      throw(:abort)
    end
  end
end
