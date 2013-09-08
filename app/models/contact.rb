class Contact < ActiveRecord::Base
  belongs_to :contact_type
  belongs_to :client

  validates :contact_type_id, presence: true
  validates :client_id, presence: true
  validates :name, presence: true

  delegate :name, to: :client, prefix: true
  delegate :name, to: :contact_type, prefix: true

  def to_s
    name
  end

  def formatted_phone
    output = ''

    unless phone.nil?
      if phone.to_s.length == 10
        format = phone.to_s.split(/^(\d{3})(\d{3})(\d{4})$/)
        output = "(#{format[1]}) #{format[2]}-#{format[3]}"
      elsif phone.to_s.length == 7
        format = phone.to_s.split(/^(\d{3})(\d{4})$/)
        output = "#{format[1]}-#{format[2]}"
      end
    else
      output = "None"
    end

    return output
  end
end
