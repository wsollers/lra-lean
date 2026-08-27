import LRA.Set.Constructions.ZFCSet.Primitives
import LRA.Identity.Interface.Definitions.Witnesses
import LRA.Identity.Constructions.Mathlib

namespace LRA.Set.Constructions.ZFCSet.Axioms

open scoped LRA.Identity.Construction.Mathlib

abbrev Set := LRA.Set.Constructions.ZFCSet

abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExactlyOne property

end LRA.Set.Constructions.ZFCSet.Axioms
