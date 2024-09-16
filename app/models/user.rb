class User < ApplicationRecord
  
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private

  def password_required?
    password_digest.nil? || !password.blank?
  end
end
