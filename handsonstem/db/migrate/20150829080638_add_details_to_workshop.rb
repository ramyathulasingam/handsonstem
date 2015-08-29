class AddDetailsToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :description, :string
    add_column :workshops, :startdate, :datetime
    add_column :workshops, :enddate, :datetime
  end
end
