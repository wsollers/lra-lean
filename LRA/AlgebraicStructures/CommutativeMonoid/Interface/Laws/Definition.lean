import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`CommutativeMonoidLaws` A commutative monoid: `(R, *, 1)` — associative, closed (free from `Mul`), nonempty (ambient `[Nonempty R]` per D7), two-sided identity `1`, and `*` is commutative. Combines `MultiplicativeSemigroupLaws` (axioms 1–2: closure + associativity) with `MultiplicativeIdentityLaws` (axiom 3: identity) and `MultiplicativeCommutativeLaws` (axiom 4: commutativity) — matches the user's four-axiom `(M, *, e)` definition exactly, sitting between `CommutativeSemigroup` and `AbelianGroup` per the user's own framing.

Predicate logic:

  class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
    MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
    MultiplicativeCommutativeLaws R

Predicate logic (unfolded):

  class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
    MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
    MultiplicativeCommutativeLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R
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
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R

end LRA.AlgebraicStructures
