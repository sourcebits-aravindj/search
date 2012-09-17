class CreateWebs < ActiveRecord::Migration
  def change
    create_table :webs do |t|
      t.string :word

      t.timestamps
    end
  end
end
