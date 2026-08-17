import LRA.Relation.Definition

namespace LRA.Relation
universe u v

/-- Reflexivity. -/
def Reflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, R x x
/-- Irreflexivity. -/
def Irreflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, ¬ R x x
/-- Symmetry. -/
def Symmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x
/-- Antisymmetry. -/
def Antisymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x → x = y
/-- Asymmetry. -/
def Asymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → ¬ R y x
/-- Transitivity. -/
def Transitive {α : Type u} (R : Endorelation α) : Prop := ∀ x y z, R x y → R y z → R x z
/-- Connexity: every pair is comparable by the relation. -/
def Connex {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ R y x
/-- Totality, here used synonymously with connexity. -/
def Total {α : Type u} (R : Endorelation α) : Prop := Connex R
/-- Weak trichotomy: one of `xRy`, `x=y`, or `yRx` holds. -/
def Trichotomous {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ x = y ∨ R y x
/-- Exactly one of three propositions holds. -/
def ExactlyOneOfThree (P Q S : Prop) : Prop :=
  (P ∧ ¬ Q ∧ ¬ S) ∨ (Q ∧ ¬ P ∧ ¬ S) ∨ (S ∧ ¬ P ∧ ¬ Q)
/-- Strong trichotomy: exactly one of `xRy`, `x=y`, or `yRx` holds. -/
def ExactlyTrichotomous {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, ExactlyOneOfThree (R x y) (x = y) (R y x)
/-- Left-Euclidean property. -/
def LeftEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R x z → R y z → R x y
/-- Right-Euclidean property. -/
def RightEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R z x → R z y → R x y
/-- Density of a relation. -/
def Dense {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, R x y → ∃ z, R x z ∧ R z y

/-- A minimal element of a represented subset with respect to an endorelation. -/
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation element minimum

/-- A maximal element of a represented subset with respect to an endorelation. -/
def MaximalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (maximum : Element) : Prop :=
  maximum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation maximum element

end LRA.Relation
