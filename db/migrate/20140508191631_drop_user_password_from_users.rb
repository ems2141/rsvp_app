class DropUserPasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user_password
  end
end
