class MoviePolicy < Struct.new(:user, :movie)
  def create?
    user.admin?
  end
end
