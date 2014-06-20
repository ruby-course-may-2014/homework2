class AddDraftToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :draft, :boolean, default: true
  end
end
