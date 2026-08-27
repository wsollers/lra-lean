import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Set.Interface.Definitions.Operations

namespace LRA.Order

open LRA.Set

universe u v

section BoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [HasSeparation Element SetObject] [HasUniversal SetObject]

/--
`UpperBounds` TODO

Predicate logic:

  def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset)

Predicate logic (unfolded):

  def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def UpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (UpperBound relation subset)

/--
`LowerBounds` TODO

Predicate logic:

  def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset)

Predicate logic (unfolded):

  def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def LowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  HasSeparation.separation
    (HasUniversal.universal : SetObject)
    (LowerBound relation subset)

/--
`LowerUpperClosure` TODO

Predicate logic:

  def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset)

Predicate logic (unfolded):

  def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def LowerUpperClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  LowerBounds relation (UpperBounds relation subset)

/--
`UpperLowerClosure` TODO

Predicate logic:

  def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset)

Predicate logic (unfolded):

  def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def UpperLowerClosure
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : SetObject :=
  UpperBounds relation (LowerBounds relation subset)

end BoundSets

end LRA.Order
