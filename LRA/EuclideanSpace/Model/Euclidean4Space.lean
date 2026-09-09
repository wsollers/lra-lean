import LRA.EuclideanSpace.Model.Euclidean3Space

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`R4` TODO

Predicate logic:

  abbrev R4 (real_model : RealModel) := Rn real_model 4

Predicate logic (unfolded):

  abbrev R4 (real_model : RealModel) := Rn real_model 4 (source fallback; no compiled unfold data available)

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (xmin xmax ymin ymax zmin zmax wmin wmax : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R4 real_model), (real_model.leInst.le xmin (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedHyperbox4._proof_1 a) ∧ (real_model.leInst.le (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedHyperbox4._proof_1 a) xmax ∧ (real_model.leInst.le ymin (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedHyperbox4._proof_2 a) ∧ (real_model.leInst.le (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedHyperbox4._proof_2 a) ymax ∧ (real_model.leInst.le zmin (LRA.EuclideanSpace.getZ LRA.EuclideanSpace.ClosedHyperbox4._proof_3 a) ∧ (real_model.leInst.le (LRA.EuclideanSpace.getZ LRA.EuclideanSpace.ClosedHyperbox4._proof_3 a) zmax ∧ (real_model.leInst.le wmin (LRA.EuclideanSpace.getW LRA.EuclideanSpace.ClosedHyperbox4._proof_4 a) ∧ real_model.leInst.le (LRA.EuclideanSpace.getW LRA.EuclideanSpace.ClosedHyperbox4._proof_4 a) wmax)))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (real_model.9.le xmin (a.1 ⟨0, ⋯⟩) ∧ (real_model.9.le (a.1 ⟨0, ⋯⟩) xmax ∧ (real_model.9.le ymin (a.1 ⟨1, ⋯⟩) ∧ (real_model.9.le (a.1 ⟨1, ⋯⟩) ymax ∧ (real_model.9.le zmin (a.1 ⟨2, ⋯⟩) ∧ (real_model.9.le (a.1 ⟨2, ⋯⟩) zmax ∧ (real_model.9.le wmin (a.1 ⟨3, ⋯⟩) ∧ real_model.9.le (a.1 ⟨3, ⋯⟩) wmax)))))))

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (center : LRA.EuclideanSpace.R4 real_model) (radiusSq : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R4 real_model), LRA.EuclideanSpace.squaredDistance real_model a center = radiusSq

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.EuclideanSpace.sumFin fun i => have delta := instHAdd.hAdd (a.coord i) (real_model.negInst.neg (center.coord i)); instHMul.hMul delta delta = radiusSq

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
      LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
    EuclideanTupleModel real_model 4

Predicate logic (unfolded):

  def Euclidean4SpaceModel (real_model : RealModel) :
      LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
    EuclideanTupleModel real_model 4 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Euclidean4SpaceModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
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
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 4

end LRA.EuclideanSpace
