class ApplicationPolicy
  attr_reader :user, :record


  def initialize(user, record)
    raise Pundit::NotAuthorizedError unless user    
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end


  def loan_officers_only
      (@user.instance_of?(Admin) || @user.instance_of?(Accountant) || @user.instance_of?(LoanManager))  && has_profile?
  end


  def has_profile?
      @user.public_send("#{@user.class.name.underscore}_profile").present?
  end

end
