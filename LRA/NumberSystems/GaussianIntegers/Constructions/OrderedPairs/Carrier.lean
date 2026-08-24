
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

/--
`GaussianInteger` TODO

Predicate logic:

  structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R

Predicate logic (unfolded):

  structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R

variable {R : Type u}

instance [OfNat R 0] : OfNat (GaussianInteger R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (GaussianInteger R) 1 := ⟨⟨1, 0⟩⟩

/--
`imaginaryUnit` TODO

Predicate logic:

  def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩

Predicate logic (unfolded):

  def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
