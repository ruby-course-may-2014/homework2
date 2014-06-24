class MoviePolicy < Struct.new(:user, :movie)
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where('draft = :d OR user_id = :u', d: false, u: user.id)
    end
  end

  def show?
    user.admin? || !movie.draft?
  end

  def create?
    user.admin?
  end
  alias_method :new?, :create?

  def update?
    user.admin? || user == movie.user
  end
  alias_method :edit?, :update?
  alias_method :publish?, :update?

end
