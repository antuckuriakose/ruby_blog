class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif  user.has_role? :moderator
      can [:read, :update,:create], Article
      can [:read,:create ,:update,:destroy],Article, :user_id => user.id
    else
      can [:read, :create], Article
      can [:update, :destroy], Article, :user_id => user.id
      can [:destroy], Comment, :commenter => user.name
      # can [:destroy], Article, :user_id=>user.id

    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  # def current_ability
  #   @current_ability ||= Ability.new(current_user)
  #   if @current_ability.has_role? :admin
  #     can :manage, :all
  #   else
  #     can :read, :update, :destroy , Article , user_id: @current_ability.id
  #   end
  # end

end
