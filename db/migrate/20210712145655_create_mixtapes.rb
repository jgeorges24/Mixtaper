class CreateMixtapes < ActiveRecord::Migration[6.1]
  def change
    create_table :mixtapes do |t|
      t.string :title
      t.string :artist
      t.integer :tracks
      t.string :genre
      t.string :artcover
      t.integer :likes
      t.string :features

      t.timestamps
    end
  end
end
