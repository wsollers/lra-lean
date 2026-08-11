import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions

/-!
Existence of a choice set, and one chosen witness.

Like Infinity, Choice does not pin down a unique object: a pairwise-disjoint
family generally has more than one valid transversal, so there is no
uniqueness theorem here. Unlike Infinity, a single canonical witness is still
worth naming (`TheChoiceSet`) — obtained the same way as every other chosen
operation in this folder, by `Classical.choose` on the existence theorem —
because later chapters will want to fix *a* transversal to work with, even
though it is not *the* transversal.
-/

namespace LRA.VolumeI.Set.Enderton

/-- If every member of `A` is nonempty and the members of `A` are pairwise
disjoint, there exists a choice set for `A`.

Logical form:

```lean
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet
```
-/
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

/-- A choice set for `A`, chosen after its existence has been established.
Not claimed to be *the* choice set — see the module docstring.

Logical form:

```lean
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)
```
-/
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)
/--
The chosen choice set really is a choice set for `A`.

Logical form:

```lean
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    IsChoiceSetFor A
      (TheChoiceSet A membersNonempty membersPairwiseDisjoint)
```
-/
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    IsChoiceSetFor A
      (TheChoiceSet A membersNonempty membersPairwiseDisjoint) := by
  sorry

end LRA.VolumeI.Set.Enderton
