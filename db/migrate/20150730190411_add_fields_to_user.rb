class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :fio, :string
    add_column :users, :years, :integer
  end
end
