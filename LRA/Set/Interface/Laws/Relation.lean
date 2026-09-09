import LRA.Set.Interface.Definitions.RelationSets
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Set

universe u v

section RelationLaws

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}

/--
`RelatesUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Union RelationObject] [inst_3 : Inter RelationObject] [inst_4 : SDiff RelationObject] [inst_5 : EmptyCollection RelationObject] [inst_6 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject) (input : Left) (output : Right), LRA.Set.Relates (first ∪ second)input output ↔ Or (LRA.Set.Relates first input output) (LRA.Set.Relates second input output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    first second : RelationObject
    input : Left
    output : Right
  Prove
    LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject) (input : Left) (output : Right), LRA.Set.Relates (first ∪ second)input output ↔ Or (LRA.Set.Relates first input output) (LRA.Set.Relates second input output)

Logical form (Lean):

```lean
theorem RelatesUnion
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∪ second) input output ↔
      Relates first input output ∨ Relates second input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

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

/--
`RelatesIntersection` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Union RelationObject] [inst_3 : Inter RelationObject] [inst_4 : SDiff RelationObject] [inst_5 : EmptyCollection RelationObject] [inst_6 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject) (input : Left) (output : Right), LRA.Set.Relates (first ∩ second)input output ↔ (LRA.Set.Relates first input output ∧ LRA.Set.Relates second input output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    first second : RelationObject
    input : Left
    output : Right
  Prove
    LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject) (input : Left) (output : Right), LRA.Set.Relates (first ∩ second)input output ↔ (LRA.Set.Relates first input output ∧ LRA.Set.Relates second input output)

Logical form (Lean):

```lean
theorem RelatesIntersection
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    (first second : RelationObject) (input : Left) (output : Right) :
    Relates (first ∩ second) input output ↔
      Relates first input output ∧ Relates second input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

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

/--
`MemberOfDomainOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (ambientDomain : DomainObject) (input : Left), input ∈ LRA.Set.DomainOf Right relation ambientDomain ↔ (input ∈ ambientDomain ∧ Exists fun output => LRA.Set.Relates relation input output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    ambientDomain : DomainObject
    input : Left
  Prove
    LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (ambientDomain : DomainObject) (input : Left), input ∈ LRA.Set.DomainOf Right relation ambientDomain ↔ (input ∈ ambientDomain ∧ Exists fun output => LRA.Set.Relates relation input output)

Logical form (Lean):

```lean
theorem MemberOfDomainOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (ambientDomain : DomainObject)
    (input : Left) :
    input ∈ DomainOf Right relation ambientDomain ↔
      input ∈ ambientDomain ∧
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

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

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

/--
`MemberOfRangeOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Right RangeObject] [inst_3 : LRA.Set.HasSeparation Right RangeObject], LRA.Set.SeparationLaws Right RangeObject → ∀ (relation : RelationObject) (ambientRange : RangeObject) (output : Right), output ∈ LRA.Set.RangeOf Left relation ambientRange ↔ (output ∈ ambientRange ∧ Exists fun input => LRA.Set.Relates relation input output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    ambientRange : RangeObject
    output : Right
  Prove
    LRA.Set.SeparationLaws Right RangeObject → ∀ (relation : RelationObject) (ambientRange : RangeObject) (output : Right), output ∈ LRA.Set.RangeOf Left relation ambientRange ↔ (output ∈ ambientRange ∧ Exists fun input => LRA.Set.Relates relation input output)

Logical form (Lean):

```lean
theorem MemberOfRangeOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Right RangeObject] [HasSeparation Right RangeObject]
    [SeparationLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject)
    (output : Right) :
    output ∈ RangeOf Left relation ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, Relates relation input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

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

/--
`MemberOfImageOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], LRA.Set.SeparationLaws Right RangeObject → ∀ (relation : RelationObject) (inputs : DomainObject) (ambientRange : RangeObject) (output : Right), output ∈ LRA.Set.ImageOf relation inputs ambientRange ↔ (output ∈ ambientRange ∧ (Exists fun input => (input ∈ inputs ∧ LRA.Set.Relates relation input output)))

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    inputs : DomainObject
    ambientRange : RangeObject
    output : Right
  Prove
    LRA.Set.SeparationLaws Right RangeObject → ∀ (relation : RelationObject) (inputs : DomainObject) (ambientRange : RangeObject) (output : Right), output ∈ LRA.Set.ImageOf relation inputs ambientRange ↔ (output ∈ ambientRange ∧ (Exists fun input => (input ∈ inputs ∧ LRA.Set.Relates relation input output)))

Logical form (Lean):

```lean
theorem MemberOfImageOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [Membership Right RangeObject] [HasSeparation Right RangeObject]
    [SeparationLaws Right RangeObject]
    (relation : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject) (output : Right) :
    output ∈ ImageOf relation inputs ambientRange ↔
      output ∈ ambientRange ∧
        ∃ input : Left, input ∈ inputs ∧ Relates relation input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

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

/--
`MemberOfPreimageOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Right RangeObject] [inst_3 : Membership Left DomainObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject) (input : Left), input ∈ LRA.Set.PreimageOf relation outputs ambientDomain ↔ (input ∈ ambientDomain ∧ (Exists fun output => (output ∈ outputs ∧ LRA.Set.Relates relation input output)))

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    outputs : RangeObject
    ambientDomain : DomainObject
    input : Left
  Prove
    LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject) (input : Left), input ∈ LRA.Set.PreimageOf relation outputs ambientDomain ↔ (input ∈ ambientDomain ∧ (Exists fun output => (output ∈ outputs ∧ LRA.Set.Relates relation input output)))

Logical form (Lean):

```lean
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
          Relates relation input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

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

/--
`MemberOfFiberOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (output : Right) (ambientDomain : DomainObject) (input : Left), input ∈ LRA.Set.FiberOf relation output ambientDomain ↔ (input ∈ ambientDomain ∧ LRA.Set.Relates relation input output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    output : Right
    ambientDomain : DomainObject
    input : Left
  Prove
    LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (output : Right) (ambientDomain : DomainObject) (input : Left), input ∈ LRA.Set.FiberOf relation output ambientDomain ↔ (input ∈ ambientDomain ∧ LRA.Set.Relates relation input output)

Logical form (Lean):

```lean
theorem MemberOfFiberOf
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [HasSeparation Left DomainObject]
    [SeparationLaws Left DomainObject]
    (relation : RelationObject) (output : Right)
    (ambientDomain : DomainObject) (input : Left) :
    input ∈ FiberOf relation output ambientDomain ↔
      input ∈ ambientDomain ∧ Relates relation input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

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

/--
`RelatesInverseOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} {ReversedPair : Type u} {ReversedObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasPairing Right Left ReversedPair] [inst_2 : Membership Pair RelationObject] [inst_3 : Membership ReversedPair ReversedObject] [inst_4 : LRA.Set.HasSeparation ReversedPair ReversedObject], (LRA.Set.SeparationLaws ReversedPair ReversedObject ∧ LRA.Set.PairingLaws Right Left ReversedPair) → ∀ (relation : RelationObject) (ambientReversed : ReversedObject) (input : Left) (output : Right), LRA.Set.Relates (LRA.Set.InverseOf Left Right relation ambientReversed) output input ↔ (LRA.Set.OrderedPair output input ∈ ambientReversed ∧ LRA.Set.Relates relation input output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ReversedPair, ReversedObject, ∈)
  Objects
    relation : RelationObject
    ambientReversed : ReversedObject
    input : Left
    output : Right
  Prove
    (LRA.Set.SeparationLaws ReversedPair ReversedObject ∧ LRA.Set.PairingLaws Right Left ReversedPair) → ∀ (relation : RelationObject) (ambientReversed : ReversedObject) (input : Left) (output : Right), LRA.Set.Relates (LRA.Set.InverseOf Left Right relation ambientReversed) output input ↔ (LRA.Set.OrderedPair output input ∈ ambientReversed ∧ LRA.Set.Relates relation input output)

Logical form (Lean):

```lean
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
        Relates relation input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

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

/--
`RelatesRestrictionOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Membership Left DomainObject], LRA.Set.PairingLaws Left Right Pair → ∀ (relation : RelationObject) (inputs : DomainObject) (input : Left) (output : Right), LRA.Set.Relates (LRA.Set.RestrictionOf Right relation inputs) input output ↔ (LRA.Set.Relates relation input output ∧ input ∈ inputs)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    inputs : DomainObject
    input : Left
    output : Right
  Prove
    LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Membership Left DomainObject], LRA.Set.PairingLaws Left Right Pair → ∀ (relation : RelationObject) (inputs : DomainObject) (input : Left) (output : Right), LRA.Set.Relates (LRA.Set.RestrictionOf Right relation inputs) input output ↔ (LRA.Set.Relates relation input output ∧ input ∈ inputs)

Logical form (Lean):

```lean
theorem RelatesRestrictionOf
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Membership Left DomainObject]
    [PairingLaws Left Right Pair]
    (relation : RelationObject) (inputs : DomainObject)
    (input : Left) (output : Right) :
    Relates (RestrictionOf Right relation inputs) input output ↔
      Relates relation input output ∧ input ∈ inputs
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

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

/--
`RestrictionIsSubset` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Union RelationObject] [inst_4 : Inter RelationObject] [inst_5 : SDiff RelationObject] [inst_6 : EmptyCollection RelationObject] [inst_7 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ [inst_8 : Membership Left DomainObject] (relation : RelationObject) (inputs : DomainObject), inst_7.Subset (LRA.Set.RestrictionOf Right relation inputs) relation

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    inputs : DomainObject
  Prove
    LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Union RelationObject] [inst_4 : Inter RelationObject] [inst_5 : SDiff RelationObject] [inst_6 : EmptyCollection RelationObject] [inst_7 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ [inst_8 : Membership Left DomainObject] (relation : RelationObject) (inputs : DomainObject), inst_7.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = inst.1 input output ∧ inst_8.1 inputs input)) relation

Logical form (Lean):

```lean
theorem RestrictionIsSubset
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
    [EmptyCollection RelationObject] [HasSubset RelationObject]
    [MembershipLaws Pair RelationObject]
    [Membership Left DomainObject]
    (relation : RelationObject) (inputs : DomainObject) :
    RestrictionOf Right relation inputs ⊆ relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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

/--
`RestrictionOfFunctionalIsFunctional` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Membership Left DomainObject], LRA.Set.PairingLaws Left Right Pair → ∀ (relation : RelationObject) (inputs : DomainObject), LRA.Set.IsFunctionalSet Left Right relation → LRA.Set.IsFunctionalSet Left Right (LRA.Set.RestrictionOf Right relation inputs)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    inputs : DomainObject
  Prove
    LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Membership Left DomainObject], LRA.Set.PairingLaws Left Right Pair → ∀ (relation : RelationObject) (inputs : DomainObject), ((∀ (member : Pair), inst_1.1 relation member → Exists fun input => Exists fun output => member = inst.1 input output) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 relation (inst.1 input firstOutput) → inst_1.1 relation (inst.1 input secondOutput) → firstOutput = secondOutput)) → ((∀ (member : Pair), inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = inst.pair input output ∧ inst_3.1 inputs input)) member → Exists fun input => Exists fun output => member = inst.1 input output) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = LRA.Set.OrderedPair input output ∧ input ∈ inputs)) (inst.1 input firstOutput) → inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = LRA.Set.OrderedPair input output ∧ input ∈ inputs)) (inst.1 input secondOutput) → firstOutput = secondOutput))

Logical form (Lean):

```lean
theorem RestrictionOfFunctionalIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [Membership Left DomainObject]
    [PairingLaws Left Right Pair]
    (relation : RelationObject) (inputs : DomainObject)
    (functional : IsFunctionalSet Left Right relation) :
    IsFunctionalSet Left Right (RestrictionOf Right relation inputs)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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

/--
`UnionOfCompatibleFunctionalIsFunctional` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Union RelationObject] [inst_3 : Inter RelationObject] [inst_4 : SDiff RelationObject] [inst_5 : EmptyCollection RelationObject] [inst_6 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject), (LRA.Set.IsFunctionalSet Left Right first ∧ (LRA.Set.IsFunctionalSet Left Right second ∧ (∀ (input : Left) (firstOutput secondOutput : Right), LRA.Set.Relates first input firstOutput → LRA.Set.Relates second input secondOutput → firstOutput = secondOutput))) → LRA.Set.IsFunctionalSet Left Right (first ∪ second)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    first second : RelationObject
  Prove
    LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject), (((∀ (member : Pair), inst_1.1 first member → Exists fun input => Exists fun output => member = inst.1 input output) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 first (inst.1 input firstOutput) → inst_1.1 first (inst.1 input secondOutput) → firstOutput = secondOutput)) ∧ (((∀ (member : Pair), inst_1.1 second member → Exists fun input => Exists fun output => member = inst.1 input output) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 second (inst.1 input firstOutput) → inst_1.1 second (inst.1 input secondOutput) → firstOutput = secondOutput)) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 first (inst.1 input firstOutput) → inst_1.1 second (inst.1 input secondOutput) → firstOutput = secondOutput))) → ((∀ (member : Pair), inst_1.1 (inst_2.1 first second) member → Exists fun input => Exists fun output => member = inst.1 input output) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 (inst_2.1 first second) (inst.1 input firstOutput) → inst_1.1 (inst_2.1 first second) (inst.1 input secondOutput) → firstOutput = secondOutput))

Logical form (Lean):

```lean
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
    IsFunctionalSet Left Right (first ∪ second)
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

/--
`RelatesGraphSetOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (map : Left → Right) (ambientPairs : RelationObject) (input : Left) (output : Right), LRA.Set.Relates (LRA.Set.GraphSetOf map ambientPairs) input output ↔ (LRA.Set.OrderedPair input output ∈ ambientPairs ∧ map input = output)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    map : Left → Right
    ambientPairs : RelationObject
    input : Left
    output : Right
  Prove
    (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (map : Left → Right) (ambientPairs : RelationObject) (input : Left) (output : Right), LRA.Set.Relates (LRA.Set.GraphSetOf map ambientPairs) input output ↔ (LRA.Set.OrderedPair input output ∈ ambientPairs ∧ map input = output)

Logical form (Lean):

```lean
theorem RelatesGraphSetOf
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject)
    (input : Left) (output : Right) :
    Relates (GraphSetOf map ambientPairs) input output ↔
      (OrderedPair input output : Pair) ∈ ambientPairs ∧
        map input = output
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

/--
`GraphSetOfIsFunctional` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (map : Left → Right) (ambientPairs : RelationObject), LRA.Set.IsFunctionalSet Left Right (LRA.Set.GraphSetOf map ambientPairs)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    map : Left → Right
    ambientPairs : RelationObject
  Prove
    (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (map : Left → Right) (ambientPairs : RelationObject), ((∀ (member : Pair), inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = inst.pair input (map input)) member → Exists fun input => Exists fun output => member = inst.1 input output) ∧ (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = LRA.Set.OrderedPair input (map input)) (inst.1 input firstOutput) → inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = LRA.Set.OrderedPair input (map input)) (inst.1 input secondOutput) → firstOutput = secondOutput))

Logical form (Lean):

```lean
theorem GraphSetOfIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject) :
    IsFunctionalSet Left Right (GraphSetOf map ambientPairs)
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
theorem GraphSetOfIsFunctional
    [HasPairing Left Right Pair]
    [Membership Pair RelationObject] [HasSeparation Pair RelationObject]
    [SeparationLaws Pair RelationObject]
    [PairingLaws Left Right Pair]
    (map : Left → Right) (ambientPairs : RelationObject) :
    IsFunctionalSet Left Right (GraphSetOf map ambientPairs) := by
  sorry

/--
`AppliedToUnique` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject), LRA.Set.IsSingleValued Left Right relation → ∀ (input : Left) (output : Right), LRA.Set.Relates relation input output → ∀ (hits : Exists fun someOutput => LRA.Set.Relates relation input someOutput), LRA.Set.AppliedTo relation input hits = output

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    input : Left
    output : Right
    relates : Relates relation input output
  Prove
    (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 relation (inst.1 input firstOutput) → inst_1.1 relation (inst.1 input secondOutput) → firstOutput = secondOutput) → ∀ (input : Left) (output : Right), inst_1.1 relation (inst.1 input output) → ∀ (hits : Exists fun someOutput => inst_1.1 relation (inst.1 input someOutput)), Classical.indefiniteDescription (LRA.Set.Relates relation input) hits = .1output

Logical form (Lean):

```lean
theorem AppliedToUnique
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (input : Left) (output : Right)
    (relates : Relates relation input output)
    (hits : ∃ someOutput : Right, Relates relation input someOutput) :
    AppliedTo relation input hits = output
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
theorem AppliedToUnique
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    (relation : RelationObject)
    (singleValued : IsSingleValued Left Right relation)
    (input : Left) (output : Right)
    (relates : Relates relation input output)
    (hits : ∃ someOutput : Right, Relates relation input someOutput) :
    AppliedTo relation input hits = output := by
  sorry

section ImageAlgebra

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}
variable [HasPairing Left Right Pair] [Membership Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [HasSeparation Right RangeObject] [SeparationLaws Right RangeObject]
variable [ExtensionalityLaw Right RangeObject]

/--
`ImageOfUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), LRA.Set.ImageOf relation (left ∪ right)ambientRange = LRA.Set.ImageOf relation left ambientRange ∪ LRA.Set.ImageOf relation right ambientRange

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    left right : DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 left right) input ∧ inst_1.1 relation (inst.1 input output)) = inst_10.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (inst.pair input output)))

Logical form (Lean):

```lean
theorem ImageOfUnion
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∪ right) ambientRange =
      ImageOf relation left ambientRange ∪ ImageOf relation right ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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

/--
`ImageOfEmpty` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (ambientRange : RangeObject), LRA.Set.ImageOf relation inst_8.emptyCollection ambientRange = inst_13.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 inst_8.1 input ∧ inst_1.1 relation (inst.1 input output)) = inst_13.1

Logical form (Lean):

```lean
theorem ImageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    ImageOf relation (∅ : DomainObject) ambientRange = (∅ : RangeObject)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ImageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientRange : RangeObject) :
    ImageOf relation (∅ : DomainObject) ambientRange = (∅ : RangeObject) := by
  sorry

/--
`ImageOfMonotone` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : HasSubset DomainObject] [inst_6 : HasSubset RangeObject] (relation : RelationObject) (smaller larger : DomainObject) (ambientRange : RangeObject), inst_5.Subset smaller larger → inst_6.Subset (LRA.Set.ImageOf relation smaller ambientRange) (LRA.Set.ImageOf relation larger ambientRange)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    smaller larger : DomainObject
    ambientRange : RangeObject
    inclusion : smaller ⊆ larger
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : HasSubset DomainObject] [inst_6 : HasSubset RangeObject] (relation : RelationObject) (smaller larger : DomainObject) (ambientRange : RangeObject), inst_5.1 smaller larger → inst_6.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 smaller input ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 larger input ∧ inst_1.1 relation (inst.pair input output)))

Logical form (Lean):

```lean
theorem ImageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : DomainObject)
    (ambientRange : RangeObject) (inclusion : smaller ⊆ larger) :
    ImageOf relation smaller ambientRange ⊆ ImageOf relation larger ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ImageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : DomainObject)
    (ambientRange : RangeObject) (inclusion : smaller ⊆ larger) :
    ImageOf relation smaller ambientRange ⊆ ImageOf relation larger ambientRange := by
  sorry

/--
`ImageOfIntersectionSubset` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Inter DomainObject] [inst_6 : Inter RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_7.Subset (LRA.Set.ImageOf relation (left ∩ right)ambientRange) (LRA.Set.ImageOf relation left ambientRange ∩ LRA.Set.ImageOf relation right ambientRange)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    left right : DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Inter DomainObject] [inst_6 : Inter RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 left right) input ∧ inst_1.1 relation (inst.pair input output))) (inst_6.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output))))

Logical form (Lean):

```lean
theorem ImageOfIntersectionSubset
    [Inter DomainObject] [Inter RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∩ right) ambientRange ⊆
      ImageOf relation left ambientRange ∩ ImageOf relation right ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ImageOfIntersectionSubset
    [Inter DomainObject] [Inter RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (left ∩ right) ambientRange ⊆
      ImageOf relation left ambientRange ∩ ImageOf relation right ambientRange := by
  sorry

/--
`DifferenceOfImagesSubsetImageOfDifference` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : SDiff DomainObject] [inst_6 : SDiff RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_7.Subset (LRA.Set.ImageOf relation left ambientRange \ LRA.Set.ImageOf relation right ambientRange) (LRA.Set.ImageOf relation (left \ right)ambientRange)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    left right : DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : SDiff DomainObject] [inst_6 : SDiff RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_6.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output)))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 left right) input ∧ inst_1.1 relation (inst.pair input output)))

Logical form (Lean):

```lean
theorem DifferenceOfImagesSubsetImageOfDifference
    [SDiff DomainObject] [SDiff RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation left ambientRange \ ImageOf relation right ambientRange ⊆
      ImageOf relation (left \ right) ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem DifferenceOfImagesSubsetImageOfDifference
    [SDiff DomainObject] [SDiff RangeObject] [HasSubset RangeObject]
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation left ambientRange \ ImageOf relation right ambientRange ⊆
      ImageOf relation (left \ right) ambientRange := by
  sorry

/--
`ImageOfIndexedUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedUnion DomainObject] [inst_6 : LRA.Set.HasIndexedUnion RangeObject] (relation : RelationObject) (family : Index → DomainObject) (ambientRange : RangeObject), LRA.Set.ImageOf relation (inst_5.indexedUnion family) ambientRange = inst_6.indexedUnion fun index => LRA.Set.ImageOf relation (family index) ambientRange

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, Index, ∈)
  Objects
    relation : RelationObject
    family : Index → DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedUnion DomainObject] [inst_6 : LRA.Set.HasIndexedUnion RangeObject] (relation : RelationObject) (family : Index → DomainObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.1 input output)) = inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (inst.pair input output))

Logical form (Lean):

```lean
theorem ImageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedUnion.indexedUnion family) ambientRange =
      HasIndexedUnion.indexedUnion
        (fun index => ImageOf relation (family index) ambientRange)
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
theorem ImageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedUnion.indexedUnion family) ambientRange =
      HasIndexedUnion.indexedUnion
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/--
`ImageOfIndexedIntersectionSubset` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedIntersection DomainObject] [inst_6 : LRA.Set.HasIndexedIntersection RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (family : Index → DomainObject) (ambientRange : RangeObject), inst_7.Subset (LRA.Set.ImageOf relation (inst_5.indexedIntersection family) ambientRange) (inst_6.indexedIntersection fun index => LRA.Set.ImageOf relation (family index) ambientRange)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, Index, ∈)
  Objects
    relation : RelationObject
    family : Index → DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedIntersection DomainObject] [inst_6 : LRA.Set.HasIndexedIntersection RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (family : Index → DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.pair input output))) (inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output)))

Logical form (Lean):

```lean
theorem ImageOfIndexedIntersectionSubset {Index : Type u}
    [HasIndexedIntersection DomainObject] [HasIndexedIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedIntersection.indexedIntersection family) ambientRange ⊆
      HasIndexedIntersection.indexedIntersection
        (fun index => ImageOf relation (family index) ambientRange)
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
theorem ImageOfIndexedIntersectionSubset {Index : Type u}
    [HasIndexedIntersection DomainObject] [HasIndexedIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Index → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasIndexedIntersection.indexedIntersection family) ambientRange ⊆
      HasIndexedIntersection.indexedIntersection
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/--
`ImageOfCountableUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : LRA.Set.HasCountableUnion DomainObject] [inst_6 : LRA.Set.HasCountableUnion RangeObject] (relation : RelationObject) (family : Nat → DomainObject) (ambientRange : RangeObject), LRA.Set.ImageOf relation (inst_5.countableUnion family) ambientRange = inst_6.countableUnion fun index => LRA.Set.ImageOf relation (family index) ambientRange

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    family : Nat → DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : LRA.Set.HasCountableUnion DomainObject] [inst_6 : LRA.Set.HasCountableUnion RangeObject] (relation : RelationObject) (family : Nat → DomainObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.1 input output)) = inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (inst.pair input output))

Logical form (Lean):

```lean
theorem ImageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableUnion.countableUnion family) ambientRange =
      HasCountableUnion.countableUnion
        (fun index => ImageOf relation (family index) ambientRange)
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
theorem ImageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableUnion.countableUnion family) ambientRange =
      HasCountableUnion.countableUnion
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/--
`ImageOfCountableIntersectionSubset` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : LRA.Set.HasCountableIntersection DomainObject] [inst_6 : LRA.Set.HasCountableIntersection RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (family : Nat → DomainObject) (ambientRange : RangeObject), inst_7.Subset (LRA.Set.ImageOf relation (inst_5.countableIntersection family) ambientRange) (inst_6.countableIntersection fun index => LRA.Set.ImageOf relation (family index) ambientRange)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    family : Nat → DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : LRA.Set.HasCountableIntersection DomainObject] [inst_6 : LRA.Set.HasCountableIntersection RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (family : Nat → DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.pair input output))) (inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output)))

Logical form (Lean):

```lean
theorem ImageOfCountableIntersectionSubset
    [HasCountableIntersection DomainObject] [HasCountableIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableIntersection.countableIntersection family) ambientRange ⊆
      HasCountableIntersection.countableIntersection
        (fun index => ImageOf relation (family index) ambientRange)
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
theorem ImageOfCountableIntersectionSubset
    [HasCountableIntersection DomainObject] [HasCountableIntersection RangeObject]
    [HasSubset RangeObject]
    (relation : RelationObject) (family : Nat → DomainObject)
    (ambientRange : RangeObject) :
    ImageOf relation (HasCountableIntersection.countableIntersection family) ambientRange ⊆
      HasCountableIntersection.countableIntersection
        (fun index => ImageOf relation (family index) ambientRange) := by
  sorry

/--
`ImageOfCongrRelation` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ (first second : RelationObject) (inputs : DomainObject) (ambientRange : RangeObject), (∀ (input : Left) (output : Right), LRA.Set.Relates first input output ↔ LRA.Set.Relates second input output) → LRA.Set.ImageOf first inputs ambientRange = LRA.Set.ImageOf second inputs ambientRange

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    first second : RelationObject
    inputs : DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ (first second : RelationObject) (inputs : DomainObject) (ambientRange : RangeObject), (∀ (input : Left) (output : Right), LRA.Set.Relates first input output ↔ LRA.Set.Relates second input output) → LRA.Set.ImageOf first inputs ambientRange = LRA.Set.ImageOf second inputs ambientRange

Logical form (Lean):

```lean
theorem ImageOfCongrRelation
    (first second : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    ImageOf first inputs ambientRange = ImageOf second inputs ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem ImageOfCongrRelation
    (first second : RelationObject) (inputs : DomainObject)
    (ambientRange : RangeObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    ImageOf first inputs ambientRange = ImageOf second inputs ambientRange := by
  sorry

/--
`ImageOfCongrInputs` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), (∀ (input : Left), input ∈ left ↔ input ∈ right) → LRA.Set.ImageOf relation left ambientRange = LRA.Set.ImageOf relation right ambientRange

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    left right : DomainObject
    ambientRange : RangeObject
  Prove
    (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), (∀ (input : Left), input ∈ left ↔ input ∈ right) → LRA.Set.ImageOf relation left ambientRange = LRA.Set.ImageOf relation right ambientRange

Logical form (Lean):

```lean
theorem ImageOfCongrInputs
    (relation : RelationObject) (left right : DomainObject)
    (ambientRange : RangeObject)
    (sameInputs : ∀ input : Left, input ∈ left ↔ input ∈ right) :
    ImageOf relation left ambientRange = ImageOf relation right ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
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

/--
`PreimageOfUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (left right : RangeObject) (ambientDomain : DomainObject), LRA.Set.PreimageOf relation (left ∪ right)ambientDomain = LRA.Set.PreimageOf relation left ambientDomain ∪ LRA.Set.PreimageOf relation right ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    left right : RangeObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (left right : RangeObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (inst_10.1 left right) output ∧ inst_1.1 relation (inst.1 input output)) = inst_5.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 left output ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 right output ∧ inst_1.1 relation (inst.pair input output)))

Logical form (Lean):

```lean
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
        PreimageOf relation right ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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

/--
`PreimageOfEmpty` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (ambientDomain : DomainObject), LRA.Set.PreimageOf relation inst_13.emptyCollection ambientDomain = inst_8.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 inst_13.1 output ∧ inst_1.1 relation (inst.1 input output)) = inst_8.1

Logical form (Lean):

```lean
theorem PreimageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    PreimageOf relation (∅ : RangeObject) ambientDomain = (∅ : DomainObject)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem PreimageOfEmpty
    [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
    [EmptyCollection DomainObject] [HasSubset DomainObject]
    [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
    [EmptyCollection RangeObject] [HasSubset RangeObject]
    [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
    (relation : RelationObject) (ambientDomain : DomainObject) :
    PreimageOf relation (∅ : RangeObject) ambientDomain = (∅ : DomainObject) := by
  sorry

/--
`PreimageOfMonotone` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : HasSubset DomainObject] [inst_6 : HasSubset RangeObject] (relation : RelationObject) (smaller larger : RangeObject) (ambientDomain : DomainObject), inst_6.Subset smaller larger → inst_5.Subset (LRA.Set.PreimageOf relation smaller ambientDomain) (LRA.Set.PreimageOf relation larger ambientDomain)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    smaller larger : RangeObject
    ambientDomain : DomainObject
    inclusion : smaller ⊆ larger
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : HasSubset DomainObject] [inst_6 : HasSubset RangeObject] (relation : RelationObject) (smaller larger : RangeObject) (ambientDomain : DomainObject), inst_6.1 smaller larger → inst_5.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 smaller output ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 larger output ∧ inst_1.1 relation (inst.pair input output)))

Logical form (Lean):

```lean
theorem PreimageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf relation smaller ambientDomain ⊆
      PreimageOf relation larger ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem PreimageOfMonotone [HasSubset DomainObject] [HasSubset RangeObject]
    (relation : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf relation smaller ambientDomain ⊆
      PreimageOf relation larger ambientDomain := by
  sorry

/--
`PreimageOfSubsetAmbient` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : HasSubset DomainObject] (relation : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject), inst_5.Subset (LRA.Set.PreimageOf relation outputs ambientDomain) ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    outputs : RangeObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : HasSubset DomainObject] (relation : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject), inst_5.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 outputs output ∧ inst_1.1 relation (inst.pair input output))) ambientDomain

Logical form (Lean):

```lean
theorem PreimageOfSubsetAmbient [HasSubset DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation outputs ambientDomain ⊆ ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem PreimageOfSubsetAmbient [HasSubset DomainObject]
    (relation : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation outputs ambientDomain ⊆ ambientDomain := by
  sorry

/--
`PreimageOfIndexedUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedUnion DomainObject] [inst_6 : LRA.Set.HasIndexedUnion RangeObject] (relation : RelationObject) (family : Index → RangeObject) (ambientDomain : DomainObject), LRA.Set.PreimageOf relation (inst_6.indexedUnion family) ambientDomain = inst_5.indexedUnion fun index => LRA.Set.PreimageOf relation (family index) ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, Index, ∈)
  Objects
    relation : RelationObject
    family : Index → RangeObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedUnion DomainObject] [inst_6 : LRA.Set.HasIndexedUnion RangeObject] (relation : RelationObject) (family : Index → RangeObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (inst_6.1 family) output ∧ inst_1.1 relation (inst.1 input output)) = inst_5.1 fun index => inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (family index) output ∧ inst_1.1 relation (inst.pair input output))

Logical form (Lean):

```lean
theorem PreimageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasIndexedUnion.indexedUnion family) ambientDomain =
      HasIndexedUnion.indexedUnion
        (fun index => PreimageOf relation (family index) ambientDomain)
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
theorem PreimageOfIndexedUnion {Index : Type u}
    [HasIndexedUnion DomainObject] [HasIndexedUnion RangeObject]
    (relation : RelationObject) (family : Index → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasIndexedUnion.indexedUnion family) ambientDomain =
      HasIndexedUnion.indexedUnion
        (fun index => PreimageOf relation (family index) ambientDomain) := by
  sorry

/--
`PreimageOfCountableUnion` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : LRA.Set.HasCountableUnion DomainObject] [inst_6 : LRA.Set.HasCountableUnion RangeObject] (relation : RelationObject) (family : Nat → RangeObject) (ambientDomain : DomainObject), LRA.Set.PreimageOf relation (inst_6.countableUnion family) ambientDomain = inst_5.countableUnion fun index => LRA.Set.PreimageOf relation (family index) ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    family : Nat → RangeObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : LRA.Set.HasCountableUnion DomainObject] [inst_6 : LRA.Set.HasCountableUnion RangeObject] (relation : RelationObject) (family : Nat → RangeObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (inst_6.1 family) output ∧ inst_1.1 relation (inst.1 input output)) = inst_5.1 fun index => inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (family index) output ∧ inst_1.1 relation (inst.pair input output))

Logical form (Lean):

```lean
theorem PreimageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasCountableUnion.countableUnion family) ambientDomain =
      HasCountableUnion.countableUnion
        (fun index => PreimageOf relation (family index) ambientDomain)
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
theorem PreimageOfCountableUnion
    [HasCountableUnion DomainObject] [HasCountableUnion RangeObject]
    (relation : RelationObject) (family : Nat → RangeObject)
    (ambientDomain : DomainObject) :
    PreimageOf relation (HasCountableUnion.countableUnion family) ambientDomain =
      HasCountableUnion.countableUnion
        (fun index => PreimageOf relation (family index) ambientDomain) := by
  sorry

/--
`PreimageOfCongrRelation` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ (first second : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject), (∀ (input : Left) (output : Right), LRA.Set.Relates first input output ↔ LRA.Set.Relates second input output) → LRA.Set.PreimageOf first outputs ambientDomain = LRA.Set.PreimageOf second outputs ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    first second : RelationObject
    outputs : RangeObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ (first second : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject), (∀ (input : Left) (output : Right), LRA.Set.Relates first input output ↔ LRA.Set.Relates second input output) → LRA.Set.PreimageOf first outputs ambientDomain = LRA.Set.PreimageOf second outputs ambientDomain

Logical form (Lean):

```lean
theorem PreimageOfCongrRelation
    (first second : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    PreimageOf first outputs ambientDomain =
      PreimageOf second outputs ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem PreimageOfCongrRelation
    (first second : RelationObject) (outputs : RangeObject)
    (ambientDomain : DomainObject)
    (sameRelation : ∀ (input : Left) (output : Right),
      Relates first input output ↔ Relates second input output) :
    PreimageOf first outputs ambientDomain =
      PreimageOf second outputs ambientDomain := by
  sorry

/--
`PreimageOfCongrOutputs` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ (relation : RelationObject) (left right : RangeObject) (ambientDomain : DomainObject), (∀ (output : Right), output ∈ left ↔ output ∈ right) → LRA.Set.PreimageOf relation left ambientDomain = LRA.Set.PreimageOf relation right ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    left right : RangeObject
    ambientDomain : DomainObject
  Prove
    (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ (relation : RelationObject) (left right : RangeObject) (ambientDomain : DomainObject), (∀ (output : Right), output ∈ left ↔ output ∈ right) → LRA.Set.PreimageOf relation left ambientDomain = LRA.Set.PreimageOf relation right ambientDomain

Logical form (Lean):

```lean
theorem PreimageOfCongrOutputs
    (relation : RelationObject) (left right : RangeObject)
    (ambientDomain : DomainObject)
    (sameOutputs : ∀ output : Right, output ∈ left ↔ output ∈ right) :
    PreimageOf relation left ambientDomain =
      PreimageOf relation right ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem PreimageOfCongrOutputs
    (relation : RelationObject) (left right : RangeObject)
    (ambientDomain : DomainObject)
    (sameOutputs : ∀ output : Right, output ∈ left ↔ output ∈ right) :
    PreimageOf relation left ambientDomain =
      PreimageOf relation right ambientDomain := by
  sorry

end PreimageAlgebra

section CompositionAndIdentity

/--
`ImageOfCompositionOf` TODO

Predicate logic:

  ∀ {Left Mid Right FirstPair SecondPair CompositePair : Type u} {FirstObject SecondObject CompositeObject DomainObject MidObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Mid FirstPair] [inst_1 : LRA.Set.HasPairing Mid Right SecondPair] [inst_2 : LRA.Set.HasPairing Left Right CompositePair] [inst_3 : Membership FirstPair FirstObject] [inst_4 : Membership SecondPair SecondObject] [inst_5 : Membership CompositePair CompositeObject] [inst_6 : Membership Left DomainObject] [inst_7 : Membership Mid MidObject] [inst_8 : Membership Right RangeObject] [inst_9 : LRA.Set.HasSeparation Mid MidObject] [inst_10 : LRA.Set.HasSeparation Right RangeObject], LRA.Set.ExtensionalityLaw Right RangeObject → ∀ (first : FirstObject) (second : SecondObject) (composite : CompositeObject) (inputs : DomainObject) (ambientMid : MidObject) (ambientRange : RangeObject), (∀ (input : Left) (output : Right), LRA.Set.Relates composite input output ↔ Exists fun middle => (LRA.Set.Relates first input middle ∧ LRA.Set.Relates second middle output)) → LRA.Set.ImageOf composite inputs ambientRange = LRA.Set.ImageOf second (LRA.Set.ImageOf first inputs ambientMid) ambientRange

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, Mid, FirstPair, SecondPair, CompositePair, FirstObject, SecondObject, CompositeObject, MidObject, ∈)
  Objects
    first : FirstObject
    second : SecondObject
    composite : CompositeObject
    inputs : DomainObject
    ambientMid : MidObject
    ambientRange : RangeObject
  Prove
    LRA.Set.ExtensionalityLaw Right RangeObject → ∀ (first : FirstObject) (second : SecondObject) (composite : CompositeObject) (inputs : DomainObject) (ambientMid : MidObject) (ambientRange : RangeObject), (∀ (input : Left) (output : Right), LRA.Set.Relates composite input output ↔ Exists fun middle => (LRA.Set.Relates first input middle ∧ LRA.Set.Relates second middle output)) → LRA.Set.ImageOf composite inputs ambientRange = LRA.Set.ImageOf second (LRA.Set.ImageOf first inputs ambientMid) ambientRange

Logical form (Lean):

```lean
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
      ImageOf second (ImageOf first inputs ambientMid) ambientRange
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
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

/--
`PreimageOfCompositionOf` TODO

Predicate logic:

  ∀ {Left Mid Right FirstPair SecondPair CompositePair : Type u} {FirstObject SecondObject CompositeObject DomainObject MidObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Mid FirstPair] [inst_1 : LRA.Set.HasPairing Mid Right SecondPair] [inst_2 : LRA.Set.HasPairing Left Right CompositePair] [inst_3 : Membership FirstPair FirstObject] [inst_4 : Membership SecondPair SecondObject] [inst_5 : Membership CompositePair CompositeObject] [inst_6 : Membership Left DomainObject] [inst_7 : Membership Mid MidObject] [inst_8 : Membership Right RangeObject] [inst_9 : LRA.Set.HasSeparation Left DomainObject] [inst_10 : LRA.Set.HasSeparation Mid MidObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (first : FirstObject) (second : SecondObject) (composite : CompositeObject) (outputs : RangeObject) (ambientDomain : DomainObject) (ambientMid : MidObject), (∀ (input : Left) (output : Right), LRA.Set.Relates composite input output ↔ Exists fun middle => (LRA.Set.Relates first input middle ∧ LRA.Set.Relates second middle output)) → LRA.Set.PreimageOf composite outputs ambientDomain = LRA.Set.PreimageOf first (LRA.Set.PreimageOf second outputs ambientMid) ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, Mid, FirstPair, SecondPair, CompositePair, FirstObject, SecondObject, CompositeObject, MidObject, ∈)
  Objects
    first : FirstObject
    second : SecondObject
    composite : CompositeObject
    outputs : RangeObject
    ambientDomain : DomainObject
    ambientMid : MidObject
  Prove
    LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (first : FirstObject) (second : SecondObject) (composite : CompositeObject) (outputs : RangeObject) (ambientDomain : DomainObject) (ambientMid : MidObject), (∀ (input : Left) (output : Right), LRA.Set.Relates composite input output ↔ Exists fun middle => (LRA.Set.Relates first input middle ∧ LRA.Set.Relates second middle output)) → LRA.Set.PreimageOf composite outputs ambientDomain = LRA.Set.PreimageOf first (LRA.Set.PreimageOf second outputs ambientMid) ambientDomain

Logical form (Lean):

```lean
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
      PreimageOf first (PreimageOf second outputs ambientMid) ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
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

/--
`PreimageOfCompositionMonotone` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (a : Membership Left DomainObject) [inst_2 : Membership Right RangeObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject] [inst_4 : HasSubset DomainObject] [inst_5 : HasSubset RangeObject] (composite : RelationObject) (smaller larger : RangeObject) (ambientDomain : DomainObject), inst_5.Subset smaller larger → inst_4.Subset (LRA.Set.PreimageOf composite smaller ambientDomain) (LRA.Set.PreimageOf composite larger ambientDomain)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    composite : RelationObject
    smaller larger : RangeObject
    ambientDomain : DomainObject
    inclusion : smaller ⊆ larger
  Prove
    inst_5.1 smaller larger → inst_4.1 (inst_3.1 ambientDomain fun input => Exists fun output => (inst_2.1 smaller output ∧ inst_1.1 composite (inst.pair input output))) (inst_3.1 ambientDomain fun input => Exists fun output => (inst_2.1 larger output ∧ inst_1.1 composite (inst.pair input output)))

Logical form (Lean):

```lean
theorem PreimageOfCompositionMonotone
    {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [HasSubset DomainObject] [HasSubset RangeObject]
    (composite : RelationObject) (smaller larger : RangeObject)
    (ambientDomain : DomainObject) (inclusion : smaller ⊆ larger) :
    PreimageOf composite smaller ambientDomain ⊆
      PreimageOf composite larger ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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

/--
`ImageOfIdentityOn` TODO

Predicate logic:

  ∀ {Left Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Left Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (identity : RelationObject) (inputs ambientDomain : DomainObject), ((∀ (leftElement rightElement : Left), LRA.Set.Relates identity leftElement rightElement ↔ leftElement = rightElement) ∧ (∀ (input : Left), input ∈ inputs → input ∈ ambientDomain)) → LRA.Set.ImageOf identity inputs ambientDomain = inputs

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    identity : RelationObject
    inputs ambientDomain : DomainObject
  Prove
    LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (identity : RelationObject) (inputs ambientDomain : DomainObject), ((∀ (leftElement rightElement : Left), LRA.Set.Relates identity leftElement rightElement ↔ leftElement = rightElement) ∧ (∀ (input : Left), input ∈ inputs → input ∈ ambientDomain)) → LRA.Set.ImageOf identity inputs ambientDomain = inputs

Logical form (Lean):

```lean
theorem ImageOfIdentityOn
    {Left Pair : Type u} {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (identity : RelationObject) (inputs ambientDomain : DomainObject)
    (isIdentity : ∀ leftElement rightElement : Left,
      Relates identity leftElement rightElement ↔ leftElement = rightElement)
    (inputsInAmbient : ∀ input : Left, input ∈ inputs → input ∈ ambientDomain) :
    ImageOf identity inputs ambientDomain = inputs
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
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

/--
`PreimageOfIdentityOn` TODO

Predicate logic:

  ∀ {Left Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Left Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (identity : RelationObject) (outputs ambientDomain : DomainObject), ((∀ (leftElement rightElement : Left), LRA.Set.Relates identity leftElement rightElement ↔ leftElement = rightElement) ∧ (∀ (output : Left), output ∈ outputs → output ∈ ambientDomain)) → LRA.Set.PreimageOf identity outputs ambientDomain = outputs

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    identity : RelationObject
    outputs ambientDomain : DomainObject
  Prove
    LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (identity : RelationObject) (outputs ambientDomain : DomainObject), ((∀ (leftElement rightElement : Left), LRA.Set.Relates identity leftElement rightElement ↔ leftElement = rightElement) ∧ (∀ (output : Left), output ∈ outputs → output ∈ ambientDomain)) → LRA.Set.PreimageOf identity outputs ambientDomain = outputs

Logical form (Lean):

```lean
theorem PreimageOfIdentityOn
    {Left Pair : Type u} {RelationObject DomainObject : Type v}
    [HasPairing Left Left Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (identity : RelationObject) (outputs ambientDomain : DomainObject)
    (isIdentity : ∀ leftElement rightElement : Left,
      Relates identity leftElement rightElement ↔ leftElement = rightElement)
    (outputsInAmbient : ∀ output : Left, output ∈ outputs → output ∈ ambientDomain) :
    PreimageOf identity outputs ambientDomain = outputs
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
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

/--
`PreimageOfSingletonIsFiberOf` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (relation : RelationObject) (outputs : RangeObject) (output : Right) (ambientDomain : DomainObject), (∀ (candidate : Right), candidate ∈ outputs ↔ candidate = output) → LRA.Set.PreimageOf relation outputs ambientDomain = LRA.Set.FiberOf relation output ambientDomain

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    outputs : RangeObject
    output : Right
    ambientDomain : DomainObject
  Prove
    LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (relation : RelationObject) (outputs : RangeObject) (output : Right) (ambientDomain : DomainObject), (∀ (candidate : Right), candidate ∈ outputs ↔ candidate = output) → LRA.Set.PreimageOf relation outputs ambientDomain = LRA.Set.FiberOf relation output ambientDomain

Logical form (Lean):

```lean
theorem PreimageOfSingletonIsFiberOf
    {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v}
    [HasPairing Left Right Pair] [Membership Pair RelationObject]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Left DomainObject] [ExtensionalityLaw Left DomainObject]
    (relation : RelationObject) (outputs : RangeObject) (output : Right)
    (ambientDomain : DomainObject)
    (isSingleton : ∀ candidate : Right, candidate ∈ outputs ↔ candidate = output) :
    PreimageOf relation outputs ambientDomain =
      FiberOf relation output ambientDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
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

/--
`AppliedToRelates` TODO

Predicate logic:

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject) (input : Left) (hits : Exists fun output => LRA.Set.Relates relation input output), LRA.Set.Relates relation input (LRA.Set.AppliedTo relation input hits)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Pair, RelationObject, DomainObject, RangeObject, ∈)
  Objects
    relation : RelationObject
    input : Left
  Prove
    inst_1.1 relation (inst.1 input (Classical.indefiniteDescription (LRA.Set.Relates relation input) hits).val)

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

end RelationLaws

end LRA.Set
