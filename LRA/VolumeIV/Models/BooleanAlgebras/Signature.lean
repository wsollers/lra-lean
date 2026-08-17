import LRA.VolumeI.UniversalAlgebra.InterpretedOperationBundles

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
  LRA.UniversalAlgebra.InterpretedOperationBundles.BooleanAlgebraOperationBundle
```
-/
abbrev BooleanAlgebraSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.BooleanAlgebraOperationBundle

end LRA.Logic.ModelTheory.BooleanAlgebras
