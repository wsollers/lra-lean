import LRA.Function.Definition
import LRA.Relation.Operations.Composition.Definition

namespace LRA.Function

universe u v w

/-- Composition of relational functions, inherited from relation composition. -/
def Compose
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    (rightFunction : RelationalFunction Beta Gamma)
    (leftFunction : RelationalFunction Alpha Beta) :
    RelationalFunction Alpha Gamma where
  graph := LRA.Relation.RelationComposition rightFunction.graph leftFunction.graph
  total := by
    sorry
  singleValued := by
    sorry

end LRA.Function
