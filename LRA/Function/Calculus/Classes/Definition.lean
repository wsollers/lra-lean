import LRA.Function.Definition
import LRA.Relation.Calculus.Classes.Definition

namespace LRA.Function

open LRA.Set
universe u v

/--
`DomainType` TODO

Predicate logic:

  abbrev DomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type u := Domain

Predicate logic (unfolded):

  abbrev DomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type u := Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev DomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type u := Domain
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
abbrev DomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type u := Domain

/--
`CodomainType` TODO

Predicate logic:

  abbrev CodomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type v := Codomain

Predicate logic (unfolded):

  abbrev CodomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type v := Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CodomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type v := Codomain
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
abbrev CodomainType {Domain : Type u} {Codomain : Type v}
    (_function : LRA.Function Domain Codomain) : Type v := Codomain

/--
`DomainClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (a : Domain), Exists fun y => function.Graph a y

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (a : Domain), Exists fun y => function a = y

Logical form (Lean):

```lean
abbrev DomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : SetClass Domain :=
  LRA.Relation.DomainClass (Graph function)
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
abbrev DomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : SetClass Domain :=
  LRA.Relation.DomainClass (Graph function)

/--
`RangeClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (a : Codomain), Exists fun x => function.Graph x a

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (a : Codomain), Exists fun x => function x = a

Logical form (Lean):

```lean
abbrev RangeClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : SetClass Codomain :=
  LRA.Relation.RangeClass (Graph function)
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
abbrev RangeClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : SetClass Codomain :=
  LRA.Relation.RangeClass (Graph function)

/--
`PointImageClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (input : Domain) (a : Codomain), function input = a

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (input : Domain) (a : Codomain), function input = a

Logical form (Lean):

```lean
abbrev PointImageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) : SetClass Codomain :=
  LRA.Relation.PointImageClass (Graph function) input
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
abbrev PointImageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) : SetClass Codomain :=
  LRA.Relation.PointImageClass (Graph function) input

/--
`ImageClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain) (a : Codomain), Exists fun x => (source x ∧ function.Graph x a)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (a : Codomain), Exists fun x => (source x ∧ function x = a)

Logical form (Lean):

```lean
abbrev ImageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (source : SetClass Domain) : SetClass Codomain :=
  LRA.Relation.ImageClass (Graph function) source
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
abbrev ImageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (source : SetClass Domain) : SetClass Codomain :=
  LRA.Relation.ImageClass (Graph function) source

/--
`PreimageClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (target : LRA.Set.SetClass Codomain) (a : Domain), Exists fun y => (target y ∧ function.Graph a y)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop) (a : Domain), Exists fun y => (target y ∧ function a = y)

Logical form (Lean):

```lean
abbrev PreimageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (target : SetClass Codomain) : SetClass Domain :=
  LRA.Relation.PreimageClass (Graph function) target
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
abbrev PreimageClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (target : SetClass Codomain) : SetClass Domain :=
  LRA.Relation.PreimageClass (Graph function) target

/--
`FiberClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (output : Codomain) (a : Domain), function a = output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (output : Codomain) (a : Domain), function a = output

Logical form (Lean):

```lean
abbrev FiberClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (output : Codomain) : SetClass Domain :=
  LRA.Relation.FiberClass (Graph function) output
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
abbrev FiberClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (output : Codomain) : SetClass Domain :=
  LRA.Relation.FiberClass (Graph function) output

/--
`KernelRelation` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (a a_1 : Domain), Exists fun output => (function.Graph a output ∧ function.Graph a_1 output)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (a a_1 : Domain), Exists fun output => (function a = output ∧ function a_1 = output)

Logical form (Lean):

```lean
def KernelRelation {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.Endorelation Domain :=
  fun left right =>
    ∃ output, Graph function left output ∧ Graph function right output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def KernelRelation {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.Endorelation Domain :=
  fun left right =>
    ∃ output, Graph function left output ∧ Graph function right output

/--
`SaturatedBy` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (subset : LRA.Set.SetClass Domain) (function : LRA.Function Domain Codomain) (input fiberMate : Domain), (subset input ∧ function.KernelRelation input fiberMate) → subset fiberMate

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (subset : Domain → Prop) (function : Domain → Codomain) (input fiberMate : Domain), (subset input ∧ Exists fun output => (function input = output ∧ function fiberMate = output)) → subset fiberMate

Logical form (Lean):

```lean
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    (subset : SetClass Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  ∀ input fiberMate,
    subset input → KernelRelation function input fiberMate → subset fiberMate
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
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    (subset : SetClass Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  ∀ input fiberMate,
    subset input → KernelRelation function input fiberMate → subset fiberMate

/--
`MapsIntoClass` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain) (target : LRA.Set.SetClass Codomain) (input : Domain) (output : Codomain), (source input ∧ function.Graph input output) → target output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (target : Codomain → Prop) (input : Domain) (output : Codomain), (source input ∧ function input = output) → target output

Logical form (Lean):

```lean
def MapsIntoClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) : Prop :=
  ∀ input output,
    source input → Graph function input output → target output
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
def MapsIntoClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) : Prop :=
  ∀ input output,
    source input → Graph function input output → target output

/--
`IsImageClassOf` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (image : LRA.Set.SetClass Codomain) (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain) (output : Codomain), image output ↔ function.ImageClass source output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (image : Codomain → Prop) (function : Domain → Codomain) (source : Domain → Prop) (output : Codomain), image output ↔ Exists fun x => (source x ∧ function x = output)

Logical form (Lean):

```lean
def IsImageClassOf {Domain : Type u} {Codomain : Type v}
    (image : SetClass Codomain)
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  ∀ output, image output ↔ ImageClass function source output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsImageClassOf {Domain : Type u} {Codomain : Type v}
    (image : SetClass Codomain)
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  ∀ output, image output ↔ ImageClass function source output

/--
`IsPreimageClassOf` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (preimage : LRA.Set.SetClass Domain) (function : LRA.Function Domain Codomain) (target : LRA.Set.SetClass Codomain) (input : Domain), preimage input ↔ function.PreimageClass target input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (preimage : Domain → Prop) (function : Domain → Codomain) (target : Codomain → Prop) (input : Domain), preimage input ↔ Exists fun y => (target y ∧ function input = y)

Logical form (Lean):

```lean
def IsPreimageClassOf {Domain : Type u} {Codomain : Type v}
    (preimage : SetClass Domain)
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  ∀ input, preimage input ↔ PreimageClass function target input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsPreimageClassOf {Domain : Type u} {Codomain : Type v}
    (preimage : SetClass Domain)
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  ∀ input, preimage input ↔ PreimageClass function target input

/--
`IsFiberClassOf` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (fiber : LRA.Set.SetClass Domain) (function : LRA.Function Domain Codomain) (output : Codomain) (input : Domain), fiber input ↔ function.FiberClass output input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (fiber : Domain → Prop) (function : Domain → Codomain) (output : Codomain) (input : Domain), fiber input ↔ function input = output

Logical form (Lean):

```lean
def IsFiberClassOf {Domain : Type u} {Codomain : Type v}
    (fiber : SetClass Domain)
    (function : LRA.Function Domain Codomain)
    (output : Codomain) : Prop :=
  ∀ input, fiber input ↔ FiberClass function output input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsFiberClassOf {Domain : Type u} {Codomain : Type v}
    (fiber : SetClass Domain)
    (function : LRA.Function Domain Codomain)
    (output : Codomain) : Prop :=
  ∀ input, fiber input ↔ FiberClass function output input

/--
`HasDomain` TODO

Predicate logic:

  class HasDomain (FunctionObject : Type u) (DomainObject : outParam (Type v)) where
  domain : FunctionObject → DomainObject

Predicate logic (unfolded):

  class HasDomain (FunctionObject : Type u) (DomainObject : outParam (Type v)) where
  domain : FunctionObject → DomainObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasDomain (FunctionObject : Type u) (DomainObject : outParam (Type v)) where
  domain : FunctionObject → DomainObject
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
class HasDomain (FunctionObject : Type u) (DomainObject : outParam (Type v)) where
  domain : FunctionObject → DomainObject

/--
`HasCodomain` TODO

Predicate logic:

  class HasCodomain (FunctionObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : FunctionObject → CodomainObject

Predicate logic (unfolded):

  class HasCodomain (FunctionObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : FunctionObject → CodomainObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasCodomain (FunctionObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : FunctionObject → CodomainObject
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
class HasCodomain (FunctionObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : FunctionObject → CodomainObject

/--
`DomainObjectOf` TODO

Predicate logic:

  def DomainObjectOf {FunctionObject : Type u} {DomainObject : Type v}
    [HasDomain FunctionObject DomainObject]
    (functionObject : FunctionObject) : DomainObject :=
  HasDomain.domain functionObject

Predicate logic (unfolded):

  def DomainObjectOf {FunctionObject : Type u} {DomainObject : Type v}
    [HasDomain FunctionObject DomainObject]
    (functionObject : FunctionObject) : DomainObject :=
  HasDomain.domain functionObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DomainObjectOf {FunctionObject : Type u} {DomainObject : Type v}
    [HasDomain FunctionObject DomainObject]
    (functionObject : FunctionObject) : DomainObject :=
  HasDomain.domain functionObject
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
def DomainObjectOf {FunctionObject : Type u} {DomainObject : Type v}
    [HasDomain FunctionObject DomainObject]
    (functionObject : FunctionObject) : DomainObject :=
  HasDomain.domain functionObject

/--
`CodomainObjectOf` TODO

Predicate logic:

  def CodomainObjectOf {FunctionObject : Type u} {CodomainObject : Type v}
    [HasCodomain FunctionObject CodomainObject]
    (functionObject : FunctionObject) : CodomainObject :=
  HasCodomain.codomain functionObject

Predicate logic (unfolded):

  def CodomainObjectOf {FunctionObject : Type u} {CodomainObject : Type v}
    [HasCodomain FunctionObject CodomainObject]
    (functionObject : FunctionObject) : CodomainObject :=
  HasCodomain.codomain functionObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CodomainObjectOf {FunctionObject : Type u} {CodomainObject : Type v}
    [HasCodomain FunctionObject CodomainObject]
    (functionObject : FunctionObject) : CodomainObject :=
  HasCodomain.codomain functionObject
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
def CodomainObjectOf {FunctionObject : Type u} {CodomainObject : Type v}
    [HasCodomain FunctionObject CodomainObject]
    (functionObject : FunctionObject) : CodomainObject :=
  HasCodomain.codomain functionObject

end LRA.Function
