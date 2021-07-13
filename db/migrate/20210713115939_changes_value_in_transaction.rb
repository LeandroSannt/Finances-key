class ChangesValueInTransaction < ActiveRecord::Migration[6.1]
  def up
  change_column :transactions, :value, :real
end
end
