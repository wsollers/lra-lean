import LRA.Identity.Constructions.Axiomatic.Model
import LRA.Identity.Constructions.Mathlib.Model
import LRA.Identity.Interface.FirstOrder.Adapter
import LRA.Identity.Interface.SecondOrder.Adapter
import LRA.Identity.Interop.Providers.Default
import LRA.Identity.Laws.Model

namespace LRA.Identity.Tests.ModelSwitching

open LRA.Identity

private inductive ExampleRelationSymbol where
  | identity

private def ExampleIdentityLanguage :
    LRA.Identity.Interface.FirstOrder.LStructure where
  signature :=
    { Functions := ⟨Empty, fun symbol => nomatch symbol⟩
      Relations := ⟨ExampleRelationSymbol, fun _ => 2⟩
      Constants := Empty }
  identitySymbol := .identity
  identityArity := rfl

private def UnitIdentityInterpretation :
    LRA.Logic.FirstOrder.Interpretation ExampleIdentityLanguage.signature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun symbol => nomatch symbol
  interpretRelation := fun _ _ => True
  interpretConstant := fun symbol => nomatch symbol

private def UnitFirstOrderModel :
    LRA.Identity.Interface.FirstOrder.Model ExampleIdentityLanguage where
  interpretation := UnitIdentityInterpretation
  Identity := fun _ _ => True
  identityIsInterpretation := fun _ _ => Iff.rfl

private theorem UnitFirstOrderTheory :
    LRA.Identity.Interface.FirstOrder.Theory ExampleIdentityLanguage Nat
      UnitFirstOrderModel where
  reflexivity := fun _ => True.intro
  leibniz := by
    intro x y _ Property _ hProperty
    cases x
    cases y
    exact hProperty

private def FirstOrderIdentityModel : LRA.Identity.IdentityModel :=
  UnitFirstOrderModel.ToIdentityModel UnitFirstOrderTheory ⟨0, 1, by decide⟩

private def FullSecondOrderModel :
    LRA.Identity.Interface.SecondOrder.FullModel ExampleIdentityLanguage where
  firstOrder := UnitFirstOrderModel

private theorem FullSecondOrderTheory :
    LRA.Identity.Interface.SecondOrder.FullTheory FullSecondOrderModel where
  reflexive := fun _ => True.intro
  leibniz := by
    intro x y _ Property _ hProperty
    cases x
    cases y
    exact hProperty

private def FullSecondOrderIdentityModel : LRA.Identity.IdentityModel :=
  FullSecondOrderModel.ToIdentityModel FullSecondOrderTheory

private def IdentityFiberHenkinDomain :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain Unit where
  Admissible := fun Property => Property = (fun _ => True)

private def HenkinSecondOrderModel :
    LRA.Identity.Interface.SecondOrder.HenkinModel ExampleIdentityLanguage where
  firstOrder := UnitFirstOrderModel
  predicateDomain := IdentityFiberHenkinDomain

private theorem HenkinSecondOrderTheory :
    LRA.Identity.Interface.SecondOrder.HenkinTheory HenkinSecondOrderModel where
  reflexive := fun _ => True.intro
  leibniz := by
    intro x y _ Property _ hProperty
    cases x
    cases y
    exact hProperty

private def HenkinSecondOrderIdentityModel : LRA.Identity.IdentityModel :=
  HenkinSecondOrderModel.ToIdentityModel HenkinSecondOrderTheory
    (fun _ => rfl)
    (fun _ => rfl)

private theorem SelectedModelIdentitySymmetric
    (M : LRA.Identity.IdentityModel) {x y : M.Carrier}
    (hIdentity : M.Identity x y) : M.Identity y x :=
  M.IdentitySymmetric hIdentity

example {x y : FirstOrderIdentityModel.Carrier}
    (hIdentity : FirstOrderIdentityModel.Identity x y) :
    FirstOrderIdentityModel.Identity y x :=
  SelectedModelIdentitySymmetric FirstOrderIdentityModel hIdentity

example {x y : FullSecondOrderIdentityModel.Carrier}
    (hIdentity : FullSecondOrderIdentityModel.Identity x y) :
    FullSecondOrderIdentityModel.Identity y x :=
  SelectedModelIdentitySymmetric FullSecondOrderIdentityModel hIdentity

example {x y : HenkinSecondOrderIdentityModel.Carrier}
    (hIdentity : HenkinSecondOrderIdentityModel.Identity x y) :
    HenkinSecondOrderIdentityModel.Identity y x :=
  SelectedModelIdentitySymmetric HenkinSecondOrderIdentityModel hIdentity

example {x y : (LRA.Identity.Interop.Providers.Default.IdentityModel Bool).Carrier}
    (hIdentity :
      (LRA.Identity.Interop.Providers.Default.IdentityModel Bool).Identity x y) :
    (LRA.Identity.Interop.Providers.Default.IdentityModel Bool).Identity y x :=
  SelectedModelIdentitySymmetric
    (LRA.Identity.Interop.Providers.Default.IdentityModel Bool) hIdentity

example {x y :
    (LRA.Identity.Constructions.Mathlib.NativeIdentityModel Bool).Carrier}
    (hIdentity :
      (LRA.Identity.Constructions.Mathlib.NativeIdentityModel Bool).Identity x y) :
    (LRA.Identity.Constructions.Mathlib.NativeIdentityModel Bool).Identity y x :=
  SelectedModelIdentitySymmetric
    (LRA.Identity.Constructions.Mathlib.NativeIdentityModel Bool) hIdentity

example {x y :
    (LRA.Identity.Constructions.Axiomatic.AxiomaticIdentityModel Bool).Carrier}
    (hIdentity :
      (LRA.Identity.Constructions.Axiomatic.AxiomaticIdentityModel Bool).Identity x y) :
    (LRA.Identity.Constructions.Axiomatic.AxiomaticIdentityModel Bool).Identity y x :=
  SelectedModelIdentitySymmetric
    (LRA.Identity.Constructions.Axiomatic.AxiomaticIdentityModel Bool) hIdentity

end LRA.Identity.Tests.ModelSwitching
