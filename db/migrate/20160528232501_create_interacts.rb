class CreateInteracts < ActiveRecord::Migration
  def change
    create_table :interacts do |t|
      t.string :ititle
      t.string :ibody
      t.date :idate
      t.integer :contact_id

      t.timestamps

    end
  end
end
