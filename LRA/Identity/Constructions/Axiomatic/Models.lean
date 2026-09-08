import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLFull
import LRA.Identity.Interface.ModelTheory.Model

namespace LRA.Identity.Constructions.Axiomatic

universe u

/-- An equality structure realized by the axiomatic identity relation.

Logical form: `equalityInterpretation = Ax_IdentityRelation`.
-/
noncomputable def EqualityStructure
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.Identity.EqualityStructure := by
  sorry

/-- The axiomatic construction viewed as a pure-equality FOL model. -/
noncomputable def FOLModel (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature := by
  sorry

/-- The axiomatic construction viewed with full second-order semantics. -/
noncomputable def SOLFullModel (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature := by
  sorry

end LRA.Identity.Constructions.Axiomatic
