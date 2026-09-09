import LRA.Set.Interface.Definitions.Pairing

namespace LRA.Set

universe u v

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

  ∀ {Left Right Pair : Type u} [inst : LRA.Set.HasPairing Left Right Pair], LRA.Set.PairingLaws Left Right Pair → ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right), LRA.Set.OrderedPair firstLeft firstRight = LRA.Set.OrderedPair secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair)
  Objects
    (none)
  Prove
    LRA.Set.PairingLaws Left Right Pair → ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right), LRA.Set.OrderedPair firstLeft firstRight = LRA.Set.OrderedPair secondLeft secondRight ↔ (firstLeft = secondLeft ∧ firstRight = secondRight)

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
        firstLeft = secondLeft ∧ firstRight = secondRight :=
  sorry

instance instProdPairingLaws {Left Right : Type u} :
    PairingLaws Left Right (Left × Right) where
  PairInjective := by
    sorry

end LRA.Set


