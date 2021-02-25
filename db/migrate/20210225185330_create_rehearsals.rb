class CreateRehearsals < ActiveRecord::Migration[6.0]
  def change
    create_table :rehearsals do |t|
      t.datetime :date_time
      t.string :address
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
