import LRA.VolumeII.Switches
import LRA.VolumeIV.AlgebrasOfSets.Foundations.AlgebraOfSets

namespace LRA.Tests.VolumeII.Switches.Sets

open LRA.VolumeI.Set.Algebra
open LRA.VolumeI.Set.Algebra.Collection
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

example : (LRASetAlgebraSignature Nat).carrier = LRA.VolumeI.Set.Implementations.LRASet.LRASet Nat := rfl

example :
    CollectionBooleanOperations
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Nat) :=
  mathlibCollectionBooleanOperations Nat

example :
    CollectionBooleanOperations
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Nat) :=
  lraSetCollectionBooleanOperations Nat

example :
    CollectionBooleanOperations
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Nat) :=
  ttSetCollectionBooleanOperations Nat

example (native : LRA.VolumeI.Set.Implementations.ZFC.NativeSetOperations) :
    NonemptySetPredicate
      (LRA.VolumeI.Set.Implementations.ZFC.collectionSetOperations native) :=
  zfcNonemptySetPredicate native

example : mathlibSetOpinion.status = BackendContractStatus.active := rfl

example : lraSetOpinion.status = BackendContractStatus.availableForSignature := rfl

example : ttSetOpinion.status = BackendContractStatus.availableForSignature := rfl

example : zfcSetOpinion.status = BackendContractStatus.availableForSignature := rfl

example : LRA.VolumeIV.AlgebrasOfSets.AlgebraOfSetsDefinition :=
  activeSetAlgebraModel Nat

example
    (space : LRA.VolumeIV.AlgebrasOfSets.AlgebraOfSetsSpaceDefinition) :
    space.SetObject = space.algebra.signature.carrier := rfl

end LRA.Tests.VolumeII.Switches.Sets
