class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :tape_id
      t.text :context

      t.timestamps
    end
  end
end
