class AddHourToProjections < ActiveRecord::Migration[5.0]
  def change
    add_column :projections, :hour, :datetime
  end
end
