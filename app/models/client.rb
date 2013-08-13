class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :contacts
  accepts_nested_attributes_for :contacts, allow_destroy: true
  validates :name, presence: true
  validates :client_type_id, presence: true
end
