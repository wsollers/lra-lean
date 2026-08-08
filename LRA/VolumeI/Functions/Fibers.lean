import LRA.VolumeI.Functions.Preimages

namespace LRA.VolumeI.Functions

universe u

/-- The fiber over one codomain value. -/
def Fiber
    (domainOperations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, u})
    (ambientDomain : domainOperations.SetObject)
    {Codomain : Type u}
    (map : Function domainOperations.Element Codomain)
    (output : Codomain) : domainOperations.SetObject :=
  domainOperations.separation ambientDomain (fun input => map input = output)

end LRA.VolumeI.Functions
