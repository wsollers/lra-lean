import LRA.EuclideanSpace.Model.CartesianPlane

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Interface.ModelTheory

/--
`R3` TODO

Predicate logic:

  abbrev R3 (real_model : RealModel) := Rn real_model 3

Predicate logic (unfolded):

  abbrev R3 (real_model : RealModel) := Rn real_model 3

Logical form (Lean):

```lean
abbrev R3 (real_model : RealModel) := Rn real_model 3
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
abbrev R3 (real_model : RealModel) := Rn real_model 3

/--
`ClosedBox` TODO

Predicate logic:

  def ClosedBox (real_model : RealModel)
    (left right front back bottom top : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      front ≤ getY (by decide) point ∧ getY (by decide) point ≤ back ∧
      bottom ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ top }

Predicate logic (unfolded):

  def ClosedBox (real_model : RealModel)
    (left right front back bottom top : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      front ≤ getY (by decide) point ∧ getY (by decide) point ≤ back ∧
      bottom ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ top }

Logical form (Lean):

```lean
def ClosedBox (real_model : RealModel)
    (left right front back bottom top : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      front ≤ getY (by decide) point ∧ getY (by decide) point ≤ back ∧
      bottom ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ top }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def ClosedBox (real_model : RealModel)
    (left right front back bottom top : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      front ≤ getY (by decide) point ∧ getY (by decide) point ≤ back ∧
      bottom ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ top }

/--
`Sphere` TODO

Predicate logic:

  def Sphere (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

Predicate logic (unfolded):

  def Sphere (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

Logical form (Lean):

```lean
def Sphere (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }
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
def Sphere (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

/--
`Ball` TODO

Predicate logic:

  def Ball (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

Predicate logic (unfolded):

  def Ball (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

Logical form (Lean):

```lean
def Ball (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }
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
def Ball (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

/--
`Plane` TODO

Predicate logic:

  def Plane (real_model : RealModel)
    (a b c d : RealCoordinate real_model) : Set (R3 real_model) :=
  { point |
      a * getX (by decide) point +
      b * getY (by decide) point +
      c * getZ (by decide) point = d }

Predicate logic (unfolded):

  def Plane (real_model : RealModel)
    (a b c d : RealCoordinate real_model) : Set (R3 real_model) :=
  { point |
      a * getX (by decide) point +
      b * getY (by decide) point +
      c * getZ (by decide) point = d }

Logical form (Lean):

```lean
def Plane (real_model : RealModel)
    (a b c d : RealCoordinate real_model) : Set (R3 real_model) :=
  { point |
      a * getX (by decide) point +
      b * getY (by decide) point +
      c * getZ (by decide) point = d }
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
def Plane (real_model : RealModel)
    (a b c d : RealCoordinate real_model) : Set (R3 real_model) :=
  { point |
      a * getX (by decide) point +
      b * getY (by decide) point +
      c * getZ (by decide) point = d }

/--
`Euclidean3SpaceModel` TODO

Predicate logic:

  def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3

Predicate logic (unfolded):

  def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3

Logical form (Lean):

```lean
def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3
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
def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3

end LRA.EuclideanSpace
