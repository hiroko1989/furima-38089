class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :ruby_family_name, presence: true
  validates :ruby_first_name, presence: true
  validates :birth_date, presence: true


end
