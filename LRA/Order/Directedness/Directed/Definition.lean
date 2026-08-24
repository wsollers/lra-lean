import LRA.Relation.Definition

namespace LRA.Order

universe u v

/--
`Directed` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (Exists fun element => element ∈ subset ∧ ∀ (first second : Element), first ∈ subset → second ∈ subset → Exists fun upper => (upper ∈ subset ∧ (relation first upper ∧ relation second upper)))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject), (Exists fun element => inst.1 subset element ∧ ∀ (first second : Element), inst.1 subset first → inst.1 subset second → Exists fun upper => (inst.1 subset upper ∧ (relation first upper ∧ relation second upper)))

Logical form (Lean):

```lean
def Directed
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper
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
def Directed
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper

end LRA.Order
