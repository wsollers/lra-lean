import LRA.VolumeI.Operations.Definition

namespace LRA.Operation.Laws.OrderCompatibility

open LRA.Operation

universe u

/-- Left translation by a fixed element preserves a relation. -/
def LeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed left) (operation fixed right)

/-- Right translation by a fixed element preserves a relation. -/
def RightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation left fixed) (operation right fixed)

/-- Coordinatewise operation preserves a relation. -/
def CoordinatewisePreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall left₁ left₂ right₁ right₂,
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)

/-- Left translation by a fixed element reverses a relation. -/
def LeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed right) (operation fixed left)

/-- Right translation by a fixed element reverses a relation. -/
def RightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation right fixed) (operation left fixed)

/-- Positive right translations preserve a relation. -/
def PositiveRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    positive fixed -> relation left right ->
      relation (operation left fixed) (operation right fixed)

/-- Positive left translations preserve a relation. -/
def PositiveLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    positive fixed -> relation left right ->
      relation (operation fixed left) (operation fixed right)

/-- Negative right translations reverse a relation. -/
def NegativeRightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    negative fixed -> relation left right ->
      relation (operation right fixed) (operation left fixed)

/-- Negative left translations reverse a relation. -/
def NegativeLeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    negative fixed -> relation left right ->
      relation (operation fixed right) (operation fixed left)

end LRA.Operation.Laws.OrderCompatibility
