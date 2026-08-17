import LRA.Operation.Definition
import LRA.Operation.Arity
import LRA.Operation.Laws
import LRA.Operation.Theorems
import LRA.Operation.Relationships
import LRA.Operation.Consequences
import LRA.Operation.FailureModes

/-!
Canonical Operation subject.

Operation owns generic operation vocabulary and laws such as associativity,
commutativity, identity, distributivity, cancellation, inverse, closure, and
related failure modes. Downstream algebraic structures and number systems
specialize these laws rather than redefine them.

`Divisibility` remains outside this pre-Order root for now because its principal
structural theorem targets `LRA.Order.Preorder`.
-/
