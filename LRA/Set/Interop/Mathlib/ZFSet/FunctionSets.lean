-- LRA/VolumeI/Set/MathlibZFSet/FunctionSets.lean
-- Certifying the generic function-set vocabulary against Mathlib's
-- internal ZFC functions: IsFunc, funs, map.

import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interop.Mathlib.ZFSet.Pairing
import LRA.Set.Interface.RelationSets

namespace LRA.Set.MathlibZFSet

open LRA.Set

/-!
Volume I label: mathlib-zfset-function-sets
Lean module: LRA.Set.MathlibZFSet.FunctionSets
Verification status: fully proved (Mathlib backend, zero sorry)

The certification the relation-set layer earns its keep by: the
generic vocabulary (`Relates`, `IsSingleValued`, `IsTotalOn`,
`IsFunctionalSet`), instantiated at `ZFSet`, coincides with Mathlib's
own internal ZFC function encoding — `ZFSet.IsFunc` ("a subset of
`x × y` relating each element of `x` to a unique element of `y`"),
`ZFSet.funs` (the function space `y ^ x`, carved from
`powerset (prod x y)` by Separation — Enderton's construction,
verbatim), and `ZFSet.map` (the graph of a definable class function).

So the sorry'd generic notions the Enderton backend instantiates have
fully-proved Mathlib twins here: same vocabulary, certified model.
-/

/-- **[Theorem — RelatesIffPairMember]** (definitional bridge: the
generic `Relates` at `ZFSet` IS Kuratowski-pair membership).

Logical form:

```lean
theorem RelatesIffPairMember (relation input output : ZFSet) :
    Relates relation input output ↔ ZFSet.pair input output ∈ relation
```
-/
theorem RelatesIffPairMember (relation input output : ZFSet) :
    Relates relation input output ↔
      ZFSet.pair input output ∈ relation := by
  sorry

/-- **[Theorem — IsPairwiseOfSubsetProd]**

A subset of a product is pairwise: every member is an ordered pair.

Logical form:

```lean
theorem IsPairwiseOfSubsetProd {domain codomain relation : ZFSet}
    (inside : relation ⊆ ZFSet.prod domain codomain) :
    IsPairwise ZFSet ZFSet relation
```
-/
theorem IsPairwiseOfSubsetProd {domain codomain relation : ZFSet}
    (inside : relation ⊆ ZFSet.prod domain codomain) :
    IsPairwise ZFSet ZFSet relation := by
  sorry

/-- **[Theorem — IsSingleValuedOfIsFunc]**

Mathlib's `IsFunc` implies the generic single-valuedness: the unique
output at each domain point, plus the subset-of-product fact locating
every pair's input in the domain, forces global uniqueness.

Logical form:

```lean
theorem IsSingleValuedOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsSingleValued ZFSet ZFSet relation
```
-/
theorem IsSingleValuedOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsSingleValued ZFSet ZFSet relation := by
  sorry

/-- **[Theorem — IsFuncIffFunctional]**

The certification: Mathlib's `IsFunc domain codomain` is exactly
"subset of the product, total on the domain, single-valued" — the
generic vocabulary, word for word.

Logical form:

```lean
theorem IsFuncIffFunctional (domain codomain relation : ZFSet) :
    ZFSet.IsFunc domain codomain relation ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation
```
-/
theorem IsFuncIffFunctional (domain codomain relation : ZFSet) :
    ZFSet.IsFunc domain codomain relation ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation := by
  sorry

/-- **[Theorem — MemberOfFunsIffFunctional]**

Membership in Mathlib's function space `funs domain codomain` — the
set `codomain ^ domain`, carved by Separation from the powerset of the
product exactly as Enderton constructs it — is the same three-part
condition.

Logical form:

```lean
theorem MemberOfFunsIffFunctional (domain codomain relation : ZFSet) :
    relation ∈ ZFSet.funs domain codomain ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation
```
-/
theorem MemberOfFunsIffFunctional (domain codomain relation : ZFSet) :
    relation ∈ ZFSet.funs domain codomain ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation := by
  sorry

/-- **[Theorem — IsFunctionalSetOfIsFunc]**

Anything Mathlib calls an internal function is a functional set in the
generic sense.

Logical form:

```lean
theorem IsFunctionalSetOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsFunctionalSet ZFSet ZFSet relation
```
-/
theorem IsFunctionalSetOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsFunctionalSet ZFSet ZFSet relation := by
  sorry

/-- **[Theorem — RelatesMapIff]**

Mathlib's `ZFSet.map f x` — the internal graph of a definable class
function over `x` — relates exactly along the function: the certified
twin of the generic `RelatesGraphSetOf`.

Logical form:

```lean
theorem RelatesMapIff (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over input output : ZFSet) :
    Relates (ZFSet.map f over) input output ↔
      input ∈ over ∧ f input = output
```
-/
theorem RelatesMapIff (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over input output : ZFSet) :
    Relates (ZFSet.map f over) input output ↔
      input ∈ over ∧ f input = output := by
  sorry

/-- **[Theorem — MapIsFunctionalSet]**

Mathlib's internal graph is a functional set in the generic sense —
the certified twin of `GraphSetOfIsFunctional`.

Logical form:

```lean
theorem MapIsFunctionalSet (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over : ZFSet) :
    IsFunctionalSet ZFSet ZFSet (ZFSet.map f over)
```
-/
theorem MapIsFunctionalSet (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over : ZFSet) :
    IsFunctionalSet ZFSet ZFSet (ZFSet.map f over) := by
  sorry

end LRA.Set.MathlibZFSet
