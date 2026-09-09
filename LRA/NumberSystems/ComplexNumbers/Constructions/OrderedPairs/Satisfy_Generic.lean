import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Instances
import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory
open LRA.AlgebraicStructures

universe u

/--
`genericModel` The ordered-pairs (`a + bi`) construction satisfies the generic ℂ interface: for any ordered field `R`, pairs over `R` form a `ComplexNumberModel`.

Predicate logic:

  def genericModel (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
      [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
    ComplexNumberModel.ofCarrier (ComplexNumber R)

Predicate logic (unfolded):

  def genericModel (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
      [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
    ComplexNumberModel.ofCarrier (ComplexNumber R) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier (ComplexNumber R)
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
def genericModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier (ComplexNumber R)

/--
`satisfiesGeneric` TODO

Predicate logic:

  abbrev satisfiesGeneric (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
      [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
    genericModel R

Predicate logic (unfolded):

  abbrev satisfiesGeneric (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
      [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
    genericModel R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev satisfiesGeneric (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  genericModel R
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
abbrev satisfiesGeneric (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  genericModel R

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
