import LRA.Set.SetClass.Definition
import LRA.Set.SetClass.Representation

namespace LRA.Set

universe u v

/--
`SetClassExtensionality` TODO

Predicate logic:

  ∀ {α : Type u} {left right : LRA.Set.SetClass α}, (∀ (element : α), left element ↔ right element) → left = right

Predicate logic (unfolded):

  Ambient
    (α)
  Objects
    left right : SetClass α
  Prove
    (∀ (element : α), left element ↔ right element) → left = right

Logical form (Lean):

```lean
theorem SetClassExtensionality {α : Type u} {left right : SetClass α}
    (sameMembers : ∀ element, left element ↔ right element) :
    left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SetClassExtensionality {α : Type u} {left right : SetClass α}
    (sameMembers : ∀ element, left element ↔ right element) :
    left = right := by
  sorry

/--
`SetRepresentsItsClass` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setObject : SetObject), LRA.Set.Represents setObject (LRA.Set.ClassOfSet setObject)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    setObject : SetObject
  Prove
    inst.1 setObject element ↔ inst.1 setObject element

Logical form (Lean):

```lean
theorem SetRepresentsItsClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) :
    Represents setObject (ClassOfSet setObject)
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
theorem SetRepresentsItsClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) :
    Represents setObject (ClassOfSet setObject) := by
  sorry

end LRA.Set
