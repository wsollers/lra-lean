import LRA.Relation.Constructions.LRA.ZFCSetRelation

namespace LRA.Relation.Examples.ZFC

open LRA.Relation.Constructions.LRA
open LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def singletonCarrierObject :
    LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet :=
  TheSingleton TheEmptySet

noncomputable def emptyMemberOfSingletonCarrier :
    CarrierOfSet singletonCarrierObject :=
  ⟨TheEmptySet, by
    sorry⟩

noncomputable def singletonIdentityRelation :
    ZFCSetRelation singletonCarrierObject :=
  ⟨TheSingleton (LRA.Set.OrderedPair TheEmptySet TheEmptySet), by
    intro pairObject pairObjectMem
    refine ⟨TheEmptySet, TheEmptySet, ?_, ?_, ?_⟩
    · sorry
    · sorry
    · sorry⟩

noncomputable def singletonIdentityEndorelation :
    LRA.Relation.Endorelation (CarrierOfSet singletonCarrierObject) :=
  singletonIdentityRelation.toEndorelation

theorem singletonIdentityRelatesEmptyToItself :
    singletonIdentityEndorelation
      emptyMemberOfSingletonCarrier
      emptyMemberOfSingletonCarrier := by
  sorry

/-- The object-language Nat -> Real example is deferred until canonical ZFC carrier
objects for naturals and reals are exposed cheaply enough to reuse here. -/
def natToRealExampleDeferred : Prop := True

/-- A local stand-in for the intended Nat -> Nat shape using the available singleton carrier. -/
noncomputable def successorLikeRelationOnSingleton :
    LRA.Relation.Endorelation (CarrierOfSet singletonCarrierObject) :=
  singletonIdentityEndorelation

end LRA.Relation.Examples.ZFC
