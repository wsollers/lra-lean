import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Fiber.Consequences
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Map.Injective

open LRA.Map.Typed

universe u v

/--
A map is injective exactly when its kernel relation is the identity relation
on its domain.
-/
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Injective map <->
      LRA.Map.Fiber.KernelRelation map =
        LRA.Relation.IdentityRelation Domain := by
  sorry

end LRA.Map.Injective
