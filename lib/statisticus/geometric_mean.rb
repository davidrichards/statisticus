module Statisticus #:nodoc:
  class GeometricMean < RWrapper
    def run(list=nil)
      list ||= @list
      raise ArgumentError, "You must provide a list to average." unless list
      r.geometric(:x => list)
    end
  end
end