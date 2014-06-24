class AddDraftIdToMovies < ActiveRecord::Migration
  def change
    add_reference :movies, :draft, index: true
  end
end
