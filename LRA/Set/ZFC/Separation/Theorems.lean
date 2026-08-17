import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality

/-!
Existence, uniqueness, and the chosen separated subset.

Separation is an axiom schema: `property` ranges over Lean predicates on
`Set`, standing in for the schema's instances.
-/

namespace LRA.Set.Enderton
/--
There exists a subset of `A` separated by `property`.

Logical form:

```lean
theorem SeparatedSubsetExists (A : Set) (property : Set -> Prop) :
    ∃ B : Set, IsSeparatedSubset A property B
```
-/
theorem SeparatedSubsetExists (A : Set) (property : Set -> Prop) :
    ∃ B : Set, IsSeparatedSubset A property B := by
  sorry
/--
Any subset of `A` separated by `property` equals any other.

Logical form:

```lean
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set -> Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B
```
-/
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set -> Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

/-- TeX label: `thm:separation-output-exists-unique`.

For any set and property, there exists exactly one subset separated by that
property.

Logical form:

```lean
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set -> Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B)
```
-/
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set -> Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B) := by
  sorry

/-- The subset of `A` separated by `property`, chosen after its existence has
been established.

Logical form:

```lean
noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)
```
-/
noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)
/--
The chosen separated subset has the expected members.

Logical form:

```lean
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set -> Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property)
```
-/
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set -> Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property) := by
  sorry
/--
Every subset of `A` separated by `property` equals the chosen one.

Logical form:

```lean
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set -> Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property
```
-/
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set -> Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property := by
  sorry

end LRA.Set.Enderton
