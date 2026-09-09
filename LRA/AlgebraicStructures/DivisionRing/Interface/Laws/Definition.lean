import LRA.AlgebraicStructures.NontrivialRing.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeInverseLaws` TODO

Predicate logic:

  class MultiplicativeInverseLaws (R : Type u)
      [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
    MulInvCancel : ∀ a : R, a ≠ 0 →
      LRA.Operation.Laws.Inverse.RightInverseOf
        (fun x y : R => x * y) 1 a a⁻¹
    InvZero : (0 : R)⁻¹ = 0

Predicate logic (unfolded):

  class MultiplicativeInverseLaws (R : Type u)
      [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
    MulInvCancel : ∀ a : R, a ≠ 0 →
      LRA.Operation.Laws.Inverse.RightInverseOf
        (fun x y : R => x * y) 1 a a⁻¹
    InvZero : (0 : R)⁻¹ = 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
  MulInvCancel : ∀ a : R, a ≠ 0 →
    LRA.Operation.Laws.Inverse.RightInverseOf
      (fun x y : R => x * y) 1 a a⁻¹
  InvZero : (0 : R)⁻¹ = 0
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
class MultiplicativeInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
  MulInvCancel : ∀ a : R, a ≠ 0 →
    LRA.Operation.Laws.Inverse.RightInverseOf
      (fun x y : R => x * y) 1 a a⁻¹
  InvZero : (0 : R)⁻¹ = 0

/--
`DivisionCompatibilityLaw` TODO

Predicate logic:

  class DivisionCompatibilityLaw (R : Type u)
      [Div R] [Mul R] [Inv R] : Prop where
    DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹

Predicate logic (unfolded):

  class DivisionCompatibilityLaw (R : Type u)
      [Div R] [Mul R] [Inv R] : Prop where
    DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class DivisionCompatibilityLaw (R : Type u)
    [Div R] [Mul R] [Inv R] : Prop where
  DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹
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
class DivisionCompatibilityLaw (R : Type u)
    [Div R] [Mul R] [Inv R] : Prop where
  DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹

/--
`DivisionRingLaws` TODO

Predicate logic:

  class abbrev DivisionRingLaws (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
    RingLaws R, NontrivialityLaw R, MultiplicativeInverseLaws R

Predicate logic (unfolded):

  class abbrev DivisionRingLaws (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
    RingLaws R, NontrivialityLaw R, MultiplicativeInverseLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev DivisionRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  RingLaws R, NontrivialityLaw R, MultiplicativeInverseLaws R
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
class abbrev DivisionRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  RingLaws R, NontrivialityLaw R, MultiplicativeInverseLaws R

section Wrappers

variable {R : Type u}

/--
`MulInvCancel` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Mul R] [inst_1 : Inv R] [inst_2 : OfNat R 0] [inst_3 : OfNat R 1], LRA.AlgebraicStructures.MultiplicativeInverseLaws R → ∀ (a : R), Ne a 0 → instHMul.hMul a (inst_1.inv a) = 1

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.MultiplicativeInverseLaws R → ∀ (a : R), (a = 0 → False) → { hMul := fun a b => inst.mul a b }.hMul a (inst_1.1 a) = 1

Logical form (Lean):

```lean
theorem MulInvCancel [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    ∀ a : R, a ≠ 0 → a * a⁻¹ = 1
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
theorem MulInvCancel [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    ∀ a : R, a ≠ 0 → a * a⁻¹ = 1 := by
  sorry
/--
`InvZero` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Mul R] [inst_1 : Inv R] [inst_2 : OfNat R 0] [inst_3 : OfNat R 1], LRA.AlgebraicStructures.MultiplicativeInverseLaws R → inst_1.inv 0 = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.MultiplicativeInverseLaws R → inst_1.1 0 = 0

Logical form (Lean):

```lean
theorem InvZero [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    (0 : R)⁻¹ = 0
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
theorem InvZero [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    (0 : R)⁻¹ = 0 := by
  sorry
/--
`DivEqMulInv` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Div R] [inst_1 : Mul R] [inst_2 : Inv R], LRA.AlgebraicStructures.DivisionCompatibilityLaw R → ∀ (a b : R), instHDiv.hDiv a b = instHMul.hMul a (inst_2.inv b)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.DivisionCompatibilityLaw R → ∀ (a b : R), { hDiv := fun a b => inst.div a b }.hDiv a b = { hMul := fun a b => inst_1.mul a b }.hMul a (inst_2.1 b)

Logical form (Lean):

```lean
theorem DivEqMulInv [Div R] [Mul R] [Inv R]
    [DivisionCompatibilityLaw R] :
    ∀ a b : R, a / b = a * b⁻¹
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
theorem DivEqMulInv [Div R] [Mul R] [Inv R]
    [DivisionCompatibilityLaw R] :
    ∀ a b : R, a / b = a * b⁻¹ := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
