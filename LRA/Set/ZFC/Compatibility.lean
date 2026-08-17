import LRA.Set.ZFC.Axioms

/-! Temporary compatibility surface for the pre-standardization Enderton namespace. -/

namespace LRA.Set.Enderton

abbrev Set := LRA.Set.ZFCSet
abbrev MembershipRelation : Set → Set → Prop := LRA.Set.ZFCMembership

abbrev Extensionality := LRA.Set.ZFC.Extensionality
abbrev EmptySet := LRA.Set.ZFC.EmptySet
abbrev Pairing := LRA.Set.ZFC.Pairing
abbrev Union := LRA.Set.ZFC.Union
abbrev PowerSet := LRA.Set.ZFC.PowerSet
abbrev Infinity := LRA.Set.ZFC.Infinity
abbrev Separation := LRA.Set.ZFC.Separation
abbrev Replacement := LRA.Set.ZFC.Replacement
abbrev Foundation := LRA.Set.ZFC.Foundation
abbrev Choice := LRA.Set.ZFC.Choice

end LRA.Set.Enderton
