namespace LRA.VolumeI.FirstOrderLogic.Relations

/-!
  ============================================================
  Properties of Binary Relations
  ============================================================

  A binary relation on a type `α` is a two-place predicate
  `α → α → Prop`. The definitions below name the structural
  properties such a relation may have (reflexivity, symmetry,
  transitivity, …) and bundle the standard combinations
  (equivalence relations, preorders, partial and total orders).

  These are stated abstractly so they apply anywhere: to ordinary
  relations like `≤` on `ℕ`, and — via a structure's
  `interpretRelationSymbol` — to the interpretation of an arity-2
  relation symbol inside a `FirstOrderStructure`.

  Each property is given with its full predicate-logic reading.
  ============================================================
-/

/-- A binary relation on `α`: a two-place predicate. -/
abbrev BinaryRelation (α : Type) : Type := α → α → Prop

variable {α : Type} (relation : BinaryRelation α)

-- ════════════════════════════════════════════════════════════
-- §1. Atomic Properties
-- ════════════════════════════════════════════════════════════

/-- **Reflexive.**  `∀ x, R x x`.
    Every element stands in the relation to itself. -/
def RelationIsReflexive : Prop :=
  ∀ element : α, relation element element

/-- **Irreflexive.**  `∀ x, ¬ R x x`.
    No element stands in the relation to itself. -/
def RelationIsIrreflexive : Prop :=
  ∀ element : α, ¬ relation element element

/-- **Symmetric.**  `∀ x y, R x y → R y x`.
    The relation never distinguishes direction. -/
def RelationIsSymmetric : Prop :=
  ∀ first second : α, relation first second → relation second first

/-- **Antisymmetric.**  `∀ x y, R x y → R y x → x = y`.
    The only way the relation can run both ways is between equal elements. -/
def RelationIsAntisymmetric : Prop :=
  ∀ first second : α, relation first second → relation second first → first = second

/-- **Asymmetric.**  `∀ x y, R x y → ¬ R y x`.
    The relation never runs both ways at all (strictly one-directional). -/
def RelationIsAsymmetric : Prop :=
  ∀ first second : α, relation first second → ¬ relation second first

/-- **Transitive.**  `∀ x y z, R x y → R y z → R x z`.
    The relation composes with itself. -/
def RelationIsTransitive : Prop :=
  ∀ first second third : α,
    relation first second → relation second third → relation first third

/-- **Total (connex).**  `∀ x y, R x y ∨ R y x`.
    Any two elements are comparable in at least one direction. -/
def RelationIsTotal : Prop :=
  ∀ first second : α, relation first second ∨ relation second first


-- ════════════════════════════════════════════════════════════
-- §2. Bundled Structures
-- ════════════════════════════════════════════════════════════

/-- **Equivalence relation.**  Reflexive, symmetric, and transitive. -/
def RelationIsEquivalence : Prop :=
  RelationIsReflexive relation ∧
    RelationIsSymmetric relation ∧
    RelationIsTransitive relation

/-- **Preorder.**  Reflexive and transitive. -/
def RelationIsPreorder : Prop :=
  RelationIsReflexive relation ∧ RelationIsTransitive relation

/-- **Partial order.**  A preorder that is also antisymmetric. -/
def RelationIsPartialOrder : Prop :=
  RelationIsPreorder relation ∧ RelationIsAntisymmetric relation

/-- **Total (linear) order.**  A partial order in which any two elements
    are comparable. -/
def RelationIsTotalOrder : Prop :=
  RelationIsPartialOrder relation ∧ RelationIsTotal relation

/-- **Strict order.**  Irreflexive and transitive (asymmetry then follows). -/
def RelationIsStrictOrder : Prop :=
  RelationIsIrreflexive relation ∧ RelationIsTransitive relation


-- ════════════════════════════════════════════════════════════
-- §3. Basic Consequences
-- ════════════════════════════════════════════════════════════

/-- An asymmetric relation is irreflexive: if `R x x` held, asymmetry applied
    to it would forbid `R x x`, a contradiction. -/
theorem asymmetricRelationIsIrreflexive
    (asymmetry : RelationIsAsymmetric relation) :
    RelationIsIrreflexive relation :=
  fun element selfRelated => asymmetry element element selfRelated selfRelated

/-- A partial order is, in particular, reflexive. -/
theorem partialOrderIsReflexive
    (partialOrder : RelationIsPartialOrder relation) :
    RelationIsReflexive relation :=
  partialOrder.left.left

/-- A partial order is, in particular, transitive. -/
theorem partialOrderIsTransitive
    (partialOrder : RelationIsPartialOrder relation) :
    RelationIsTransitive relation :=
  partialOrder.left.right


-- ════════════════════════════════════════════════════════════
-- §4. Equality Is the Canonical Equivalence Relation
-- ════════════════════════════════════════════════════════════

/-- Equality is reflexive. -/
theorem equalityIsReflexive : RelationIsReflexive (@Eq α) :=
  fun _ => rfl

/-- Equality is symmetric. -/
theorem equalityIsSymmetric : RelationIsSymmetric (@Eq α) :=
  fun _ _ proofOfEquality => proofOfEquality.symm

/-- Equality is transitive. -/
theorem equalityIsTransitive : RelationIsTransitive (@Eq α) :=
  fun _ _ _ firstEquality secondEquality => firstEquality.trans secondEquality

/-- Equality is an equivalence relation. -/
theorem equalityIsEquivalence : RelationIsEquivalence (@Eq α) :=
  ⟨equalityIsReflexive, equalityIsSymmetric, equalityIsTransitive⟩

end LRA.VolumeI.FirstOrderLogic.Relations
