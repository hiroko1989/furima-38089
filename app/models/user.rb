class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :ruby_family_name, presence: true,format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' }
  validates :ruby_first_name, presence: true,format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' }
  validates :birth_date, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX,message: '半角の英字と数字の両方を含めて設定してください'

end
