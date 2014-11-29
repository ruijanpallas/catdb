class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
      t.string :picture
      t.string :race
      t.string :gender

      t.timestamps
    end
  end
end
