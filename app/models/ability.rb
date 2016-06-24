class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Post, user_id: user.id
    can :manage, User, user_id: user.id
  end
end
