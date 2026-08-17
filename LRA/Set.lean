import LRA.Set.Interface

/-!
Canonical backend-agnostic import route for set mathematics.

`LRA.Set` deliberately selects no concrete set ontology. Downstream subjects
should depend on the operation/certificate interface exposed here. Concrete
predicate-set and ZFC realizations, model theory, set algebras, examples, and
Mathlib interoperability are opt-in imports.
-/
