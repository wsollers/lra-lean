import LRA.Set.Constructions.NBGSet.Primitives
import LRA.Identity.Constructions.Leibniz.Definitions.ExistenceAndUniqueness

namespace LRA.Set.Constructions.NBGSet.Axioms

abbrev Set := LRA.Set.Constructions.NBGSet

abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

end LRA.Set.Constructions.NBGSet.Axioms
