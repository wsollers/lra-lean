import LRA.VolumeI.Functions.Fibers

namespace LRA.VolumeI.Functions

universe u

/-- Injectivity of a function. -/
def Injective {Domain Codomain : Type u} (map : Domain -> Codomain) : Prop :=
  forall left right, map left = map right -> left = right

/-- Fiber formulation of injectivity. -/
def InjectiveByFibers
    (domainOperations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, u})
    (ambientDomain : domainOperations.SetObject)
    {Codomain : Type u}
    (map : Function domainOperations.Element Codomain) : Prop :=
  forall output left right,
    domainOperations.member left (Fiber domainOperations ambientDomain map output) ->
      domainOperations.member right (Fiber domainOperations ambientDomain map output) ->
        left = right

end LRA.VolumeI.Functions
