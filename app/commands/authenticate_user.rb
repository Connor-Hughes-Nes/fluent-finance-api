# define a command class
class AuthenticateUser
  # put SimpleCommand before the class' ancestors chain
  prepend SimpleCommand
  include ActiveModel::Validations

  # optional, initialize the command with some arguments
  def initialize(email, password, role)
    @email = email
    @password = password
    @role = role
  end

  # mandatory: define a #call method. its return value will be available
  #            through #result
  def call
    if (user = User.find_by(email: @email)&.authenticate(@password))
      return user
    else
      errors.add(:base, :failure)
    end
    nil
  end
end