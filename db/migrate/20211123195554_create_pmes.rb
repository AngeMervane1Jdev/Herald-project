class CreatePmes < ActiveRecord::Migration[6.1]
  def change
    create_table :pmes do |t|
      t.string :designation
      t.text :raison
      t.string :sector
      t.string :email
      t.string :address
      t.string :state
      t.string :status
      t.string :contact

      t.timestamps
    end
    add_index :pmes, :email,unique: true
    add_index :pmes, :designation,unique: true
    add_reference :pmes, :user, foreign_key: true
  end
end
