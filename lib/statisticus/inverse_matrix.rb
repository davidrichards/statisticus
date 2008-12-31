# This creates an inverse of a matrix (A^-1) that is:
# 1) square
# 2) with |A| != 0
module Statisticus #:nodoc:
  class InverseMatrix < RWrapper
    # For now, I'm converting a list into a square matrix.
    # TODO: Make this more general.
    def run(list, rows)
      raise "Cannot make a square matrix out of #{list.size} elements and #{rows} rows." unless list.size % rows == 0
      r.inverseFromList(:x => list, :y => rows)
    end
  end
end


