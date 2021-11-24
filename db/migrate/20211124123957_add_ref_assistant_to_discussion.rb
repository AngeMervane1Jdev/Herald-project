class AddRefAssistantToDiscussion < ActiveRecord::Migration[6.1]
  def change
    add_reference :discussions, :assistant, foreign_key: true
  end
end
