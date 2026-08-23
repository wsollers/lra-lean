-- LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Model.lean
-- The strict model-theoretic structure/theory/model split for integer structure.

import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.Theory
import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

/-!
An integer model in the strict model-theoretic sense:

1. an `L_int`-structure (`IntegerStructureLStructure`);
2. the Henkin integer-structure theory
   (`IntegerStructureHenkinTheory`, exported compatibly as
   `IntegerStructureTheory`);
3. a proof that the structure satisfies that theory.

The bridge lemma from native `IntegerStructure` data into this logical form
is still pending and is tracked in `Integers/ProofOrder.md`.
-/

/-- A concrete model of the active Henkin integer-structure theory: a
Henkin model together with a proof that it satisfies that theory. -/
structure IntegerStructureModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature
  satisfiesTheory : IntegerStructureTheory toHenkinModel

/-- Backward-compatible scaffold name while the bridge lemmas are still
being developed. -/
abbrev IntegerStructureSatisfaction :=
  IntegerStructureModel

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
