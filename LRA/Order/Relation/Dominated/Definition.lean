import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`Dominated` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (dominated dominating : SetObject) (element : Element), element ∈ dominated → Exists fun other => (other ∈ dominating ∧ relation element other)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (dominated dominating : SetObject) (element : Element), inst.1 dominated element → Exists fun other => (inst.1 dominating other ∧ relation element other)

Logical form (Lean):

```lean
def Dominated
    (relation : LRA.Relation.Endorelation Element)
    (dominated dominating : SetObject) : Prop :=
  forall element, element ∈ dominated ->
    exists other, other ∈ dominating /\ relation element other
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def Dominated
    (relation : LRA.Relation.Endorelation Element)
    (dominated dominating : SetObject) : Prop :=
  forall element, element ∈ dominated ->
    exists other, other ∈ dominating /\ relation element other

end LRA.Order
