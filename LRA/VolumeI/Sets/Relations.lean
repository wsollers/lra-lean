-- LRA/VolumeI/Sets/Relations.lean
--
-- The relation sibling of the model signature: a relation is a SET of
-- arity-tuples (codomain Prop). Carrier and arity live in the TYPE; the
-- defining predicate IS the extension (one datum, not three). Structural
-- properties (reflexive, symmetric, …) are predicates ONE RUNG UP — about
-- a relation, never fields inside it.
--
-- Built on Foundations.Tuple (shared with Algebra/Operations.lean). Every
-- concrete relation ships ONE characterization lemma that absorbs the
-- Fin/pair plumbing once; the property proofs then route through it.

import LRA.VolumeI.Foundations.Tuple
import LRA.VolumeI.Sets.SetDefinitions

namespace LRA.VolumeI.Sets.Relations

open LRA.VolumeI.Foundations
open LRA.VolumeI.Sets

-- ── The relation type ──────────────────────────────────────────────────────

/-- An arity-`n` relation on `α`: a set of arity-`n` tuples. Arity is in the
    type, so it is recoverable even for the empty relation. -/
abbrev Relation (α : Type) (n : Nat) : Type := Set (Tuple α n)

/-- A binary relation: the arity-2 specialization. -/
abbrev BinaryRelation (α : Type) : Type := Relation α 2

/-- "The relation holds of `first` and `second`": the ordered pair is a member
    of the relation-set. This is the queryable accessor — relation applied to a
    tuple — mirroring `Operations.apply`. -/
def BinaryRelationHolds {α : Type}
    (relation : BinaryRelation α) (first second : α) : Prop :=
  memberOf (pair first second) relation

-- ── Structural properties (predicates ABOUT a relation, one rung up) ───────

/-- Reflexive: every element is related to itself. -/
def RelationIsReflexive {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ element : α, BinaryRelationHolds relation element element

/-- Irreflexive: no element is related to itself. -/
def RelationIsIrreflexive {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ element : α, ¬ BinaryRelationHolds relation element element

/-- Symmetric: relatedness is independent of order. -/
def RelationIsSymmetric {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second →
    BinaryRelationHolds relation second first

/-- Antisymmetric: two mutually related elements are equal. -/
def RelationIsAntisymmetric {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second →
    BinaryRelationHolds relation second first →
    first = second

/-- Asymmetric: relatedness never holds in both directions. -/
def RelationIsAsymmetric {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second →
    ¬ BinaryRelationHolds relation second first

/-- Transitive: relatedness chains. -/
def RelationIsTransitive {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second third : α,
    BinaryRelationHolds relation first second →
    BinaryRelationHolds relation second third →
    BinaryRelationHolds relation first third

/-- Total: any two elements are related in at least one direction. -/
def RelationIsTotal {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second ∨
    BinaryRelationHolds relation second first

-- ── Bundled properties ─────────────────────────────────────────────────────

/-- An equivalence relation: reflexive, symmetric, and transitive. -/
def RelationIsEquivalence {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsReflexive relation ∧
    RelationIsSymmetric relation ∧
    RelationIsTransitive relation

/-- A preorder: reflexive and transitive. -/
def RelationIsPreorder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsReflexive relation ∧ RelationIsTransitive relation

/-- A partial order: reflexive, antisymmetric, and transitive. -/
def RelationIsPartialOrder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsReflexive relation ∧
    RelationIsAntisymmetric relation ∧
    RelationIsTransitive relation

/-- A total order: a partial order in which any two elements are comparable. -/
def RelationIsTotalOrder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsPartialOrder relation ∧ RelationIsTotal relation

/-- A strict order: irreflexive and transitive. -/
def RelationIsStrictOrder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsIrreflexive relation ∧ RelationIsTransitive relation

-- ════════════════════════════════════════════════════════════════════════════
-- Equality as a relation — the canonical equivalence relation
-- ════════════════════════════════════════════════════════════════════════════

/-- Equality as a relation-set: the set of pairs whose two components agree. -/
def EqualityRelation {α : Type} : BinaryRelation α :=
  fun tuple => tuple i₀ = tuple i₁

/-- The characterization lemma: it pays the Fin/`pair` plumbing exactly once.
    Every equality-relation property proof below routes through this. -/
theorem EqualityRelationHoldsIffEqual {α : Type} (first second : α) :
    BinaryRelationHolds (@EqualityRelation α) first second ↔ first = second :=
  Iff.rfl

theorem EqualityRelationIsReflexive {α : Type} :
    RelationIsReflexive (@EqualityRelation α) :=
  fun element => (EqualityRelationHoldsIffEqual element element).mpr rfl

theorem EqualityRelationIsSymmetric {α : Type} :
    RelationIsSymmetric (@EqualityRelation α) :=
  fun first second holds =>
    (EqualityRelationHoldsIffEqual second first).mpr
      ((EqualityRelationHoldsIffEqual first second).mp holds).symm

theorem EqualityRelationIsTransitive {α : Type} :
    RelationIsTransitive (@EqualityRelation α) :=
  fun first second third firstHolds secondHolds =>
    (EqualityRelationHoldsIffEqual first third).mpr
      (((EqualityRelationHoldsIffEqual first second).mp firstHolds).trans
       ((EqualityRelationHoldsIffEqual second third).mp secondHolds))

theorem EqualityRelationIsEquivalence {α : Type} :
    RelationIsEquivalence (@EqualityRelation α) :=
  ⟨EqualityRelationIsReflexive,
   EqualityRelationIsSymmetric,
   EqualityRelationIsTransitive⟩

-- ════════════════════════════════════════════════════════════════════════════
-- Subset as a relation — a partial order whose antisymmetry IS extensionality
-- ════════════════════════════════════════════════════════════════════════════

/-- The subset relation on sets over `α`: `A ⊆ B` iff every member of `A` is a
    member of `B`. A binary relation on the carrier `Set α`. -/
def SubsetRelation {α : Type} : BinaryRelation (Set α) :=
  fun tuple => ∀ x, memberOf x (tuple i₀) → memberOf x (tuple i₁)

/-- Characterization lemma for subset. -/
theorem SubsetRelationHoldsIffContained {α : Type} (firstSet secondSet : Set α) :
    BinaryRelationHolds (@SubsetRelation α) firstSet secondSet ↔
      (∀ x, memberOf x firstSet → memberOf x secondSet) :=
  Iff.rfl

theorem SubsetRelationIsReflexive {α : Type} :
    RelationIsReflexive (@SubsetRelation α) :=
  fun aSet =>
    (SubsetRelationHoldsIffContained aSet aSet).mpr (fun _ membership => membership)

theorem SubsetRelationIsTransitive {α : Type} :
    RelationIsTransitive (@SubsetRelation α) :=
  fun firstSet secondSet thirdSet firstContained secondContained =>
    (SubsetRelationHoldsIffContained firstSet thirdSet).mpr
      (fun x membership =>
        (SubsetRelationHoldsIffContained secondSet thirdSet).mp secondContained x
          ((SubsetRelationHoldsIffContained firstSet secondSet).mp firstContained x
            membership))

/-- The wiring test: subset's antisymmetry IS the extensionality theorem.
    `A ⊆ B → B ⊆ A → A = B` is exactly `axiom_set_extension` applied to the
    two containments. The order layer rests on the axiom fix already shipped. -/
theorem SubsetRelationIsAntisymmetric {α : Type} :
    RelationIsAntisymmetric (@SubsetRelation α) :=
  fun firstSet secondSet forwardContained backwardContained =>
    axiom_set_extension firstSet secondSet
      (fun x =>
        ⟨(SubsetRelationHoldsIffContained firstSet secondSet).mp forwardContained x,
         (SubsetRelationHoldsIffContained secondSet firstSet).mp backwardContained x⟩)

theorem SubsetRelationIsPartialOrder {α : Type} :
    RelationIsPartialOrder (@SubsetRelation α) :=
  ⟨SubsetRelationIsReflexive,
   SubsetRelationIsAntisymmetric,
   SubsetRelationIsTransitive⟩

end LRA.VolumeI.Sets.Relations
