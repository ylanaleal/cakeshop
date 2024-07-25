class AddUserIdToLeadEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :lead_events, :user, null: true, foreign_key: true
  end
end
