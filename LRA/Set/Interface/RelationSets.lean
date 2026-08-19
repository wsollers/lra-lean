-- LRA/Set/Interface/RelationSets.lean
-- Relations and functions as sets: the fluent, backend-generic vocabulary.

import LRA.Set.Interface.Pairing
import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v

/-!
Volume I label: set-interface-relation-sets
Lean module: LRA.Set.Interface.RelationSets
Verification status: checked definitions

Relations and functions as **first-class sets**. A relation is nothing
new: it is a set whose members are ordered pairs, so `f ∪ g`, `f ∩ g`,
`f ⊆ g`, and every membership law apply to relations verbatim — the
union of two functions, the extension order on partial functions, all
inherited from the set interface for free.

Design rules, matching the rest of the interface:

- **`Relates` is the fluent primitive.** All the vocabulary speaks
  through `Relates relation input output := ⟨input, output⟩ ∈ relation`
  and never inspects a pair's internals.
- **Constructions are ambient-relative.** `DomainOf`, `ImageOf`,
  `InverseOf`, … carve their result out of an ambient set by
  Separation — the same discipline as the σ-algebra layer, and forced
  by Enderton's honesty: there is no free-floating "set of all pairs".
  The one exception is `RestrictionOf`, which carves from the relation
  itself (a restriction is a subset of the relation, no ambient
  needed).
- **Sorts that appear only in the body are explicit arguments**
  (`IsSingleValued Left Right relation`), matching the `WellFounded`
  precedent: Lean cannot infer a type that occurs in no argument.
-/

section Vocabulary

variable {Left Right Mid Pair ReversedPair CompositePair : Type u}
variable {RelationObject : Type v} {DomainObject : Type v}
variable {RangeObject : Type v} {ReversedObject : Type v}
variable {CompositeObject : Type v}

/-- **[Definition — Relates]**

The relation-set `relation` relates `input` to `output` when the
ordered pair `⟨input, output⟩` is a member of it. This is the fluent
primitive: the entire vocabulary below speaks through it.

Logical form:

```lean
def Relates [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left) (output : Right) : Prop :=
  OrderedPair input output ∈ relation
```
-/
def Relates [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left) (output : Right) : Prop :=
  OrderedPair input output ∈ relation

/-- **[Definition — IsPairwise]**

Every member of the set is an ordered pair — the set genuinely *is* a
relation. For typed backends this is automatic (every element of
`Left × Right` is a pair); for single-sorted backends it is a real
condition.

Logical form:

```lean
def IsPairwise (Left Right : Type u)
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ member : Pair, member ∈ relation →
    ∃ (input : Left) (output : Right), member = OrderedPair input output
```
-/
def IsPairwise (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ member : Pair, member ∈ relation →
    ∃ (input : Left) (output : Right), member = OrderedPair input output

/-- **[Definition — IsSingleValued]**

No input relates to two different outputs — the defining property of a
functional relation.

Logical form:

```lean
def IsSingleValued (Left Right : Type u) (relation : RelationObject) : Prop :=
  ∀ (input : Left) (firstOutput secondOutput : Right),
    Relates relation input firstOutput →
    Relates relation input secondOutput →
    firstOutput = secondOutput
```
-/
def IsSingleValued (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ (input : Left) (firstOutput secondOutput : Right),
    Relates relation input firstOutput →
    Relates relation input secondOutput →
    firstOutput = secondOutput

/-- **[Definition — IsFunctionalSet]**

A function, as a set: a set of ordered pairs that is single-valued.
This is Enderton's definition of a function, stated backend-generically
— and `ZFSet.IsFunc` is its Mathlib twin.

Logical form:

```lean
def IsFunctionalSet (Left Right : Type u) (relation : RelationObject) : Prop :=
  IsPairwise Left Right relation ∧ IsSingleValued Left Right relation
```
-/
def IsFunctionalSet (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  IsPairwise Left Right relation ∧ IsSingleValued Left Right relation

/-- **[Definition — IsTotalOn]**

Every member of the domain set relates to at least one output.

Logical form:

```lean
def IsTotalOn (Right : Type u) (relation : RelationObject)
    (domain : DomainObject) : Prop :=
  ∀ input : Left, input ∈ domain →
    ∃ output : Right, Relates relation input output
```
-/
def IsTotalOn (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (domain : DomainObject) : Prop :=
  ∀ input : Left, input ∈ domain →
    ∃ output : Right, Relates relation input output

/-- **[Definition — DomainOf]**

The domain of a relation-set, carved out of an ambient set of inputs:
the inputs that relate to at least one output.

Logical form:

```lean
def DomainOf (Right : Type u) (relation : RelationObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output)
```
-/
def DomainOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output)

/-- **[Definition — RangeOf]**

The range of a relation-set, carved out of an ambient set of outputs:
the outputs hit from at least one input.

Logical form:

```lean
def RangeOf (Left : Type u) (relation : RelationObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output)
```
-/
def RangeOf (Left : Type u) {Right Pair : Type u}
    {RelationObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output)

/-- **[Definition — ImageOf]**

The image of a set of inputs under a relation-set, carved out of an
ambient set of outputs.

Logical form:

```lean
def ImageOf (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, input ∈ inputs ∧
      Relates relation input output)
```
-/
def ImageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, input ∈ inputs ∧
      Relates relation input output)

/-- **[Definition — PreimageOf]**

The preimage of a set of outputs under a relation-set, carved out of
an ambient set of inputs.

Logical form:

```lean
def PreimageOf (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, output ∈ outputs ∧
      Relates relation input output)
```
-/
def PreimageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, output ∈ outputs ∧
      Relates relation input output)

/-- **[Definition — FiberOf]**

The fiber over a single output: the inputs the relation sends to it —
the preimage of a point, the set the "vertical line test" inspects.

Logical form:

```lean
def FiberOf (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output)
```
-/
def FiberOf {Left Right Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output)

/-- **[Definition — InverseOf]**

The inverse relation, carved out of an ambient set of *reversed*
pairs: `⟨b, a⟩` is in the inverse exactly when `⟨a, b⟩` is in the
relation (and the reversed pair is in the ambient).

Logical form:

```lean
def InverseOf (Left Right : Type u) (relation : RelationObject)
    (ambientReversed : ReversedObject) : ReversedObject :=
  HasSeparation.separation ambientReversed
    (fun reversed => ∃ (input : Left) (output : Right),
      reversed = OrderedPair output input ∧ Relates relation input output)
```
-/
def InverseOf (Left Right : Type u) {Pair ReversedPair : Type u}
    {RelationObject ReversedObject : Type v}
    [HasPairing Left Right Pair] [HasPairing Right Left ReversedPair]
    [Membership Pair RelationObject]
    [HasSeparation ReversedPair ReversedObject]
    (relation : RelationObject) (ambientReversed : ReversedObject) :
    ReversedObject :=
  HasSeparation.separation ambientReversed
    (fun reversed => ∃ (input : Left) (output : Right),
      reversed = OrderedPair output input ∧ Relates relation input output)

/-- **[Definition — RestrictionOf]**

The restriction of a relation-set to a set of inputs — carved from the
relation *itself* (a restriction is a subset of the relation; no
ambient is needed).

Logical form:

```lean
def RestrictionOf (Right : Type u) (relation : RelationObject)
    (inputs : DomainObject) : RelationObject :=
  HasSeparation.separation relation
    (fun member => ∃ (input : Left) (output : Right),
      member = OrderedPair input output ∧ input ∈ inputs)
```
-/
def RestrictionOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RelationObject :=
  HasSeparation.separation relation
    (fun member => ∃ (input : Left) (output : Right),
      member = OrderedPair input output ∧ input ∈ inputs)

/-- **[Definition — IsExtensionOf]**

`extension` extends `relation` when the relation is a subset of the
extension — the extension order on partial functions IS the subset
order on their graphs.

Logical form:

```lean
def IsExtensionOf (extension relation : RelationObject) : Prop :=
  relation ⊆ extension
```
-/
def IsExtensionOf {RelationObject : Type v} [HasSubset RelationObject]
    (extension relation : RelationObject) : Prop :=
  relation ⊆ extension

/-- **[Definition — GraphSetOf]**

The graph of a type-level function, reified as a set of pairs carved
out of an ambient — the bridge from `Functions.Function` into the set
world.

Logical form:

```lean
def GraphSetOf (map : Left → Right)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input))
```
-/
def GraphSetOf {Left Right Pair : Type u} {RelationObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    (map : Left → Right) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input))

/-- **[Definition — IdentityOn]**

The identity relation on a set of inputs, carved out of an ambient set
of pairs.

Logical form:

```lean
def IdentityOn (inputs : DomainObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left,
      input ∈ inputs ∧ member = OrderedPair input input)
```
-/
def IdentityOn {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (inputs : DomainObject) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left,
      input ∈ inputs ∧ member = OrderedPair input input)

/-- **[Definition — CompositionOf]**

The composition `second ∘ first` as a relation-set, carved out of an
ambient set of composite pairs: `⟨a, c⟩` belongs when some middle
value `b` has `first` relating `a` to `b` and `second` relating `b`
to `c`.

Logical form:

```lean
def CompositionOf (Mid : Type u) {Left Right : Type u}
    {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject]
    [Membership SecondPair SecondObject]
    [HasSeparation CompositePair CompositeObject]
    (second : SecondObject) (first : FirstObject)
    (ambientComposite : CompositeObject) : CompositeObject :=
  HasSeparation.separation ambientComposite
    (fun member => ∃ (input : Left) (middle : Mid) (output : Right),
      member = OrderedPair input output ∧
      Relates first input middle ∧ Relates second middle output)
```
-/
def CompositionOf (Mid : Type u) {Left Right : Type u}
    {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject]
    [Membership SecondPair SecondObject]
    [HasSeparation CompositePair CompositeObject]
    (second : SecondObject) (first : FirstObject)
    (ambientComposite : CompositeObject) : CompositeObject :=
  HasSeparation.separation ambientComposite
    (fun member => ∃ (input : Left) (middle : Mid) (output : Right),
      member = OrderedPair input output ∧
      Relates first input middle ∧ Relates second middle output)

/-- **[Definition — AppliedTo]**

Function application out of a relation-set: given a witness that the
input relates to something, choose the output. For a single-valued
relation the choice is unique (see `AppliedToRelates` and
`AppliedToUnique` in `RelationLaws`). Choice-backed, hence
noncomputable — matching the Enderton backend's other operations.

Logical form:

```lean
noncomputable def AppliedTo (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits
```
-/
noncomputable def AppliedTo {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits

/-- **[Theorem — AppliedToRelates]**

The chosen output is related to the input — the defining property of
application, by the choice specification (pure delegation).

Logical form:

```lean
theorem AppliedToRelates (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) :
    Relates relation input (AppliedTo relation input hits)
```
-/
theorem AppliedToRelates {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) :
    Relates relation input (AppliedTo relation input hits) :=
  Classical.choose_spec hits

end Vocabulary

end LRA.Set
