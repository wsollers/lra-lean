import LRA.Set.Constructions.NBGSet.Axioms.Public
import LRA.Set.Interface.Definitions.Pairing

namespace LRA.Set.Constructions.NBG

noncomputable instance (priority := high) : HasPairing Set Set Set :=
  ⟨OrderedPair⟩

end LRA.Set.Constructions.NBG
