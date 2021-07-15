class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :mixtape_id
      t.text :context

      t.timestamps
    end
  end
end
