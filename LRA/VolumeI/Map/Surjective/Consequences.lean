import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Map.Surjective

open scoped LRA.Set
open LRA.Map.Typed

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
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet)
    (ambientCoversDomain :
      forall input : DomainElement, input ∈ ambientDomain) :
    Surjective map <->
      forall output : CodomainElement,
        output ∈
          (LRA.Map.Image.Range map ambientDomain : CodomainSet) := by
  constructor
  · intro surjective output
    unfold LRA.Map.Image.Range LRA.Map.Image.Image
    exact
      (LRA.Set.SeparationMembership
        (𝒰 : CodomainSet)
        (fun candidate : CodomainElement =>
          exists input : DomainElement,
            input ∈ ambientDomain /\ map input = candidate)
        output).mpr
        ⟨LRA.Set.UniversalMembership output,
          by
            rcases surjective output with ⟨input, mapsToOutput⟩
            exact ⟨input, ambientCoversDomain input, mapsToOutput⟩⟩
  · intro rangeCovers output
    unfold LRA.Map.Image.Range LRA.Map.Image.Image at rangeCovers
    have outputInRange := rangeCovers output
    have separatedMembership :=
      (LRA.Set.SeparationMembership
        (𝒰 : CodomainSet)
        (fun candidate : CodomainElement =>
          exists input : DomainElement,
            input ∈ ambientDomain /\ map input = candidate)
        output).mp outputInRange
    rcases separatedMembership with ⟨_, input, _, mapsToOutput⟩
    exact ⟨input, mapsToOutput⟩

end LRA.Map.Surjective
