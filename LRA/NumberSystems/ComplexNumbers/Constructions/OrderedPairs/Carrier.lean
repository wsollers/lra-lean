
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

universe u

/--
`ComplexNumber` TODO

Predicate logic:

  structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R

Predicate logic (unfolded):

  structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R
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
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R

variable {R : Type u}

instance [OfNat R 0] : OfNat (ComplexNumber R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (ComplexNumber R) 1 := ⟨⟨1, 0⟩⟩

/--
`imaginaryUnit` TODO

Predicate logic:

  def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩

Predicate logic (unfolded):

  def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩
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
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
