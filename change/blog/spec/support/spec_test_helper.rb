module SpecTestHelper
  def login(user)
    session[:current_user] = user.id
  end
end
