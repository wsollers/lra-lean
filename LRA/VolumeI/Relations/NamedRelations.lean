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

/-- Trichotomy of an endorelation. -/
def trichotomous {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  forall left right, relation left right \/ left = right \/ relation right left

/-- Equivalence-relation laws for an endorelation. -/
def equivalence {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  reflexive relation /\ symmetric relation /\ transitive relation

end LRA.VolumeI.Relations
