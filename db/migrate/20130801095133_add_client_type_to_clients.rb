class AddClientTypeToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :client_type, index: true
  end
end
