import LRA.AlgebraicStructures.Monoid.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeGroupInverseLaws` TODO

Predicate logic:

  class MultiplicativeGroupInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop where
  InvMulCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
  MulInvCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)

Predicate logic (unfolded):

  class MultiplicativeGroupInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop where
  InvMulCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
  MulInvCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeGroupInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop where
  InvMulCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
  MulInvCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
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
class MultiplicativeGroupInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop where
  InvMulCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)
  MulInvCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a * b) 1 (fun a : R => a⁻¹)

/--
`GroupLaws` TODO

Predicate logic:

  class abbrev GroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeGroupInverseLaws R

Predicate logic (unfolded):

  class abbrev GroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeGroupInverseLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev GroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeGroupInverseLaws R
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
class abbrev GroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeGroupInverseLaws R

section Wrappers

variable {R : Type u}

/--
`InvMulCancel` TODO

Predicate logic:

  ∀ a : R, a⁻¹ * a = 1

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : Inv R] [inst_2 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.MultiplicativeGroupInverseLaws R → ∀ (a : R), instHMul.1 (inst_1.1 a) a = inst_2.1

Logical form (Lean):

```lean
theorem InvMulCancel [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a⁻¹ * a = 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem InvMulCancel [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a⁻¹ * a = 1 :=
  sorry

/--
`MulInvCancelGroup` TODO

Predicate logic:

  ∀ a : R, a * a⁻¹ = 1

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : Inv R] [inst_2 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.MultiplicativeGroupInverseLaws R → ∀ (a : R), instHMul.1 a (inst_1.1 a) = inst_2.1

Logical form (Lean):

```lean
theorem MulInvCancelGroup [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a * a⁻¹ = 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem MulInvCancelGroup [Mul R] [Inv R] [OfNat R 1]
    [MultiplicativeGroupInverseLaws R] :
    ∀ a : R, a * a⁻¹ = 1 :=
  sorry
