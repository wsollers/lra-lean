import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 7 (inner Pasch): if `p` lies between `u` and `v`, and
`q` lies between `p` and `z`, then some point `x` lies between `u` and
`z` and also between `q` and `v` -- a betweenness-only statement of the
fact that a line entering a triangle through one side must leave through
another. -/
axiom InnerPasch (u v p q z : TarskiPoint)
    (bupv : TarskiBetween u p v) (bpqz : TarskiBetween p q z) :
    ∃ x : TarskiPoint, TarskiBetween u x z ∧ TarskiBetween q x v

end LRA.EuclideanSpace
