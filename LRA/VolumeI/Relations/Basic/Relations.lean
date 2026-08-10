namespace LRA.VolumeI.Relations

universe u v w

/-- A unary relation, or predicate, on one carrier. -/
abbrev UnaryRelation (alpha : Type u) :=
  alpha -> Prop

/-- A heterogeneous binary relation from one carrier to another. -/
abbrev HeterogeneousBinaryRelation
    (alpha beta : Type u) :=
  alpha -> beta -> Prop

/-- A homogeneous binary relation on one carrier. -/
abbrev HomogeneousBinaryRelation (alpha : Type u) :=
  HeterogeneousBinaryRelation alpha alpha

/-- The common short name for a homogeneous binary relation. -/
abbrev BinaryRelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha

/-- Compatibility synonym for a homogeneous binary relation. -/
abbrev HomogeneousRelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha

/-- Compatibility synonym for a heterogeneous binary relation. -/
abbrev HeterogeneousRelation
    (alpha beta : Type u) :=
  HeterogeneousBinaryRelation alpha beta

/-- Compatibility synonym for a binary relation on one carrier. -/
abbrev Endorelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha

/-- The empty relation: no ordered pair is related. -/
def EmptyRelation (alpha : Type u) : Endorelation alpha :=
  fun _ _ => False

/-- The universal relation: every ordered pair is related. -/
def UniversalRelation (alpha : Type u) : Endorelation alpha :=
  fun _ _ => True

/-- The identity relation: exactly the diagonal ordered pairs are related. -/
def IdentityRelation (alpha : Type u) : Endorelation alpha :=
  fun left right => left = right

/-- The diversity relation: exactly the off-diagonal ordered pairs are related. -/
def DiversityRelation (alpha : Type u) : Endorelation alpha :=
  fun left right => left ≠ right

/-- Inclusion of relations: every ordered pair in the first relation is in the second. -/
def RelationIncluded {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Prop :=
  forall left right, leftRelation left right -> rightRelation left right

/-- Proper inclusion of relations: inclusion without equality. -/
def RelationProperlyIncluded {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Prop :=
  RelationIncluded leftRelation rightRelation /\ leftRelation ≠ rightRelation

/-- Union of two endorelations, interpreted as union of their ordered pairs. -/
def RelationUnion {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => leftRelation left right \/ rightRelation left right

/-- Intersection of two endorelations, interpreted as intersection of their ordered pairs. -/
def RelationIntersection {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => leftRelation left right /\ rightRelation left right

/-- Complement of an endorelation inside the universal relation on its carrier. -/
def RelationComplement {alpha : Type u}
    (relation : Endorelation alpha) : Endorelation alpha :=
  fun left right => Not (relation left right)

end LRA.VolumeI.Relations
