import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.MetricSpace.Definition.MetricSpace
import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.Analysis.MetricSpace

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.EuclideanSpace

universe u

/--
`MathlibRn` TODO

Predicate logic:

  abbrev MathlibRn (n : ℕ) := Rn mathlibRealModel n

Predicate logic (unfolded):

  abbrev MathlibRn (n : ℕ) := Rn mathlibRealModel n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MathlibRn (n : ℕ) := Rn mathlibRealModel n
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
abbrev MathlibRn (n : ℕ) := Rn mathlibRealModel n

/--
`coordinates` TODO

Predicate logic:

  abbrev coordinates {n : ℕ} (point : MathlibRn n) : Fin n → ℝ :=
  point.coord

Predicate logic (unfolded):

  abbrev coordinates {n : ℕ} (point : MathlibRn n) : Fin n → ℝ :=
  point.coord (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev coordinates {n : ℕ} (point : MathlibRn n) : Fin n → ℝ :=
  point.coord
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
abbrev coordinates {n : ℕ} (point : MathlibRn n) : Fin n → ℝ :=
  point.coord

/--
`MathlibRnExt` TODO

Predicate logic:

  (∀ i : Fin n, coordinates x i = coordinates y i) → x = y

Predicate logic (unfolded):

  ∀ {n : Nat} {x y : LRA.EuclideanSpace.EuclideanPoint LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel n}, (∀ (i : Fin n), x.1 i = y.1 i) → x = y

Logical form (Lean):

```lean
theorem MathlibRnExt {n : ℕ} {x y : MathlibRn n}
    (h : ∀ i : Fin n, coordinates x i = coordinates y i) : x = y
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
theorem MathlibRnExt {n : ℕ} {x y : MathlibRn n}
    (h : ∀ i : Fin n, coordinates x i = coordinates y i) : x = y := by
  sorry
/--
`EuclideanRnMetric` TODO

Predicate logic:

  noncomputable def EuclideanRnMetric (n : ℕ) :
    MetricDefinition (MathlibRn n) where
  distance x y

Predicate logic (unfolded):

  noncomputable def EuclideanRnMetric (n : ℕ) :
    MetricDefinition (MathlibRn n) where
  distance x y (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def EuclideanRnMetric (n : ℕ) :
    MetricDefinition (MathlibRn n) where
  distance x y
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
noncomputable def EuclideanRnMetric (n : ℕ) :
    MetricDefinition (MathlibRn n) where
  distance x y := dist (coordinates x) (coordinates y)
  positive x y := by
    constructor
    · exact dist_nonneg
    · constructor
      · intro hxy
        apply MathlibRnExt
        exact fun i => by
          exact congrFun (dist_eq_zero.mp hxy) i
      · intro hxy
        cases hxy
        exact dist_self (coordinates x)
  symmetric x y := dist_comm (coordinates x) (coordinates y)
  triangle x y z := dist_triangle (coordinates x) (coordinates y) (coordinates z)

/--
`EuclideanRnMetricSpaceDefinition` TODO

Predicate logic:

  noncomputable def EuclideanRnMetricSpaceDefinition (n : ℕ) :
    MetricSpaceDefinition where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n

Predicate logic (unfolded):

  noncomputable def EuclideanRnMetricSpaceDefinition (n : ℕ) :
    MetricSpaceDefinition where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def EuclideanRnMetricSpaceDefinition (n : ℕ) :
    MetricSpaceDefinition where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n
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
noncomputable def EuclideanRnMetricSpaceDefinition (n : ℕ) :
    MetricSpaceDefinition where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n

/--
`EuclideanRnMetricSpaceModel` TODO

Predicate logic:

  structure EuclideanRnMetricSpaceModel (real_model : RealModel) (n : ℕ)
    where
  metricSpace : MetricSpaceDefinition
  euclideanStructure : TarskiStructure
  carrier_eq : metricSpace.Carrier = euclideanStructure.Domain

Predicate logic (unfolded):

  structure EuclideanRnMetricSpaceModel (real_model : RealModel) (n : ℕ)
    where
  metricSpace : MetricSpaceDefinition
  euclideanStructure : TarskiStructure
  carrier_eq : metricSpace.Carrier = euclideanStructure.Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure EuclideanRnMetricSpaceModel (real_model : RealModel) (n : ℕ)
    where
  metricSpace : MetricSpaceDefinition
  euclideanStructure : TarskiStructure
  carrier_eq : metricSpace.Carrier = euclideanStructure.Domain
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
structure EuclideanRnMetricSpaceModel (real_model : RealModel) (n : ℕ)
    where
  metricSpace : MetricSpaceDefinition
  euclideanStructure : TarskiStructure
  carrier_eq : metricSpace.Carrier = euclideanStructure.Domain

/--
`euclideanRnMetricSpaceModelOf` TODO

Predicate logic:

  def euclideanRnMetricSpaceModelOf
    (real_model : RealModel) (n : ℕ)
    (metric : MetricDefinition (Rn real_model n)) :
    EuclideanRnMetricSpaceModel real_model n where
  metricSpace := {
    Carrier := Rn real_model n
    metric := metric
  }
  euclideanStructure := EuclideanTupleModel real_model n
  carrier_eq := rfl

Predicate logic (unfolded):

  def euclideanRnMetricSpaceModelOf
    (real_model : RealModel) (n : ℕ)
    (metric : MetricDefinition (Rn real_model n)) :
    EuclideanRnMetricSpaceModel real_model n where
  metricSpace := {
    Carrier := Rn real_model n
    metric := metric
  }
  euclideanStructure := EuclideanTupleModel real_model n
  carrier_eq := rfl (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def euclideanRnMetricSpaceModelOf
    (real_model : RealModel) (n : ℕ)
    (metric : MetricDefinition (Rn real_model n)) :
    EuclideanRnMetricSpaceModel real_model n where
  metricSpace := {
    Carrier := Rn real_model n
    metric := metric
  }
  euclideanStructure := EuclideanTupleModel real_model n
  carrier_eq := rfl
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
def euclideanRnMetricSpaceModelOf
    (real_model : RealModel) (n : ℕ)
    (metric : MetricDefinition (Rn real_model n)) :
    EuclideanRnMetricSpaceModel real_model n where
  metricSpace := {
    Carrier := Rn real_model n
    metric := metric
  }
  euclideanStructure := EuclideanTupleModel real_model n
  carrier_eq := rfl

/--
`canonicalEuclideanRnMetricSpaceModel` TODO

Predicate logic:

  noncomputable def canonicalEuclideanRnMetricSpaceModel (n : ℕ) :
    EuclideanRnMetricSpaceModel mathlibRealModel n where
  metricSpace := EuclideanRnMetricSpaceDefinition n
  euclideanStructure := EuclideanTupleModel mathlibRealModel n
  carrier_eq := rfl

Predicate logic (unfolded):

  noncomputable def canonicalEuclideanRnMetricSpaceModel (n : ℕ) :
    EuclideanRnMetricSpaceModel mathlibRealModel n where
  metricSpace := EuclideanRnMetricSpaceDefinition n
  euclideanStructure := EuclideanTupleModel mathlibRealModel n
  carrier_eq := rfl (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def canonicalEuclideanRnMetricSpaceModel (n : ℕ) :
    EuclideanRnMetricSpaceModel mathlibRealModel n where
  metricSpace := EuclideanRnMetricSpaceDefinition n
  euclideanStructure := EuclideanTupleModel mathlibRealModel n
  carrier_eq := rfl
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
noncomputable def canonicalEuclideanRnMetricSpaceModel (n : ℕ) :
    EuclideanRnMetricSpaceModel mathlibRealModel n where
  metricSpace := EuclideanRnMetricSpaceDefinition n
  euclideanStructure := EuclideanTupleModel mathlibRealModel n
  carrier_eq := rfl

end LRA.Analysis.MetricSpace
