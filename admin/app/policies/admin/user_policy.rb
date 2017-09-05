class Admin::UserPolicy < Admin::ApplicationPolicy

  def destroy?
    false
  end
end
