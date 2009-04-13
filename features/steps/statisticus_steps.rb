Given /^a class, GeometricMean$/ do
  class GeometricMean; include Statisticus end
  @klass = GeometricMean
  @params = [1,2,3]
  @lib_name = 'geometric_mean.r'
end

When /^I call it$/ do
  @result = @klass.call(@params)
end

Then /^it uses code from (.+)$/ do |lib_name|
  pending
end

