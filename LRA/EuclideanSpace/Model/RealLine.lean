import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`R1` TODO

Predicate logic:

  abbrev R1 (real_model : RealModel) := Rn real_model 1

Predicate logic (unfolded):

  abbrev R1 (real_model : RealModel) := Rn real_model 1

Logical form (Lean):

```lean
abbrev R1 (real_model : RealModel) := Rn real_model 1
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
abbrev R1 (real_model : RealModel) := Rn real_model 1

/--
`getX1` TODO

Predicate logic:

  def getX1 (point : R1 real_model) : RealCoordinate real_model :=
  point.coord ⟨0, by decide⟩

Predicate logic (unfolded):

  def getX1 (point : R1 real_model) : RealCoordinate real_model :=
  point.coord ⟨0, by decide⟩

Logical form (Lean):

```lean
def getX1 (point : R1 real_model) : RealCoordinate real_model :=
  point.coord ⟨0, by decide⟩
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
def getX1 (point : R1 real_model) : RealCoordinate real_model :=
  point.coord ⟨0, by decide⟩

/--
`OpenIntervalM` TODO

Predicate logic:

  def OpenIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point ∧ getX1 point < b }

Predicate logic (unfolded):

  def OpenIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point ∧ getX1 point < b }

Logical form (Lean):

```lean
def OpenIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point ∧ getX1 point < b }
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
def OpenIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point ∧ getX1 point < b }

/--
`ClosedIntervalM` TODO

Predicate logic:

  def ClosedIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a ≤ getX1 point ∧ getX1 point ≤ b }

Predicate logic (unfolded):

  def ClosedIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a ≤ getX1 point ∧ getX1 point ≤ b }

Logical form (Lean):

```lean
def ClosedIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a ≤ getX1 point ∧ getX1 point ≤ b }
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
def ClosedIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a ≤ getX1 point ∧ getX1 point ≤ b }

/--
`OpenRayAboveM` TODO

Predicate logic:

  def OpenRayAboveM (real_model : RealModel)
    (a : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point }

Predicate logic (unfolded):

  def OpenRayAboveM (real_model : RealModel)
    (a : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point }

Logical form (Lean):

```lean
def OpenRayAboveM (real_model : RealModel)
    (a : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point }
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
def OpenRayAboveM (real_model : RealModel)
    (a : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point }

/--
`OpenRayBelowM` TODO

Predicate logic:

  def OpenRayBelowM (real_model : RealModel)
    (b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | getX1 point < b }

Predicate logic (unfolded):

  def OpenRayBelowM (real_model : RealModel)
    (b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | getX1 point < b }

Logical form (Lean):

```lean
def OpenRayBelowM (real_model : RealModel)
    (b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | getX1 point < b }
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
def OpenRayBelowM (real_model : RealModel)
    (b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | getX1 point < b }

/--
`RealLineModel` TODO

Predicate logic:

  def RealLineModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 1

Predicate logic (unfolded):

  def RealLineModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 1

Logical form (Lean):

```lean
def RealLineModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 1
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
def RealLineModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 1

end LRA.EuclideanSpace
