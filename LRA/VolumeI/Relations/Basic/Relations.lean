namespace LRA.Relation

universe u v w

/--
A unary relation, or predicate, on one carrier.

Logical form:

```lean
abbrev UnaryRelation (alpha : Type u) :=
  alpha -> Prop
```
-/
abbrev UnaryRelation (alpha : Type u) :=
  alpha -> Prop

/--
A heterogeneous binary relation from one carrier to another.

Logical form:

```lean
abbrev HeterogeneousBinaryRelation
    (alpha beta : Type u) :=
  alpha -> beta -> Prop
```
 -/
abbrev HeterogeneousBinaryRelation
    (alpha : Type u) (beta : Type v) :=
  alpha -> beta -> Prop

/--
A homogeneous binary relation on one carrier.

Logical form:

```lean
abbrev HomogeneousBinaryRelation (alpha : Type u) :=
  HeterogeneousBinaryRelation alpha alpha
```
-/
abbrev HomogeneousBinaryRelation (alpha : Type u) :=
  HeterogeneousBinaryRelation alpha alpha

/--
The common short name for a homogeneous binary relation.

Logical form:

```lean
abbrev BinaryRelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha
```
-/
abbrev BinaryRelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha

/--
Compatibility synonym for a homogeneous binary relation.

Logical form:

```lean
abbrev HomogeneousRelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha
```
-/
abbrev HomogeneousRelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha

/--
Compatibility synonym for a heterogeneous binary relation.

Logical form:

```lean
abbrev HeterogeneousRelation
    (alpha beta : Type u) :=
  HeterogeneousBinaryRelation alpha beta
```
 -/
abbrev HeterogeneousRelation
    (alpha : Type u) (beta : Type v) :=
  HeterogeneousBinaryRelation alpha beta

/--
Compatibility synonym for a binary relation on one carrier.

Logical form:

```lean
abbrev Endorelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha
```
-/
abbrev Endorelation (alpha : Type u) :=
  HomogeneousBinaryRelation alpha

/--
The empty relation: no ordered pair is related.

Logical form:

```lean
def EmptyRelation (alpha : Type u) : Endorelation alpha :=
  fun _ _ => False
```
-/
def EmptyRelation (alpha : Type u) : Endorelation alpha :=
  fun _ _ => False

/--
The universal relation: every ordered pair is related.

Logical form:

```lean
def UniversalRelation (alpha : Type u) : Endorelation alpha :=
  fun _ _ => True
```
-/
def UniversalRelation (alpha : Type u) : Endorelation alpha :=
  fun _ _ => True

/--
The identity relation: exactly the diagonal ordered pairs are related.

Logical form:

```lean
def IdentityRelation (alpha : Type u) : Endorelation alpha :=
  fun left right => left = right
```
-/
def IdentityRelation (alpha : Type u) : Endorelation alpha :=
  fun left right => left = right

/--
The diversity relation: exactly the off-diagonal ordered pairs are related.

Logical form:

```lean
def DiversityRelation (alpha : Type u) : Endorelation alpha :=
  fun left right => left ≠ right
```
-/
def DiversityRelation (alpha : Type u) : Endorelation alpha :=
  fun left right => left ≠ right

/--
Inclusion of relations: every ordered pair in the first relation is in the second.

Logical form:

```lean
def RelationIncluded {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Prop :=
  forall left right, leftRelation left right -> rightRelation left right
```
-/
def RelationIncluded {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Prop :=
  forall left right, leftRelation left right -> rightRelation left right

/--
Proper inclusion of relations: inclusion without equality.

Logical form:

```lean
def RelationProperlyIncluded {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Prop :=
  RelationIncluded leftRelation rightRelation /\ leftRelation ≠ rightRelation
```
-/
def RelationProperlyIncluded {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Prop :=
  RelationIncluded leftRelation rightRelation /\ leftRelation ≠ rightRelation

/--
Union of two endorelations, interpreted as union of their ordered pairs.

Logical form:

```lean
def RelationUnion {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => leftRelation left right \/ rightRelation left right
```
-/
def RelationUnion {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => leftRelation left right \/ rightRelation left right

/--
Intersection of two endorelations, interpreted as intersection of their ordered pairs.

Logical form:

```lean
def RelationIntersection {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => leftRelation left right /\ rightRelation left right
```
-/
def RelationIntersection {alpha : Type u}
    (leftRelation rightRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => leftRelation left right /\ rightRelation left right

/--
Complement of an endorelation inside the universal relation on its carrier.

Logical form:

```lean
def RelationComplement {alpha : Type u}
    (relation : Endorelation alpha) : Endorelation alpha :=
  fun left right => Not (relation left right)
```
-/
def RelationComplement {alpha : Type u}
    (relation : Endorelation alpha) : Endorelation alpha :=
  fun left right => Not (relation left right)

/--
The converse of a relation reverses the order of its arguments.

Logical form:

```lean
def Converse {alpha : Type u}
    (relation : Endorelation alpha) : Endorelation alpha :=
  fun left right => relation right left
```
-/
def Converse {alpha : Type u}
    (relation : Endorelation alpha) : Endorelation alpha :=
  fun left right => relation right left

end LRA.Relation
