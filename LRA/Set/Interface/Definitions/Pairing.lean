namespace LRA.Set

universe u v

class HasPairing (Left : Type u) (Right : Type u)
    (Pair : outParam (Type u)) where
  pair : Left → Right → Pair

def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
    (first : Left) (second : Right) : Pair :=
  HasPairing.pair first second

instance instProdPairing {Left Right : Type u} :
    HasPairing Left Right (Left × Right) :=
  ⟨Prod.mk⟩

end LRA.Set
