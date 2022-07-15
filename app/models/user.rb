class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :ruby_family_name, presence: true,format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' }
  validates :ruby_first_name, presence: true,format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' }
  validates :birth_date, presence: true


end
