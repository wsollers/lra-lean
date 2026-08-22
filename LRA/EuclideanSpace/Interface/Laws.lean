import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

universe u

/-!
The generic, backend-agnostic law-classes any concrete realization of
Euclidean space is checked against -- the "generic model" -- mirroring
`LRA.Set.Interface.Membership`'s `MembershipLaws`/`ExtensionalityLaw`:
each class states what `Between`/`Congruent` *mean* for an arbitrary
`Point` type, decoupled from how any one backend (`Tarski`, a future
Mathlib-backed realization) constructs them. The field names and shapes
mirror `Tarski.Axioms` one-for-one, so a backend whose primitives are
literally the axioms (like `Tarski` itself) can supply these instances
by direct reference, with no restatement.

Split by capability, as everywhere else in this repo's `Interface`
folders: `CongruenceLaws` needs only `Congruent`; `BetweennessLaws`
needs only `Between`; the rest need both.
-/

variable (Point : Type u)

/-- Tarski axioms 1-3: congruence is reflexive, transitive (in its
"shared first pair" form), and forces equal endpoints on a degenerate
segment. -/
class CongruenceLaws [Congruent Point] : Prop where
  CongruenceReflexivity : ∀ x y : Point, congruent x y y x
  CongruenceTransitivity :
    ∀ x y z w u v : Point,
      congruent x y z w → congruent x y u v → congruent z w u v
  CongruenceIdentity : ∀ x y z : Point, congruent x y z z → x = y

/-- Tarski axiom 4: a segment congruent to `ab` can always be laid off
from `y` along ray `xy`. -/
class SegmentConstructionLaw [Between Point] [Congruent Point] : Prop where
  SegmentConstruction :
    ∀ x y a b : Point, ∃ z : Point, between x y z ∧ congruent y z a b

/-- Tarski axiom 5: the five-segment rigidity axiom. -/
class FiveSegmentLaw [Between Point] [Congruent Point] : Prop where
  FiveSegment :
    ∀ x y z x' y' z' u u' : Point, x ≠ y →
      between x y z → between x' y' z' →
      congruent x y x' y' → congruent y z y' z' →
      congruent x u x' u' → congruent y u y' u' →
      congruent z u z' u'

/-- Tarski axioms 6-7: betweenness is nondegenerate, and satisfies inner
Pasch. -/
class BetweennessLaws [Between Point] : Prop where
  BetweennessIdentity : ∀ x y : Point, between x y x → x = y
  InnerPasch :
    ∀ u v p q z : Point, between u p v → between p q z →
      ∃ x : Point, between u x z ∧ between q x v

/-- Tarski axiom 10 (Playfair form of the parallel postulate). -/
class ParallelLaw [Between Point] : Prop where
  Playfair :
    ∀ a b c d t : Point, between a d t → between b d c → a ≠ d →
      ∃ x y : Point, between a b x ∧ between a c y ∧ between x t y

/-- Tarski axiom 11 (continuity schema), quantifying over `Point → Prop`
directly in place of `L_geom`-formulas -- see
`Tarski.Axioms.Continuity`'s module doc for why that is a faithful
choice. -/
class ContinuityLaw [Between Point] : Prop where
  Continuity :
    ∀ φ ψ : Point → Prop,
      (∃ a : Point, ∀ x y : Point, φ x → ψ y → between a x y) →
      ∃ b : Point, ∀ x y : Point, φ x → ψ y → between x b y

/-- `n + 1` points not lying in a common flat determined by the other
`n`. Deferred (`sorry`-valued), exactly as `Tarski.Axioms.
DimensionPredicates.AffinelyIndependent` is, and for the same reason:
this is genuine unformalized mathematics, not an invented shortcut, and
a wrong definition here would be worse than an admitted gap.

Logical form:

```lean
def AffinelyIndependent [Between Point] [Congruent Point]
    (n : Nat) (points : Fin (n + 1) → Point) : Prop :=
  sorry
```
-/
def AffinelyIndependent [Between Point] [Congruent Point]
    (n : Nat) (points : Fin (n + 1) → Point) : Prop :=
  sorry

/-- A point's position pinned down (up to finitely many candidates) by
its distances to `points`. Deferred, mirroring `Tarski.Axioms.
DimensionPredicates.CoincidesOrDeterminedByDistances`.

Logical form:

```lean
def CoincidesOrDeterminedByDistances [Between Point] [Congruent Point]
    (n : Nat) (p : Point) (points : Fin (n + 1) → Point) : Prop :=
  sorry
```
-/
def CoincidesOrDeterminedByDistances [Between Point] [Congruent Point]
    (n : Nat) (p : Point) (points : Fin (n + 1) → Point) : Prop :=
  sorry

/-- Tarski axioms 8-9: the space has dimension exactly `n`. Vacuous
until `AffinelyIndependent`/`CoincidesOrDeterminedByDistances` are
filled in. -/
class DimensionLaws [Between Point] [Congruent Point] (n : Nat) : Prop where
  LowerDimension :
    ∃ points : Fin (n + 1) → Point, AffinelyIndependent Point n points
  UpperDimension :
    ∀ (p : Point) (points : Fin (n + 1) → Point),
      AffinelyIndependent Point n points →
      CoincidesOrDeterminedByDistances Point n p points

end LRA.EuclideanSpace
