class GeometricMean
  
  include Statisticus
  def process(list=nil)
    list ||= @list
    raise ArgumentError, "You must provide a list to average." unless list
    r.geometric(:x => list)
  end
end
