class Ability
  include CanCan::Ability

  # I need help with syntax here.
  def initialize(user)
    user ||= User.new # Guest account if the user does not have an account.

    if user.role? :artist
      can :create, Song
      can :update, Song do |song|
            song.try(:user_id) == current_user.id # Ryan Bates does not have id here.
            end
      can :delete, Song do |song|
            song.try(:user) == user
            end
      can :delete, Comment do |comment| # When it relates to their own song or their own comment.
            comment.try(:user) == user # I feel like an || should be use here for the other condition.
            end
      can [:update, :delete], User do |user_ability|
        user_ability.id == user.id
      end

    elsif user.role? :moderator
      can :delete, Comment
    else 
      can :read, :all
      can :create, Comment  
      can :update, Comment do |comment|
            comment.try(:user) == user 
          end
      can :delete, Comment do |comment|
            comment.try(:user) == user
          end
      can :create, User
      can :update, User do |user_ability|
        user.id == user_ability.id
      end
      can :delete, User do |user_ability|
        user.id == user_ability.id
      end 
    end
  end
end