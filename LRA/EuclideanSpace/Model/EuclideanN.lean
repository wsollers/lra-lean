import LRA.EuclideanSpace.CoordinateSystems
import LRA.EuclideanSpace.Definition
import LRA.EuclideanSpace.Interface.ModelTheory.Model
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Interface.ModelTheory

universe u

abbrev RealCoordinate (real_model : RealModel) : Type u := real_model.Carrier

abbrev Coordinates (real_model : RealModel) (n : ℕ) : Type u :=
  CoordinateTuple real_model n

                                                                        
                                             
structure EuclideanPoint (real_model : RealModel) (n : ℕ) where
  coord : Coordinates real_model n

                                                    
abbrev Rn (real_model : RealModel) (n : ℕ) := EuclideanPoint real_model n

def euclideanSpace (real_model : RealModel) (n : ℕ) : EuclideanSpaceDefinition where
  Carrier := Rn real_model n

def origin (real_model : RealModel) (n : ℕ) : Rn real_model n :=
  { coord := OriginCoordinates real_model n }

def pointOfCoordinates (real_model : RealModel) (n : ℕ) :
    Coordinates real_model n → Rn real_model n :=
  fun coordinates => { coord := coordinates }

def standardCoordinateSystem (real_model : RealModel) (n : ℕ) :
    CoordinateSystemDefinition (euclideanSpace real_model n) real_model n where
  origin := origin real_model n
  coordinates := fun point => point.coord
  pointOf := pointOfCoordinates real_model n

                                                                              
def getX {real_model : RealModel} {n : ℕ} (hn : 1 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨0, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                           
def getY {real_model : RealModel} {n : ℕ} (hn : 2 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨1, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                          
def getZ {real_model : RealModel} {n : ℕ} (hn : 3 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨2, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                           
def getW {real_model : RealModel} {n : ℕ} (hn : 4 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨3, Nat.lt_of_lt_of_le (by decide) hn⟩

                                                                   
                            
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

                                                                           
def squaredDistance (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i =>
    let delta := x.coord i + -(y.coord i)
    delta * delta)

                                                           
instance (real_model : RealModel) (n : ℕ) : Congruent (Rn real_model n) where
  congruent x y z w :=
    squaredDistance real_model x y = squaredDistance real_model z w

                                                                       
def EuclideanTupleModel (real_model : RealModel) (n : ℕ) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  BuildTarskiModel
    (Point := Rn real_model n)
    (between := fun x y z => between x y z)
    (congruent := fun x y z w => congruent x y z w)

end LRA.EuclideanSpace
