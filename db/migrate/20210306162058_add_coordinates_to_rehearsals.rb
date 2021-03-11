class AddCoordinatesToRehearsals < ActiveRecord::Migration[6.0]
  def change
    add_column :rehearsals, :latitude, :float
    add_column :rehearsals, :longitude, :float
  end
end
