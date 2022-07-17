class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title        null: false
      t.text :description              null: false
      t.text :category_id              null: false
      t.string :condition_id           null: false
      t.string :delivery_charge_id     null: false
      t.string :prefecture_id          null: false
      t.string :shipping_date_id       null: false
      t.integer :price                 null: false
      t.use :references                null: false
      t.timestamps
    end
  end
end
