import LRA.VolumeI.UniversalAlgebra.Signatures.OperationBundles

namespace LRA.Logic.ModelTheory.BooleanAlgebras

/-!
Source-facing signature for Boolean algebras.
-/

/-- A Boolean-algebra signature names an abstract carrier with `zero`, `one`,
`join`, `meet`, and `complement`; equivalently, concrete powerset models
interpret these as `∅`, `U`, union, intersection, and set complement.

Logical form:

```lean
abbrev BooleanAlgebraSignature :=
  LRA.UniversalAlgebra.Signatures.BooleanAlgebraOperationSignature
```
-/
abbrev BooleanAlgebraSignature :=
  LRA.UniversalAlgebra.Signatures.BooleanAlgebraOperationSignature

end LRA.Logic.ModelTheory.BooleanAlgebras
