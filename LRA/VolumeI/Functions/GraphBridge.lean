-- LRA/VolumeI/Functions/GraphBridge.lean
-- The round trip between type-level functions and their set-level graphs.

import LRA.VolumeI.Functions.Functions
import LRA.VolumeI.Set.Interface.RelationLaws

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-!
Volume I label: functions-graph-bridge
Lean module: LRA.VolumeI.Functions.GraphBridge
Verification status: definitions checked; round-trip theorems pending
(proving queue — each is `RelatesGraphSetOf` + `AppliedToUnique`
plumbing)

The bridge between the two ways this repo holds a function:

- **type-level** (`Functions/Functions.lean`): `map : Domain → Codomain`
  with its `Prop`-valued `Graph`;
- **set-level** (`Set/Interface/RelationSets.lean`): a functional
  relation-set, a citizen of a set backend.

Descending is `GraphSetOf` (reify the graph inside an ambient);
ascending is `MapOfFunctionalSet` below (apply the relation via
choice). The round-trip theorems say the two directions invert — up to
the ambient, which is the honest price of set-citizenship: a set-level
graph only knows the pairs the ambient provided.
-/

section GraphBridge

variable {Left Right Pair : Type u}
variable {RelationObject : Type v}

/-- **[Definition — MapOfFunctionalSet]**

Ascend from a relation-set to a type-level function: apply the
relation at each input, using a totality witness to choose the output.
On a single-valued relation the choice is forced (see
`GraphOfMapOfFunctionalSet`). Choice-backed, hence noncomputable.

Logical form:

```lean
noncomputable def MapOfFunctionalSet
    (relation : RelationObject)
    (total : ∀ input : Left, ∃ output : Right, Relates relation input output) :
    Left → Right :=
  fun input => AppliedTo relation input (total input)
```
-/
noncomputable def MapOfFunctionalSet
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject)
    (total : ∀ input : Left,
      ∃ output : Right, Relates relation input output) :
    Left → Right :=
  fun input => AppliedTo relation input (total input)

/-- **[Theorem — RelatesGraphSetOfIffGraph]**

Descending, membership-first: the reified graph relates `input` to
`output` exactly when the ambient contains the pair and the type-level
`Graph` holds. The `Prop`-graph and the set-graph say the same thing,
ambient permitting.

Logical form:

```lean
theorem RelatesGraphSetOfIffGraph
    (map : Left → Right) (ambientPairs : RelationObject)
    (input : Left) (output : Right) :
    Relates (GraphSetOf map ambientPairs) input output ↔
      (OrderedPair input output : Pair) ∈ ambientPairs ∧
        Graph map input output
```
-/
theorem RelatesGraphSetOfIffGraph
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject] [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject)
    (input : Left) (output : Right) :
    Relates (GraphSetOf map ambientPairs) input output ↔
      (OrderedPair input output : Pair) ∈ ambientPairs ∧
        Graph map input output := by
  sorry

/-- **[Theorem — GraphOfMapOfFunctionalSet]**

Ascending, then reading the graph: on a single-valued relation, the
extracted map's `Graph` holds exactly where the relation relates —
choice cannot invent or lose pairs when outputs are unique.

Logical form:

```lean
theorem GraphOfMapOfFunctionalSet
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (total : ∀ input : Left, ∃ output : Right, Relates relation input output)
    (input : Left) (output : Right) :
    Graph (MapOfFunctionalSet relation total) input output ↔
      Relates relation input output
```
-/
theorem GraphOfMapOfFunctionalSet
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (total : ∀ input : Left,
      ∃ output : Right, Relates relation input output)
    (input : Left) (output : Right) :
    Graph (MapOfFunctionalSet relation total) input output ↔
      Relates relation input output := by
  sorry

/-- **[Theorem — MapOfGraphSetOfAgrees]**

The full round trip, descending then ascending: wherever the ambient
actually contains the function's pair, the extracted map agrees with
the original — reification then application is the identity, ambient
permitting.

Logical form:

```lean
theorem MapOfGraphSetOfAgrees
    (map : Left → Right) (ambientPairs : RelationObject)
    (total : ∀ input : Left, ∃ output : Right,
      Relates (GraphSetOf map ambientPairs) input output)
    (input : Left)
    (ambientHasPair :
      (OrderedPair input (map input) : Pair) ∈ ambientPairs) :
    MapOfFunctionalSet (GraphSetOf map ambientPairs) total input =
      map input
```
-/
theorem MapOfGraphSetOfAgrees
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject] [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject)
    (total : ∀ input : Left, ∃ output : Right,
      Relates (GraphSetOf map ambientPairs) input output)
    (input : Left)
    (ambientHasPair :
      (OrderedPair input (map input) : Pair) ∈ ambientPairs) :
    MapOfFunctionalSet (GraphSetOf map ambientPairs) total input =
      map input := by
  sorry

/-- **[Theorem — GraphSetOfMapOfFunctionalSetEquals]**

The full round trip, ascending then descending: a functional
relation-set that lies inside the ambient is recovered exactly by
reifying its extracted map — set-level extensionality closes the loop.

Logical form:

```lean
theorem GraphSetOfMapOfFunctionalSetEquals
    (relation : RelationObject)
    (functional : IsFunctionalSet Left Right relation)
    (total : ∀ input : Left, ∃ output : Right, Relates relation input output)
    (insideAmbient : relation ⊆ ambientPairs)
    (ambientPairwise : IsPairwise Left Right ambientPairs) :
    GraphSetOf (MapOfFunctionalSet relation total) ambientPairs =
      relation
```
-/
theorem GraphSetOfMapOfFunctionalSetEquals
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject] [PairingLaws Left Right Pair]
    [HasSubset RelationObject]
    [ExtensionalityLaw Pair RelationObject]
    (relation ambientPairs : RelationObject)
    (functional : IsFunctionalSet Left Right relation)
    (total : ∀ input : Left,
      ∃ output : Right, Relates relation input output)
    (insideAmbient : relation ⊆ ambientPairs)
    (ambientPairwise : IsPairwise Left Right ambientPairs) :
    GraphSetOf (MapOfFunctionalSet relation total) ambientPairs =
      relation := by
  sorry

/-- **[Theorem — DomainOfGraphSetOfMatchesDomainOfGraph]**

The two domain constructions agree: the set-level domain of the
reified graph is the `Prop`-level `DomainOfGraph` — when the ambient
pairs cover the function over the ambient domain, both carve the same
inputs.

Logical form:

```lean
theorem DomainOfGraphSetOfMatchesDomainOfGraph
    (map : Left → Right) (ambientPairs : RelationObject)
    (ambientDomain : DomainObject)
    (covers : ∀ input : Left, input ∈ ambientDomain →
      (OrderedPair input (map input) : Pair) ∈ ambientPairs) :
    DomainOf Right (GraphSetOf map ambientPairs) ambientDomain =
      DomainOfGraph ambientDomain (Graph map)
```
-/
theorem DomainOfGraphSetOfMatchesDomainOfGraph
    {DomainObject : Type v}
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject] [PairingLaws Left Right Pair]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    [ExtensionalityLaw Left DomainObject]
    (map : Left → Right) (ambientPairs : RelationObject)
    (ambientDomain : DomainObject)
    (covers : ∀ input : Left, input ∈ ambientDomain →
      (OrderedPair input (map input) : Pair) ∈ ambientPairs) :
    DomainOf Right (GraphSetOf map ambientPairs) ambientDomain =
      DomainOfGraph ambientDomain (Graph map) := by
  sorry

end GraphBridge

end LRA.VolumeI.Functions
