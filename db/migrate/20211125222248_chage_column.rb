class ChageColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :discussions, :type, :category
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
