-- LRA/Set/Interface/RelationLaws.lean
-- The theorem surface for relations-as-sets. Statements here; proofs are
-- the learner's.

import LRA.Set.Interface.RelationSets
import LRA.Set.Interface.Membership

namespace LRA.Set

universe u v

/-!
Volume I label: set-interface-relation-laws
Lean module: LRA.Set.Interface.RelationLaws
Verification status: statements accepted; proofs pending (each is a
short argument from `SeparationMembership` + `PairInjective` + the
membership laws)

The payoff layer: because relations ARE sets, the membership laws of
the set interface specialize to relation vocabulary — `Relates` walks
through `∪`/`∩`/`\` — and each ambient-relative construction has a
membership characterization by one application of
`SeparationMembership`, with `PairInjective` untangling the pair
equations. Every theorem below holds simultaneously for all four
backends the moment its brackets are satisfied.

Proof recipe (the same three moves each time): unfold the definition,
apply `SeparationMembership`, and if a pair equation appears, split it
with `PairInjective`.
-/

section RelationLaws

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}

/-- **[Theorem — RelatesUnion]**

A pair is in a union of relations exactly when it is in one of them —
the union of two functions/relations, spoken fluently. Specializes
`UnionMembership` to the pair sort.

Logical form:

```lean
theorem RelatesUnion
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∪ second) input output ↔
      Relates first input output ∨ Relates second input output
```
-/
theorem RelatesUnion
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∪ second) input output ↔
      Relates first input output ∨ Relates second input output := by
  sorry

/-- **[Theorem — RelatesIntersection]**

A pair is in an intersection of relations exactly when it is in both.

Logical form:

```lean
theorem RelatesIntersection
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∩ second) input output ↔
      Relates first input output ∧ Relates second input output
```
-/
theorem RelatesIntersection
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∩ second) input output ↔
      Relates first input output ∧ Relates second input output := by
  sorry

/-- **[Theorem — MemberOfDomainOf]**

Membership in the carved domain: an input is in `DomainOf` exactly
when it is in the ambient and relates to some output.

Logical form:

```lean
theorem MemberOfDomainOf
    (relation : RelationObject) (ambientDomain : DomainObject)
    (input : Left) :
    input ∈ DomainOf Right relation ambientDomain ↔
      input ∈ ambientDomain ∧ ∃ output : Right, Relates relation input output
```
-/
theorem MemberOfDomainOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject)
    (input : Left) :
    input ∈ DomainOf Right relation ambientDomain ↔
      input ∈ ambientDomain ∧
        ∃ output : Right, Relates relation input output := by
  sorry

/-- **[Theorem — MemberOfRangeOf]**

Membership in the carved range.

Logical form:

```lean
theorem MemberOfRangeOf
    (relation : RelationObject) (ambientRange : RangeObject)
    (output : Right) :
    output ∈ RangeOf Left relation ambientRange ↔
      output ∈ ambientRange ∧ ∃ input : Left, Relates relation input output
```
-/
theorem MemberOfRangeOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Right RangeObject]
    [SeparationLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject)
    (output : Right) :
    output ∈ RangeOf Left relation ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, Relates relation input output := by
  sorry

/-- **[Theorem — MemberOfImageOf]**

Membership in the image of a set of inputs.

Logical form:

```lean
theorem MemberOfImageOf
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) (output : Right) :
    output ∈ ImageOf relation inputs ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, input ∈ inputs ∧ Relates relation input output
```
-/
theorem MemberOfImageOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [Membership Right RangeObject] [HasSeparation Right RangeObject]
    [SeparationLaws Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) (output : Right) :
    output ∈ ImageOf relation inputs ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, input ∈ inputs ∧ Relates relation input output := by
  sorry

/-- **[Theorem — MemberOfPreimageOf]**

Membership in the preimage of a set of outputs.

Logical form:

```lean
theorem MemberOfPreimageOf
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ PreimageOf relation outputs ambientDomain ↔
      input ∈ ambientDomain ∧
        ∃ output : Right, output ∈ outputs ∧ Relates relation input output
```
-/
theorem MemberOfPreimageOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ PreimageOf relation outputs ambientDomain ↔
      input ∈ ambientDomain ∧
        ∃ output : Right, output ∈ outputs ∧
          Relates relation input output := by
  sorry

/-- **[Theorem — MemberOfFiberOf]**

Membership in a fiber: exactly the ambient inputs sent to the given
output.

Logical form:

```lean
theorem MemberOfFiberOf
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ FiberOf relation output ambientDomain ↔
      input ∈ ambientDomain ∧ Relates relation input output
```
-/
theorem MemberOfFiberOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ FiberOf relation output ambientDomain ↔
      input ∈ ambientDomain ∧ Relates relation input output := by
  sorry

/-- **[Theorem — RelatesInverseOf]**

The inverse relates backwards: `⟨output, input⟩` is in the inverse
exactly when the reversed pair is in the ambient and the relation
relates forwards. `PairInjective` (for the reversed pair sort) is what
collapses the existential.

Logical form:

```lean
theorem RelatesInverseOf
    (relation : RelationObject) (ambientReversed : ReversedObject)
    (input : Left) (output : Right) :
    Relates (InverseOf Left Right relation ambientReversed) output input ↔
      OrderedPair output input ∈ ambientReversed ∧
        Relates relation input output
```
-/
theorem RelatesInverseOf {ReversedPair : Type u}
    {ReversedObject : Type v}
    [HasPairing Left Right Pair] [HasPairing Right Left ReversedPair]
    [Membership Pair RelationObject]
    [Membership ReversedPair ReversedObject]
    [HasSeparation ReversedPair ReversedObject]
    [SeparationLaws ReversedPair ReversedObject]
    [PairingLaws Right Left ReversedPair]
    (relation : RelationObject) (ambientReversed : ReversedObject)
    (input : Left) (output : Right) :
    Relates (InverseOf Left Right relation ambientReversed)
        output input ↔
      (OrderedPair output input : ReversedPair) ∈ ambientReversed ∧
        Relates relation input output := by
  sorry

/-- **[Theorem — RelatesRestrictionOf]**

The restriction relates exactly the pairs of the relation whose input
lies in the restricting set.

Logical form:

```lean
theorem RelatesRestrictionOf
    (relation : RelationObject) (inputs : DomainObject)
    (input : Left) (output : Right) :
    Relates (RestrictionOf Right relation inputs) input output ↔
      Relates relation input output ∧ input ∈ inputs
```
-/
theorem RelatesRestrictionOf
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Membership Left DomainObject]
    [PairingLaws Left Right Pair]
    (relation : RelationObject) (inputs : DomainObject)
    (input : Left) (output : Right) :
    Relates (RestrictionOf Right relation inputs) input output ↔
      Relates relation input output ∧ input ∈ inputs := by
  sorry

/-- **[Theorem — RestrictionIsSubset]**

A restriction is a subset of the relation — restriction shrinks,
extension grows, and both live on the same `⊆` order.

Logical form:

```lean
theorem RestrictionIsSubset
    (relation : RelationObject) (inputs : DomainObject) :
    RestrictionOf Right relation inputs ⊆ relation
```
-/
theorem RestrictionIsSubset
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RestrictionOf Right relation inputs ⊆ relation := by
  sorry

/-- **[Theorem — RestrictionOfFunctionalIsFunctional]**

Restricting a function is still a function — single-valuedness only
loses pairs.

Logical form:

```lean
theorem RestrictionOfFunctionalIsFunctional
    (relation : RelationObject) (inputs : DomainObject)
    (functional : IsFunctionalSet Left Right relation) :
    IsFunctionalSet Left Right (RestrictionOf Right relation inputs)
```
-/
theorem RestrictionOfFunctionalIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Membership Left DomainObject]
    [PairingLaws Left Right Pair]
    (relation : RelationObject) (inputs : DomainObject)
    (functional : IsFunctionalSet Left Right relation) :
    IsFunctionalSet Left Right (RestrictionOf Right relation inputs) := by
  sorry

/-- **[Theorem — UnionOfCompatibleFunctionalIsFunctional]**

The gluing theorem — the reason functions-as-sets earn their keep:
the union of two functions is a function exactly when they agree
wherever both are defined. `x ∈ f ∪ g`, doing real work.

Logical form:

```lean
theorem UnionOfCompatibleFunctionalIsFunctional
    (first second : RelationObject)
    (firstFunctional : IsFunctionalSet Left Right first)
    (secondFunctional : IsFunctionalSet Left Right second)
    (compatible : ∀ (input : Left) (firstOutput secondOutput : Right),
      Relates first input firstOutput →
      Relates second input secondOutput →
      firstOutput = secondOutput) :
    IsFunctionalSet Left Right (first ∪ second)
```
-/
theorem UnionOfCompatibleFunctionalIsFunctional
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject)
    (firstFunctional : IsFunctionalSet Left Right first)
    (secondFunctional : IsFunctionalSet Left Right second)
    (compatible : ∀ (input : Left) (firstOutput secondOutput : Right),
      Relates first input firstOutput →
      Relates second input secondOutput →
      firstOutput = secondOutput) :
    IsFunctionalSet Left Right (first ∪ second) := by
  sorry

/-- **[Theorem — RelatesGraphSetOf]**

The reified graph relates exactly along the function — the round trip
between the type-level function and its set-level graph.

Logical form:

```lean
theorem RelatesGraphSetOf
    (map : Left → Right) (ambientPairs : RelationObject)
    (input : Left) (output : Right) :
    Relates (GraphSetOf map ambientPairs) input output ↔
      OrderedPair input output ∈ ambientPairs ∧ map input = output
```
-/
theorem RelatesGraphSetOf
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject)
    (input : Left) (output : Right) :
    Relates (GraphSetOf map ambientPairs) input output ↔
      (OrderedPair input output : Pair) ∈ ambientPairs ∧
        map input = output := by
  sorry

/-- **[Theorem — GraphSetOfIsFunctional]**

A reified graph is a functional set: it is pairwise by construction
and single-valued because the function is.

Logical form:

```lean
theorem GraphSetOfIsFunctional
    (map : Left → Right) (ambientPairs : RelationObject) :
    IsFunctionalSet Left Right (GraphSetOf map ambientPairs)
```
-/
theorem GraphSetOfIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject) :
    IsFunctionalSet Left Right (GraphSetOf map ambientPairs) := by
  sorry

/-- **[Theorem — AppliedToUnique]**

On a single-valued relation, application is the unique related output
— any witnessed output IS the applied value.

Logical form:

```lean
theorem AppliedToUnique
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (input : Left) (output : Right)
    (relates : Relates relation input output)
    (hits : ∃ someOutput : Right, Relates relation input someOutput) :
    AppliedTo relation input hits = output
```
-/
theorem AppliedToUnique
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (input : Left) (output : Right)
    (relates : Relates relation input output)
    (hits : ∃ someOutput : Right, Relates relation input someOutput) :
    AppliedTo relation input hits = output := by
  sorry

/-!
## Image and preimage algebra

These laws are **relation-general**: functionality appears nowhere in their
statements, and each is true of an arbitrary relation. They were previously
stated only at the function level, over `Graph f`, in `LRA/VolumeI/Map/`; that
made them recognizable restatements of results belonging here, so §7.1.2
relocates them to the level at which they actually hold.

The laws that are *not* here are exactly the ones that fail for a general
relation: preimage of an intersection, difference, complement, or symmetric
difference all need single-valuedness, and preimage of the ambient needs
totality, because `PreimageOf` is existential. Those stay at the function
level, stated through `Graph`.
-/

section ImageAlgebra

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}
variable [HasPairing Left Right Pair] [Membership Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [HasSeparation Right RangeObject] [SeparationLaws Right RangeObject]
variable [ExtensionalityLaw Right RangeObject]

/-- The image of a union is the union of the images. -/
theorem ImageOfUnion
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∪ right) ambientRange =
      ImageOf relation left ambientRange ∪ ImageOf relation right ambientRange := by
  sorry

/-- The image of the empty set of inputs is empty. -/
theorem ImageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    ImageOf relation (∅ : DomainObject) ambientRange = (∅ : RangeObject) := by
  sorry

/-- Image is monotone in the set of inputs. -/
theorem ImageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : DomainObject)
    (ambientRange : RangeObject) (inclusion : smaller ⊆ larger) :
    ImageOf relation smaller ambientRange ⊆ ImageOf relation larger ambientRange := by
  sorry

/-- The image of an intersection is contained in the intersection of the images.
Equality needs left-uniqueness of the relation, so only this direction is general. -/
theorem ImageOfIntersectionSubset
    [Inter DomainObject] [Inter RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∩ right) ambientRange ⊆
      ImageOf relation left ambientRange ∩ ImageOf relation right ambientRange := by
  sorry

/-- The difference of images is contained in the image of the difference. -/
theorem DifferenceOfImagesSubsetImageOfDifference
    [SDiff DomainObject] [SDiff RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation left ambientRange \ ImageOf relation right ambientRange ⊆
      ImageOf relation (left \ right) ambientRange := by
  sorry

/-- The image of an indexed union is the indexed union of the images. -/
theorem ImageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedUnion.indexedUnion family) ambientRange =
      HasIndexedUnion.indexedUnion
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/-- The image of an indexed intersection is contained in the indexed
intersection of the images. -/
theorem ImageOfIndexedIntersectionSubset {Index : Type u}
    [HasIndexedIntersection DomainObject] [HasIndexedIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedIntersection.indexedIntersection family) ambientRange ⊆
      HasIndexedIntersection.indexedIntersection
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/-- The image of a countable union is the countable union of the images. -/
theorem ImageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableUnion.countableUnion family) ambientRange =
      HasCountableUnion.countableUnion
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/-- The image of a countable intersection is contained in the countable
intersection of the images. -/
theorem ImageOfCountableIntersectionSubset
    [HasCountableIntersection DomainObject] [HasCountableIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableIntersection.countableIntersection family) ambientRange ⊆
      HasCountableIntersection.countableIntersection
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/-- Relations relating the same pairs have the same images. -/
theorem ImageOfCongrRelation
    (first second : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    ImageOf first inputs ambientRange = ImageOf second inputs ambientRange := by
  sorry

/-- Equal sets of inputs have equal images. -/
theorem ImageOfCongrInputs
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject)
    (sameInputs : ∀ input : Left, input ∈ left ↔ input ∈ right) :
    ImageOf relation left ambientRange = ImageOf relation right ambientRange := by
  sorry

end ImageAlgebra

section PreimageAlgebra

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}
variable [HasPairing Left Right Pair] [Membership Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [HasSeparation Left DomainObject] [SeparationLaws Left DomainObject]
variable [ExtensionalityLaw Left DomainObject]

/-- The preimage of a union is the union of the preimages. -/
theorem PreimageOfUnion
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (left right : RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (left ∪ right) ambientDomain =
      PreimageOf relation left ambientDomain ∪
        PreimageOf relation right ambientDomain := by
  sorry

/-- The preimage of the empty set of outputs is empty. -/
theorem PreimageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    PreimageOf relation (∅ : RangeObject) ambientDomain = (∅ : DomainObject) := by
  sorry

/-- Preimage is monotone in the set of outputs. -/
theorem PreimageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf relation smaller ambientDomain ⊆
      PreimageOf relation larger ambientDomain := by
  sorry

/-- A preimage is contained in the ambient domain it was separated from. -/
theorem PreimageOfSubsetAmbient [HasSubset DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation outputs ambientDomain ⊆ ambientDomain := by
  sorry

/-- The preimage of an indexed union is the indexed union of the preimages. -/
theorem PreimageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasIndexedUnion.indexedUnion family) ambientDomain =
      HasIndexedUnion.indexedUnion
        (fun index => PreimageOf relation (family index) ambientDomain) := by
  sorry

/-- The preimage of a countable union is the countable union of the preimages. -/
theorem PreimageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasCountableUnion.countableUnion family) ambientDomain =
      HasCountableUnion.countableUnion
        (fun index => PreimageOf relation (family index) ambientDomain) := by
  sorry

/-- Relations relating the same pairs have the same preimages. -/
theorem PreimageOfCongrRelation
    (first second : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    PreimageOf first outputs ambientDomain =
      PreimageOf second outputs ambientDomain := by
  sorry

/-- Equal sets of outputs have equal preimages. -/
theorem PreimageOfCongrOutputs
    (relation : RelationObject) (left right : RangeObject)
    (ambientDomain : DomainObject)
    (sameOutputs : ∀ output : Right, output ∈ left ↔ output ∈ right) :
    PreimageOf relation left ambientDomain =
      PreimageOf relation right ambientDomain := by
  sorry

end PreimageAlgebra

section CompositionAndIdentity

/-- The image under a composite relation is the image of the image. -/
theorem ImageOfCompositionOf
    {Left Mid Right : Type u} {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    {DomainObject MidObject RangeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject] [Membership SecondPair SecondObject]
    [Membership CompositePair CompositeObject]
    [Membership Left DomainObject] [Membership Mid MidObject]
    [Membership Right RangeObject]
    [HasSeparation Mid MidObject] [HasSeparation Right RangeObject]
    [ExtensionalityLaw Right RangeObject]
    (first : FirstObject) (second : SecondObject) (composite : CompositeObject)
    (inputs : DomainObject) (ambientMid : MidObject) (ambientRange : RangeObject)
    (isComposite : ∀ (input : Left) (output : Right),
      Relates composite input output ↔
        ∃ middle : Mid, Relates first input middle ∧ Relates second middle output) :
    ImageOf composite inputs ambientRange =
      ImageOf second (ImageOf first inputs ambientMid) ambientRange := by
  sorry

/-- The preimage under a composite relation is the preimage of the preimage. -/
theorem PreimageOfCompositionOf
    {Left Mid Right : Type u} {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    {DomainObject MidObject RangeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject] [Membership SecondPair SecondObject]
    [Membership CompositePair CompositeObject]
    [Membership Left DomainObject] [Membership Mid MidObject]
    [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [HasSeparation Mid MidObject]
    [ExtensionalityLaw Left DomainObject]
    (first : FirstObject) (second : SecondObject) (composite : CompositeObject)
    (outputs : RangeObject) (ambientDomain : DomainObject) (ambientMid : MidObject)
    (isComposite : ∀ (input : Left) (output : Right),
      Relates composite input output ↔
        ∃ middle : Mid, Relates first input middle ∧ Relates second middle output) :
    PreimageOf composite outputs ambientDomain =
      PreimageOf first (PreimageOf second outputs ambientMid) ambientDomain := by
  sorry

/-- The preimage under a composite relation is monotone in the set of outputs. -/
theorem PreimageOfCompositionMonotone
    {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [HasSubset DomainObject] [HasSubset RangeObject]
    (composite : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf composite smaller ambientDomain ⊆
      PreimageOf composite larger ambientDomain := by
  sorry

/-- The image under an identity relation is the set of inputs itself. -/
theorem ImageOfIdentityOn
    {Left Pair : Type u} {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (identity : RelationObject) (inputs ambientDomain : DomainObject)
    (isIdentity : ∀ leftElement rightElement : Left,
      Relates identity leftElement rightElement ↔ leftElement = rightElement)
    (inputsInAmbient : ∀ input : Left, input ∈ inputs → input ∈ ambientDomain) :
    ImageOf identity inputs ambientDomain = inputs := by
  sorry

/-- The preimage under an identity relation is the set of outputs itself. -/
theorem PreimageOfIdentityOn
    {Left Pair : Type u} {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (identity : RelationObject) (outputs ambientDomain : DomainObject)
    (isIdentity : ∀ leftElement rightElement : Left,
      Relates identity leftElement rightElement ↔ leftElement = rightElement)
    (outputsInAmbient : ∀ output : Left, output ∈ outputs → output ∈ ambientDomain) :
    PreimageOf identity outputs ambientDomain = outputs := by
  sorry

/-- The preimage of a singleton-like set of outputs is the fiber over it. -/
theorem PreimageOfSingletonIsFiberOf
    {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject) (output : Right)
    (ambientDomain : DomainObject)
    (isSingleton : ∀ candidate : Right, candidate ∈ outputs ↔ candidate = output) :
    PreimageOf relation outputs ambientDomain =
      FiberOf relation output ambientDomain := by
  sorry

end CompositionAndIdentity

end RelationLaws

end LRA.Set
