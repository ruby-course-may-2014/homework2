class AddUserIdToMovies < ActiveRecord::Migration
  def change
    add_reference :movies, :user, index: true

    Movie.update_all("user_id = #{User.first.id}")
  end
end
