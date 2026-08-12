import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality

/-!
Existence, uniqueness, and the chosen Enderton empty set.
-/

namespace LRA.VolumeI.Set.Enderton
/--
There exists an empty set.

Logical form:

```lean
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A
```
-/
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  have emptySet := EmptySet
  cases emptySet with
  | intro A AIsEmpty =>
    exact ⟨A, AIsEmpty⟩

/--
Any empty set is equal to any other empty set.

Logical form:

```lean
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A
```
-/
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




theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  exact EmptySetIsUnique BIsEmpty AIsEmpty




/-- TeX label: `thm:empty-set-exists-unique`.

There exists exactly one empty set. Its proof combines `EmptySetExists` with
`EmptySetIsUnique`.

Logical form:

```lean
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet
```
-/
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  constructor
  · exact EmptySetExists
  · intro A B AIsEmpty BIsEmpty
    exact EmptySetIsUnique BIsEmpty AIsEmpty

/--
The empty set chosen after its existence has been established.

Logical form:

```lean
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists
```
-/
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists
/--
The chosen empty set has no members.

Logical form:

```lean
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet
```
-/
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  have TheEmptySetExists := EmptySetExists
  have TheEmptySetIsEmpty := Classical.choose_spec TheEmptySetExists
  exact TheEmptySetIsEmpty
/--
Every empty set is equal to the chosen empty set.

Logical form:

```lean
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet
```
-/
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  exact EmptySetsAreEqual AIsEmpty TheEmptySetIsEmpty


end LRA.VolumeI.Set.Enderton
