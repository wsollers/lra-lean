import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u v

/--
`LexicographicRelation` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} (leftRelation : LRA.Relation.Endorelation Alpha) (rightRelation : LRA.Relation.Endorelation Beta) (a a_1 : Prod Alpha Beta), Or (leftRelation a.fst a_1.fst) ((a.fst = a_1.fst ∧ rightRelation a.snd a_1.snd))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (leftRelation : Alpha → Alpha → Prop) (rightRelation : Beta → Beta → Prop) (a a_1 : Prod Alpha Beta), Or (leftRelation a.1 a_1.1) ((a.1 = a_1.1 ∧ rightRelation a.2 a_1.2))

Logical form (Lean):

```lean
def LexicographicRelation
    {Alpha : Type u} {Beta : Type v}
    (leftRelation : LRA.Relation.Endorelation Alpha)
    (rightRelation : LRA.Relation.Endorelation Beta) :
    LRA.Relation.Endorelation (Alpha × Beta) :=
  fun first second =>
    leftRelation first.1 second.1 \/
      (first.1 = second.1 /\ rightRelation first.2 second.2)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def LexicographicRelation
    {Alpha : Type u} {Beta : Type v}
    (leftRelation : LRA.Relation.Endorelation Alpha)
    (rightRelation : LRA.Relation.Endorelation Beta) :
    LRA.Relation.Endorelation (Alpha × Beta) :=
  fun first second =>
    leftRelation first.1 second.1 \/
      (first.1 = second.1 /\ rightRelation first.2 second.2)

end LRA.Order
