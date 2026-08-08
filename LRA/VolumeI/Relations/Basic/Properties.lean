import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Public.Interface

namespace LRA.VolumeI.Relations

universe u

/-- Reflexivity of an endorelation. -/
def Reflexive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall element, relation element element

/-- Irreflexivity of an endorelation. -/
def Irreflexive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall element, Not (relation element element)

/-- Symmetry of an endorelation. -/
def Symmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left

/-- Antisymmetry of an endorelation. -/
def Antisymmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left -> left = right

/-- Asymmetry of an endorelation. -/
def Asymmetric {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> Not (relation right left)

/-- Transitivity of an endorelation. -/
def Transitive {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall first second third,
    relation first second -> relation second third -> relation first third

/-- Connexity of an endorelation. -/
def Connex {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ relation right left

/-- Totality, or connexity, of an endorelation. -/
def Total {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  Connex relation

/-- Exactly one of three propositions holds. -/
def ExactlyOneOfThree (first second third : Prop) : Prop :=
  (first /\ Not second /\ Not third) \/
    (second /\ Not first /\ Not third) \/
      (third /\ Not first /\ Not second)

/-- Weak trichotomy of an endorelation: one of the three alternatives holds. -/
def Trichotomous {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ left = right \/ relation right left

/-- Omnibus trichotomy: exactly one of `xRy`, `x = y`, and `yRx` holds. -/
def ExactlyTrichotomous {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    ExactlyOneOfThree (relation left right) (left = right) (relation right left)

/-- Left-Euclidean property of an endorelation. -/
def LeftEuclidean {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation left fixed -> relation right fixed -> relation left right

/-- Right-Euclidean property of an endorelation. -/
def RightEuclidean {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation fixed left -> relation fixed right -> relation left right

/-- Density of an endorelation. -/
def Dense {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    relation left right ->
      exists middle, relation left middle /\ relation middle right

/-- A minimal element of a subset with respect to an endorelation. -/
def MinimalElement (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : Endorelation interface.Element)
    (subset : interface.SetObject)
    (minimum : interface.Element) : Prop :=
  interface.member minimum subset /\
    forall element,
      interface.member element subset ->
        Not (relation element minimum)

/-- Well-foundedness of an endorelation in the omnibus subset-minimal sense. -/
def WellFounded (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : Endorelation interface.Element) : Prop :=
  forall subset : interface.SetObject,
    (exists element, interface.member element subset) ->
      exists minimum, MinimalElement interface relation subset minimum

/-- Equivalence-relation laws for an endorelation. -/
def Equivalence {alpha : Type u}
    (relation : Endorelation alpha) : Prop :=
  Reflexive relation /\ Symmetric relation /\ Transitive relation

end LRA.VolumeI.Relations
