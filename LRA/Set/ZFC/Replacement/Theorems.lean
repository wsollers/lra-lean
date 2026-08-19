import LRA.Set.ZFC.Axioms.Replacement
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

/-!
Existence, uniqueness, and the chosen replacement image.

Replacement is an axiom schema conditioned on the functional side hypothesis
`IsFunctionalOn A relation`.
-/

namespace LRA.Set.ZFC

/-- If `relation` is functional on `A`, there exists a replacement image. -/
theorem ReplacementImageExists
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B := by
  sorry

/-- Any replacement image equals any other replacement image. -/
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set → Set → Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B := by
  sorry

/-- TeX label: `thm:replacement-output-exists-unique`.
A functional replacement image exists uniquely. -/
theorem ReplacementImageExistsAndIsUnique
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ExistsAndUnique (fun B : Set => IsReplacementImageOf A relation B) := by
  sorry

/-- The chosen replacement image. -/
noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

/-- The chosen replacement image has the expected members. -/
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry

/-- Every replacement image equals the chosen one. -/
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional := by
  sorry

end LRA.Set.ZFC
