import LRA.EuclideanSpace.Model.Euclidean3Space

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Interface.ModelTheory

/--
`R4` TODO

Predicate logic:

  abbrev R4 (real_model : RealModel) := Rn real_model 4

Predicate logic (unfolded):

  abbrev R4 (real_model : RealModel) := Rn real_model 4

Logical form (Lean):

```lean
abbrev R4 (real_model : RealModel) := Rn real_model 4
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
abbrev R4 (real_model : RealModel) := Rn real_model 4

/--
`ClosedHyperbox4` TODO

Predicate logic:

  def ClosedHyperbox4 (real_model : RealModel)
    (xmin xmax ymin ymax zmin zmax wmin wmax : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point |
      xmin ≤ getX (by decide) point ∧ getX (by decide) point ≤ xmax ∧
      ymin ≤ getY (by decide) point ∧ getY (by decide) point ≤ ymax ∧
      zmin ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ zmax ∧
      wmin ≤ getW (by decide) point ∧ getW (by decide) point ≤ wmax }

Predicate logic (unfolded):

  def ClosedHyperbox4 (real_model : RealModel)
    (xmin xmax ymin ymax zmin zmax wmin wmax : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point |
      xmin ≤ getX (by decide) point ∧ getX (by decide) point ≤ xmax ∧
      ymin ≤ getY (by decide) point ∧ getY (by decide) point ≤ ymax ∧
      zmin ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ zmax ∧
      wmin ≤ getW (by decide) point ∧ getW (by decide) point ≤ wmax }

Logical form (Lean):

```lean
def ClosedHyperbox4 (real_model : RealModel)
    (xmin xmax ymin ymax zmin zmax wmin wmax : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point |
      xmin ≤ getX (by decide) point ∧ getX (by decide) point ≤ xmax ∧
      ymin ≤ getY (by decide) point ∧ getY (by decide) point ≤ ymax ∧
      zmin ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ zmax ∧
      wmin ≤ getW (by decide) point ∧ getW (by decide) point ≤ wmax }
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
def ClosedHyperbox4 (real_model : RealModel)
    (xmin xmax ymin ymax zmin zmax wmin wmax : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point |
      xmin ≤ getX (by decide) point ∧ getX (by decide) point ≤ xmax ∧
      ymin ≤ getY (by decide) point ∧ getY (by decide) point ≤ ymax ∧
      zmin ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ zmax ∧
      wmin ≤ getW (by decide) point ∧ getW (by decide) point ≤ wmax }

/--
`Sphere4` TODO

Predicate logic:

  def Sphere4 (real_model : RealModel)
    (center : R4 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

Predicate logic (unfolded):

  def Sphere4 (real_model : RealModel)
    (center : R4 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

Logical form (Lean):

```lean
def Sphere4 (real_model : RealModel)
    (center : R4 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R4 real_model) :=
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
def Sphere4 (real_model : RealModel)
    (center : R4 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

/--
`Euclidean4SpaceModel` TODO

Predicate logic:

  def Euclidean4SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 4

Predicate logic (unfolded):

  def Euclidean4SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 4

Logical form (Lean):

```lean
def Euclidean4SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 4
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
def Euclidean4SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 4

end LRA.EuclideanSpace
