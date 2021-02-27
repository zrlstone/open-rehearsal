class RemoveConfirmedFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :confirmed, :boolean
  end
end
