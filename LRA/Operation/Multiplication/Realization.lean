import LRA.Operation.Multiplication.Definition

namespace LRA.Operation.Multiplication

open LRA.Operation

universe u

/-- A realized multiplication package exposing an actual `Mul` instance. -/
structure Realization (Carrier : Type u) where
  spec : Specification Carrier
  instMul : Mul Carrier

instance {Carrier : Type u} : CoeFun (Specification Carrier) (fun _ => Carrier → Carrier → Carrier) where
  coe spec := spec.mul

end LRA.Operation.Multiplication
