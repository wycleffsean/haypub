require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'payhub'

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
