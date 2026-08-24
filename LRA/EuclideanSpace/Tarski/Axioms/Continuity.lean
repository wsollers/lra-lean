import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`Continuity` TODO

Predicate logic:

  ∃ a ∈ TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween a x y → ∃ b ∈ TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween x b y end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (φ ψ : LRA.EuclideanSpace.TarskiPoint → Prop), (Exists fun a => ∀ (x y : LRA.EuclideanSpace.TarskiPoint), φ x → ψ y → LRA.EuclideanSpace.TarskiBetween a x y) → Exists fun b => ∀ (x y : LRA.EuclideanSpace.TarskiPoint), φ x → ψ y → LRA.EuclideanSpace.TarskiBetween x b y

Logical form (Lean):

```lean
axiom Continuity (φ ψ : TarskiPoint → Prop) :
    (∃ a : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween a x y) →
    ∃ b : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween x b y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
axiom Continuity (φ ψ : TarskiPoint → Prop) :
    (∃ a : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween a x y) →
    ∃ b : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween x b y

end LRA.EuclideanSpace
