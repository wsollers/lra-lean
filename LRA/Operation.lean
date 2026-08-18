import LRA.Operation.Definition
import LRA.Operation.Arity
import LRA.Operation.Laws
import LRA.Operation.Theorems
import LRA.Operation.Relationships
import LRA.Operation.Consequences
import LRA.Operation.FailureModes
import LRA.Operation.Divisibility

/-!
Canonical Operation subject.

Operation owns generic operation vocabulary and laws such as associativity,
commutativity, identity, distributivity, cancellation, inverse, closure,
divisibility, and related failure modes. Downstream algebraic structures and
number systems specialize these laws rather than redefine them.

The divisibility preorder theorem depends only on canonical `LRA.Order`.
-/
