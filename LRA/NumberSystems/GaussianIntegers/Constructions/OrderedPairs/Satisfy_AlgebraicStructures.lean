import LRA.AlgebraicStructures
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Instances

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

/--
`satisfiesAbelianGroup` The ordered-pairs Gaussian-integer construction canonically realizes abelian group structure over a commutative-ring base.

Predicate logic:

  ∀ (R : Type u) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.AbelianGroupLaws (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.AbelianGroupLaws (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R)

Logical form (Lean):

```lean
theorem satisfiesAbelianGroup
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    AbelianGroupLaws (GaussianInteger R)
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
theorem satisfiesAbelianGroup
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    AbelianGroupLaws (GaussianInteger R) := by
  sorry
/--
`satisfiesRing` The ordered-pairs Gaussian-integer construction canonically realizes ring structure over a commutative-ring base.

Predicate logic:

  ∀ (R : Type u) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.RingLaws (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.RingLaws (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R)

Logical form (Lean):

```lean
theorem satisfiesRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    RingLaws (GaussianInteger R)
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
theorem satisfiesRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    RingLaws (GaussianInteger R) := by
  sorry
/--
`satisfiesCommutativeRing` The ordered-pairs Gaussian-integer construction canonically realizes commutative ring structure over a commutative-ring base.

Predicate logic:

  ∀ (R : Type u) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.CommutativeRingLaws (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.AlgebraicStructures.CommutativeRingLaws (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R)

Logical form (Lean):

```lean
theorem satisfiesCommutativeRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    CommutativeRingLaws (GaussianInteger R)
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
    CommutativeRingLaws (GaussianInteger R) := by
  sorry
end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
