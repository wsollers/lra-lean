namespace LRA.Set

universe u v

/--
`HasPairing` TODO

Predicate logic:

  class HasPairing (Left : Type u) (Right : Type u)
      (Pair : outParam (Type u)) where
    pair : Left → Right → Pair

Predicate logic (unfolded):

  class HasPairing (Left : Type u) (Right : Type u)
      (Pair : outParam (Type u)) where
    pair : Left → Right → Pair (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasPairing (Left : Type u) (Right : Type u)
    (Pair : outParam (Type u)) where
  pair : Left → Right → Pair
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
class HasPairing (Left : Type u) (Right : Type u)
    (Pair : outParam (Type u)) where
  pair : Left → Right → Pair

/--
`OrderedPair` TODO

Predicate logic:

  def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
      (first : Left) (second : Right) : Pair :=
    HasPairing.pair first second

Predicate logic (unfolded):

  def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
      (first : Left) (second : Right) : Pair :=
    HasPairing.pair first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
    (first : Left) (second : Right) : Pair :=
  HasPairing.pair first second
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
def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
    (first : Left) (second : Right) : Pair :=
  HasPairing.pair first second

instance instProdPairing {Left Right : Type u} :
    HasPairing Left Right (Left × Right) :=
  ⟨Prod.mk⟩

end LRA.Set
