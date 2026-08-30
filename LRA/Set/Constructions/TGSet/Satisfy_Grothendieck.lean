import LRA.Set.Constructions.TGSet.Satisfy_ZFC
import LRA.Set.Constructions.TGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.TGSet.Theorems.ModelTheory.StandardTransitive
import LRA.Set.Constructions.GrothendieckUniverse.Satisfy_ZFC

/-!
TGSet supports and satisfies the Grothendieck-universe tower: the third leg of
TGSet's triple-satisfy (Generic / ZFC / Grothendieck). Every internal universe
`U` is itself an internal model of ZFC, and TG provides a canonical such
universe for every parameter set.
-/

namespace LRA.Set.Constructions.TGSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.Constructions.TGSet.Interface.ModelTheory
open LRA.Set.Constructions.GrothendieckUniverse
open LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

theorem tgSetSupportsUniverseAxiom : TGUniverseAxiom := by
  sorry

theorem tgSetContainsInternalUniverseModel
    (A : TGSetObject) :
    ∃ U : TGSetObject,
      ∃ hU : TGUniversePredicate A U,
      GrothendieckUniverseMembershipModel A U hU ∈
        ModelsOfFormulaTheory ZFCTheory := by
  sorry

theorem tgSetInternalUniverseIsStandardTransitive
    (A : TGSetObject) :
    IsStandardTransitiveMembershipStructure
      (toUniverseLStructure
        A
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A)
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverseIsGrothendieckUniverseFor A)) := by
  sorry

/--
Interface-level tower statement: TG provides canonical internal Grothendieck
universes, each of which models ZFC.
-/
def SupportsInternalUniverseTower : Prop :=
  ∀ A : TGSetObject,
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory

theorem tgSetSupportsInternalUniverseTower : SupportsInternalUniverseTower := by
  sorry

/--
Interface-level TG semantic package. The ambient model is recorded together with
the TG universe axiom and the existence of internal ZFC-universes.
-/
def SatisfiesTGSemanticTower : Prop :=
  TGUniverseAxiom ∧ SupportsInternalUniverseTower

theorem tgSetSatisfiesTGSemanticTower : SatisfiesTGSemanticTower := by
  sorry

/--
TGSet, as the ambient model, satisfies its own interface-level export
`SatisfiesTGTheory`: it models ZFC and supports the universe axiom. The proof
is `⟨tgSetModelsZFC, tgSetSupportsUniverseAxiom⟩`.
-/
theorem tgSetSatisfiesTGTheory : SatisfiesTGTheory TGSetMembershipModel := by
  sorry

end LRA.Set.Constructions.TGSet
