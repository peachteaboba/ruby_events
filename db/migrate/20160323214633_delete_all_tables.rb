class DeleteAllTables < ActiveRecord::Migration
  def change
    drop_table(:events)
    drop_table(:user_events)
  end
end
