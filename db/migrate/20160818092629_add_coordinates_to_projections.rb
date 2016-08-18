class AddCoordinatesToProjections < ActiveRecord::Migration[5.0]
  def change
    add_column :projections, :latitude, :float
    add_column :projections, :longitude, :float
  end
end
