class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|

      t.timestamps
    end
  end
end
