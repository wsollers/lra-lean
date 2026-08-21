import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 4 (segment construction): for any `x`, `y`, `a`, `b`
there is a point `z` beyond `y` from `x` with `yz ≡ ab` -- a segment
congruent to `ab` can always be laid off from `y` along ray `xy`. -/
axiom SegmentConstruction (x y a b : TarskiPoint) :
    ∃ z : TarskiPoint, TarskiBetween x y z ∧ TarskiCongruent y z a b

end LRA.EuclideanSpace
