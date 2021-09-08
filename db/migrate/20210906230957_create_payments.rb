class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name
      t.references :payable, polymorphic: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
