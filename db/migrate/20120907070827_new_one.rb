class NewOne < ActiveRecord::Migration
  def up
  	add_column :webs, :status, :integer, :default =>0
  end

  def down
  end
end
