class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  def to_s
    name
  end
end
