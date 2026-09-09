import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.Semigroup.Examples

/-! Non-empty strings under concatenation — the free semigroup on an alphabet `Σ⁺`.
Modelled here as non-empty lists over an arbitrary alphabet type, under `++`: closed
(concatenating two non-empty lists is non-empty) and associative (list append already
is), with no identity — the empty list would be the identity, and it's exactly the
element excluded, so this is genuinely a semigroup and not a monoid. Unlike the two
numeric examples, this one is generic over the alphabet rather than a single
concrete type. -/

universe u

variable {Alphabet : Type u}

instance : Mul (List Alphabet) := ⟨(· ++ ·)⟩
instance : Nonempty (List Alphabet) := ⟨[]⟩

instance [Nonempty Alphabet] :
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws (List Alphabet) where
  MulAssociative := List.append_assoc
/--
`NonemptyLists` TODO

Predicate logic:

  ∀ {Alphabet : Type u} (a : List Alphabet), a = List.nil → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a = List.nil → False

Logical form (Lean):

```lean
def NonemptyLists : LRA.Set.LRA_Set (List Alphabet) := {l | l ≠ []}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def NonemptyLists : LRA.Set.LRA_Set (List Alphabet) := {l | l ≠ []}

/--
`nonemptyListsClosedUnderConcatenation` TODO

Predicate logic:

  ∀ {Alphabet : Type u} (a b : List Alphabet), (a ∈ LRA.AlgebraicStructures.Semigroup.Examples.NonemptyLists ∧ b ∈ LRA.AlgebraicStructures.Semigroup.Examples.NonemptyLists) → instHMul.hMul a b ∈ LRA.AlgebraicStructures.Semigroup.Examples.NonemptyLists

Predicate logic (unfolded):

  Ambient
    (Alphabet)
  Objects
    (none)
  Prove
    ((a ∈ fun l => l = List.nil → False) ∧ (b ∈ fun l => l = List.nil → False)) → { hMul := fun a b => { mul := fun x1 x2 => instHAppendOfAppend.1 x1 x2 }.mul a b }.hMul a b ∈ fun l => l = List.nil → False

Logical form (Lean):

```lean
theorem nonemptyListsClosedUnderConcatenation :
    ∀ a b, a ∈ NonemptyLists → b ∈ NonemptyLists →
      a * b ∈ (NonemptyLists : LRA.Set.LRA_Set (List Alphabet))
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
theorem nonemptyListsClosedUnderConcatenation :
    ∀ a b, a ∈ NonemptyLists → b ∈ NonemptyLists →
      a * b ∈ (NonemptyLists : LRA.Set.LRA_Set (List Alphabet)) := by
  sorry
noncomputable instance [Nonempty Alphabet] :
    Mul {l : List Alphabet // l ∈ NonemptyLists} :=
  Magma.Constructions.ClosedSubsetMul nonemptyListsClosedUnderConcatenation

noncomputable instance [Nonempty Alphabet] :
    Nonempty {l : List Alphabet // l ∈ NonemptyLists} :=
  ⟨[Classical.choice ‹Nonempty Alphabet›], List.cons_ne_nil _ []⟩

noncomputable instance [Nonempty Alphabet] :
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws
      {l : List Alphabet // l ∈ NonemptyLists} :=
  Semigroup.Constructions.ClosedSubsetSemigroupLaws nonemptyListsClosedUnderConcatenation
end LRA.AlgebraicStructures.Semigroup.Examples
