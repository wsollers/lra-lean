import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeCommutativeLaws` TODO

Predicate logic:

  class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a * b)

Predicate logic (unfolded):

  class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a * b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a * b)
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
class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

/--
`MulCommutative` TODO

Predicate logic:

  ∀ a b : R, a * b = b * a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R], LRA.AlgebraicStructures.MultiplicativeCommutativeLaws R → ∀ (a b : R), instHMul.1 a b = instHMul.1 b a

Logical form (Lean):

```lean
theorem MulCommutative [Mul R] [MultiplicativeCommutativeLaws R] :
    ∀ a b : R, a * b = b * a
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
theorem MulCommutative [Mul R] [MultiplicativeCommutativeLaws R] :
    ∀ a b : R, a * b = b * a :=
  sorry
