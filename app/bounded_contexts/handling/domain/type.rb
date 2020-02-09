module Handling
  module Domain
    class Type < ValueObject
      TYPES = Types::String.enum("LOAD", "UNLOAD", "RECEIVE", "CLAIM", "CUSTOMS")

      attribute :type, TYPES
    end
  end
end
