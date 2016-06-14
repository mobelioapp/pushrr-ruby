module Pushrr
  class Error        < StandardError; end
  class NotFound     < Error; end
  class Unauthorized < Error; end
end
