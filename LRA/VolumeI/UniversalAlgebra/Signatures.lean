import LRA.VolumeI.UniversalAlgebra.Signatures.FormalVocabulary
import LRA.VolumeI.UniversalAlgebra.Signatures.BasicArithmeticLanguage
import LRA.VolumeI.UniversalAlgebra.Signatures.OperationBundles

/-!
Aggregate import for algebraic signatures.

Generic arity-indexed vocabulary and law-free operation bundles live here.
Named first-order signatures are owned by the corresponding
`AlgebraicStructures/<Concept>/ModelTheory` folder; concrete number-system
languages are owned by Volume II.
-/

/-!
The per-operation symbol-type signatures (`Signatures/Algebraic`,
`Signatures/Ordered`) and the bundled structure hierarchy
(`AlgebraicStructures`) are retired to `hold/Algebra-bundled/`: they had
no consumers, their arity fields did not enforce their advertised arities,
and the mixin layer in `LRA.AlgebraicStructures` supersedes them.
-/
