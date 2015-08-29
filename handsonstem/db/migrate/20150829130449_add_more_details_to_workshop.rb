class AddMoreDetailsToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :skills_taught, :string
    add_column :workshops, :equiptment_needed, :string
    add_column :workshops, :friendliness, :integer
  end
end
