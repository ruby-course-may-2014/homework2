class MoviePolicy < Struct.new(:user, :movie)
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
end
