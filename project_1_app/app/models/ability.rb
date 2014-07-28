class Ability
  include CanCan::Ability

  # I need help with syntax here.
  def initialize(user)
    user ||= User.new
    if user.role? :artist
      can :read, :all
      can :delete, :comment
      can :create, :song
      can :update, :song do |song|
            song.user.id == user.id
            end
      can :delete, :song do |song|
            song.user.id == user.id
            end
    elsif user.role? :moderator
      can :read, :all
      can :create, :comment 
      can :update, :comment do |comment|
            comment.user.id == user.id
          end
      can :delete, :comment
    else 
      can :read, :all
      can :create, :comment
      can :update, :comment do |comment|
            comment.user.id == user.id
          end
      can :delete, :comment do |comment|
            comment.user.id == user.id
          end # When it's their own comments.
    end

end