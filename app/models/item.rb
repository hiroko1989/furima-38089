class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #テーブル間アソシエーション
  belongs_to :user
  has_one    :purchase

  #Active storageのアソシエーション
  has_one_attached :image

  #ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true


  #「--」を選択した場合にエラーメッセージが出現
  validates :category_id, numericality: { other_than: 0 , message: "「--」は選択できません"}
  validates :condition_id, numericality: { other_than: 0 , message: "「--」は選択できません"}
  validates :delivery_charge_id, numericality: { other_than: 0 , message: "「--」は選択できません"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "「--」は選択できません"}
  validates :shipping_date_id, numericality: { other_than: 0 , message: "「--」は選択できません"}


end