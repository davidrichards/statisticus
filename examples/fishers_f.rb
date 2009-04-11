# Sets up a two-tailed Fishers F test on two lists.  This tests whether
# the variance of the two samples are the same.  The p value will return
# this number.  You should reject the NULL hypothesis if p < 0.025,
# typically, and conclude that the variances are different. 
class FishersF
  include Statisticus
  def run(list1=nil, list2=nil)
    list1 ||= @list1
    list2 ||= @list2
    r.var_test(list1, list2)
  end
end

# Sample data

# set_a = [10.6, 19.2, 26.2, 30.0, 30.9, 32.4, 35.5, 12.0, 22.0, 30.6, 31.8, 32.4, 31.1, 31.5, 11.3, 19.4, 25.8, 27.9, 28.5, 28.1, 27.8]
# set_b = [10.5, 14.9, 18.1, 18.9, 19.5, 22.2, 21.9, 7.7, 11.4, 12.3, 13.0, 12.5, 13.7, 14.4, 10.6, 18.0, 17.9, 17.9, 17.9, 18.9, 19.9]
