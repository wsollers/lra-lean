import LRA.Relation.Properties.Definition

namespace LRA.Relation

universe u v

/--
`WellFounded` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (Exists fun element => element) ∈ subset → Exists fun minimum => LRA.Relation.MinimalElement relation subset minimum

Predicate logic (unfolded):

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun minimum => (inst.1 subset minimum ∧ ∀ (element : Element), inst.1 subset element → relation element minimum → False)

Logical form (Lean):

```lean
def WellFounded {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : Endorelation Element) : Prop :=
  ∀ subset : SetObject,
    (∃ element, element ∈ subset) →
      ∃ minimum, MinimalElement relation subset minimum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def WellFounded {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : Endorelation Element) : Prop :=
  ∀ subset : SetObject,
    (∃ element, element ∈ subset) →
      ∃ minimum, MinimalElement relation subset minimum

end LRA.Relation
