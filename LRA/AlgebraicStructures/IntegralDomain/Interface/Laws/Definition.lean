import LRA.AlgebraicStructures.CommutativeRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.NontrivialRing.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`NoZeroDivisorsLaw` TODO

Predicate logic:

  class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0

Predicate logic (unfolded):

  class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0

/--
`IntegralDomainLaws` TODO

Predicate logic:

  class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  CommutativeRingLaws R, NontrivialityLaw R, NoZeroDivisorsLaw R

Predicate logic (unfolded):

  class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  CommutativeRingLaws R, NontrivialityLaw R, NoZeroDivisorsLaw R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  CommutativeRingLaws R, NontrivialityLaw R, NoZeroDivisorsLaw R
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
class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  CommutativeRingLaws R, NontrivialityLaw R, NoZeroDivisorsLaw R

section Wrappers

variable {R : Type u}

/--
`EqZeroOfMulEqZero` TODO

Predicate logic:

  ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.NoZeroDivisorsLaw R → ∀ (a b : R), instHMul.1 a b = inst_1.1 → Or (a = inst_1.1)(b = inst_1.1)

Logical form (Lean):

```lean
theorem EqZeroOfMulEqZero [Mul R] [OfNat R 0] [NoZeroDivisorsLaw R] :
    ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem EqZeroOfMulEqZero [Mul R] [OfNat R 0] [NoZeroDivisorsLaw R] :
    ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0 :=
  sorry

end Wrappers

end LRA.AlgebraicStructures
