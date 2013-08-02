class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :contact_type, index: true
      t.belongs_to :client, index: true
      t.string :name
      t.string :title
      t.string :email
      t.integer :phone, :limit => 8
      t.string :skype
      t.string :im

      t.timestamps
    end
  end
end
