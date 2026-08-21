import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 10 (Euclid's parallel postulate, Playfair form): if
`d` lies between `a` and `t`, and also between `b` and `c`, with `a ≠
d`, then the segments `ab`/`ac` extended meet a common transversal
through `t` -- the form of the parallel postulate that pins the theory
to Euclidean (rather than hyperbolic) geometry. Stateable purely from
`TarskiBetween`, unlike axioms 8/9. -/
axiom Playfair (a b c d t : TarskiPoint)
    (badt : TarskiBetween a d t) (bbdc : TarskiBetween b d c)
    (aNeD : a ≠ d) :
    ∃ x y : TarskiPoint,
      TarskiBetween a b x ∧ TarskiBetween a c y ∧ TarskiBetween x t y

end LRA.EuclideanSpace
