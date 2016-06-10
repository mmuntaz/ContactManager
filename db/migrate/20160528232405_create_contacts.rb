class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :cfname
      t.string :clname
      t.string :cemail
      t.date :cdob
      t.string :caddress
      t.string :cphone
      t.string :ccompany
      t.string :cindustry
      t.string :cinterest
      t.string :crelation
      t.string :cnote
      t.integer :user_id

      t.timestamps

    end
  end
end
