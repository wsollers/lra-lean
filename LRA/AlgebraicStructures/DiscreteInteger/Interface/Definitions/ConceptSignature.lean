import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.AlgebraicStructures.Ring.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/--
`DiscreteIntegerConceptSignature` The UA-level signature for a discrete integer structure: a ring's carrier and operations, plus the two extra unary step operations (`succ`, `pred`) the two-sided-Peano axiomatization adds on top.

Predicate logic:

  structure DiscreteIntegerConceptSignature extends RingConceptSignature where
    succ : LRA.Operation.UnaryOperation carrier
    pred : LRA.Operation.UnaryOperation carrier

Predicate logic (unfolded):

  structure DiscreteIntegerConceptSignature extends RingConceptSignature where
    succ : LRA.Operation.UnaryOperation carrier
    pred : LRA.Operation.UnaryOperation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure DiscreteIntegerConceptSignature extends RingConceptSignature where
  succ : LRA.Operation.UnaryOperation carrier
  pred : LRA.Operation.UnaryOperation carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure DiscreteIntegerConceptSignature extends RingConceptSignature where
  succ : LRA.Operation.UnaryOperation carrier
  pred : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
