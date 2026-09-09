import LRA.Operation
import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveCommutativeLaws` Commutativity of `+`, on its own — an atomic mixin, reused across every subject in the tree that needs "additively commutative" (`AbelianGroupLaws`, `Semiring`/`Ring`/`Field` etc. all list it alongside their own associativity/identity/etc. mixins). Kept atomic and unchanged: this is not the place to fold in associativity, since that would duplicate `AddAssociative` across every downstream combining class that already brings it in separately. Doesn't need `[Nonempty R]` itself — nothing about "commutative" requires it, unlike `AdditiveSemigroupLaws`, which has no identity/zero constant to derive it from.

Predicate logic:

  class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
    AddCommutative :
      LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b)

Predicate logic (unfolded):

  class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
    AddCommutative :
      LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b)
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
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

/--
`AddCommutative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R], LRA.AlgebraicStructures.AdditiveCommutativeLaws R → ∀ (a b : R), instHAdd.hAdd a b = instHAdd.hAdd b a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.AdditiveCommutativeLaws R → ∀ (a b : R), { hAdd := fun a b => inst.add a b }.hAdd a b = { hAdd := fun a b => inst.add a b }.hAdd b a

Logical form (Lean):

```lean
theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a
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
theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a := by
  sorry
end Wrappers

/--
`AdditiveCommutativeSemigroupLaws` An additive commutative semigroup: `(R, +)` where `+` is both associative and commutative, and `R` is nonempty. This is the combining class this subject was missing — `AdditiveCommutativeLaws` alone only states commutativity, and nothing upstream forced it together with `AdditiveSemigroupLaws` (associativity + nonemptiness); the multiplicative side had the identical gap, fixed in `CommutativeSemigroup` (as-03). A `class abbrev` combining two already-existing LRA classes derives its instances automatically from instances of its parts, so no separate combinator proof is needed here — see `Constructions/Mathlib/Laws.lean` for a bridge instance from Mathlib's `AddCommSemigroup`. Needs `[Nonempty R]` in its own header because `AdditiveSemigroupLaws R` does — see `MagmaLaws`'s doc comment.

Predicate logic:

  class abbrev AdditiveCommutativeSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop :=
    AdditiveSemigroupLaws R, AdditiveCommutativeLaws R

Predicate logic (unfolded):

  class abbrev AdditiveCommutativeSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop :=
    AdditiveSemigroupLaws R, AdditiveCommutativeLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev AdditiveCommutativeSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R
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
class abbrev AdditiveCommutativeSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R

end LRA.AlgebraicStructures
