import LRA.Identity.Axioms
import LRA.Identity.Equality
import LRA.Identity.Distinctness
import LRA.Identity.Substitution
import LRA.Identity.Congruence
import LRA.Identity.Uniqueness
import LRA.Identity.ExistenceAndUniqueness
import LRA.Identity.Interface

/-!
Canonical import route for identity and equality.

The core aggregate intentionally excludes `LRA.Identity.Toolkit` and
`LRA.Identity.Interop.Lean`; those are opt-in layers.
-/
