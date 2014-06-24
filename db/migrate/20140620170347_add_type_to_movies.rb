class AddTypeToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :type, :string
  end
end
