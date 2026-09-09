import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeSemigroupLaws` A semigroup: `(R, *)` where `*` is associative and `R` is nonempty. Nonemptiness is an ambient `[Nonempty R]` assumption, not a stored field — see `MagmaLaws`'s doc comment for why.

Predicate logic:

  class MultiplicativeSemigroupLaws (R : Type u) [Mul R] [Nonempty R] : Prop where
    MulAssociative :
      LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

Predicate logic (unfolded):

  class MultiplicativeSemigroupLaws (R : Type u) [Mul R] [Nonempty R] : Prop where
    MulAssociative :
      LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] [Nonempty R] : Prop where
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
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] [Nonempty R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

/--
`MulAssociative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Mul R] [inst_1 : Nonempty R], LRA.AlgebraicStructures.MultiplicativeSemigroupLaws R → ∀ (a b c : R), instHMul.hMul (instHMul.hMul a b) c = instHMul.hMul a (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws R → ∀ (a b c : R), { hMul := fun a b => inst.mul a b }.hMul ({ hMul := fun a b => inst.mul a b }.hMul a b) c = { hMul := fun a b => inst.mul a b }.hMul a ({ hMul := fun a b => inst.mul a b }.hMul b c)

Logical form (Lean):

```lean
theorem MulAssociative [Mul R] [Nonempty R] [MultiplicativeSemigroupLaws R] :
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
theorem MulAssociative [Mul R] [Nonempty R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c) := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
