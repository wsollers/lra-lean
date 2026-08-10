import LRA.VolumeI.Set.Axioms.Axioms
import LRA.VolumeI.Set.Native.Definitions
import LRA.VolumeI.Set.Native.Extensionality

/-!
Existence, uniqueness, and the chosen native empty set.
-/

namespace LRA.VolumeI.Set

/--
There exists an empty set.

Logical form:

```lean
∃ A : Set, IsEmptySet A
```
-/
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  sorry

/--
Any empty set is equal to any other empty set.

Logical form:

```lean
IsEmptySet A → IsEmptySet B → B = A
```
-/
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

/-- TeX label: `thm:empty-set-exists-unique`.

There exists exactly one empty set. Its proof combines `EmptySetExists` with
`EmptySetIsUnique`.

Logical form:

```lean
∃ A : Set,
  IsEmptySet A ∧
  ∀ B : Set, IsEmptySet B → B = A
```
-/
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  sorry

/--
The empty set chosen after its existence has been established.

Logical form:

```lean
TheEmptySet = Classical.choose EmptySetExists
```
-/
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

/--
The chosen empty set has no members.

Logical form:

```lean
IsEmptySet TheEmptySet
```
-/
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  sorry

/--
Every empty set is equal to the chosen empty set.

Logical form:

```lean
IsEmptySet A → A = TheEmptySet
```
-/
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  sorry

end LRA.VolumeI.Set
