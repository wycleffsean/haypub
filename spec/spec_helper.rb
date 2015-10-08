require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'payhub'
require 'webmock/rspec'
require 'dotenv'
Dotenv.load!
#WebMock.allow_net_connect!(:net_http_connect_on_start => true)

API_KEY = ENV['PAYHUB_API_KEY']

def load_json_fixture(file)
  fixture_dir = File.expand_path('../fixtures', __FILE__)
  File.open(File.join(fixture_dir, file)).read
end

require 'json'

#todo move to application code
def serialize(obj)
  hashify = ->(obj) {
    if obj.respond_to?(:to_hash)
      obj.to_hash.inject({}) {|acc,(key,val)|
        acc[key] = hashify[val]
        acc
      }
    else
      obj
    end
  }
  hashed = hashify[obj]
  JSON.dump(hashed)
end
