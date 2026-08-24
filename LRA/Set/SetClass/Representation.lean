import LRA.Set.SetClass.Definition

namespace LRA.Set

universe u v

/--
`ClassOfSet` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setObject : SetObject) (a : Element), inst.1 setObject a

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setObject : SetObject) (a : Element), inst.1 setObject a

Logical form (Lean):

```lean
def ClassOfSet {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) : SetClass Element :=
  fun element => element ∈ setObject
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
def ClassOfSet {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) : SetClass Element :=
  fun element => element ∈ setObject

/--
`Represents` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setObject : SetObject) (setClass : LRA.Set.SetClass Element) (element : Element), element ∈ setObject ↔ setClass element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setObject : SetObject) (setClass : Element → Prop) (element : Element), inst.1 setObject element ↔ setClass element

Logical form (Lean):

```lean
def Represents {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) (setClass : SetClass Element) : Prop :=
  ∀ element, element ∈ setObject ↔ setClass element
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
def Represents {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) (setClass : SetClass Element) : Prop :=
  ∀ element, element ∈ setObject ↔ setClass element

/--
`Representable` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setClass : LRA.Set.SetClass Element), Exists fun setObject => LRA.Set.Represents setObject setClass

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setClass : Element → Prop), Exists fun setObject => ∀ (element : Element), inst.1 setObject element ↔ setClass element

Logical form (Lean):

```lean
def Representable {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ∃ setObject : SetObject, Represents setObject setClass
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def Representable {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ∃ setObject : SetObject, Represents setObject setClass

/--
`ProperClass` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setClass : LRA.Set.SetClass Element), LRA.Set.Representable setClass → False

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setClass : Element → Prop), (Exists fun setObject => ∀ (element : Element), inst.1 setObject element ↔ setClass element) → False

Logical form (Lean):

```lean
def ProperClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ¬ Representable (SetObject := SetObject) setClass
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
def ProperClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ¬ Representable (SetObject := SetObject) setClass

end LRA.Set
