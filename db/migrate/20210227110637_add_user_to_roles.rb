class AddUserToRoles < ActiveRecord::Migration[6.0]
  def change
    add_reference :roles, :user, foreign_key: true
  end
end
