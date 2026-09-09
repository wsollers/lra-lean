import LRA.EuclideanSpace.Model.CartesianPlane

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`R3` TODO

Predicate logic:

  abbrev R3 (real_model : RealModel) := Rn real_model 3

Predicate logic (unfolded):

  abbrev R3 (real_model : RealModel) := Rn real_model 3 (source fallback; no compiled unfold data available)

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (left right front back bottom top : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R3 real_model), (real_model.leInst.le left (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedBox._proof_1 a) ∧ (real_model.leInst.le (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedBox._proof_1 a) right ∧ (real_model.leInst.le front (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedBox._proof_2 a) ∧ (real_model.leInst.le (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedBox._proof_2 a) back ∧ (real_model.leInst.le bottom (LRA.EuclideanSpace.getZ LRA.EuclideanSpace.ClosedBox._proof_3 a) ∧ real_model.leInst.le (LRA.EuclideanSpace.getZ LRA.EuclideanSpace.ClosedBox._proof_3 a) top)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (real_model.9.le left (a.1 ⟨0, ⋯⟩) ∧ (real_model.9.le (a.1 ⟨0, ⋯⟩) right ∧ (real_model.9.le front (a.1 ⟨1, ⋯⟩) ∧ (real_model.9.le (a.1 ⟨1, ⋯⟩) back ∧ (real_model.9.le bottom (a.1 ⟨2, ⋯⟩) ∧ real_model.9.le (a.1 ⟨2, ⋯⟩) top)))))

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (center : LRA.EuclideanSpace.R3 real_model) (radiusSq : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R3 real_model), LRA.EuclideanSpace.squaredDistance real_model a center = radiusSq

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.EuclideanSpace.sumFin fun i => have delta := instHAdd.hAdd (a.coord i) (real_model.negInst.neg (center.coord i)); instHMul.hMul delta delta = radiusSq

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (center : LRA.EuclideanSpace.R3 real_model) (radiusSq : LRA.EuclideanSpace.RealCoordinate real_model) (a : LRA.EuclideanSpace.R3 real_model), real_model.leInst.1 (LRA.EuclideanSpace.squaredDistance real_model a center) radiusSq

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    real_model.leInst.1 (LRA.EuclideanSpace.sumFin fun i => have delta := instHAdd.hAdd (a.coord i) (real_model.negInst.neg (center.coord i)); instHMul.hMul delta delta) radiusSq

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (a b c d : LRA.EuclideanSpace.RealCoordinate real_model) (a_1 : LRA.EuclideanSpace.R3 real_model), instHAdd.hAdd (instHAdd.hAdd (instHMul.hMul a (LRA.EuclideanSpace.getX LRA.EuclideanSpace.ClosedBox._proof_1 a_1)) (instHMul.hMul b (LRA.EuclideanSpace.getY LRA.EuclideanSpace.ClosedBox._proof_2 a_1))) (instHMul.hMul c (LRA.EuclideanSpace.getZ LRA.EuclideanSpace.ClosedBox._proof_3 a_1)) = d

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { hAdd := fun a b => real_model.2.add a b }.hAdd ({ hAdd := fun a b => real_model.2.add a b }.hAdd ({ hMul := fun a b => real_model.3.mul a b }.hMul a (a_1.1 ⟨0, ⋯⟩)) ({ hMul := fun a b => real_model.3.mul a b }.hMul b (a_1.1 ⟨1, ⋯⟩))) ({ hMul := fun a b => real_model.3.mul a b }.hMul c (a_1.1 ⟨2, ⋯⟩)) = d

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
      LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
    EuclideanTupleModel real_model 3

Predicate logic (unfolded):

  def Euclidean3SpaceModel (real_model : RealModel) :
      LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
    EuclideanTupleModel real_model 3 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
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
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3

end LRA.EuclideanSpace
