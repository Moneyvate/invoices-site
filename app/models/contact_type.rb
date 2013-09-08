class ContactType < ActiveRecord::Base
  has_many :contacts

  def to_s
    name
  end
end
