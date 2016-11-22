class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :about, :text
  end
end
