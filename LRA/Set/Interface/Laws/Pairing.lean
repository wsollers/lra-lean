import LRA.Set.Interface.Definitions.Pairing

namespace LRA.Set

universe u v

class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight

theorem PairInjective {Left Right Pair : Type u}
    [HasPairing Left Right Pair] [PairingLaws Left Right Pair] :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight :=
  PairingLaws.PairInjective

instance instProdPairingLaws {Left Right : Type u} :
    PairingLaws Left Right (Left × Right) where
  PairInjective := fun firstLeft secondLeft firstRight secondRight => by
    simp [OrderedPair, HasPairing.pair]

end LRA.Set
