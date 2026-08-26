import LRA.Set.Constructions.TGSet.Interface.ModelTheory.LStructure
import LRA.Set.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Axioms
import LRA.Set.Constructions.GrothendieckUniverse.Definitions

namespace LRA.Set.Constructions.TGSet.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

abbrev extensionalityFormula := LRA.Set.ModelTheory.extensionalityFormula
abbrev emptySetFormula := LRA.Set.ModelTheory.emptySetFormula
abbrev pairingFormula := LRA.Set.ModelTheory.pairingFormula
abbrev unionFormula := LRA.Set.ModelTheory.unionFormula
abbrev powerSetFormula := LRA.Set.ModelTheory.powerSetFormula
abbrev infinityFormula := LRA.Set.ModelTheory.infinityFormula
abbrev foundationFormula := LRA.Set.ModelTheory.foundationFormula
abbrev choiceFormula := LRA.Set.ModelTheory.choiceFormula
abbrev SeparationHygienic := LRA.Set.ModelTheory.SeparationHygienic
abbrev separationInstance := LRA.Set.ModelTheory.separationInstance
abbrev ReplacementHygienic := LRA.Set.ModelTheory.ReplacementHygienic
abbrev replacementInstance := LRA.Set.ModelTheory.replacementInstance
abbrev ZFCTheory := LRA.Set.ModelTheory.ZFCTheory

/--
The TG-specific universe axiom: every set is contained in some Grothendieck
universe.
-/
abbrev TGUniverseAxiom :=
  LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom TGSetObject

/--
`TGUniversePredicate A U` is the internal universe predicate used by TG for a
universe `U` containing the parameter set `A`.
-/
abbrev TGUniversePredicate (A U : TGSetObject) : Prop :=
  LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U

/--
Interface-level notion of satisfying TG: the ambient structure satisfies ZFC and
supports the universe axiom.
-/
def SatisfiesTGTheory (model : Model MembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory ∧ TGUniverseAxiom

end LRA.Set.Constructions.TGSet.Interface.ModelTheory
