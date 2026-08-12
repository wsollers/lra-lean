-- LRA/VolumeI/Set/Interface/RelationLaws.lean
-- The theorem surface for relations-as-sets. Statements here; proofs are
-- the learner's.

import LRA.VolumeI.Set.Interface.RelationSets
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.VolumeI.Set

universe u v

/-!
Volume I label: set-interface-relation-laws
Lean module: LRA.VolumeI.Set.Interface.RelationLaws
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

end RelationLaws

end LRA.VolumeI.Set
