import Mathlib.Algebra.Group.End
import LRA.AlgebraicStructures.Group.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Group.Examples

/-- `(Sym(S), ∘)` — Mathlib's own `Equiv.Perm S` (bijections `S → S` under
composition), free via the generic Mathlib bridge (`Equiv.Perm.permGroup`).
Non-abelian for `|S| ≥ 3`, per the user's own note — `GroupLaws` doesn't
assume commutativity either way. -/
example {S : Type u} : LRA.AlgebraicStructures.GroupLaws (Equiv.Perm S) := inferInstance

end LRA.AlgebraicStructures.Group.Examples
