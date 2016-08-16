class CreateProjections < ActiveRecord::Migration[5.0]
  def change
    create_table :projections do |t|
      t.string :movie
      t.text :address
      t.date :date
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
