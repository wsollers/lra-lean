import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.SetRings.Signature

namespace LRA.Logic.ModelTheory.SetAlgebras

/-!
Source-facing signature for algebras of sets.

The abstract distinguished elements are named `zero` and `one`; concrete
powerset models will interpret `zero` as the empty set and `one` as the
ambient universe.
-/

/-- A set-algebra signature is a set-ring signature with a distinguished `one`
and a complement operation; equivalently, in powerset models `zero` is `∅`,
`one` is `U`, `join` is union, `meet` is intersection, and `complement` is set
complement relative to `U`.

Logical form:

```lean
structure SetAlgebraSignature extends LRA.Logic.ModelTheory.SetRings.SetRingSignature where
  one : carrier
  complement : LRA.Operation.UnaryOperation carrier
```
-/
structure SetAlgebraSignature extends LRA.Logic.ModelTheory.SetRings.SetRingSignature where
  one : carrier
  complement : LRA.Operation.UnaryOperation carrier

end LRA.Logic.ModelTheory.SetAlgebras
