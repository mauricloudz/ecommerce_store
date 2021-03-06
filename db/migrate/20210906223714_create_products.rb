class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :stock
      t.references :category, polymorphic: true

      t.timestamps
    end
  end
end
