import LRA.Relation.Constructions.Mathlib.PredicateSetRelation
import LRA.Set.Interop.Switch
import Mathlib.Data.Real.Basic

namespace LRA.Relation.Examples.Predicate

open LRA.Relation.Constructions.Mathlib

def evenNaturals : LRA.Set.LRA_Set Nat :=
  fun n => n % 2 = 0

def evenNaturalsAsUnaryRelation : LRA.Relation.UnaryRelation Nat :=
  evenNaturals

def lessThanOrEqualPairs : PredicateSetRelation Nat :=
  fun pair => pair.1 ≤ pair.2

def lessThanOrEqualRelation : LRA.Relation.Endorelation Nat :=
  PredicateSetRelation.toEndorelation lessThanOrEqualPairs

def natToRealInclusionPairs : PredicateSetRelation (Nat ⊕ Real) :=
  fun pair =>
    match pair.1, pair.2 with
    | Sum.inl n, Sum.inr r => r = n
    | _, _ => False

def natToRealInclusionRelation : LRA.Relation.Endorelation (Nat ⊕ Real) :=
  PredicateSetRelation.toEndorelation natToRealInclusionPairs

def successorPairs : PredicateSetRelation Nat :=
  fun pair => pair.2 = pair.1 + 1

def successorRelation : LRA.Relation.Endorelation Nat :=
  PredicateSetRelation.toEndorelation successorPairs

theorem successorRelatesZeroToOne :
    successorRelation 0 1 := by
  change (0, 1) ∈ successorPairs
  change 1 = 0 + 1
  rfl

end LRA.Relation.Examples.Predicate
