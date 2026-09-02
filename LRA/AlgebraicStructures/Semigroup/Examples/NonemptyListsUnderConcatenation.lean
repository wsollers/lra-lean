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
def NonemptyLists : LRA.Set.LRA_Set (List Alphabet) := {l | l ≠ []}

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
