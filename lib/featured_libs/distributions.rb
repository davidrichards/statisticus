class BetaDistribution
  include Statisticus

  def process(shape1, shape2)
    r.dbeta(shape1, shape2)
  end
end

class BetaProbability
  include Statisticus

  def process(shape1, shape2)
    r.pbeta(shape1, shape2)
  end
end

class BetaQuantile
  include Statisticus

  def process(shape1, shape2)
    r.qbeta(shape1, shape2)
  end
end

class BetaRandomNumber
  include Statisticus

  def process(shape1, shape2)
    r.rbeta(shape1, shape2)
  end
end

# Given n possibilities per choice, and x choices, how many total choices are there?
class BinomialChoice
  include Statisticus
  def process(n,x)
    r.choose(n,x)
  end
end

class BinomialDistribution
  include Statisticus

  def process(x, size, prob)
    r.dbinom(x, size, prob)
  end
end

class BinomialProbability
  include Statisticus

  def process(x, size, prob)
    r.pbinom(x, size, prob)
  end
end


class BinomialQuantile
  include Statisticus

  def process(x, size, prob)
    r.qbinom(x, size, prob)
  end
end

class BinomialRandomNumber
  include Statisticus

  def process(n, size, prob)
    r.rbinom(n, size, prob)
  end
end

class CauchyDistribution
  include Statisticus

  def process(location, scale)
    r.dcauchy(location, scale)
  end
end

class CauchyProbability
  include Statisticus

  def process(location, scale)
    r.pcauchy(location, scale)
  end
end

class CauchyQuantile
  include Statisticus

  def process(location, scale)
    r.qcauchy(location, scale)
  end
end

class CauchyRandomNumber
  include Statisticus

  def process(location, scale)
    r.rcauchy(location, scale)
  end
end

class ExponentialDistribution
  include Statisticus

  def process(rate=nil)
    r.dexp(rate)
  end
end

class ExponentialProbability
  include Statisticus

  def process(rate=nil)
    r.pexp(rate)
  end
end

class ExponentialQuantile
  include Statisticus

  def process(rate=nil)
    r.qexp(rate)
  end
end

class ExponentialRandomNumber
  include Statisticus

  def process(rate=nil)
    r.rexp(rate)
  end
end

class ChiSquaredDistribution
  include Statisticus

  def process(df)
    r.dchisq(df)
  end
end

class ChiSquaredProbability
  include Statisticus

  def process(df)
    r.pchisq(df)
  end
end

class ChiSquaredQuantile
  include Statisticus

  def process(df)
    r.qchisq(df)
  end
end

class ChiSquaredRandomNumber
  include Statisticus

  def process(df)
    r.rchisq(df)
  end
end

class FDistribution
  include Statisticus

  def process(df1, df2)
    r.df(df1, df2)
  end
end

class FProbability
  include Statisticus

  def process(df1, df2)
    r.pf(df1, df2)
  end
end

class FQuantile
  include Statisticus

  def process(df1, df2)
    r.qf(df1, df2)
  end
end

class FRandomNumber
  include Statisticus

  def process(df1, df2)
    r.rf(df1, df2)
  end
end

class GammaDistribution
  include Statisticus

  def process(shape)
    r.dgamma(shape)
  end
end

class GammaProbability
  include Statisticus

  def process(shape)
    r.pgamma(shape)
  end
end

class GammaQuantile
  include Statisticus

  def process(shape)
    r.qgamma(shape)
  end
end

class GammaRandomNumber
  include Statisticus

  def process(shape)
    r.rgamma(shape)
  end
end

class GeometricDistribution
  include Statisticus

  def process(prob)
    r.dgeom(prob)
  end
end

class GeometricProbability
  include Statisticus

  def process(prob)
    r.pgeom(prob)
  end
end

class GeometricQuantile
  include Statisticus

  def process(prob)
    r.qgeom(prob)
  end
end

class GeometricRandomNumber
  include Statisticus

  def process(prob)
    r.rgeom(prob)
  end
end

class HyperGeometricDistribution
  include Statisticus

  def process(m, n, k)
    r.dhyper(m, n, k)
  end
end

class HyperGeometricProbability
  include Statisticus

  def process(m, n, k)
    r.phyper(m, n, k)
  end
end

class HyperGeometricQuantile
  include Statisticus

  def process(m, n, k)
    r.qhyper(m, n, k)
  end
end

class HyperGeometricRandomNumber
  include Statisticus

  def process(m, n, k)
    r.rhyper(m, n, k)
  end
end

class LogNormalDistribution
  include Statisticus

  def process(mean, std)
    r.dlnorm(mean, std)
  end
end

class LogNormalProbability
  include Statisticus

  def process(mean, std)
    r.plnorm(mean, std)
  end
end

class LogNormalQuantile
  include Statisticus

  def process(mean, std)
    r.qlnorm(mean, std)
  end
end

class LogNormalRandomNumber
  include Statisticus

  def process(mean, std)
    r.rlnorm(mean, std)
  end
end

class LogisticDistribution
  include Statisticus

  def process(location, scale)
    r.dlogis(location, scale)
  end
end

class LogisticProbability
  include Statisticus

  def process(location, scale)
    r.plogis(location, scale)
  end
end

class LogisticQuantile
  include Statisticus

  def process(location, scale)
    r.qlogis(location, scale)
  end
end

class LogisticRandomNumber
  include Statisticus

  def process(location, scale)
    r.rlogis(location, scale)
  end
end

class NegativeBinomialDistribution
  include Statisticus

  def process(size, prob)
    r.dnbinom(size, prob)
  end
end

class NegativeBinomialProbability
  include Statisticus

  def process(size, prob)
    r.pnbinom(size, prob)
  end
end

class NegativeBinomialQuantile
  include Statisticus

  def process(size, prob)
    r.qnbinom(size, prob)
  end
end

class NegativeBinomialRandomNumber
  include Statisticus

  def process(size, prob)
    r.rnbinom(size, prob)
  end
end

class NormalDistribution
  include Statisticus

  def process(mean, std)
    r.dnorm(mean, std)
  end
end

class NormalProbability
  include Statisticus

  def process(mean, std)
    r.pnorm(mean, std)
  end
end

class NormalQuantile
  include Statisticus

  def process(mean, std)
    r.qnorm(mean, std)
  end
end

class NormalRandomNumber
  include Statisticus

  def process(mean, std)
    r.rnorm(mean, std)
  end
end

class PoissonDistribution
  include Statisticus

  def process(mean)
    r.dpois(mean)
  end
end

class PoissonProbability
  include Statisticus

  def process(mean)
    r.ppois(mean)
  end
end

class PoissonQuantile
  include Statisticus

  def process(mean)
    r.qpois(mean)
  end
end

class PoissonRandomNumber
  include Statisticus

  def process(mean)
    r.rpois(mean)
  end
end

class WilcoxonSignedRankStatisticDistribution
  include Statisticus

  def process(n)
    r.dsignrank(n)
  end
end

class WilcoxonSignedRankStatisticProbability
  include Statisticus

  def process(n)
    r.psignrank(n)
  end
end

class WilcoxonSignedRankStatisticQuantile
  include Statisticus

  def process(n)
    r.qsignrank(n)
  end
end

class WilcoxonSignedRankStatisticRandomNumber
  include Statisticus

  def process(n)
    r.rsignrank(n)
  end
end

class StudentsTDistribution
  include Statisticus

  def process(df)
    r.dt(df)
  end
end

class StudentsTProbability
  include Statisticus

  def process(df)
    r.pt(df)
  end
end

class StudentsTQuantile
  include Statisticus

  def process(df)
    r.qt(df)
  end
end

class StudentsTRandomNumber
  include Statisticus

  def process(df)
    r.rt(df)
  end
end

class UniformDistribution
  include Statisticus

  def process(min=nil, max=nil)
    r.dunif(min, max)
  end
end

class UniformProbability
  include Statisticus

  def process(min=nil, max=nil)
    r.punif(min, max)
  end
end

class UniformQuantile
  include Statisticus

  def process(min=nil, max=nil)
    r.qunif(min, max)
  end
end

class UniformRandomNumber
  include Statisticus

  def process(min=nil, max=nil)
    r.runif(min, max)
  end
end

class WeibulDistribution
  include Statisticus

  def process(shape)
    r.dweibull(shape)
  end
end

class WeibulProbability
  include Statisticus

  def process(shape)
    r.pweibull(shape)
  end
end

class WeibulQuantile
  include Statisticus

  def process(shape)
    r.qweibull(shape)
  end
end

class WeibulRandomNumber
  include Statisticus

  def process(shape)
    r.rweibull(shape)
  end
end

class WilcoxonRankSumDistribution
  include Statisticus

  def process(m, n)
    r.dwilcox(m, n)
  end
end

class WilcoxonRankSumProbability
  include Statisticus

  def process(m, n)
    r.pwilcox(m, n)
  end
end

class WilcoxonRankSumQuantile
  include Statisticus

  def process(m, n)
    r.qwilcox(m, n)
  end
end

class WilcoxonRankSumRandomNumber
  include Statisticus

  def process(m, n)
    r.rwilcox(m, n)
  end
end
