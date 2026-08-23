-- LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Model.lean
-- The strict model-theoretic structure/theory/model split for Peano system.

import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.Theory
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

/-!
A Peano model in the strict model-theoretic sense:

1. an `L_nat`-structure (`PeanoLStructure`);
2. the Henkin Peano theory (`PeanoHenkinTheory`, exported compatibly as
   `PeanoTheory`);
3. a proof that the structure satisfies that theory.

The bridge lemma from native `PeanoSystem` data into this logical form is
still pending.
-/

/-- A concrete model of the active Henkin Peano theory: a Henkin model
together with a proof that it satisfies that theory. -/
structure PeanoModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature
  satisfiesTheory : PeanoTheory toHenkinModel

/-- Backward-compatible scaffold name while bridge lemmas are still being
developed. -/
abbrev PeanoSatisfaction := PeanoModel

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
