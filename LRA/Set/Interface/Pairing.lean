
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

/--
`PairingLaws` TODO

Predicate logic:

  class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight

Predicate logic (unfolded):

  class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight

/--
`PairInjective` TODO

Predicate logic:

  ∀ firstLeft secondLeft ∈ Left firstRight secondRight ∈ Right, OrderedPair firstLeft firstRight = OrderedPair secondLeft secondRight ↔ firstLeft = secondLeft ∧ firstRight = secondRight

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} [inst : LRA.Set.HasPairing Left Right Pair], LRA.Set.PairingLaws Left Right Pair → ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right), inst.1 firstLeft firstRight = inst.1 secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

Logical form (Lean):

```lean
theorem PairInjective {Left Right Pair : Type u}
    [HasPairing Left Right Pair] [PairingLaws Left Right Pair] :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem PairInjective {Left Right Pair : Type u}
    [HasPairing Left Right Pair] [PairingLaws Left Right Pair] :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

instance instProdPairing {Left Right : Type u} :
    HasPairing Left Right (Left × Right) :=
  ⟨Prod.mk⟩

instance instProdPairingLaws {Left Right : Type u} :
    PairingLaws Left Right (Left × Right) where
  PairInjective := fun firstLeft secondLeft firstRight secondRight => by
    simp [OrderedPair, HasPairing.pair]

end LRA.Set
