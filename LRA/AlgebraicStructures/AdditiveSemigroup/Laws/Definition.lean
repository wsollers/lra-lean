import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveSemigroupLaws` TODO

Predicate logic:

  class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

Predicate logic (unfolded):

  class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)
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
class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

/--
`AddAssociative` TODO

Predicate logic:

  ∀ a b c : R, (a + b) + c = a + (b + c)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R], LRA.AlgebraicStructures.AdditiveSemigroupLaws R → ∀ (a b c : R), instHAdd.1 (instHAdd.1 a b) c = instHAdd.1 a (instHAdd.1 b c)

Logical form (Lean):

```lean
theorem AddAssociative [Add R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c)
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
theorem AddAssociative [Add R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c) :=
  sorry
