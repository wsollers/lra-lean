import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Set.SetClass.Operations

/-!
Reviewed failure modes for function image/preimage laws.

The unit `source ⊆ preimage (image source)` and the counit
`image (preimage target) ⊆ target` always hold. These predicates name cases
where the inclusion is proper. This file also records why injectivity alone does
not make image commute with an empty indexed intersection.
-/

namespace LRA.Function

open LRA.Set
universe u v

/-- The unit of the adjunction is a proper inclusion at this source class.

Logical form:

```lean
def UnitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  SetClass.Included source
      (PreimageClass function (ImageClass function source)) ∧
    PreimageClass function (ImageClass function source) ≠ source
```
-/
def UnitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  SetClass.Included source
      (PreimageClass function (ImageClass function source)) ∧
    PreimageClass function (ImageClass function source) ≠ source

/-- The counit of the adjunction is a proper inclusion at this target class.

Logical form:

```lean
def CounitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  SetClass.Included
      (ImageClass function (PreimageClass function target)) target ∧
    ImageClass function (PreimageClass function target) ≠ target
```
-/
def CounitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  SetClass.Included
      (ImageClass function (PreimageClass function target)) target ∧
    ImageClass function (PreimageClass function target) ≠ target

/-- An injective function exhibits the empty-indexed-intersection failure when
its image of the universal source class is not the universal target class.

For an empty index type both indexed intersections are universal classes. The
source side becomes the range of the function, while the target side is all of
the codomain. Hence this predicate holds exactly in the injective,
non-surjective boundary case relevant to indexed intersections.

Logical form:

```lean
def EmptyIndexedIntersectionImageFailure
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧
    ImageClass function (SetClass.Universal : SetClass Domain) ≠
      (SetClass.Universal : SetClass Codomain)
```
-/
def EmptyIndexedIntersectionImageFailure
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧
    ImageClass function (SetClass.Universal : SetClass Domain) ≠
      (SetClass.Universal : SetClass Codomain)

/-- The embedding of natural numbers into `Option Nat` by `some` is injective
but misses `none`, so it realizes the empty-indexed-intersection failure.

Equivalently, for the empty family of source classes, the image of the source
intersection is the range of `some`, whereas the intersection of the images is
the universal `Option Nat` class.

Logical form:

```lean
theorem SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure :
    EmptyIndexedIntersectionImageFailure (fun n : Nat => some n)
```
-/
theorem SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure :
    EmptyIndexedIntersectionImageFailure (fun n : Nat => some n) := by
  sorry

end LRA.Function
