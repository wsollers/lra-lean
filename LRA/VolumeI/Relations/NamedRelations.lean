import LRA.VolumeI.Relations.Relations

namespace LRA.VolumeI.Relations

universe u

/-- Reflexivity of an endorelation. -/
def reflexive {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall element, relation element element

/-- Irreflexivity of an endorelation. -/
def irreflexive {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall element, Not (relation element element)

/-- Symmetry of an endorelation. -/
def symmetric {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left

/-- Antisymmetry of an endorelation. -/
def antisymmetric {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right -> relation right left -> left = right

/-- Transitivity of an endorelation. -/
def transitive {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall first second third,
    relation first second -> relation second third -> relation first third

/-- Connexity of an endorelation. -/
def connex {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ relation right left

/-- Totality, or connexity, of an endorelation. -/
def total {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  connex relation

/-- Exactly one of three propositions holds. -/
def exactlyOneOfThree (first second third : Prop) : Prop :=
  (first /\ Not second /\ Not third) \/
    (second /\ Not first /\ Not third) \/
      (third /\ Not first /\ Not second)

/-- Weak trichotomy of an endorelation: one of the three alternatives holds. -/
def trichotomous {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ left = right \/ relation right left

/-- Omnibus trichotomy: exactly one of `xRy`, `x = y`, and `yRx` holds. -/
def exactlyTrichotomous {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    exactlyOneOfThree (relation left right) (left = right) (relation right left)

/-- Left-Euclidean property of an endorelation. -/
def leftEuclidean {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation left fixed -> relation right fixed -> relation left right

/-- Right-Euclidean property of an endorelation. -/
def rightEuclidean {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall fixed left right,
    relation fixed left -> relation fixed right -> relation left right

/-- Density of an endorelation. -/
def dense {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right,
    relation left right ->
      exists middle, relation left middle /\ relation middle right

/-- A minimal element of a subset with respect to an endorelation. -/
def minimalElement {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (minimum : alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.member minimum subset /\
    forall element,
      LRA.VolumeI.Set.LRASet.member element subset ->
        Not (relation element minimum)

/-- Well-foundedness of an endorelation in the omnibus subset-minimal sense. -/
def wellFounded {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall subset : LRA.VolumeI.Set.LRASet alpha,
    LRA.VolumeI.Set.LRASet.nonempty subset ->
      exists minimum, minimalElement relation subset minimum

/-- Equivalence-relation laws for an endorelation. -/
def equivalence {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  reflexive relation /\ symmetric relation /\ transitive relation

end LRA.VolumeI.Relations
