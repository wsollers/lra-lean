import LRA.Set.Constructions.ZFCSet.Primitives
import LRA.Identity.Laws.Witnesses
import LRA.Identity.Constructions.Mathlib

namespace LRA.Set.Constructions.ZFCSet.Axioms

open scoped LRA.Identity.Construction.Mathlib

abbrev Set := LRA.Set.Constructions.ZFCSet

/--
`ExistsAndUnique property` states that `property` has a witness and all of its
witnesses are identical. It is the ZFC-set alias for
`LRA.Identity.ExactlyOne property`.

This namespace activates the Mathlib identity provider, so `Ident` is Lean
equality here. Equivalently, it expresses
`(∃ x, property x) ∧ ∀ x y, property x → property y → x = y`.
-/
abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExactlyOne property

end LRA.Set.Constructions.ZFCSet.Axioms
