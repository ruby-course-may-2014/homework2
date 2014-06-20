class AddTwinIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :twin_id, :string
    add_index :movies, :twin_id
  end
end
