-- LRA/Cardinality/Definition.lean
-- The subject's core notion: comparing the sizes of two types by the
-- functions that exist between them.

import LRA.Function.Properties.Definition

namespace LRA.Cardinality

universe u v

/-!
Volume I label: cardinality-definition
Lean module: LRA.Cardinality.Definition
Verification status: checked definitions

Equinumerosity is stated through the working (arrow) presentation of a
function, `LRA.Function.Domain Codomain := Domain → Codomain`, and its
existing `Injective`/`Surjective`/`Bijective` vocabulary — not through
the set-theoretic triple. Cardinality compares arbitrary types, most of
which are never packaged as `LRA.Set` objects, so the arrow is the
right default here (§1.2 of the subject architecture): "to everything
else in the repository, a function *is* `Domain → Codomain`."

`Dominates` (`A ⪯ B`, "`A` has cardinality at most `B`'s") is the
generically useful notion `Equinumerous` alone cannot give: it is a
preorder immediately, and `Theorems.lean`'s
`CantorSchroederBernstein` is precisely the theorem that mutual
domination collapses it back to `Equinumerous`.
-/

/-- **[Definition — Equinumerous]**

Two types are equinumerous, `A ≈ B`, when a bijection exists between
them.

Logical form:

```lean
def Equinumerous (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Bijective f
```
-/
def Equinumerous (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Bijective f

/-- **[Definition — Dominates]**

`A` is dominated by `B`, `A ⪯ B`, when an injection from `A` to `B`
exists -- `A` has cardinality at most that of `B`.

Logical form:

```lean
def Dominates (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Injective f
```
-/
def Dominates (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Injective f

/-- **[Definition — StrictlyDominates]**

`A` is strictly dominated by `B` when `A ⪯ B` but the two are not
equinumerous -- `A`'s cardinality is strictly less than `B`'s.

Logical form:

```lean
def StrictlyDominates (A : Type u) (B : Type v) : Prop :=
  Dominates A B ∧ ¬ Equinumerous A B
```
-/
def StrictlyDominates (A : Type u) (B : Type v) : Prop :=
  Dominates A B ∧ ¬ Equinumerous A B

end LRA.Cardinality
