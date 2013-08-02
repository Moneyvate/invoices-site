class Contact < ActiveRecord::Base
  belongs_to :contact_type
  belongs_to :client

  validates :contact_type_id, presence: true
  validates :client_id, presence: true
  validates :name, presence: true
end
