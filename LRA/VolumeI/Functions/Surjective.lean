import LRA.VolumeI.Functions.Fibers

namespace LRA.VolumeI.Functions

universe u

/-- Surjectivity of a function. -/
def Surjective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall output, exists input, map input = output

/-- Fiber formulation of surjectivity. -/
def SurjectiveByFibers
    (domainOperations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, u})
    (ambientDomain : domainOperations.SetObject)
    {Codomain : Type u}
    (map : Function domainOperations.Element Codomain) : Prop :=
  forall output,
    exists input,
      domainOperations.member input (Fiber domainOperations ambientDomain map output)

end LRA.VolumeI.Functions
