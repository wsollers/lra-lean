import LRA.Set.Interface.Definitions.Operations
import LRA.SetSystems.Closure

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]

/--
`RingOfSets` TODO

Predicate logic:

  structure RingOfSets (ambient : SetObject) where
  IsMember : SetObject → Prop
  MembersAreSubsets : ∀ A, IsMember A → A ⊆ ambient
  EmptyIsMember : IsMember (∅ : SetObject)
  UnionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∪ B)
  IntersectionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∩ B)
  DifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A \ B)
  SymmetricDifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∆ B)

Predicate logic (unfolded):

  structure RingOfSets (ambient : SetObject) where
  IsMember : SetObject → Prop
  MembersAreSubsets : ∀ A, IsMember A → A ⊆ ambient
  EmptyIsMember : IsMember (∅ : SetObject)
  UnionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∪ B)
  IntersectionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∩ B)
  DifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A \ B)
  SymmetricDifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∆ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RingOfSets (ambient : SetObject) where
  IsMember : SetObject → Prop
  MembersAreSubsets : ∀ A, IsMember A → A ⊆ ambient
  EmptyIsMember : IsMember (∅ : SetObject)
  UnionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∪ B)
  IntersectionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∩ B)
  DifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A \ B)
  SymmetricDifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∆ B)
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
structure RingOfSets (ambient : SetObject) where
  IsMember : SetObject → Prop
  MembersAreSubsets : ∀ A, IsMember A → A ⊆ ambient
  EmptyIsMember : IsMember (∅ : SetObject)
  UnionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∪ B)
  IntersectionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∩ B)
  DifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A \ B)
  SymmetricDifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∆ B)

end LRA.SetSystems
