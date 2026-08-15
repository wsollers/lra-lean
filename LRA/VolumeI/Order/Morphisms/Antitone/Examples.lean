import LRA.VolumeI.Order.Morphisms.Antitone.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Order

open LRA.Set

universe u v

/-- Complement reverses inclusion in every generic set backend that supports it. -/
theorem ComplementIsAntitone
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [HasUniversal SetObject] [HasComplement SetObject]
    [MembershipLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject] :
    Antitone
      (fun left right : SetObject => left ⊆ right)
      (fun left right : SetObject => left ⊆ right)
      HasComplement.complement := by
  sorry

end LRA.Order
