import LRA.NumberSystems.IntegerStructure.Definition
import LRA.NumberSystems.IntegerStructure.Interface.Signature.Definition
import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.Model
import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.Axioms
import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.Satisfaction
import LRA.NumberSystems.IntegerStructure.Categoricity
import LRA.NumberSystems.IntegerStructure.Bundled

/-!
Canonical import route for the generic integer-structure axiomatic layer.

`IntegerStructure` is to the integers what `PeanoSystem` is to the naturals
(§1.6.10): the generic, construction-agnostic characterization -- zero, one,
negative one, mutually-inverse successor/predecessor, aperiodicity,
two-sided induction -- that every `Integers` construction (Polish's
two-sided successor, the quotient-of-pairs constructions, ...) realizes,
unqualified. It selects no construction and has no `Realization.lean` of
its own: nothing outside itself realizes here, this is what gets realized.

Promoted from `LRA.VolumeII.Integers.Polish.DiscreteIntegerStructure`'s
`IntegerStructure`, which stayed Int-specific throughout (its categoricity
result was proved against Lean's built-in `Int`, not against a second
generic model). That proven, Int-specific development stays with the
Polish construction that motivated it; this module generalizes its shape
the way the user's two-sided Peano axiomatization
(`Integers/ProofOrder.md`, Part 0) states it: model-to-model, matching
`PeanoSystem.Categoricity`'s own genericity.
-/
