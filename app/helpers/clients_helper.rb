module ClientsHelper
  def client_type
    if @client.client_type.nil?
      "No Type!"
    else
      @client.client_type.name
    end
  end
end
