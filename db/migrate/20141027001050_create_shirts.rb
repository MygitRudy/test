class CreateShirts < ActiveRecord::Migration
  def change
    create_table :shirts do |t|
      t.integer :shoulder
      t.integer :chest
      t.integer :waist
      t.integer :armhole
      t.integer :length
      
      t.references :user, index: true

      t.timestamps
    end
  end
end
