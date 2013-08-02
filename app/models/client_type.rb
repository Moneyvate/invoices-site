class ClientType < ActiveRecord::Base
  has_many :clients

  def to_s
    return self.name
  end
end
