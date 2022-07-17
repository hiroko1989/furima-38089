class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #テーブル間アソシエーション
  belongs_to :user
  has_one    :purchase

  #Active storageのアソシエーション
  has_one_attached :image

  #Active hashのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  #「--」を選択した場合にエラーメッセージが出現
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :deliverly_charge_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 0 , message: "can't be blank"}


end