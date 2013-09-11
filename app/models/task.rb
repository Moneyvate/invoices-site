class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  has_many :work_logs
  accepts_nested_attributes_for :work_logs, allow_destroy: true

  def to_s
    name
  end

  def estimated?
    complexity == 0 ? false : true
  end

  def easy?
    complexity == 1 ? true : false
  end

  def medium?
    complexity == 3 ? true : false
  end
end
