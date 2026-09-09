import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveSemigroupLaws` An additive semigroup: `(R, +)` where `+` is associative and `R` is nonempty. Formally identical to `MultiplicativeSemigroupLaws`, just under additive notation — nonemptiness is an ambient `[Nonempty R]` assumption, not a stored field, for the same reason: see `MagmaLaws`'s doc comment for the concrete failure a stored field caused here (this class's `CarrierNonempty` collided with `MultiplicativeSemigroupLaws`'s the moment `SemiringLaws` and friends combined both sides — fixed by moving nonemptiness to a parameter for every subject in the tree that needs it, rather than by picking yet another field name).

Predicate logic:

  class AdditiveSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop where
    AddAssociative :
      LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

Predicate logic (unfolded):

  class AdditiveSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop where
    AddAssociative :
      LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditiveSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop where
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
class AdditiveSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

/--
`AddAssociative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Nonempty R], LRA.AlgebraicStructures.AdditiveSemigroupLaws R → ∀ (a b c : R), instHAdd.hAdd (instHAdd.hAdd a b) c = instHAdd.hAdd a (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.AdditiveSemigroupLaws R → ∀ (a b c : R), { hAdd := fun a b => inst.add a b }.hAdd ({ hAdd := fun a b => inst.add a b }.hAdd a b) c = { hAdd := fun a b => inst.add a b }.hAdd a ({ hAdd := fun a b => inst.add a b }.hAdd b c)

Logical form (Lean):

```lean
theorem AddAssociative [Add R] [Nonempty R] [AdditiveSemigroupLaws R] :
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
theorem AddAssociative [Add R] [Nonempty R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c) := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
