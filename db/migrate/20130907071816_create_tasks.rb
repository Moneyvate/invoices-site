class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :client, index: true
      t.string :name
      t.text :description
      t.text :notes
      t.integer :priority
      t.date :due_date
      t.decimal :rate

      t.timestamps
    end
  end
end
