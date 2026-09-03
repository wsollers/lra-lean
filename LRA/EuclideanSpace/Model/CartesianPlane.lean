import LRA.EuclideanSpace.Model.RealLine

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

                                                                     



/--
`R2` TODO

Predicate logic:

  abbrev R2 (real_model : RealModel) := Rn real_model 2

Predicate logic (unfolded):

  abbrev R2 (real_model : RealModel) := Rn real_model 2

Logical form (Lean):

```lean
abbrev R2 (real_model : RealModel) := Rn real_model 2
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
abbrev R2 (real_model : RealModel) := Rn real_model 2

                                                            



/--
`ClosedRectangle` TODO

Predicate logic:

  def ClosedRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      bottom ≤ getY (by decide) point ∧ getY (by decide) point ≤ top }

Predicate logic (unfolded):

  def ClosedRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      bottom ≤ getY (by decide) point ∧ getY (by decide) point ≤ top }

Logical form (Lean):

```lean
def ClosedRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      bottom ≤ getY (by decide) point ∧ getY (by decide) point ≤ top }
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
def ClosedRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      bottom ≤ getY (by decide) point ∧ getY (by decide) point ≤ top }

                                                          



/--
`OpenRectangle` TODO

Predicate logic:

  def OpenRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left < getX (by decide) point ∧ getX (by decide) point < right ∧
      bottom < getY (by decide) point ∧ getY (by decide) point < top }

Predicate logic (unfolded):

  def OpenRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left < getX (by decide) point ∧ getX (by decide) point < right ∧
      bottom < getY (by decide) point ∧ getY (by decide) point < top }

Logical form (Lean):

```lean
def OpenRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left < getX (by decide) point ∧ getX (by decide) point < right ∧
      bottom < getY (by decide) point ∧ getY (by decide) point < top }
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
def OpenRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left < getX (by decide) point ∧ getX (by decide) point < right ∧
      bottom < getY (by decide) point ∧ getY (by decide) point < top }

                                                                    



/--
`Circle` TODO

Predicate logic:

  def Circle (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

Predicate logic (unfolded):

  def Circle (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

Logical form (Lean):

```lean
def Circle (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
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
def Circle (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

                                                                  



/--
`Disk` TODO

Predicate logic:

  def Disk (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

Predicate logic (unfolded):

  def Disk (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

Logical form (Lean):

```lean
def Disk (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
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
def Disk (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

                                                                    



/--
`GraphOf` TODO

Predicate logic:

  def GraphOf (real_model : RealModel)
    (f : RealCoordinate real_model → RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | getY (by decide) point = f (getX (by decide) point) }

Predicate logic (unfolded):

  def GraphOf (real_model : RealModel)
    (f : RealCoordinate real_model → RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | getY (by decide) point = f (getX (by decide) point) }

Logical form (Lean):

```lean
def GraphOf (real_model : RealModel)
    (f : RealCoordinate real_model → RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | getY (by decide) point = f (getX (by decide) point) }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def GraphOf (real_model : RealModel)
    (f : RealCoordinate real_model → RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | getY (by decide) point = f (getX (by decide) point) }

                                                                     



/--
`CartesianPlaneModel` TODO

Predicate logic:

  def CartesianPlaneModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 2

Predicate logic (unfolded):

  def CartesianPlaneModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 2

Logical form (Lean):

```lean
def CartesianPlaneModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 2
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
def CartesianPlaneModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 2

end LRA.EuclideanSpace
