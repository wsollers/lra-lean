
import LRA.Set.Interface.Definitions.Pairing
import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set

universe u v

section CartesianProduct

variable {Left Right Pair : Type u}
variable {DomainObject RangeObject RelationObject : Type v}

/--
`CartesianProductOf` TODO

Predicate logic:

  def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right)

Predicate logic (unfolded):

  def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right)
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
def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right)

end CartesianProduct

end LRA.Set
