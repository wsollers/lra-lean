import LRA.Operation.Definition
import LRA.Operation.Arity
import LRA.Operation.Laws

/-!
Canonical Operation subject.

Operation owns generic operation vocabulary and laws such as associativity,
commutativity, identity, distributivity, cancellation, and related failure modes.
Downstream algebraic structures and number systems should specialize these laws
rather than redefine them.
-/
