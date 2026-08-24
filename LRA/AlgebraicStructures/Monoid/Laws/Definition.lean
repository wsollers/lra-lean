import LRA.AlgebraicStructures.Semigroup.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeIdentityLaws` TODO

Predicate logic:

  class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1

Predicate logic (unfolded):

  class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1
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
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1

/--
`MonoidLaws` TODO

Predicate logic:

  class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R

Predicate logic (unfolded):

  class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R
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
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R

section Wrappers

variable {R : Type u}

/--
`OneMul` TODO

Predicate logic:

  ∀ a : R, 1 * a = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.MultiplicativeIdentityLaws R → ∀ (a : R), instHMul.1 inst_1.1 a = a

Logical form (Lean):

```lean
theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a
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
theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a :=
  sorry

/--
`MulOne` TODO

Predicate logic:

  ∀ a : R, a * 1 = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.MultiplicativeIdentityLaws R → ∀ (a : R), instHMul.1 a inst_1.1 = a

Logical form (Lean):

```lean
theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a
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
theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a :=
  sorry
