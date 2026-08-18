import LRA.Function.Definition
import LRA.Function.Canonical
import LRA.Function.Properties
import LRA.Function.Structures
import LRA.Function.Operations
import LRA.Function.Calculus
import LRA.Function.SetTheoretic

/-!
Canonical Function subject.

A function *is* an arrow `Domain → Codomain`. Injective, surjective, and
bijective are properties of that arrow, stated through its `Graph` rather than
by restating the quantifier. Domain, range, image, preimage, point image, and
fibers specialize the `LRA.Relation` calculus and are not redefined here.
Function-producing constructions belong to `Operations`.

This subject deliberately does *not* own the question of what a function is
set-theoretically. That belongs to `LRA.Function.SetTheoretic`, which is
reached from this router and meets the arrow at exactly one theorem.
-/
