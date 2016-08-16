class AddNameToProjections < ActiveRecord::Migration[5.0]
  def change
    add_column :projections, :name, :string
  end
end
