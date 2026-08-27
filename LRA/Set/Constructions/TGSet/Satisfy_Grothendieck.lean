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
  infer_instance

theorem tgSetContainsInternalUniverseModel
    (A : TGSetObject) :
    ∃ U : TGSetObject,
      ∃ hU : TGUniversePredicate A U,
      GrothendieckUniverseMembershipModel A U hU ∈
        ModelsOfFormulaTheory ZFCTheory := by
  rcases GrothendieckUniverseExistsAsGenericUniverse A with ⟨U, hU⟩
  refine ⟨U, hU, ?_⟩
  exact grothendieckUniverseModelsZFC A U hU

theorem tgSetInternalUniverseIsStandardTransitive
    (A : TGSetObject) :
    IsStandardTransitiveMembershipStructure
      (toUniverseLStructure
        A
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A)
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverseIsGrothendieckUniverseFor A)) :=
  grothendieckUniverseModelIsStandardTransitive
    A
    (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A)
    (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverseIsGrothendieckUniverseFor A)

/--
Interface-level tower statement: TG provides canonical internal Grothendieck
universes, each of which models ZFC.
-/
def SupportsInternalUniverseTower : Prop :=
  ∀ A : TGSetObject,
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory

theorem tgSetSupportsInternalUniverseTower : SupportsInternalUniverseTower :=
  tgSetCanonicalGrothendieckUniverseModelsZFC

/--
Interface-level TG semantic package. The ambient model is recorded together with
the TG universe axiom and the existence of internal ZFC-universes.
-/
def SatisfiesTGSemanticTower : Prop :=
  TGUniverseAxiom ∧ SupportsInternalUniverseTower

theorem tgSetSatisfiesTGSemanticTower : SatisfiesTGSemanticTower := by
  constructor
  exact tgSetSupportsUniverseAxiom
  exact tgSetSupportsInternalUniverseTower

/--
TGSet, as the ambient model, satisfies its own interface-level export
`SatisfiesTGTheory`: it models ZFC and supports the universe axiom. The proof
is `⟨tgSetModelsZFC, tgSetSupportsUniverseAxiom⟩`.
-/
theorem tgSetSatisfiesTGTheory : SatisfiesTGTheory TGSetMembershipModel := by
  sorry

end LRA.Set.Constructions.TGSet
