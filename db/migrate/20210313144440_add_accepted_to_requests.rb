class AddAcceptedToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :accepted, :boolean
  end
end
