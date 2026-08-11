import LRA.VolumeI.Algebra.Signatures.FormalVocabulary
import LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage
import LRA.VolumeI.Algebra.Signatures.OperationBundles

/-!
Aggregate import for algebraic signatures.

The existing number-system-heavy signature implementation remains in
`LRA.VolumeI.Algebra.Models.Signatures` for this first pass and is deferred to
the Volume II-oriented number-system pass.
-/

/-!
The per-operation symbol-type signatures (`Signatures/Algebraic`,
`Signatures/Ordered`) and the bundled structure hierarchy
(`Algebra/Structures`) are retired to `hold/Algebra-bundled/`: they had
no consumers, their arity fields did not enforce their advertised arities,
and the mixin layer in `LRA.VolumeI.AlgebraicStructures` supersedes them.
-/
