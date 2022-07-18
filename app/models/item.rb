class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #テーブル間アソシエーション
  belongs_to :user
  #has_one    :purchase

  #Active storageのアソシエーション
  has_one_attached :image

  #ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :title, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :delivery_charge_id, presence: true
    validates :prefecture_id, presence: true
    validates :shipping_date_id, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true }
  end
  
  #「--」を選択した場合に保存できない
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end