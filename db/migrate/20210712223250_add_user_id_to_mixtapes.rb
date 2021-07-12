class AddUserIdToMixtapes < ActiveRecord::Migration[6.1]
  def change
    add_column :mixtapes, :user_id, :integer
  end
end
