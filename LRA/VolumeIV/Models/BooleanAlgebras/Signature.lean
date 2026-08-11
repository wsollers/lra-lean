import LRA.VolumeI.Algebra.Signatures.OperationBundles

namespace LRA.VolumeIV.Models.BooleanAlgebras

/-!
Source-facing signature for Boolean algebras.
-/

/-- A Boolean-algebra signature names an abstract carrier with `zero`, `one`,
`join`, `meet`, and `complement`; equivalently, concrete powerset models
interpret these as `∅`, `U`, union, intersection, and set complement.

Logical form:

```lean
abbrev BooleanAlgebraSignature :=
  LRA.VolumeI.Algebra.Signatures.BooleanAlgebraOperationSignature
```
-/
abbrev BooleanAlgebraSignature :=
  LRA.VolumeI.Algebra.Signatures.BooleanAlgebraOperationSignature

end LRA.VolumeIV.Models.BooleanAlgebras
