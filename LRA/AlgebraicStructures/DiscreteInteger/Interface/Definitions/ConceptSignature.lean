import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.AlgebraicStructures.Ring.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a discrete integer structure: a ring's carrier
and operations, plus the two extra unary step operations (`succ`, `pred`) the
two-sided-Peano axiomatization adds on top. -/
structure DiscreteIntegerConceptSignature extends RingConceptSignature where
  succ : LRA.Operation.UnaryOperation carrier
  pred : LRA.Operation.UnaryOperation carrier

end LRA.AlgebraicStructures
