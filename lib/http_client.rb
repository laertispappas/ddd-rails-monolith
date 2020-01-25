require 'net/http'

# Dummy poc http client implementation.
#
module HttpClient
  module_function

  def get(path, params = {})
    uri = URI(path)
    uri.query = URI.encode_www_form( params )
    response = Net::HTTP.get(uri)
    JSON.parse(response).deep_symbolize_keys
  end
end
