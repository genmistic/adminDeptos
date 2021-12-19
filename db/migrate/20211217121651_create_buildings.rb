class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.string :nombre
      t.string :direccion
      t.string :ciudad
      t.string :region

      t.timestamps
    end
  end
end
