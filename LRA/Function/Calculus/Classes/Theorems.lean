import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Interface.Structures.Definition
import LRA.Relation.Interface.Canonical.IdentityRelation.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

universe u v w

/--
`EveryInputInDomainClass` TODO

Predicate logic:

  (∀ input ∈ Domain), DomainClass function input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (input : Domain), Exists fun y => function input = y

Logical form (Lean):

```lean
theorem EveryInputInDomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    DomainClass function input
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
theorem EveryInputInDomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    DomainClass function input := by
  sorry
/--
`KernelRelationIsEquivalenceRelation` TODO

Predicate logic:

  LRA.Relation.EquivalenceRelation (KernelRelation function)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (x : Domain), Exists fun output => (function x = output ∧ function x = output) ∧ (∀ (x y : Domain), (Exists fun output => (function x = output ∧ function y = output)) → Exists fun output => (function y = output ∧ function x = output) ∧ ∀ (x y z : Domain), (Exists fun output => (function x = output ∧ function y = output)) → (Exists fun output => (function y = output ∧ function z = output)) → Exists fun output => (function x = output ∧ function z = output)))

Logical form (Lean):

```lean
theorem KernelRelationIsEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation function)
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
theorem KernelRelationIsEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation function) := by
  sorry
/--
`InjectiveIffKernelIsIdentityRelation` TODO

Predicate logic:

  Injective function ↔ KernelRelation function = LRA.Relation.IdentityRelation Domain

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), ∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂ ↔ fun left right => Exists fun output => (function left = output ∧ function right = output) = funx y => x = y

Logical form (Lean):

```lean
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      KernelRelation function = LRA.Relation.IdentityRelation Domain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      KernelRelation function = LRA.Relation.IdentityRelation Domain := by
  sorry
section FunctionalPreimageLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

/--
`PreimageClassIntersection` TODO

Predicate logic:

  PreimageClass function (SetClass.Intersection left right) = SetClass.Intersection (PreimageClass function left) (PreimageClass function right)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (left right : Codomain → Prop), fun x => Exists fun y => ((left y ∧ right y) ∧ function x = y) = funelement => (Exists fun y => (left y ∧ function element = y) ∧ Exists fun y => (right y ∧ function element = y))

Logical form (Lean):

```lean
theorem PreimageClassIntersection (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (PreimageClass function left)
        (PreimageClass function right)
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
theorem PreimageClassIntersection (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (PreimageClass function left)
        (PreimageClass function right) := by
  sorry
/--
`PreimageClassDifference` TODO

Predicate logic:

  PreimageClass function (SetClass.Difference left right) = SetClass.Difference (PreimageClass function left) (PreimageClass function right)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (left right : Codomain → Prop), fun x => Exists fun y => ((left y ∧ right y → False) ∧ function x = y) = funelement => (Exists fun y => (left y ∧ function element = y) ∧ (Exists fun y => (right y ∧ function element = y)) → False)

Logical form (Lean):

```lean
theorem PreimageClassDifference (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Difference left right) =
      SetClass.Difference (PreimageClass function left)
        (PreimageClass function right)
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
theorem PreimageClassDifference (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Difference left right) =
      SetClass.Difference (PreimageClass function left)
        (PreimageClass function right) := by
  sorry
/--
`PreimageClassComplement` TODO

Predicate logic:

  PreimageClass function (SetClass.Complement target) = SetClass.Complement (PreimageClass function target)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop), fun x => Exists fun y => (target y → False ∧ function x = y) = funelement => (Exists fun y => (target y ∧ function element = y)) → False

Logical form (Lean):

```lean
theorem PreimageClassComplement (target : SetClass Codomain) :
    PreimageClass function (SetClass.Complement target) =
      SetClass.Complement (PreimageClass function target)
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
theorem PreimageClassComplement (target : SetClass Codomain) :
    PreimageClass function (SetClass.Complement target) =
      SetClass.Complement (PreimageClass function target) := by
  sorry
/--
`PreimageClassSymmetricDifference` TODO

Predicate logic:

  PreimageClass function (SetClass.Union (SetClass.Difference left right) (SetClass.Difference right left)) = SetClass.Union (SetClass.Difference (PreimageClass function left) (PreimageClass function right)) (SetClass.Difference (PreimageClass function right) (PreimageClass function left))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (left right : Codomain → Prop), fun x => Exists fun y => (Or ((left y ∧ right y → False)) ((right y ∧ left y → False)) ∧ function x = y) = funelement => Or ((Exists fun y => (left y ∧ function element = y) ∧ (Exists fun y => (right y ∧ function element = y)) → False)) ((Exists fun y => (right y ∧ function element = y) ∧ (Exists fun y => (left y ∧ function element = y)) → False))

Logical form (Lean):

```lean
theorem PreimageClassSymmetricDifference (left right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Union (SetClass.Difference left right)
          (SetClass.Difference right left)) =
      SetClass.Union
        (SetClass.Difference (PreimageClass function left)
          (PreimageClass function right))
        (SetClass.Difference (PreimageClass function right)
          (PreimageClass function left))
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
theorem PreimageClassSymmetricDifference (left right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Union (SetClass.Difference left right)
          (SetClass.Difference right left)) =
      SetClass.Union
        (SetClass.Difference (PreimageClass function left)
          (PreimageClass function right))
        (SetClass.Difference (PreimageClass function right)
          (PreimageClass function left)) := by
  sorry
/--
`PreimageClassDifferenceUnion` TODO

Predicate logic:

  PreimageClass function (SetClass.Difference left (SetClass.Union middle right)) = SetClass.Difference (PreimageClass function left) (SetClass.Union (PreimageClass function middle) (PreimageClass function right))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (left middle right : Codomain → Prop), fun x => Exists fun y => ((left y ∧ Or (middle y) (right y) → False) ∧ function x = y) = funelement => (Exists fun y => (left y ∧ function element = y) ∧ Or (Exists fun y => (middle y ∧ function element = y)) (Exists fun y => (right y ∧ function element = y)) → False)

Logical form (Lean):

```lean
theorem PreimageClassDifferenceUnion (left middle right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Difference left (SetClass.Union middle right)) =
      SetClass.Difference (PreimageClass function left)
        (SetClass.Union (PreimageClass function middle)
          (PreimageClass function right))
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
theorem PreimageClassDifferenceUnion (left middle right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Difference left (SetClass.Union middle right)) =
      SetClass.Difference (PreimageClass function left)
        (SetClass.Union (PreimageClass function middle)
          (PreimageClass function right)) := by
  sorry
/--
`PreimageClassUniversal` TODO

Predicate logic:

  PreimageClass function SetClass.Universal ∈ SetClass Codomain = SetClass.Universal ∈ SetClass Domain

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), fun x => Exists fun y => (True ∧ function x = y) = funx => True

Logical form (Lean):

```lean
theorem PreimageClassUniversal :
    PreimageClass function (SetClass.Universal : SetClass Codomain) =
      (SetClass.Universal : SetClass Domain)
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
theorem PreimageClassUniversal :
    PreimageClass function (SetClass.Universal : SetClass Codomain) =
      (SetClass.Universal : SetClass Domain) := by
  sorry
/--
`PreimageClassIndexedIntersection` TODO

Predicate logic:

  (Index → SetClass Codomain) → PreimageClass function (fun output => ∀ index, family index output) = (fun input => ∀ index, PreimageClass function (family index) input)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) {Index : Type w} (family : Index → Codomain → Prop), fun x => Exists fun y => ((fun output => ∀ (index : Index), family index output) y ∧ function x = y) = funinput => ∀ (index : Index), Exists fun y => (family index y ∧ function input = y)

Logical form (Lean):

```lean
theorem PreimageClassIndexedIntersection {Index : Type w}
    (family : Index → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input)
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
theorem PreimageClassIndexedIntersection {Index : Type w}
    (family : Index → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input) := by
  sorry
/--
`PreimageClassCountableIntersection` TODO

Predicate logic:

  (Nat → SetClass Codomain) → PreimageClass function (fun output => ∀ index, family index output) = (fun input => ∀ index, PreimageClass function (family index) input)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (family : Nat → Codomain → Prop), fun x => Exists fun y => ((fun output => ∀ (index : Nat), family index output) y ∧ function x = y) = funinput => ∀ (index : Nat), Exists fun y => (family index y ∧ function input = y)

Logical form (Lean):

```lean
theorem PreimageClassCountableIntersection (family : Nat → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input)
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
theorem PreimageClassCountableIntersection (family : Nat → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input) := by
  sorry
end FunctionalPreimageLaws

section ImagePreimageAdjunction

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

/--
`ImagePreimageAdjunction` TODO

Predicate logic:

  SetClass.Included source (PreimageClass function target) ↔ SetClass.Included (ImageClass function source) target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (target : Codomain → Prop), ∀ (element : Domain), source element → Exists fun y => (target y ∧ function element = y) ↔ ∀ (element : Codomain), (Exists fun x => (source x ∧ function x = element)) → target element

Logical form (Lean):

```lean
theorem ImagePreimageAdjunction
    (source : SetClass Domain) (target : SetClass Codomain) :
    SetClass.Included source (PreimageClass function target) ↔
      SetClass.Included (ImageClass function source) target
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem ImagePreimageAdjunction
    (source : SetClass Domain) (target : SetClass Codomain) :
    SetClass.Included source (PreimageClass function target) ↔
      SetClass.Included (ImageClass function source) target := by
  sorry
/--
`ImageOfPreimageClassIncluded` TODO

Predicate logic:

  SetClass.Included (ImageClass function (PreimageClass function target)) target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop) (element : Codomain), (Exists fun x => (Exists fun y => (target y ∧ function x = y) ∧ function x = element)) → target element

Logical form (Lean):

```lean
theorem ImageOfPreimageClassIncluded (target : SetClass Codomain) :
    SetClass.Included
      (ImageClass function (PreimageClass function target)) target
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
theorem ImageOfPreimageClassIncluded (target : SetClass Codomain) :
    SetClass.Included
      (ImageClass function (PreimageClass function target)) target := by
  sorry
/--
`SourceIncludedInPreimageOfImageClass` TODO

Predicate logic:

  SetClass.Included source (PreimageClass function (ImageClass function source))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (element : Domain), source element → Exists fun y => (Exists fun x => (source x ∧ function x = y) ∧ function element = y)

Logical form (Lean):

```lean
theorem SourceIncludedInPreimageOfImageClass (source : SetClass Domain) :
    SetClass.Included source
      (PreimageClass function (ImageClass function source))
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
theorem SourceIncludedInPreimageOfImageClass (source : SetClass Domain) :
    SetClass.Included source
      (PreimageClass function (ImageClass function source)) := by
  sorry
/--
`ImageOfPreimageClassEqualsMeetWithRange` TODO

Predicate logic:

  ImageClass function (PreimageClass function target) = SetClass.Intersection target (RangeClass function)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop), fun y => Exists fun x => (Exists fun y => (target y ∧ function x = y) ∧ function x = y) = funelement => (target element ∧ Exists fun x => function x = element)

Logical form (Lean):

```lean
theorem ImageOfPreimageClassEqualsMeetWithRange (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) =
      SetClass.Intersection target (RangeClass function)
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
theorem ImageOfPreimageClassEqualsMeetWithRange (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) =
      SetClass.Intersection target (RangeClass function) := by
  sorry
/--
`ImageOfPreimageClassOfIncludedInRange` TODO

Predicate logic:

  ImageClass function (PreimageClass function target) = target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop), (∀ (element : Codomain), target element → Exists fun x => function x = element) → fun y => Exists fun x => (Exists fun y => (target y ∧ function x = y) ∧ function x = y) = target

Logical form (Lean):

```lean
theorem ImageOfPreimageClassOfIncludedInRange (target : SetClass Codomain)
    (insideRange : SetClass.Included target (RangeClass function)) :
    ImageClass function (PreimageClass function target) = target
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
theorem ImageOfPreimageClassOfIncludedInRange (target : SetClass Codomain)
    (insideRange : SetClass.Included target (RangeClass function)) :
    ImageClass function (PreimageClass function target) = target := by
  sorry
/--
`MapsIntoClassIffImageIncluded` TODO

Predicate logic:

  MapsIntoClass function source target ↔ SetClass.Included (ImageClass function source) target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (target : Codomain → Prop), ∀ (input : Domain) (output : Codomain), source input → function input = output → target output ↔ ∀ (element : Codomain), (Exists fun x => (source x ∧ function x = element)) → target element

Logical form (Lean):

```lean
theorem MapsIntoClassIffImageIncluded
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included (ImageClass function source) target
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem MapsIntoClassIffImageIncluded
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included (ImageClass function source) target := by
  sorry
/--
`MapsIntoClassIffIncludedInPreimage` TODO

Predicate logic:

  MapsIntoClass function source target ↔ SetClass.Included source (PreimageClass function target)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (target : Codomain → Prop), ∀ (input : Domain) (output : Codomain), source input → function input = output → target output ↔ ∀ (element : Domain), source element → Exists fun y => (target y ∧ function element = y)

Logical form (Lean):

```lean
theorem MapsIntoClassIffIncludedInPreimage
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included source (PreimageClass function target)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem MapsIntoClassIffIncludedInPreimage
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included source (PreimageClass function target) := by
  sorry
end ImagePreimageAdjunction

section InjectiveAndSurjectiveLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

/--
`ImageClassIntersectionOfInjective` TODO

Predicate logic:

  ImageClass function (SetClass.Intersection left right) = SetClass.Intersection (ImageClass function left) (ImageClass function right)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → ∀ (left right : Domain → Prop), fun y => Exists fun x => ((left x ∧ right x) ∧ function x = y) = funelement => (Exists fun x => (left x ∧ function x = element) ∧ Exists fun x => (right x ∧ function x = element))

Logical form (Lean):

```lean
theorem ImageClassIntersectionOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (ImageClass function left)
        (ImageClass function right)
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
theorem ImageClassIntersectionOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (ImageClass function left)
        (ImageClass function right) := by
  sorry
/--
`ImageClassDifferenceOfInjective` TODO

Predicate logic:

  ImageClass function (SetClass.Difference left right) = SetClass.Difference (ImageClass function left) (ImageClass function right)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → ∀ (left right : Domain → Prop), fun y => Exists fun x => ((left x ∧ right x → False) ∧ function x = y) = funelement => (Exists fun x => (left x ∧ function x = element) ∧ (Exists fun x => (right x ∧ function x = element)) → False)

Logical form (Lean):

```lean
theorem ImageClassDifferenceOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Difference left right) =
      SetClass.Difference (ImageClass function left)
        (ImageClass function right)
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
theorem ImageClassDifferenceOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Difference left right) =
      SetClass.Difference (ImageClass function left)
        (ImageClass function right) := by
  sorry
/--
`ImageClassIndexedIntersectionOfInjective` TODO

Predicate logic:

  (Index → SetClass Domain) → ImageClass function (fun input => ∀ index, family index input) = (fun output => ∀ index, ImageClass function (family index) output)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) {Index : Type w}, (Nonempty Index ∧ ∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → ∀ (family : Index → Domain → Prop), fun y => Exists fun x => ((fun input => ∀ (index : Index), family index input) x ∧ function x = y) = funoutput => ∀ (index : Index), Exists fun x => (family index x ∧ function x = output)

Logical form (Lean):

```lean
theorem ImageClassIndexedIntersectionOfInjective {Index : Type w} [Nonempty Index]
    (injective : Injective function) (family : Index → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output)
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
theorem ImageClassIndexedIntersectionOfInjective {Index : Type w} [Nonempty Index]
    (injective : Injective function) (family : Index → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output) := by
  sorry
/--
`ImageClassCountableIntersectionOfInjective` TODO

Predicate logic:

  (Nat → SetClass Domain) → ImageClass function (fun input => ∀ index, family index input) = (fun output => ∀ index, ImageClass function (family index) output)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → ∀ (family : Nat → Domain → Prop), fun y => Exists fun x => ((fun input => ∀ (index : Nat), family index input) x ∧ function x = y) = funoutput => ∀ (index : Nat), Exists fun x => (family index x ∧ function x = output)

Logical form (Lean):

```lean
theorem ImageClassCountableIntersectionOfInjective
    (injective : Injective function) (family : Nat → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output)
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
theorem ImageClassCountableIntersectionOfInjective
    (injective : Injective function) (family : Nat → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output) := by
  sorry
/--
`ImageClassWitnessUniqueOfInjective` TODO

Predicate logic:

  (∀ output ∈ Codomain ∀ firstInput secondInput ∈ Domain), (source firstInput ∧ function firstInput = output ∧ source secondInput ∧ function secondInput = output) → firstInput = secondInput

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → ∀ (source : Domain → Prop) (output : Codomain) (firstInput secondInput : Domain), ((source firstInput ∧ function firstInput = output) ∧ (source secondInput ∧ function secondInput = output)) → firstInput = secondInput

Logical form (Lean):

```lean
theorem ImageClassWitnessUniqueOfInjective
    (injective : Injective function) (source : SetClass Domain)
    (output : Codomain) (firstInput secondInput : Domain)
    (firstWitness : source firstInput ∧ function firstInput = output)
    (secondWitness : source secondInput ∧ function secondInput = output) :
    firstInput = secondInput
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ImageClassWitnessUniqueOfInjective
    (injective : Injective function) (source : SetClass Domain)
    (output : Codomain) (firstInput secondInput : Domain)
    (firstWitness : source firstInput ∧ function firstInput = output)
    (secondWitness : source secondInput ∧ function secondInput = output) :
    firstInput = secondInput := by
  sorry
/--
`PreimageOfImageClassOfInjective` TODO

Predicate logic:

  PreimageClass function (ImageClass function source) = source

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → ∀ (source : Domain → Prop), fun x => Exists fun y => (Exists fun x => (source x ∧ function x = y) ∧ function x = y) = source

Logical form (Lean):

```lean
theorem PreimageOfImageClassOfInjective
    (injective : Injective function) (source : SetClass Domain) :
    PreimageClass function (ImageClass function source) = source
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
theorem PreimageOfImageClassOfInjective
    (injective : Injective function) (source : SetClass Domain) :
    PreimageClass function (ImageClass function source) = source := by
  sorry
/--
`ImageOfPreimageClassOfSurjective` TODO

Predicate logic:

  ImageClass function (PreimageClass function target) = target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain), Exists fun x => function x = y) → ∀ (target : Codomain → Prop), fun y => Exists fun x => (Exists fun y => (target y ∧ function x = y) ∧ function x = y) = target

Logical form (Lean):

```lean
theorem ImageOfPreimageClassOfSurjective
    (surjective : Surjective function) (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) = target
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
theorem ImageOfPreimageClassOfSurjective
    (surjective : Surjective function) (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) = target := by
  sorry
/--
`SurjectiveOfImageClassCoversCodomain` TODO

Predicate logic:

  (∀ output : Codomain, ImageClass function SetClass.Universal ∈ SetClass Domain output) → Surjective function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (output : Codomain), Exists fun x => (True ∧ function x = output)) → ∀ (y : Codomain), Exists fun x => function x = y

Logical form (Lean):

```lean
theorem SurjectiveOfImageClassCoversCodomain
    (covers : ∀ output : Codomain,
      ImageClass function (SetClass.Universal : SetClass Domain) output) :
    Surjective function
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
theorem SurjectiveOfImageClassCoversCodomain
    (covers : ∀ output : Codomain,
      ImageClass function (SetClass.Universal : SetClass Domain) output) :
    Surjective function := by
  sorry
end InjectiveAndSurjectiveLaws

section KernelLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

/--
`FiberClassOverValueIffKernelRelated` TODO

Predicate logic:

  (∀ representative input ∈ Domain), FiberClass function (function representative) input ↔ KernelRelation function input representative

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (representative input : Domain), function input = function representative ↔ Exists fun output => (function input = output ∧ function representative = output)

Logical form (Lean):

```lean
theorem FiberClassOverValueIffKernelRelated
    (representative input : Domain) :
    FiberClass function (function representative) input ↔
      KernelRelation function input representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem FiberClassOverValueIffKernelRelated
    (representative input : Domain) :
    FiberClass function (function representative) input ↔
      KernelRelation function input representative := by
  sorry
/--
`FiberClassSaturatedBy` TODO

Predicate logic:

  (∀ output ∈ Codomain), SaturatedBy (FiberClass function output) function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (output : Codomain) (input fiberMate : Domain), (function input = output ∧ Exists fun output => (function input = output ∧ function fiberMate = output)) → function fiberMate = output

Logical form (Lean):

```lean
theorem FiberClassSaturatedBy (output : Codomain) :
    SaturatedBy (FiberClass function output) function
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
theorem FiberClassSaturatedBy (output : Codomain) :
    SaturatedBy (FiberClass function output) function := by
  sorry
/--
`FiberClassEqualsKernelEquivalenceClass` TODO

Predicate logic:

  (∀ representative ∈ Domain), FiberClass function (function representative) = (fun input => KernelRelation function input representative)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (representative : Domain), fun x => function x = function representative = funinput => Exists fun output => (function input = output ∧ function representative = output)

Logical form (Lean):

```lean
theorem FiberClassEqualsKernelEquivalenceClass
    (representative : Domain) :
    FiberClass function (function representative) =
      (fun input => KernelRelation function input representative)
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
theorem FiberClassEqualsKernelEquivalenceClass
    (representative : Domain) :
    FiberClass function (function representative) =
      (fun input => KernelRelation function input representative) := by
  sorry
/--
`KernelClassMapsTo` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (classOfInputs : LRA.Set.SetClass Domain) (output : Codomain) (input : Domain), classOfInputs input → function input = output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (classOfInputs : Domain → Prop) (output : Codomain) (input : Domain), classOfInputs input → function input = output

Logical form (Lean):

```lean
def KernelClassMapsTo
    (classOfInputs : SetClass Domain) (output : Codomain) : Prop :=
  ∀ input, classOfInputs input → function input = output
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
def KernelClassMapsTo
    (classOfInputs : SetClass Domain) (output : Codomain) : Prop :=
  ∀ input, classOfInputs input → function input = output

/--
`KernelClassMapsToRepresentativeValue` TODO

Predicate logic:

  (∀ representative ∈ Domain), KernelClassMapsTo function (FiberClass function (function representative)) (function representative)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (representative input : Domain), function input = function representative → function input = function representative

Logical form (Lean):

```lean
theorem KernelClassMapsToRepresentativeValue
    (representative : Domain) :
    KernelClassMapsTo function
      (FiberClass function (function representative)) (function representative)
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
theorem KernelClassMapsToRepresentativeValue
    (representative : Domain) :
    KernelClassMapsTo function
      (FiberClass function (function representative)) (function representative) := by
  sorry
/--
`KernelClassMapsToOutputUnique` TODO

Predicate logic:

  (∀ firstOutput secondOutput ∈ Codomain), (∃ input, classOfInputs input) → firstOutput = secondOutput

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (classOfInputs : Domain → Prop) (firstOutput secondOutput : Codomain), (Exists fun input => classOfInputs input ∧ (∀ (input : Domain), classOfInputs input → function input = firstOutput ∧ ∀ (input : Domain), classOfInputs input → function input = secondOutput)) → firstOutput = secondOutput

Logical form (Lean):

```lean
theorem KernelClassMapsToOutputUnique
    (classOfInputs : SetClass Domain) (firstOutput secondOutput : Codomain)
    (inhabited : ∃ input, classOfInputs input)
    (firstMapsTo : KernelClassMapsTo function classOfInputs firstOutput)
    (secondMapsTo : KernelClassMapsTo function classOfInputs secondOutput) :
    firstOutput = secondOutput
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem KernelClassMapsToOutputUnique
    (classOfInputs : SetClass Domain) (firstOutput secondOutput : Codomain)
    (inhabited : ∃ input, classOfInputs input)
    (firstMapsTo : KernelClassMapsTo function classOfInputs firstOutput)
    (secondMapsTo : KernelClassMapsTo function classOfInputs secondOutput) :
    firstOutput = secondOutput := by
  sorry
/--
`KernelClassMapsToExistsOfRangeMember` TODO

Predicate logic:

  (∀ output ∈ Codomain), ∃ classOfInputs ∈ SetClass Domain, (∃ input, classOfInputs input) ∧ KernelClassMapsTo function classOfInputs output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (output : Codomain), (Exists fun x => function x = output) → Exists fun classOfInputs => (Exists fun input => classOfInputs input ∧ ∀ (input : Domain), classOfInputs input → function input = output)

Logical form (Lean):

```lean
theorem KernelClassMapsToExistsOfRangeMember
    (output : Codomain) (inRange : RangeClass function output) :
    ∃ classOfInputs : SetClass Domain,
      (∃ input, classOfInputs input) ∧
        KernelClassMapsTo function classOfInputs output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem KernelClassMapsToExistsOfRangeMember
    (output : Codomain) (inRange : RangeClass function output) :
    ∃ classOfInputs : SetClass Domain,
      (∃ input, classOfInputs input) ∧
        KernelClassMapsTo function classOfInputs output := by
  sorry
/--
`KernelQuotientProjectionWellDefined` TODO

Predicate logic:

  (∀ leftInput rightInput ∈ Domain), function leftInput = function rightInput

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (leftInput rightInput : Domain), (Exists fun output => (function leftInput = output ∧ function rightInput = output)) → function leftInput = function rightInput

Logical form (Lean):

```lean
theorem KernelQuotientProjectionWellDefined
    (leftInput rightInput : Domain)
    (kernelRelated : KernelRelation function leftInput rightInput) :
    function leftInput = function rightInput
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
theorem KernelQuotientProjectionWellDefined
    (leftInput rightInput : Domain)
    (kernelRelated : KernelRelation function leftInput rightInput) :
    function leftInput = function rightInput := by
  sorry
end KernelLaws

end LRA.Function
