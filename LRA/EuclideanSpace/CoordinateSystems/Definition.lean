import LRA.EuclideanSpace.Definition
import LRA.NumberSystems.RealNumbers.Interop.ConstructionModels

namespace LRA.EuclideanSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

universe u

/--
`CoordinateTuple` TODO

Predicate logic:

  abbrev CoordinateTuple (real_model : RealModel) (n : ℕ) : Type u :=
  Fin n → real_model.Carrier

Predicate logic (unfolded):

  abbrev CoordinateTuple (real_model : RealModel) (n : ℕ) : Type u :=
  Fin n → real_model.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CoordinateTuple (real_model : RealModel) (n : ℕ) : Type u :=
  Fin n → real_model.Carrier
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
abbrev CoordinateTuple (real_model : RealModel) (n : ℕ) : Type u :=
  Fin n → real_model.Carrier

/--
`OriginCoordinates` TODO

Predicate logic:

  def OriginCoordinates (real_model : RealModel) (n : ℕ) :
    CoordinateTuple real_model n :=
  fun _ => 0

Predicate logic (unfolded):

  def OriginCoordinates (real_model : RealModel) (n : ℕ) :
    CoordinateTuple real_model n :=
  fun _ => 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OriginCoordinates (real_model : RealModel) (n : ℕ) :
    CoordinateTuple real_model n :=
  fun _ => 0
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
def OriginCoordinates (real_model : RealModel) (n : ℕ) :
    CoordinateTuple real_model n :=
  fun _ => 0

/--
`CoordinateSystemDefinition` TODO

Predicate logic:

  structure CoordinateSystemDefinition
    (space : EuclideanSpaceDefinition)
    (real_model : RealModel)
    (n : ℕ) where
  origin : space.Carrier
  coordinates : space.Carrier → CoordinateTuple real_model n
  pointOf : CoordinateTuple real_model n → space.Carrier

Predicate logic (unfolded):

  structure CoordinateSystemDefinition
    (space : EuclideanSpaceDefinition)
    (real_model : RealModel)
    (n : ℕ) where
  origin : space.Carrier
  coordinates : space.Carrier → CoordinateTuple real_model n
  pointOf : CoordinateTuple real_model n → space.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure CoordinateSystemDefinition
    (space : EuclideanSpaceDefinition)
    (real_model : RealModel)
    (n : ℕ) where
  origin : space.Carrier
  coordinates : space.Carrier → CoordinateTuple real_model n
  pointOf : CoordinateTuple real_model n → space.Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure CoordinateSystemDefinition
    (space : EuclideanSpaceDefinition)
    (real_model : RealModel)
    (n : ℕ) where
  origin : space.Carrier
  coordinates : space.Carrier → CoordinateTuple real_model n
  pointOf : CoordinateTuple real_model n → space.Carrier

end LRA.EuclideanSpace
