class AddTypeToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :type, :string, default: 'Movie::Draft'
  end
end
