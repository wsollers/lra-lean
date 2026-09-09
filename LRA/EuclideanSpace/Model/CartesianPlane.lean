import LRA.EuclideanSpace.Model.RealLine

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

                                                                     



/--
`R2` TODO

Predicate logic:

  abbrev R2 (real_model : RealModel) := Rn real_model 2

Predicate logic (unfolded):

  abbrev R2 (real_model : RealModel) := Rn real_model 2 (source fallback; no compiled unfold data available)

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (left right bottom top : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R2 real_model), (real_model.leInst.le left (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedRectangle._proof_1 a) ∧ (real_model.leInst.le (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedRectangle._proof_1 a) right ∧ (real_model.leInst.le bottom (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedRectangle._proof_2 a) ∧ real_model.leInst.le (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedRectangle._proof_2 a) top)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (real_model.9.le left (a.1 ⟨0, ⋯⟩) ∧ (real_model.9.le (a.1 ⟨0, ⋯⟩) right ∧ (real_model.9.le bottom (a.1 ⟨1, ⋯⟩) ∧ real_model.9.le (a.1 ⟨1, ⋯⟩) top)))

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (left right bottom top : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R2 real_model), (real_model.ltInst.lt left (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedRectangle._proof_1 a) ∧ (real_model.ltInst.lt (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedRectangle._proof_1 a) right ∧ (real_model.ltInst.lt bottom (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedRectangle._proof_2 a) ∧ real_model.ltInst.lt (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedRectangle._proof_2 a) top)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (real_model.8.lt left (a.1 ⟨0, ⋯⟩) ∧ (real_model.8.lt (a.1 ⟨0, ⋯⟩) right ∧ (real_model.8.lt bottom (a.1 ⟨1, ⋯⟩) ∧ real_model.8.lt (a.1 ⟨1, ⋯⟩) top)))

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (center : LRA.EuclideanSpace.R2 real_model) (radiusSq : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R2 real_model), LRA.EuclideanSpace.squaredDistance real_model a center = radiusSq

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.EuclideanSpace.sumFin fun i => have delta := instHAdd.hAdd (a.coord i) (real_model.negInst.neg (center.coord i)); instHMul.hMul delta delta = radiusSq

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (center : LRA.EuclideanSpace.R2 real_model) (radiusSq : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R2 real_model), real_model.leInst.1 (LRA.EuclideanSpace.squaredDistance real_model a center) radiusSq

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    real_model.leInst.1 (LRA.EuclideanSpace.sumFin fun i => have delta := instHAdd.hAdd (a.coord i) (real_model.negInst.neg (center.coord i)); instHMul.hMul delta delta) radiusSq

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (f : LRA.EuclideanSpace.RealCoordinate real_model → LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R2 real_model), LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedRectangle._proof_2 a = f (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedRectangle._proof_1 a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a.1 ⟨1, ⋯⟩ = f (a.1 ⟨0, ⋯⟩)

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
    EuclideanTupleModel real_model 2 (source fallback; no compiled unfold data available)

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
