import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 6 (betweenness identity): if `x` lies between `y` and
`x` itself, then `x = y` -- betweenness is nondegenerate. -/
axiom BetweennessIdentity (x y : TarskiPoint)
    (bxyx : TarskiBetween x y x) : x = y

end LRA.EuclideanSpace
