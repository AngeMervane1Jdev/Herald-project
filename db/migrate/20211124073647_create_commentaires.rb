class CreateCommentaires < ActiveRecord::Migration[6.1]
  def change
    create_table :commentaires do |t|
      t.text :message
      t.timestamps
      t.string :send_by
    end
  end
end
