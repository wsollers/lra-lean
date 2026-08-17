import LRA.Set.ZFC.Axioms.EmptySet
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

/-!
Existence, uniqueness, and the chosen ZFC empty set.
-/

namespace LRA.Set.ZFC

/-- There exists an empty set. -/
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  have emptySet := EmptySet
  cases emptySet with
  | intro A AIsEmpty =>
    exact ⟨A, AIsEmpty⟩

/-- Any empty set is equal to any other empty set. -/
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  apply Extensionality
  intro b
  have bInB := BIsEmpty b
  have bInA := AIsEmpty b
  constructor
  · intro xInB
    exfalso
    exact bInB xInB
  · intro xInA
    exfalso
    exact bInA xInA

/-- Any two empty sets are equal. -/
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  exact EmptySetIsUnique BIsEmpty AIsEmpty

/-- TeX label: `thm:empty-set-exists-unique`.
There exists exactly one empty set. -/
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  constructor
  · exact EmptySetExists
  · intro A B AIsEmpty BIsEmpty
    exact EmptySetIsUnique BIsEmpty AIsEmpty

/-- The empty set chosen after its existence has been established. -/
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

/-- The chosen empty set has no members. -/
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  have TheEmptySetExists := EmptySetExists
  have TheEmptySetIsEmpty := Classical.choose_spec TheEmptySetExists
  exact TheEmptySetIsEmpty

/-- Every empty set is equal to the chosen empty set. -/
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  exact EmptySetsAreEqual AIsEmpty TheEmptySetIsEmpty

end LRA.Set.ZFC

/-! Compatibility aliases for the historical Enderton theorem names. -/
namespace LRA.Set.Enderton

abbrev EmptySetExists := LRA.Set.ZFC.EmptySetExists

abbrev EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) : B = A :=
  LRA.Set.ZFC.EmptySetIsUnique AIsEmpty BIsEmpty

abbrev EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) : A = B :=
  LRA.Set.ZFC.EmptySetsAreEqual AIsEmpty BIsEmpty

abbrev EmptySetExistsAndIsUnique := LRA.Set.ZFC.EmptySetExistsAndIsUnique
noncomputable abbrev TheEmptySet : Set := LRA.Set.ZFC.TheEmptySet
abbrev TheEmptySetIsEmpty : IsEmptySet TheEmptySet := LRA.Set.ZFC.TheEmptySetIsEmpty

abbrev EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) : A = TheEmptySet :=
  LRA.Set.ZFC.EveryEmptySetEqualsTheEmptySet AIsEmpty

end LRA.Set.Enderton
