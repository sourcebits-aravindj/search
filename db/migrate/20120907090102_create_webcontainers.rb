class CreateWebcontainers < ActiveRecord::Migration
  def change
    create_table :webcontainers do |t|
      t.integer :occu
      t.integer :weight
      t.references :web
      t.references :container

      t.timestamps
    end
    add_index :webcontainers, :web_id
    add_index :webcontainers, :container_id
  end
end
