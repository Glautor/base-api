module Utils
  module Errors
    module User
      class Unauthorized < StandardError; end
      class UserNotAdmin < StandardError; end
    end
  end
end
