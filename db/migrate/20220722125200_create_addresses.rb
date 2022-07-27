class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user,         null: false, foreign_key: true
      t.string     :post_number,      null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :block,         null: false
      t.string     :building
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
