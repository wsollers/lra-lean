import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveIdentityLaws` TODO

Predicate logic:

  class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a + b) 0
  AddZero :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a + b) 0

Predicate logic (unfolded):

  class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a + b) 0
  AddZero :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a + b) 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a + b) 0
  AddZero :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a + b) 0
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
class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a + b) 0
  AddZero :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a + b) 0

/--
`AdditiveMonoidLaws` TODO

Predicate logic:

  class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R

Predicate logic (unfolded):

  class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R
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
class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R

section Wrappers

variable {R : Type u}

/--
`ZeroAdd` TODO

Predicate logic:

  ∀ a : R, 0 + a = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.AdditiveIdentityLaws R → ∀ (a : R), instHAdd.1 inst_1.1 a = a

Logical form (Lean):

```lean
theorem ZeroAdd [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, 0 + a = a
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
theorem ZeroAdd [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, 0 + a = a :=
  sorry

/--
`AddZero` TODO

Predicate logic:

  ∀ a : R, a + 0 = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.AdditiveIdentityLaws R → ∀ (a : R), instHAdd.1 a inst_1.1 = a

Logical form (Lean):

```lean
theorem AddZero [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, a + 0 = a
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
theorem AddZero [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, a + 0 = a :=
  sorry
