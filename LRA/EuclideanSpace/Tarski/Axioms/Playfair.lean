import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`Playfair` TODO

Predicate logic:

  (∀ a b c d t ∈ TarskiPoint), ∃ x y ∈ TarskiPoint, TarskiBetween a b x ∧ TarskiBetween a c y ∧ TarskiBetween x t y end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (a b c d t : LRA.EuclideanSpace.TarskiPoint), (LRA.EuclideanSpace.TarskiBetween a d t ∧ (LRA.EuclideanSpace.TarskiBetween b d c ∧ a = d → False)) → Exists fun x => Exists fun y => (LRA.EuclideanSpace.TarskiBetween a b x ∧ (LRA.EuclideanSpace.TarskiBetween a c y ∧ LRA.EuclideanSpace.TarskiBetween x t y))

Logical form (Lean):

```lean
axiom Playfair (a b c d t : TarskiPoint)
    (badt : TarskiBetween a d t) (bbdc : TarskiBetween b d c)
    (aNeD : a ≠ d) :
    ∃ x y : TarskiPoint,
      TarskiBetween a b x ∧ TarskiBetween a c y ∧ TarskiBetween x t y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
axiom Playfair (a b c d t : TarskiPoint)
    (badt : TarskiBetween a d t) (bbdc : TarskiBetween b d c)
    (aNeD : a ≠ d) :
    ∃ x y : TarskiPoint,
      TarskiBetween a b x ∧ TarskiBetween a c y ∧ TarskiBetween x t y

end LRA.EuclideanSpace
