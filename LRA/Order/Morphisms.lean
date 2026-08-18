import LRA.Order.Morphisms.Monotone.Definition
import LRA.Order.Morphisms.Monotone.Theorems
import LRA.Order.Morphisms.Antitone.Definition
import LRA.Order.Morphisms.Antitone.Theorems
import LRA.Order.Morphisms.OrderEmbedding.Definition
import LRA.Order.Morphisms.OrderEmbedding.Theorems
import LRA.Order.Morphisms.OrderIsomorphism.Definition
import LRA.Order.Morphisms.OrderIsomorphism.Theorems

/-!
Canonical order-specific morphisms: monotone and antitone functions, order
embeddings, and order isomorphisms.

Each is a specialization of a `LRA.Morphism` primitive rather than a fresh
statement of the preservation quantifier. Set-image and set-preimage transport
results are not owned here; they belong to the function calculus that owns
image and preimage.
-/
