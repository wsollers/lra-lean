import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Theorems

/-!
Canonical public names for the derived ZFC development.

The underlying proofs were originally developed in the `LRA.Set.Enderton`
namespace. During standardization those declarations remain available for
compatibility, while this module exposes the mathematically owned `LRA.Set.ZFC`
surface used by new canonical code.
-/

namespace LRA.Set.ZFC

abbrev ExistsAndUnique := LRA.Set.Enderton.ExistsAndUnique
abbrev IsEmptySet := LRA.Set.Enderton.IsEmptySet
abbrev IsPairSet := LRA.Set.Enderton.IsPairSet
abbrev IsSingletonSet := LRA.Set.Enderton.IsSingletonSet
abbrev IsUnionOf := LRA.Set.Enderton.IsUnionOf
abbrev IsPowerSetOf := LRA.Set.Enderton.IsPowerSetOf
abbrev IsSeparatedSubset := LRA.Set.Enderton.IsSeparatedSubset
abbrev IsRelativeComplementOf := LRA.Set.Enderton.IsRelativeComplementOf
abbrev IsIntersectionOf := LRA.Set.Enderton.IsIntersectionOf
abbrev IsSymmetricDifferenceOf := LRA.Set.Enderton.IsSymmetricDifferenceOf
abbrev Subset := LRA.Set.Enderton.Subset
abbrev IsFunctionalOn := LRA.Set.Enderton.IsFunctionalOn
abbrev IsReplacementImageOf := LRA.Set.Enderton.IsReplacementImageOf
abbrev IsSuccessorOf := LRA.Set.Enderton.IsSuccessorOf
abbrev IsInductiveSet := LRA.Set.Enderton.IsInductiveSet
abbrev IsFoundationWitness := LRA.Set.Enderton.IsFoundationWitness
abbrev IsChoiceSetFor := LRA.Set.Enderton.IsChoiceSetFor

abbrev SetExtensionality := LRA.Set.Enderton.SetExtensionality
abbrev EmptySetExists := LRA.Set.Enderton.EmptySetExists
abbrev EmptySetIsUnique := LRA.Set.Enderton.EmptySetIsUnique
abbrev EmptySetExistsAndIsUnique := LRA.Set.Enderton.EmptySetExistsAndIsUnique
noncomputable abbrev TheEmptySet := LRA.Set.Enderton.TheEmptySet
abbrev TheEmptySetIsEmptySet := LRA.Set.Enderton.TheEmptySetIsEmptySet

noncomputable abbrev TheUnion := LRA.Set.Enderton.TheUnion
noncomputable abbrev TheIntersection := LRA.Set.Enderton.TheIntersection
noncomputable abbrev TheRelativeComplement := LRA.Set.Enderton.TheRelativeComplement
noncomputable abbrev TheSymmetricDifference := LRA.Set.Enderton.TheSymmetricDifference
noncomputable abbrev TheSeparatedSubset := LRA.Set.Enderton.TheSeparatedSubset
noncomputable abbrev ThePowerSet := LRA.Set.Enderton.ThePowerSet
noncomputable abbrev TheUnionOver := LRA.Set.Enderton.TheUnionOver
noncomputable abbrev TheIntersectionOver := LRA.Set.Enderton.TheIntersectionOver

end LRA.Set.ZFC
