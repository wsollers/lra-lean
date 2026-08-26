import LRA.Set.Constructions.ZFCSet.Primitives
import LRA.Identity.Constructions.Leibniz.Definitions.ExistenceAndUniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

abbrev Set := LRA.Set.Constructions.ZFCSet

abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

end LRA.Set.Constructions.ZFCSet.Axioms
