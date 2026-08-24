
import LRA.Set.Interface.Pairing
import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v

section Vocabulary

variable {Left Right Mid Pair ReversedPair CompositePair : Type u}
variable {RelationObject : Type v} {DomainObject : Type v}
variable {RangeObject : Type v} {ReversedObject : Type v}
variable {CompositeObject : Type v}

/--
`Relates` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (input : Left) (output : Right), inst_1.1 relation (LRA.Set.OrderedPair input output)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (input : Left) (output : Right), inst_1.1 relation (inst.1 input output)

Logical form (Lean):

```lean
def Relates [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left) (output : Right) : Prop :=
  OrderedPair input output ∈ relation
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
def Relates [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left) (output : Right) : Prop :=
  OrderedPair input output ∈ relation

/--
`IsPairwise` TODO

Predicate logic:

  ∀ (Left Right : Type u) {Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (member : Pair), member ∈ relation → Exists fun input => Exists fun output => member = LRA.Set.OrderedPair input output

Predicate logic (unfolded):

  ∀ (Left Right : Type u) {Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (member : Pair), inst_1.1 relation member → Exists fun input => Exists fun output => member = inst.1 input output

Logical form (Lean):

```lean
def IsPairwise (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ member : Pair, member ∈ relation →
    ∃ (input : Left) (output : Right), member = OrderedPair input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsPairwise (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ member : Pair, member ∈ relation →
    ∃ (input : Left) (output : Right), member = OrderedPair input output

/--
`IsSingleValued` TODO

Predicate logic:

  ∀ (Left Right : Type u) {Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (input : Left) (firstOutput secondOutput : Right), (LRA.Set.Relates relation input firstOutput ∧ LRA.Set.Relates relation input secondOutput) → firstOutput = secondOutput

Predicate logic (unfolded):

  ∀ (Left Right : Type u) {Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (input : Left) (firstOutput secondOutput : Right), (inst_1.1 relation (inst.1 input firstOutput) ∧ inst_1.1 relation (inst.1 input secondOutput)) → firstOutput = secondOutput

Logical form (Lean):

```lean
def IsSingleValued (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ (input : Left) (firstOutput secondOutput : Right),
    Relates relation input firstOutput →
    Relates relation input secondOutput →
    firstOutput = secondOutput
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsSingleValued (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  ∀ (input : Left) (firstOutput secondOutput : Right),
    Relates relation input firstOutput →
    Relates relation input secondOutput →
    firstOutput = secondOutput

/--
`IsFunctionalSet` TODO

Predicate logic:

  ∀ (Left Right : Type u) {Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject), (LRA.Set.IsPairwise Left Right relation ∧ LRA.Set.IsSingleValued Left Right relation)

Predicate logic (unfolded):

  ∀ (Left Right : Type u) {Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject), (∀ (member : Pair), inst_1.1 relation member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 relation (inst.1 input firstOutput) → inst_1.1 relation (inst.1 input secondOutput) → firstOutput = secondOutput)

Logical form (Lean):

```lean
def IsFunctionalSet (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  IsPairwise Left Right relation ∧ IsSingleValued Left Right relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsFunctionalSet (Left Right : Type u) {Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) : Prop :=
  IsPairwise Left Right relation ∧ IsSingleValued Left Right relation

/--
`IsTotalOn` TODO

Predicate logic:

  ∀ (Right : Type u) {Left Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] (relation : RelationObject) (domain : DomainObject) (input : Left), input ∈ domain → Exists fun output => LRA.Set.Relates relation input output

Predicate logic (unfolded):

  ∀ (Right : Type u) {Left Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] (relation : RelationObject) (domain : DomainObject) (input : Left), inst_2.1 domain input → Exists fun output => inst_1.1 relation (inst.1 input output)

Logical form (Lean):

```lean
def IsTotalOn (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (domain : DomainObject) : Prop :=
  ∀ input : Left, input ∈ domain →
    ∃ output : Right, Relates relation input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsTotalOn (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (domain : DomainObject) : Prop :=
  ∀ input : Left, input ∈ domain →
    ∃ output : Right, Relates relation input output

/--
`DomainOf` TODO

Predicate logic:

  def DomainOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output)

Predicate logic (unfolded):

  def DomainOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DomainOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def DomainOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, Relates relation input output)

/--
`RangeOf` TODO

Predicate logic:

  def RangeOf (Left : Type u) {Right Pair : Type u}
    {RelationObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output)

Predicate logic (unfolded):

  def RangeOf (Left : Type u) {Right Pair : Type u}
    {RelationObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RangeOf (Left : Type u) {Right Pair : Type u}
    {RelationObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def RangeOf (Left : Type u) {Right Pair : Type u}
    {RelationObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, Relates relation input output)

/--
`ImageOf` TODO

Predicate logic:

  def ImageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, input ∈ inputs ∧
      Relates relation input output)

Predicate logic (unfolded):

  def ImageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, input ∈ inputs ∧
      Relates relation input output) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ImageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) : RangeObject :=
  HasSeparation.separation ambientRange
    (fun output => ∃ input : Left, input ∈ inputs ∧
      Relates relation input output)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

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

/--
`PreimageOf` TODO

Predicate logic:

  def PreimageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, output ∈ outputs ∧
      Relates relation input output)

Predicate logic (unfolded):

  def PreimageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, output ∈ outputs ∧
      Relates relation input output) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PreimageOf {Left Right Pair : Type u}
    {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output : Right, output ∈ outputs ∧
      Relates relation input output)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

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

/--
`FiberOf` TODO

Predicate logic:

  def FiberOf {Left Right Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output)

Predicate logic (unfolded):

  def FiberOf {Left Right Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FiberOf {Left Right Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output)
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
def FiberOf {Left Right Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [HasSeparation Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) : DomainObject :=
  HasSeparation.separation ambientDomain
    (fun input => Relates relation input output)

/--
`InverseOf` TODO

Predicate logic:

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

Predicate logic (unfolded):

  def InverseOf (Left Right : Type u) {Pair ReversedPair : Type u}
    {RelationObject ReversedObject : Type v}
    [HasPairing Left Right Pair] [HasPairing Right Left ReversedPair]
    [Membership Pair RelationObject]
    [HasSeparation ReversedPair ReversedObject]
    (relation : RelationObject) (ambientReversed : ReversedObject) :
    ReversedObject :=
  HasSeparation.separation ambientReversed
    (fun reversed => ∃ (input : Left) (output : Right),
      reversed = OrderedPair output input ∧ Relates relation input output) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

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

/--
`RestrictionOf` TODO

Predicate logic:

  def RestrictionOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RelationObject :=
  HasSeparation.separation relation
    (fun member => ∃ (input : Left) (output : Right),
      member = OrderedPair input output ∧ input ∈ inputs)

Predicate logic (unfolded):

  def RestrictionOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RelationObject :=
  HasSeparation.separation relation
    (fun member => ∃ (input : Left) (output : Right),
      member = OrderedPair input output ∧ input ∈ inputs) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RestrictionOf (Right : Type u) {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RelationObject :=
  HasSeparation.separation relation
    (fun member => ∃ (input : Left) (output : Right),
      member = OrderedPair input output ∧ input ∈ inputs)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

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

/--
`IsExtensionOf` TODO

Predicate logic:

  ∀ {RelationObject : Type v} [inst : HasSubset RelationObject] (extension relation : RelationObject), inst.1 relation extension

Predicate logic (unfolded):

  ∀ {RelationObject : Type v} [inst : HasSubset RelationObject] (extension relation : RelationObject), inst.1 relation extension

Logical form (Lean):

```lean
def IsExtensionOf {RelationObject : Type v} [HasSubset RelationObject]
    (extension relation : RelationObject) : Prop :=
  relation ⊆ extension
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
def IsExtensionOf {RelationObject : Type v} [HasSubset RelationObject]
    (extension relation : RelationObject) : Prop :=
  relation ⊆ extension

/--
`GraphSetOf` TODO

Predicate logic:

  def GraphSetOf {Left Right Pair : Type u} {RelationObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    (map : Left → Right) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input))

Predicate logic (unfolded):

  def GraphSetOf {Left Right Pair : Type u} {RelationObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    (map : Left → Right) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GraphSetOf {Left Right Pair : Type u} {RelationObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    (map : Left → Right) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def GraphSetOf {Left Right Pair : Type u} {RelationObject : Type v}
    [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
    (map : Left → Right) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left, member = OrderedPair input (map input))

/--
`IdentityOn` TODO

Predicate logic:

  def IdentityOn {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (inputs : DomainObject) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left,
      input ∈ inputs ∧ member = OrderedPair input input)

Predicate logic (unfolded):

  def IdentityOn {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (inputs : DomainObject) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left,
      input ∈ inputs ∧ member = OrderedPair input input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IdentityOn {Left Pair : Type u}
    {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [HasSeparation Pair RelationObject]
    [Membership Left DomainObject]
    (inputs : DomainObject) (ambientPairs : RelationObject) :
    RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ input : Left,
      input ∈ inputs ∧ member = OrderedPair input input)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

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

/--
`CompositionOf` TODO

Predicate logic:

  def CompositionOf (Mid : Type u) {Left Right : Type u}
    {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject]
    [Membership SecondPair SecondObject]
    [HasSeparation CompositePair CompositeObject]
    (second : SecondObject) (first : FirstObject)
    (ambientComposite : CompositeObject) : CompositeObject

Predicate logic (unfolded):

  def CompositionOf (Mid : Type u) {Left Right : Type u}
    {FirstPair SecondPair CompositePair : Type u}
    {FirstObject SecondObject CompositeObject : Type v}
    [HasPairing Left Mid FirstPair] [HasPairing Mid Right SecondPair]
    [HasPairing Left Right CompositePair]
    [Membership FirstPair FirstObject]
    [Membership SecondPair SecondObject]
    [HasSeparation CompositePair CompositeObject]
    (second : SecondObject) (first : FirstObject)
    (ambientComposite : CompositeObject) : CompositeObject (source fallback; no compiled unfold data available)

Logical form (Lean):

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
    (ambientComposite : CompositeObject) : CompositeObject
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

/--
`AppliedTo` TODO

Predicate logic:

  noncomputable def AppliedTo {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits

Predicate logic (unfolded):

  noncomputable def AppliedTo {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def AppliedTo {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
noncomputable def AppliedTo {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) : Right :=
  Classical.choose hits

/--
`AppliedToRelates` TODO

Predicate logic:

  (∀ relation ∈ RelationObject ∀ input ∈ Left), (∃ output ∈ Right, Relates relation input output) → Relates relation input (AppliedTo relation input hits)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (input : Left) (hits : Exists fun output => inst_1.1 relation (inst.1 input output)), inst_1.1 relation (inst.1 input (Classical.indefiniteDescription (LRA.Set.Relates relation input) hits).val)

Logical form (Lean):

```lean
theorem AppliedToRelates {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) :
    Relates relation input (AppliedTo relation input hits)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem AppliedToRelates {Left Right Pair : Type u}
    {RelationObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject) (input : Left)
    (hits : ∃ output : Right, Relates relation input output) :
    Relates relation input (AppliedTo relation input hits) := by
  sorry

end Vocabulary

end LRA.Set
