import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment
import LRA.Logic.Semantics.Satisfaction
import LRA.Logic.Semantics.Substitution
import LRA.Logic.Semantics.Sentence
import LRA.Logic.Semantics.Examples
import LRA.Logic.Semantics.SecondOrderMonadic

/-!
Aggregate import for the `Semantics` layer (`Semantics/`): term
evaluation, assignment updating, first-order formula satisfaction,
substitution-satisfaction facts, assignment-independence for closed formulas,
the second end-to-end checkpoint (`A ∧ B`, both true, via nullary relation
symbols), and second-order (monadic, Henkin) satisfaction.
-/
