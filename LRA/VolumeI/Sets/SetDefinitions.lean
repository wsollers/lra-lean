namespace LRA.VolumeI.Sets

-- A Set is defined as a predicate on a Type alpha
def Set (α : Type) := α → Prop

-- Element-of relation: x ∈ S
def memberOf (x : α) (s : Set α) : Prop := s x

-- Intersection (A ∩ B): The set of x such that x is in A AND x is in B
def intersection (s1 s2 : Set α) : Set α :=
  fun x => memberOf x s1 ∧ memberOf x s2

-- Union (A ∪ B): The set of x such that x is in A OR x is in B
def union (s1 s2 : Set α) : Set α :=
  fun x => memberOf x s1 ∨ memberOf x s2


-- ============================================================
-- ZFC AXIOMS IN LEAN 4 (FOUNDATIONAL REFERENCE)
-- ============================================================
-- Lean 4 is based on Type Theory, not ZFC. However, we can
-- map ZFC concepts to Lean's built-in axioms and constants.
-- ============================================================

/-
  1. AXIOM OF EXTENSIONALITY
     Status: NOT built-in for predicates.
     We must define it (as we did with `axiom_set_extension`) to treat
     functions as sets.
-/

-- Extensionality: Two sets are equal if they have the same members.
-- This is the only "Axiom" we need for these proofs.
axiom axiom_set_extension {α : Type} (A B : Set α) : (∀ x, memberOf x A ↔ memberOf x B) → A = B

/-
  2. AXIOM OF EMPTY SET / EXISTENCE
     Status: Built-in via the 'Empty' type or 'False' predicate.
-/
def emptySet (α : Type) : Set α := fun _ => False


/-
  3. AXIOM OF PAIRING
     Status: Built-in via Inductive Types (Prod / PProd).
-/

/-
  4. AXIOM OF UNION
     Status: Built-in via Logical Disjunction (∨).
-/

/-
  5. AXIOM OF POWER SET
     Status: Built-in via Function Types (α → Prop).
     The set of all subsets of α is exactly the type 'Set α'.
-/

/-
  6. AXIOM OF INFINITY
     Status: Provided by the inductive definition of Natural Numbers.
     (In your project, this is 'Axiom N' in Landau/Axioms.lean) .
-/

/-
  7. AXIOM OF CHOICE
     Status: Available in Lean 4 core as 'Classical.choice'.
     It allows producing an element from a non-empty type.
-/

/-
  8. AXIOM OF SCHEMA OF SEPARATION / REPLACEMENT
     Status: Inherited through Lean's Function Abstraction.
     We 'separate' sets by defining new predicates: {x ∈ S | P x}.
-/

/-
  9. AXIOM OF REGULARITY (FOUNDATION)
     Status: Implicitly handled by Lean's requirement that
     inductive types be well-founded (no infinite descending chains).
-/





end LRA.VolumeI.Sets
