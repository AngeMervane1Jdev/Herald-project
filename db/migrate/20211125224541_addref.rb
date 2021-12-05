class Addref < ActiveRecord::Migration[6.1]
  def change
    add_reference :commentaires, :discussion, foreign_key: true
  end
end
