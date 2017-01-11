class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.id
      can [:new, :create, :index], [Group, Event, Review]
      can [:show, :edit, :update], Group, group_members: {user_id: user.id}
      can [:edit, :update], Event, user_id: user.id
      can :show, Event, group_members: {user_id: user.id}
      can :show, Event, rsvps: {user_id: user.id}
      can [:edit, :update], Rsvp, user_id: user.id
      can :create, GroupMember, group: {group_members: {user_id: user.id}}
      can :destroy, GroupMember, user_id: user.id
      can :index, :dashboard
      can :index, :search
    end

  end
end
