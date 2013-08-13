class Contact < ActiveRecord::Base
  belongs_to :contact_type
  belongs_to :client

  validates :contact_type_id, presence: true
  validates :client_id, presence: true
  validates :name, presence: true

  def parse_phone
    unless phone.nil?
      format = phone.to_s.split(/^(\d{3})(\d{3})(\d{4})$/)
      return "(#{format[1]}) #{format[2]}-#{format[3]}"
    else
      return "None"
    end
  end
end
