class Client < ActiveRecord::Base
  belongs_to :client_type
  validates :client_type_id, presence: true
end
