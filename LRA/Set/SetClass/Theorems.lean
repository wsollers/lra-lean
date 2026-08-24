import LRA.Set.SetClass.Definition
import LRA.Set.SetClass.Representation

namespace LRA.Set

universe u v

/--
`SetClassExtensionality` TODO

Predicate logic:

  (∀ element, left element ↔ right element) → left = right

Predicate logic (unfolded):

  ∀ {α : Type u} {left right : α → Prop}, (∀ (element : α), left element ↔ right element) → left = right

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

  (∀ A ∈ U), Represents A (ClassOfSet A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (setObject : SetObject) (element : Element), inst.1 setObject element ↔ inst.1 setObject element

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
