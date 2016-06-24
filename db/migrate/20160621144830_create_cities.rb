class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.text :name
      t.text :country
      t.text :description

      t.timestamps null: false
    end
  end
end
