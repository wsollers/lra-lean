import LRA.AlgebraicStructures
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Instances

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

/--
`satisfiesCommutativeRing` The ordered-pairs complex-number construction canonically realizes commutative ring structure over a commutative-ring base.

Predicate logic:

  ∀ (R : Type u) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.CommutativeRingLaws (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.CommutativeRingLaws (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R)

Logical form (Lean):

```lean
theorem satisfiesCommutativeRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    CommutativeRingLaws (ComplexNumber R)
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
theorem satisfiesCommutativeRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    CommutativeRingLaws (ComplexNumber R) := by
  sorry
/--
`satisfiesField` The ordered-pairs complex-number construction canonically realizes field structure over an ordered-field base.

Predicate logic:

  ∀ (R : Type u) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R)

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws R → LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R)

Logical form (Lean):

```lean
theorem satisfiesField
    (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] :
    FieldLaws (ComplexNumber R)
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
theorem satisfiesField
    (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] :
    FieldLaws (ComplexNumber R) := by
  sorry
end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
