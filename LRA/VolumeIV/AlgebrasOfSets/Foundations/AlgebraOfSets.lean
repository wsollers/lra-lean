import Mathlib.Data.Set.Basic

/-!
Reference definitions for algebras of sets.

This module records textbook-level data for Volume IV orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's measurable-space and set-algebra APIs directly.
-/

namespace LRA.VolumeIV.AlgebrasOfSets

universe u

/-- Reference data for an algebra of sets on a carrier type.

An algebra of sets is a family of subsets containing the whole space and closed
under complements and finite unions.
-/
structure AlgebraOfSetsDefinition (X : Type u) where
  /-- The subsets belonging to the algebra. -/
  IsMember : Set X → Prop
  /-- The whole carrier belongs to the algebra. -/
  univ_mem : IsMember Set.univ
  /-- Complements of members belong to the algebra. -/
  compl_mem : ∀ A : Set X, IsMember A → IsMember Aᶜ
  /-- Finite unions of members belong to the algebra, stated in binary form. -/
  union_mem : ∀ A B : Set X, IsMember A → IsMember B → IsMember (A ∪ B)

/-- Reference data for a space equipped with an algebra of sets. -/
structure AlgebraOfSetsSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The algebra of sets on the carrier. -/
  algebra : AlgebraOfSetsDefinition Carrier

end LRA.VolumeIV.AlgebrasOfSets

