class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name_transaction
      t.integer :value
      t.date :date_transaction
      t.boolean :situation
      t.text :description
      

      t.timestamps
    end
  end
end
