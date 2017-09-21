class Person < ApplicationRecord

  has_secure_password
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true, length: { maximum: 50 }
  validates :born_at, presence: true
  validate :age_limit

  validates :email, allow_blank: true, allow_nil: true, uniqueness: true,
    format: {
      with: /\A[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}\z/
  }

  def self.auth(email, senha)
    person = Person.where(email: email).first
    person && person.authenticate(senha) ? person : nil
  end

  private


  def age_limit
    if self.born_at.nil? || Date.current.year - self.born_at.year < 16
      errors.add(:born_at, 'tem que ser maior que 16 anos')
      throw(:abort)
    end
  end
end
