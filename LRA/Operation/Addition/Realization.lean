import LRA.Operation.Addition.Definition

namespace LRA.Operation.Addition

open LRA.Operation

universe u

/-- A realized addition package exposing an actual `Add` instance. -/
structure Realization (Carrier : Type u) where
  spec : Specification Carrier
  instAdd : Add Carrier

instance {Carrier : Type u} : CoeFun (Specification Carrier) (fun _ => Carrier → Carrier → Carrier) where
  coe spec := spec.add

end LRA.Operation.Addition
