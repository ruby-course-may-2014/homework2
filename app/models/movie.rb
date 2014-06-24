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
  scope :published , -> {
    where.not(type: 'Movie::Draft')
  }

  has_one :draft, class_name: 'Movie::Draft'

  def self.all_ratings
    all.map(&:rating).uniq
  end

  def update_attributes_with_draft(params)
    if draft?
      update_attributes(params)
    else
      create_draft(params).persisted?
    end
  end

  def draft?
    type == 'Movie::Draft'
  end

  class Published < Movie
    has_one :draft, class_name: 'Movie::Draft', foreign_key: :draft_id
  end

  class Draft < Movie
    belongs_to :origin, class_name: 'Movie::Published', foreign_key: :draft_id

    def publish!
      (origin || build_origin).update_attributes self.attributes.without(:id)
      destroy
    end
  end

end
