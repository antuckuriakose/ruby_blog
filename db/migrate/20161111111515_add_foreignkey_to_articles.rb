class AddForeignkeyToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :articles, :users
  end
end
