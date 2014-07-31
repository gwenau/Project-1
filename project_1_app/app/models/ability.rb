class Ability
  include CanCan::Ability

  # I need help with syntax here.
  def initialize(user)
    user ||= User.new # Guest account if the user does not have an account.

    if user.role? :admin
      can :manage, :all
      can :create, User
    elsif user.role? :moderator
      can :read, :all
      can :create, User
      can :update, User do |user_ability|
        user_ability.id == user.id
      end
      can :create, Comment 
      can :update, Comment do |comment| 
            comment.user == user
          end
      can :delete, Comment
    elsif user.role? :artist
      can :read, :all
      can :create, User
      can :update, User do |user_ability|
        user_ability.id == user.id
      end
      can :create, Song
      can :update, Song do |song|
            song.user_id == user.id 
            end
      # This seems to be working as well.
      can :delete, Song do |song|
            song.try(:user) == user
            end
      can :create, Comment 
      can :delete, Comment do |comment| 
            # comment.user.id == user.id
            comment.song.user.id = user.id
          end
    else 
      can :read, :all
      can :create, Comment  
      can [:update, :delete], Comment do |comment|
            comment.try(:user) == user
          end
    end
  end
end