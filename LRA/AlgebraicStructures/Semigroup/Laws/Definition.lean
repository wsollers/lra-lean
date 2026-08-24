import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeSemigroupLaws` TODO

Predicate logic:

  class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

Predicate logic (unfolded):

  class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)
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
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

/--
`MulAssociative` TODO

Predicate logic:

  ∀ a b c : R, (a * b) * c = a * (b * c)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R], LRA.AlgebraicStructures.MultiplicativeSemigroupLaws R → ∀ (a b c : R), instHMul.1 (instHMul.1 a b) c = instHMul.1 a (instHMul.1 b c)

Logical form (Lean):

```lean
theorem MulAssociative [Mul R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c)
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
theorem MulAssociative [Mul R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c) :=
  sorry
