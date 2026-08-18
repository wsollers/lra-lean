import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Fiber.Consequences
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Function.Injective

open LRA.Function

universe u v

/--
A map is injective exactly when its kernel relation is the identity relation
on its domain.
-/
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Injective map <->
      LRA.Function.Fiber.KernelRelation map =
        LRA.Relation.IdentityRelation Domain := by
  sorry

end LRA.Function.Injective
