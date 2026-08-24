import LRA.AlgebraicStructures.AdditiveSemigroup.Laws.Definition
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.Semigroup.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Laws.Definition
import LRA.AlgebraicStructures.CommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Laws.Distributive
import LRA.Operation.Laws.Cancellation.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveCancellativeLaws` TODO

Predicate logic:

  class AdditiveCancellativeLaws (R : Type u) [Add R] : Prop where
  AddCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b)

Predicate logic (unfolded):

  class AdditiveCancellativeLaws (R : Type u) [Add R] : Prop where
  AddCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditiveCancellativeLaws (R : Type u) [Add R] : Prop where
  AddCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b)
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
class AdditiveCancellativeLaws (R : Type u) [Add R] : Prop where
  AddCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b)

/--
`MultiplicativeCancellativeLaws` TODO

Predicate logic:

  class MultiplicativeCancellativeLaws (R : Type u) [Mul R] : Prop where
  MulCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b)

Predicate logic (unfolded):

  class MultiplicativeCancellativeLaws (R : Type u) [Mul R] : Prop where
  MulCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeCancellativeLaws (R : Type u) [Mul R] : Prop where
  MulCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b)
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
class MultiplicativeCancellativeLaws (R : Type u) [Mul R] : Prop where
  MulCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b)

/--
`CommutativeSemiringWithoutZeroLaws` TODO

Predicate logic:

  class abbrev CommutativeSemiringWithoutZeroLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R, AdditiveCancellativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R, MultiplicativeCancellativeLaws R,
  DistributiveLaws R

Predicate logic (unfolded):

  class abbrev CommutativeSemiringWithoutZeroLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R, AdditiveCancellativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R, MultiplicativeCancellativeLaws R,
  DistributiveLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev CommutativeSemiringWithoutZeroLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R, AdditiveCancellativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R, MultiplicativeCancellativeLaws R,
  DistributiveLaws R
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
class abbrev CommutativeSemiringWithoutZeroLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R, AdditiveCancellativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R, MultiplicativeCancellativeLaws R,
  DistributiveLaws R

section Wrappers

variable {R : Type u}

/--
`AddCancellative` TODO

Predicate logic:

  LRA.Operation.Laws.Cancellation.TwoSidedCancellative fun a b ∈ R => a + b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R], LRA.AlgebraicStructures.AdditiveCancellativeLaws R → (∀ (fixed first second : R), (fun a b => instHAdd.1 a b) fixed first = (fun a b => instHAdd.1 a b) fixed second → first = second ∧ ∀ (first second fixed : R), (fun a b => instHAdd.1 a b) first fixed = (fun a b => instHAdd.1 a b) second fixed → first = second)

Logical form (Lean):

```lean
theorem AddCancellative [Add R] [AdditiveCancellativeLaws R] :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b)
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
theorem AddCancellative [Add R] [AdditiveCancellativeLaws R] :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b) :=
  sorry

/--
`MulCancellative` TODO

Predicate logic:

  LRA.Operation.Laws.Cancellation.TwoSidedCancellative fun a b ∈ R => a * b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R], LRA.AlgebraicStructures.MultiplicativeCancellativeLaws R → (∀ (fixed first second : R), (fun a b => instHMul.1 a b) fixed first = (fun a b => instHMul.1 a b) fixed second → first = second ∧ ∀ (first second fixed : R), (fun a b => instHMul.1 a b) first fixed = (fun a b => instHMul.1 a b) second fixed → first = second)

Logical form (Lean):

```lean
theorem MulCancellative [Mul R] [MultiplicativeCancellativeLaws R] :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b)
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
theorem MulCancellative [Mul R] [MultiplicativeCancellativeLaws R] :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b) :=
  sorry
