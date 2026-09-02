import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Interface.Laws.Distributive
import LRA.Operation

namespace LRA.AlgebraicStructures

/--
`ZeroAbsorbingLaws` TODO

Predicate logic:

  class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing (fun a b : R => a * b) 0
  MulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing (fun a b : R => a * b) 0

Predicate logic (unfolded):

  class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing (fun a b : R => a * b) 0
  MulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing (fun a b : R => a * b) 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing (fun a b : R => a * b) 0
  MulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing (fun a b : R => a * b) 0
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
class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing (fun a b : R => a * b) 0
  MulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing (fun a b : R => a * b) 0

/--
`SemiringLaws` TODO

Predicate logic:

  class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

Predicate logic (unfolded):

  class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R
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
class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

section Wrappers

variable {R : Type u}

/--
`ZeroMul` TODO

Predicate logic:

  ∀ a : R, 0 * a = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.ZeroAbsorbingLaws R → ∀ (a : R), instHMul.1 inst_1.1 a = inst_1.1

Logical form (Lean):

```lean
theorem ZeroMul [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, 0 * a = 0
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
theorem ZeroMul [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, 0 * a = 0 := by
  sorry
/--
`MulZero` TODO

Predicate logic:

  ∀ a : R, a * 0 = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.ZeroAbsorbingLaws R → ∀ (a : R), instHMul.1 a inst_1.1 = inst_1.1

Logical form (Lean):

```lean
theorem MulZero [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, a * 0 = 0
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
theorem MulZero [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, a * 0 = 0 := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
