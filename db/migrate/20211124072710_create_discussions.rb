class CreateDiscussions < ActiveRecord::Migration[6.1]
  def change
    create_table :discussions do |t|
      t.string :type
      t.string :titre
      t.timestamps
    end
    add_reference :discussions, :user, foreign_key: true
  end
end
