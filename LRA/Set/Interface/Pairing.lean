-- LRA/VolumeI/Set/Interface/Pairing.lean
-- The ordered-pair capability: the one new primitive behind relations-as-sets.

namespace LRA.Set

universe u v

/-!
Volume I label: set-interface-pairing
Lean module: LRA.Set.Interface.Pairing
Verification status: checked interface module (default instance proved)

The ordered pair is the single new primitive that turns sets into a
home for relations and functions: once `⟨a, b⟩` exists, a relation is
just a set of pairs, and the entire existing set interface — `∈`, `∪`,
`∩`, `⊆`, separation — applies to relations *because they are sets*.

The two backend families build the pair differently, and the
capability class absorbs exactly that difference:

- **Single-sorted backends** (Enderton, `ZFSet`) build the pair inside
  the universe: the Kuratowski pair `⟨a, b⟩ = {{a}, {a, b}}` is itself
  a set, registered at high priority in the backend files.
- **Typed backends** (`LRASet`, Mathlib `Set`) build the pair in the
  type theory: `⟨a, b⟩ = (a, b) : Left × Right`, the default instance
  below — this is exactly Mathlib's own `SetRel α β := Set (α × β)`
  design.

The stable API above never looks inside a pair; it speaks only through
`OrderedPair` and the injectivity law. What a pair's *members* are
(`{a} ∈ ⟨a, b⟩` is meaningful for Kuratowski, meaningless for `Prod`)
is backend-private.
-/

/-- **[Operation class — HasPairing]**

The ordered-pair machine: a backend registers how to form `⟨a, b⟩`.
`Pair` is an `outParam`, resolved from the coordinate sorts.

Logical form:

```lean
class HasPairing (Left : Type u) (Right : Type u)
    (Pair : outParam (Type u)) where
  pair : Left → Right → Pair
```
-/
class HasPairing (Left : Type u) (Right : Type u)
    (Pair : outParam (Type u)) where
  pair : Left → Right → Pair

/-- **[Definition — OrderedPair]**

The ordered pair `⟨a, b⟩`, resolved from the coordinate types.

Logical form:

```lean
def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
    (first : Left) (second : Right) : Pair :=
  HasPairing.pair first second
```
-/
def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
    (first : Left) (second : Right) : Pair :=
  HasPairing.pair first second

/-- **[Certificate class — PairingLaws]**

The single law an ordered pair must satisfy — Enderton's Theorem 3A:
pairs are equal exactly when their coordinates are. Everything a pair
is *for* follows from this.

Logical form:

```lean
class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight
```
-/
class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight

/-- **[Theorem — PairInjective]**

Two ordered pairs are equal exactly when their coordinates are.

Logical form:

```lean
theorem PairInjective {Left Right Pair : Type u}
    [HasPairing Left Right Pair] [PairingLaws Left Right Pair] :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight
```
-/
theorem PairInjective {Left Right Pair : Type u}
    [HasPairing Left Right Pair] [PairingLaws Left Right Pair] :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight :=
  PairingLaws.PairInjective

/-! ## The default pairing: type-level products

Every typed backend (`LRASet Alpha`, Mathlib `Set α`) pairs through the
product type — this is one global instance, at default priority so the
single-sorted backends' internal pairs (registered at high priority)
win on their own carriers. Proved outright: `Prod` injectivity is a
core fact, so this is the Mathlib-side of the bridge. -/

/-- **[Instance — product pairing]**

Logical form:

```lean
instance instProdPairing {Left Right : Type u} :
    HasPairing Left Right (Left × Right) :=
  ⟨Prod.mk⟩
```
-/
instance instProdPairing {Left Right : Type u} :
    HasPairing Left Right (Left × Right) :=
  ⟨Prod.mk⟩

/-- **[Instance — product pairing laws]** (proved: core `Prod`
injectivity).

Logical form:

```lean
instance instProdPairingLaws {Left Right : Type u} :
    PairingLaws Left Right (Left × Right)
```
-/
instance instProdPairingLaws {Left Right : Type u} :
    PairingLaws Left Right (Left × Right) where
  PairInjective := fun firstLeft secondLeft firstRight secondRight => by
    simp [OrderedPair, HasPairing.pair]

end LRA.Set
