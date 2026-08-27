import LRA.Set.Constructions.TGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.TGSet.ModelTheory.StandardTransitive
import LRA.Set.Constructions.TGSet.Axioms
import LRA.Set.Constructions.TGSet.Theorems
import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.Model

namespace LRA.Set.Constructions.TGSet.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.Constructions.TGSet
open LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

@[reducible] noncomputable def TGSetMembershipModel : Model MembershipSignature where
  Domain := TGSetObject
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

theorem tgSetSupportsUniverseAxiom : TGUniverseAxiom := by
  infer_instance

/--
The canonical internal Grothendieck-universe model exported by TG.
-/
noncomputable abbrev TGSetCanonicalGrothendieckUniverseMembershipModel :=
  LRA.Set.ModelTheory.TGSetCanonicalGrothendieckUniverseMembershipModel

theorem tgSetCanonicalGrothendieckUniverseModelsZFC
    (A : TGSetObject) :
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory :=
  LRA.Set.ModelTheory.tgSetCanonicalGrothendieckUniverseModelsZFC A

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

end LRA.Set.Constructions.TGSet.Interface.ModelTheory
