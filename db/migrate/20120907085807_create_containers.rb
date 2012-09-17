class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
