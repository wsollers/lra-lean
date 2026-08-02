import LRA.VolumeII.Switches
import LRA.VolumeIV.AlgebrasOfSets.Foundations.AlgebraOfSets

namespace LRA.Tests.VolumeII.Switches.Sets

open LRA.VolumeI.Set.Algebra
open LRA.VolumeII.Switches.Sets

example : (ActiveSetAlgebraSignature Nat).carrier = Set Nat := rfl

example : (ActiveSetAlgebraSignature Nat).IsMember (∅ : Set Nat) := by
  trivial

example : SetAlgebraModel :=
  activeSetAlgebraModel Nat

example : SetAlgebraModel :=
  emptyUniversalSetAlgebraModel Bool

example :
    ¬ (EmptyUniversalSetAlgebraSignature Bool).IsMember ({true} : Set Bool) := by
  intro SingletonIsMember
  rcases SingletonIsMember with SingletonIsEmpty | SingletonIsUniversal
  · have TrueIsInSingleton : true ∈ ({true} : Set Bool) := by
      simp
    rw [SingletonIsEmpty] at TrueIsInSingleton
    exact TrueIsInSingleton
  · have FalseIsInUniversal : false ∈ (Set.univ : Set Bool) := by
      simp
    rw [← SingletonIsUniversal] at FalseIsInUniversal
    simp at FalseIsInUniversal

example : SigmaAlgebraModel :=
  activeSigmaAlgebraModel Nat

example : (LRASetAlgebraSignature Nat).carrier = LRA.VolumeI.Set.LRASet Nat := rfl

example : mathlibSetOpinion.status = BackendContractStatus.active := rfl

example : lraSetOpinion.status = BackendContractStatus.availableForSignature := rfl

example : zfcSetOpinion.status = BackendContractStatus.pendingOperationSurface := rfl

example : zfSetOpinion.status = BackendContractStatus.pendingOperationSurface := rfl

example : LRA.VolumeIV.AlgebrasOfSets.AlgebraOfSetsDefinition :=
  activeSetAlgebraModel Nat

example
    (space : LRA.VolumeIV.AlgebrasOfSets.AlgebraOfSetsSpaceDefinition) :
    space.SetObject = space.algebra.signature.carrier := rfl

end LRA.Tests.VolumeII.Switches.Sets
