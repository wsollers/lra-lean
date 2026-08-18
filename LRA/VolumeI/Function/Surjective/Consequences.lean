import LRA.VolumeI.Function.Surjective.Definition
import LRA.VolumeI.Function.Image.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Function.Surjective

open scoped LRA.Set
open LRA.Function

universe u₁ u₂ v₁ v₂

/--
If the chosen ambient domain contains every typed input, surjectivity is
equivalent to the range covering every codomain element.
-/
theorem SurjectiveIffRangeCoversCodomain
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    [LRA.Set.HasSeparation CodomainElement CodomainSet]
    [LRA.Set.HasUniversal CodomainSet]
    [LRA.Set.HasComplement CodomainSet]
    [LRA.Set.SeparationLaws CodomainElement CodomainSet]
    [LRA.Set.UniversalMembershipLaws CodomainElement CodomainSet]
    (map : Function DomainElement CodomainElement)
    (ambientDomain : DomainSet)
    (ambientCoversDomain :
      forall input : DomainElement, input ∈ ambientDomain) :
    Surjective map <->
      forall output : CodomainElement,
        output ∈
          (LRA.Function.Image.Range map ambientDomain : CodomainSet) := by
  sorry

end LRA.Function.Surjective
