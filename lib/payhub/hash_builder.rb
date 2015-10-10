module Payhub
  class HashBuilder
    attr_reader :hash

    def initialize(&block)
      @hash = {}
      instance_eval &block
    end

    def method_missing(key, *args, &block)
      @hash[key] = args.first
    end
  end
end
