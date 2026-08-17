import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality

/-!
Existence, uniqueness, and the chosen replacement image.

Replacement is an axiom schema conditioned on a functional side hypothesis:
`relation` must assign at most one output to each member of `A`
(`IsFunctionalOn A relation`) before the image is guaranteed to exist.
-/

namespace LRA.Set.Enderton

/-- If `relation` is functional on `A`, there exists a replacement image of
`A` under `relation`.

Logical form:

```lean
theorem ReplacementImageExists
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B
```
-/
theorem ReplacementImageExists
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B := by
  sorry
/--
Any replacement image of `A` under `relation` equals any other.

Logical form:

```lean
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set -> Set -> Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B
```
-/
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set -> Set -> Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B := by
  sorry

/-- TeX label: `thm:replacement-output-exists-unique`.

If `relation` is functional on `A`, there exists exactly one replacement
image of `A` under `relation`.

Logical form:

```lean
theorem ReplacementImageExistsAndIsUnique
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    ExistsAndUnique (fun B : Set => IsReplacementImageOf A relation B)
```
-/
theorem ReplacementImageExistsAndIsUnique
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    ExistsAndUnique (fun B : Set => IsReplacementImageOf A relation B) := by
  sorry

/-- The replacement image of `A` under `relation`, chosen after its existence
has been established. Carries the functional hypothesis as an explicit
argument, the same way `TheEmptySet` carries no hypothesis beyond the axiom
and `TheSeparatedSubset` carries only `property` — this one additionally needs
`relation` to actually be functional before a choice is available.

Logical form:

```lean
noncomputable def TheReplacementImage
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)
```
-/
noncomputable def TheReplacementImage
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)
/--
The chosen replacement image has the expected members.

Logical form:

```lean
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional)
```
-/
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry
/--
Every replacement image of `A` under `relation` equals the chosen one.

Logical form:

```lean
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set -> Set -> Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional
```
-/
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set -> Set -> Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional := by
  sorry

end LRA.Set.Enderton
