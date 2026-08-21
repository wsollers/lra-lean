import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-!
Tarski axiom 11 is a first-order *schema*: for every pair of formulas
`φ(x, w̄)`, `ψ(y, w̄)` of `L_geom`, "if some point separates every `φ`-point
from every `ψ`-point via betweenness, then some point does so between
them." Formalizing "every `L_geom`-formula" literally would need the
`Formula` machinery from `LRA.Logic.Syntax.FirstOrder` quantified over,
which is a separate undertaking. The standard, faithful way to state a
first-order schema inside a system with native higher-order `Prop` is to
quantify over arbitrary predicates directly -- every `L_geom`-formula
already denotes some `TarskiPoint → Prop`, so quantifying over all such
predicates is at least as strong as (a legitimate, common strengthening
of) the schema, and is what is stated here.
-/

/-- Tarski axiom 11 (continuity): if some point `a` witnesses that every
`φ`-point comes before every `ψ`-point (via `Between`), then some point
`b` can be inserted between every `φ`-point and every `ψ`-point. -/
axiom Continuity (φ ψ : TarskiPoint → Prop) :
    (∃ a : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween a x y) →
    ∃ b : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween x b y

end LRA.EuclideanSpace
