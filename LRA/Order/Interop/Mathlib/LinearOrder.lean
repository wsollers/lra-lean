import Mathlib.Order.Defs.LinearOrder
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.Interop.Mathlib.Order

open LRA.Order

universe u

/--
`toMathlibLinearOrder` TODO

Predicate logic:

  noncomputable def toMathlibLinearOrder
    (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le

Predicate logic (unfolded):

  noncomputable def toMathlibLinearOrder
    (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def toMathlibLinearOrder
    (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le
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
@[reducible] noncomputable def toMathlibLinearOrder
    (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le := (· ≤ ·)
  lt := (· < ·)
  le_refl := LeRefl
  le_trans := LeTrans
  lt_iff_le_not_ge := LtIffLeNotLe
  le_antisymm := LeAntisymm
  le_total := LeTotal
  toDecidableLE := by
    classical
    infer_instance

noncomputable example : LinearOrder Int := toMathlibLinearOrder Int

end LRA.Interop.Mathlib.Order
