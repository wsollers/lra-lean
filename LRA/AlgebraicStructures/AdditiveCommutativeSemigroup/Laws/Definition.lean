import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveCommutativeLaws` TODO

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

  ∀ a b : R, a + b = b + a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R], LRA.AlgebraicStructures.AdditiveCommutativeLaws R → ∀ (a b : R), instHAdd.1 a b = instHAdd.1 b a

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
    ∀ a b : R, a + b = b + a :=
  sorry
