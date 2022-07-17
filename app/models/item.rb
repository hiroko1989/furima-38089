class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #テーブル間
  belongs_to :user
  has_one    :purchase

  #Active storage
  has_one_attached :image

  #Active hash
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

end
