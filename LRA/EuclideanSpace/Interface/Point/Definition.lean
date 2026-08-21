import LRA.AlgebraicStructures.OrderedField.Laws
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

universe u

/-!
The canonical generic point: an `n`-tuple of elements of an abstract
ordered field `R`, wrapped as a genuine structure (not a bare `Fin n →
R`, for the same "primitive, not a re-exported abstraction" reason
`Tarski`'s carrier is opaque rather than a raw alias). `R` is a type
parameter, not fixed to `ℝ` -- `Point n R` is meant to be instantiated
at `mathlibRealModel`'s carrier, at one of `RealModel`'s from-scratch
constructions, or at any other `OrderedFieldLaws` carrier, uniformly.

That genericity is why the coordinate sum below is a hand-rolled
recursion (`sumFin`) rather than Mathlib's `Finset.sum`: `Finset.sum`
needs a Mathlib `AddCommMonoid` instance, which this repo's own
from-scratch `RealModel` constructions (deliberately kept Mathlib-free,
per `NumberSystems.RealNumbers`'s own router doc) do not carry. `sumFin`
needs only the `Add`/`OfNat _ 0` already required below, so `Point n R`
stays usable with either kind of carrier.

`between`/`congruent` need only ordered-field arithmetic -- affine
combination for betweenness, equality of sums of squares for
congruence -- neither needs a square root, so neither needs `R` to be
real-closed the way `Tarski`'s segment-construction axiom does. That
axiom (and the others requiring more than a bare ordered field) is a
genuine proof *obligation* on `Point n R`, not a hypothesis baked into
these definitions.
-/

/-- A point of `n`-dimensional space over `R`: an `n`-tuple of `R`-values,
accessed by `.get`.

Logical form:

```lean
structure Point (n : ℕ) (R : Type u) where
  get : Fin n → R
```
-/
structure Point (n : ℕ) (R : Type u) where
  get : Fin n → R

/-- A Mathlib-free sum over `Fin n`, needing only `Add`/`OfNat _ 0`.

Logical form:

```lean
def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f i.castSucc)
```
-/
def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f i.castSucc)

variable {n : ℕ} {R : Type u} [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1]
  [LT R] [LE R] [OrderedFieldLaws R]

/-- Betweenness by affine combination: `y` is between `x` and `z` when
`y = (1 - t) • x + t • z` coordinatewise, for some `t` with `0 ≤ t ≤ 1`.

Logical form:

```lean
instance : Between (Point n R) where
  between x y z :=
    ∃ t : R, (0 : R) ≤ t ∧ t ≤ 1 ∧
      ∀ i : Fin n, y.get i = (1 - t) * x.get i + t * z.get i
```
-/
instance : Between (Point n R) where
  between x y z :=
    ∃ t : R, (0 : R) ≤ t ∧ t ≤ 1 ∧
      ∀ i : Fin n, y.get i = (1 - t) * x.get i + t * z.get i

/-- Congruence by equal sums of squared coordinate differences: `xy ≡ zw`
when `∑ᵢ (xᵢ - yᵢ)² = ∑ᵢ (zᵢ - wᵢ)²`. No square root is taken -- this is
stateable, and meaningful, over any ordered field.

Logical form:

```lean
instance : Congruent (Point n R) where
  congruent x y z w :=
    sumFin (fun i => (x.get i - y.get i) * (x.get i - y.get i)) =
      sumFin (fun i => (z.get i - w.get i) * (z.get i - w.get i))
```
-/
instance : Congruent (Point n R) where
  congruent x y z w :=
    sumFin (fun i => (x.get i - y.get i) * (x.get i - y.get i)) =
      sumFin (fun i => (z.get i - w.get i) * (z.get i - w.get i))

end LRA.EuclideanSpace
