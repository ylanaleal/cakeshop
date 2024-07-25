class RemoveInfoFromLeadEvents < ActiveRecord::Migration[7.1]
  def change
    remove_reference :lead_events, :user, null: false, foreign_key: true
  end
end
