class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title
      t.string :imageSource
      t.integer :price
      t.datetime :date
      t.datetime :registerby

      t.timestamps
    end
  end
end
