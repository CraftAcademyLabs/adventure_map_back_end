class Admin::UserPolicy < Admin::ApplicationPolicy

  def destroy?
    true
  end
end
