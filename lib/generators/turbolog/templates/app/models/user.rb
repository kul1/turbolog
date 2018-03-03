class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
    ## Added
  field :activated, type: Boolean, default: false
  field :activated_at, type: DateTime

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
