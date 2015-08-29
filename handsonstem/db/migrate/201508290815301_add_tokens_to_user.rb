class AddTokensToUser < ActiveRecord::Migration
  def change
    add_column :users, :eventbriteAuthToken, :string
    add_column :users, :linkedinAuthToken, :string
    add_column :users, :name, :string
  end
end
