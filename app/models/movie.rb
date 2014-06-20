class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :rating, presence: true,
                     inclusion: {in: ['G','PG','PG-13','R', 'NC-17'], allow_blank: true }
  validates :release_date, presence: { message: "looks bad"}

  scope :list, ->(options) {
    res = all
    res = res.where(rating: options[:rating]) if options.key? :rating
    res = res.order(options[:order]) if options.key? :order
    res
  }

  before_validation :generate_twin_id, on: :create

  def self.all_ratings
    all.map(&:rating).uniq
  end

  def generate_twin_id
    self.twin_id = SecureRandom.uuid
  end

end
