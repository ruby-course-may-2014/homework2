class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :rating, presence: true,
                     inclusion: {in: ['G','PG','PG-13','R', 'NC-17'], allow_blank: true }
  validates :release_date, presence: { message: "looks bad"}


  def self.all_ratings
    Movie.select(:rating).distinct.pluck(:rating)
  end

end
