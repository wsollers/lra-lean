import LRA.Order.Morphisms.Antitone.Definition
import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v w

/--
`Antitone.comp_antitone_is_monotone` TODO

Predicate logic:

  Monotone sourceRelation targetRelation (fun input => second (first input))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {sourceRelation : Alpha → Alpha → Prop} {middleRelation : Beta → Beta → Prop} {targetRelation : Gamma → Gamma → Prop} {first : Alpha → Beta} {second : Beta → Gamma}, (∀ (left right : Alpha), sourceRelation left right → middleRelation (first right) (first left) ∧ ∀ (left right : Beta), middleRelation left right → targetRelation (second right) (second left)) → ∀ (left right : Alpha), sourceRelation left right → targetRelation ((fun input => second (first input)) left) ((fun input => second (first input)) right)

Logical form (Lean):

```lean
theorem Antitone.comp_antitone_is_monotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {first : Alpha -> Beta}
    {second : Beta -> Gamma}
    (firstAntitone : Antitone sourceRelation middleRelation first)
    (secondAntitone : Antitone middleRelation targetRelation second) :
    Monotone sourceRelation targetRelation
      (fun input => second (first input))
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
theorem Antitone.comp_antitone_is_monotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {first : Alpha -> Beta}
    {second : Beta -> Gamma}
    (firstAntitone : Antitone sourceRelation middleRelation first)
    (secondAntitone : Antitone middleRelation targetRelation second) :
    Monotone sourceRelation targetRelation
      (fun input => second (first input)) := by
  sorry
end LRA.Order
