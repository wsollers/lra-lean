import LRA.EuclideanSpace.CoordinateSystems
import LRA.EuclideanSpace.Definition
import LRA.EuclideanSpace.Interface.ModelTheory.Model
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

universe u




/--
`RealCoordinate` TODO

Predicate logic:

  abbrev RealCoordinate (real_model : RealModel) : Type u := real_model.Carrier

Predicate logic (unfolded):

  abbrev RealCoordinate (real_model : RealModel) : Type u := real_model.Carrier

Logical form (Lean):

```lean
abbrev RealCoordinate (real_model : RealModel) : Type u := real_model.Carrier
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
abbrev RealCoordinate (real_model : RealModel) : Type u := real_model.Carrier




/--
`Coordinates` TODO

Predicate logic:

  abbrev Coordinates (real_model : RealModel) (n : ℕ) : Type u :=
  CoordinateTuple real_model n

Predicate logic (unfolded):

  abbrev Coordinates (real_model : RealModel) (n : ℕ) : Type u :=
  CoordinateTuple real_model n

Logical form (Lean):

```lean
abbrev Coordinates (real_model : RealModel) (n : ℕ) : Type u :=
  CoordinateTuple real_model n
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
abbrev Coordinates (real_model : RealModel) (n : ℕ) : Type u :=
  CoordinateTuple real_model n

                                                                        
                                             



/--
`EuclideanPoint` TODO

Predicate logic:

  structure EuclideanPoint (real_model : RealModel) (n : ℕ) where
  coord : Coordinates real_model n

Predicate logic (unfolded):

  structure EuclideanPoint (real_model : RealModel) (n : ℕ) where
  coord : Coordinates real_model n

Logical form (Lean):

```lean
structure EuclideanPoint (real_model : RealModel) (n : ℕ) where
  coord : Coordinates real_model n
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure EuclideanPoint (real_model : RealModel) (n : ℕ) where
  coord : Coordinates real_model n

                                                    



/--
`Rn` TODO

Predicate logic:

  abbrev Rn (real_model : RealModel) (n : ℕ) := EuclideanPoint real_model n

Predicate logic (unfolded):

  abbrev Rn (real_model : RealModel) (n : ℕ) := EuclideanPoint real_model n

Logical form (Lean):

```lean
abbrev Rn (real_model : RealModel) (n : ℕ) := EuclideanPoint real_model n
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
abbrev Rn (real_model : RealModel) (n : ℕ) := EuclideanPoint real_model n




/--
`euclideanSpace` TODO

Predicate logic:

  def euclideanSpace (real_model : RealModel) (n : ℕ) : EuclideanSpaceDefinition where
  Carrier := Rn real_model n

Predicate logic (unfolded):

  def euclideanSpace (real_model : RealModel) (n : ℕ) : EuclideanSpaceDefinition where
  Carrier := Rn real_model n

Logical form (Lean):

```lean
def euclideanSpace (real_model : RealModel) (n : ℕ) : EuclideanSpaceDefinition where
  Carrier := Rn real_model n
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
def euclideanSpace (real_model : RealModel) (n : ℕ) : EuclideanSpaceDefinition where
  Carrier := Rn real_model n




/--
`origin` TODO

Predicate logic:

  def origin (real_model : RealModel) (n : ℕ) : Rn real_model n :=
  { coord := OriginCoordinates real_model n }

Predicate logic (unfolded):

  def origin (real_model : RealModel) (n : ℕ) : Rn real_model n :=
  { coord := OriginCoordinates real_model n }

Logical form (Lean):

```lean
def origin (real_model : RealModel) (n : ℕ) : Rn real_model n :=
  { coord := OriginCoordinates real_model n }
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
def origin (real_model : RealModel) (n : ℕ) : Rn real_model n :=
  { coord := OriginCoordinates real_model n }




/--
`pointOfCoordinates` TODO

Predicate logic:

  def pointOfCoordinates (real_model : RealModel) (n : ℕ) :
    Coordinates real_model n → Rn real_model n :=
  fun coordinates => { coord := coordinates }

Predicate logic (unfolded):

  def pointOfCoordinates (real_model : RealModel) (n : ℕ) :
    Coordinates real_model n → Rn real_model n :=
  fun coordinates => { coord := coordinates }

Logical form (Lean):

```lean
def pointOfCoordinates (real_model : RealModel) (n : ℕ) :
    Coordinates real_model n → Rn real_model n :=
  fun coordinates => { coord := coordinates }
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
def pointOfCoordinates (real_model : RealModel) (n : ℕ) :
    Coordinates real_model n → Rn real_model n :=
  fun coordinates => { coord := coordinates }




/--
`standardCoordinateSystem` TODO

Predicate logic:

  def standardCoordinateSystem (real_model : RealModel) (n : ℕ) :
    CoordinateSystemDefinition (euclideanSpace real_model n) real_model n where
  origin := origin real_model n
  coordinates := fun point => point.coord
  pointOf := pointOfCoordinates real_model n

Predicate logic (unfolded):

  def standardCoordinateSystem (real_model : RealModel) (n : ℕ) :
    CoordinateSystemDefinition (euclideanSpace real_model n) real_model n where
  origin := origin real_model n
  coordinates := fun point => point.coord
  pointOf := pointOfCoordinates real_model n

Logical form (Lean):

```lean
def standardCoordinateSystem (real_model : RealModel) (n : ℕ) :
    CoordinateSystemDefinition (euclideanSpace real_model n) real_model n where
  origin := origin real_model n
  coordinates := fun point => point.coord
  pointOf := pointOfCoordinates real_model n
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
def standardCoordinateSystem (real_model : RealModel) (n : ℕ) :
    CoordinateSystemDefinition (euclideanSpace real_model n) real_model n where
  origin := origin real_model n
  coordinates := fun point => point.coord
  pointOf := pointOfCoordinates real_model n

                                                                              



/--
`getX` TODO

Predicate logic:

  def getX {real_model : RealModel} {n : ℕ} (hn : 1 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨0, Nat.lt_of_lt_of_le (by decide) hn⟩

Predicate logic (unfolded):

  def getX {real_model : RealModel} {n : ℕ} (hn : 1 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨0, Nat.lt_of_lt_of_le (by decide) hn⟩

Logical form (Lean):

```lean
def getX {real_model : RealModel} {n : ℕ} (hn : 1 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨0, Nat.lt_of_lt_of_le (by decide) hn⟩
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
def getX {real_model : RealModel} {n : ℕ} (hn : 1 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨0, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                           



/--
`getY` TODO

Predicate logic:

  def getY {real_model : RealModel} {n : ℕ} (hn : 2 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨1, Nat.lt_of_lt_of_le (by decide) hn⟩

Predicate logic (unfolded):

  def getY {real_model : RealModel} {n : ℕ} (hn : 2 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨1, Nat.lt_of_lt_of_le (by decide) hn⟩

Logical form (Lean):

```lean
def getY {real_model : RealModel} {n : ℕ} (hn : 2 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨1, Nat.lt_of_lt_of_le (by decide) hn⟩
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
def getY {real_model : RealModel} {n : ℕ} (hn : 2 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨1, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                          



/--
`getZ` TODO

Predicate logic:

  def getZ {real_model : RealModel} {n : ℕ} (hn : 3 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨2, Nat.lt_of_lt_of_le (by decide) hn⟩

Predicate logic (unfolded):

  def getZ {real_model : RealModel} {n : ℕ} (hn : 3 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨2, Nat.lt_of_lt_of_le (by decide) hn⟩

Logical form (Lean):

```lean
def getZ {real_model : RealModel} {n : ℕ} (hn : 3 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨2, Nat.lt_of_lt_of_le (by decide) hn⟩
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
def getZ {real_model : RealModel} {n : ℕ} (hn : 3 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨2, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                           



/--
`getW` TODO

Predicate logic:

  def getW {real_model : RealModel} {n : ℕ} (hn : 4 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨3, Nat.lt_of_lt_of_le (by decide) hn⟩

Predicate logic (unfolded):

  def getW {real_model : RealModel} {n : ℕ} (hn : 4 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨3, Nat.lt_of_lt_of_le (by decide) hn⟩

Logical form (Lean):

```lean
def getW {real_model : RealModel} {n : ℕ} (hn : 4 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨3, Nat.lt_of_lt_of_le (by decide) hn⟩
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
def getW {real_model : RealModel} {n : ℕ} (hn : 4 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨3, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                   
                            



/--
`sumFin` TODO

Predicate logic:

  def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f (Fin.castSucc i))

Predicate logic (unfolded):

  def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f (Fin.castSucc i))

Logical form (Lean):

```lean
def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f (Fin.castSucc i))
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
def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f (Fin.castSucc i))

instance (real_model : RealModel) (n : ℕ) : Nonempty (Rn real_model n) :=
  ⟨origin real_model n⟩

                                                           
instance (real_model : RealModel) (n : ℕ) : Between (Rn real_model n) where
  between x y z :=
    ∃ t : RealCoordinate real_model, 0 ≤ t ∧ t ≤ 1 ∧
      ∀ i : Fin n, y.coord i = (1 + -t) * x.coord i + t * z.coord i

                                                                           



/--
`squaredDistance` TODO

Predicate logic:

  def squaredDistance (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i =>
    let delta := x.coord i + -(y.coord i)
    delta * delta)

Predicate logic (unfolded):

  def squaredDistance (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i =>
    let delta := x.coord i + -(y.coord i)
    delta * delta)

Logical form (Lean):

```lean
def squaredDistance (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i =>
    let delta := x.coord i + -(y.coord i)
    delta * delta)
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
def squaredDistance (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i =>
    let delta := x.coord i + -(y.coord i)
    delta * delta)

                                                           
instance (real_model : RealModel) (n : ℕ) : Congruent (Rn real_model n) where
  congruent x y z w :=
    squaredDistance real_model x y = squaredDistance real_model z w

                                                                       



/--
`EuclideanTupleModel` TODO

Predicate logic:

  def EuclideanTupleModel (real_model : RealModel) (n : ℕ) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  BuildTarskiModel
    (Point := Rn real_model n)
    (between := fun x y z => between x y z)
    (congruent := fun x y z w => congruent x y z w)

Predicate logic (unfolded):

  def EuclideanTupleModel (real_model : RealModel) (n : ℕ) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  BuildTarskiModel
    (Point := Rn real_model n)
    (between := fun x y z => between x y z)
    (congruent := fun x y z w => congruent x y z w)

Logical form (Lean):

```lean
def EuclideanTupleModel (real_model : RealModel) (n : ℕ) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  BuildTarskiModel
    (Point := Rn real_model n)
    (between := fun x y z => between x y z)
    (congruent := fun x y z w => congruent x y z w)
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
def EuclideanTupleModel (real_model : RealModel) (n : ℕ) :
    LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature :=
  BuildTarskiModel
    (Point := Rn real_model n)
    (between := fun x y z => between x y z)
    (congruent := fun x y z w => congruent x y z w)

end LRA.EuclideanSpace
