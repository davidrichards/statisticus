Feature: Analyst runs R code in Ruby
  In order to access the R runtime
  An analyst can use simple conventions to use the R runtime seamlessly

  RSRuby is a good set of bindings for R.  But it stops as a binding,
  and doesn't integrate with a workflow.  Since I have a workflow that I'
  m comfortable with, TeguGears', I can adapt the tools from RSRuby and
  have a good time of it.  These are the conventions, spelled out.

  Scenario: A class called GeometricMean that uses geometric_mean.r to define it's process
    Given a class, GeometricMean
    When I call it
    Then it uses code from geometric_mean.r
