class AddTransactionToCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :transaction, null: true, foreign_key: true
  end
end
