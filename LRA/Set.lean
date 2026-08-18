import LRA.Set.Interface
import LRA.Set.SetClass

/-!
Canonical backend-agnostic import route for set mathematics.

`LRA.Set` selects no concrete set ontology. It exposes the shared operation/law
interface and the backend-neutral `SetClass` theory. Predicate-set and ZFC
realizations, model theory, SetSystems, examples, and Mathlib interoperability
remain opt-in imports.
-/
