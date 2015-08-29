class AddEventUrlToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :eventUrl, :string
  end
end
