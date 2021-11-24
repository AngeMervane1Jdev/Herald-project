class CreateCommentaires < ActiveRecord::Migration[6.1]
  def change
    create_table :commentaires do |t|
      t.text :message
      t.timestamps
    end
    add_reference :commentaires, :discussion, foreign_key: true
    add_reference :commentaires, :user, foreign_key: true
  end
end
