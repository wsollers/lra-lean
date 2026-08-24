
import LRA.Set.Interface.RelationSets
import LRA.Set.Interface.Membership

namespace LRA.Set

universe u v

section RelationLaws

variable {Left Right Pair : Type u}
variable {RelationObject DomainObject RangeObject : Type v}

/--
`RelatesUnion` TODO

Predicate logic:

  (∀ first second ∈ RelationObject ∀ input ∈ Left ∀ output ∈ Right), Relates (first ∪ second) input output ↔ Relates first input output ∨ Relates second input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Union RelationObject] [inst_3 : Inter RelationObject] [inst_4 : SDiff RelationObject] [inst_5 : EmptyCollection RelationObject] [inst_6 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject) (input : Left) (output : Right), inst_1.1 (inst_2.1 first second) (inst.1 input output) ↔ Or (inst_1.1 first (inst.1 input output)) (inst_1.1 second (inst.1 input output))

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

  (∀ first second ∈ RelationObject ∀ input ∈ Left ∀ output ∈ Right), Relates (first ∩ second) input output ↔ Relates first input output ∧ Relates second input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Union RelationObject] [inst_3 : Inter RelationObject] [inst_4 : SDiff RelationObject] [inst_5 : EmptyCollection RelationObject] [inst_6 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject) (input : Left) (output : Right), inst_1.1 (inst_3.1 first second) (inst.1 input output) ↔ (inst_1.1 first (inst.1 input output) ∧ inst_1.1 second (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ ambientDomain ∈ DomainObject ∀ input ∈ Left), input ∈ DomainOf Right relation ambientDomain ↔ input ∈ ambientDomain ∧ ∃ output ∈ Right, Relates relation input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (ambientDomain : DomainObject) (input : Left), inst_2.1 (inst_3.1 ambientDomain fun input => Exists fun output => inst_1.1 relation (inst.pair input output)) input ↔ (inst_2.1 ambientDomain input ∧ Exists fun output => inst_1.1 relation (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ ambientRange ∈ RangeObject ∀ output ∈ Right), output ∈ RangeOf Left relation ambientRange ↔ output ∈ ambientRange ∧ ∃ input ∈ Left, Relates relation input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Right RangeObject] [inst_3 : LRA.Set.HasSeparation Right RangeObject], LRA.Set.SeparationLaws Right RangeObject → ∀ (relation : RelationObject) (ambientRange : RangeObject) (output : Right), inst_2.1 (inst_3.1 ambientRange fun output => Exists fun input => inst_1.1 relation (inst.pair input output)) output ↔ (inst_2.1 ambientRange output ∧ Exists fun input => inst_1.1 relation (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ inputs ∈ DomainObject ∀ ambientRange ∈ RangeObject ∀ output ∈ Right), output ∈ ImageOf relation inputs ambientRange ↔ output ∈ ambientRange ∧ ∃ input ∈ Left, input ∈ inputs ∧ Relates relation input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], LRA.Set.SeparationLaws Right RangeObject → ∀ (relation : RelationObject) (inputs : DomainObject) (ambientRange : RangeObject) (output : Right), inst_3.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 inputs input ∧ inst_1.1 relation (inst.pair input output))) output ↔ (inst_3.1 ambientRange output ∧ Exists fun input => (inst_2.1 inputs input ∧ inst_1.1 relation (inst.1 input output)))

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

  (∀ relation ∈ RelationObject ∀ outputs ∈ RangeObject ∀ ambientDomain ∈ DomainObject ∀ input ∈ Left), input ∈ PreimageOf relation outputs ambientDomain ↔ input ∈ ambientDomain ∧ ∃ output ∈ Right, output ∈ outputs ∧ Relates relation input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Right RangeObject] [inst_3 : Membership Left DomainObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject) (input : Left), inst_3.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_2.1 outputs output ∧ inst_1.1 relation (inst.pair input output))) input ↔ (inst_3.1 ambientDomain input ∧ Exists fun output => (inst_2.1 outputs output ∧ inst_1.1 relation (inst.1 input output)))

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

  (∀ relation ∈ RelationObject ∀ output ∈ Right ∀ ambientDomain ∈ DomainObject ∀ input ∈ Left), input ∈ FiberOf relation output ambientDomain ↔ input ∈ ambientDomain ∧ Relates relation input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.SeparationLaws Left DomainObject → ∀ (relation : RelationObject) (output : Right) (ambientDomain : DomainObject) (input : Left), inst_2.1 (inst_3.1 ambientDomain fun input => inst_1.1 relation (inst.pair input output)) input ↔ (inst_2.1 ambientDomain input ∧ inst_1.1 relation (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ ambientReversed ∈ ReversedObject ∀ input ∈ Left ∀ output ∈ Right), Relates (InverseOf Left Right relation ambientReversed) output input ↔ OrderedPair output input ∈ ReversedPair ∈ ambientReversed ∧ Relates relation input output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} {ReversedPair : Type u} {ReversedObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasPairing Right Left ReversedPair] [inst_2 : Membership Pair RelationObject] [inst_3 : Membership ReversedPair ReversedObject] [inst_4 : LRA.Set.HasSeparation ReversedPair ReversedObject], (LRA.Set.SeparationLaws ReversedPair ReversedObject ∧ LRA.Set.PairingLaws Right Left ReversedPair) → ∀ (relation : RelationObject) (ambientReversed : ReversedObject) (input : Left) (output : Right), inst_3.1 (inst_4.1 ambientReversed fun reversed => Exists fun input => Exists fun output => (reversed = inst_1.1 output input ∧ inst_2.1 relation (LRA.Set.OrderedPair input output))) (inst_1.1 output input) ↔ (inst_3.1 ambientReversed (inst_1.1 output input) ∧ inst_2.1 relation (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ inputs ∈ DomainObject ∀ input ∈ Left ∀ output ∈ Right), Relates (RestrictionOf Right relation inputs) input output ↔ Relates relation input output ∧ input ∈ inputs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Membership Left DomainObject], LRA.Set.PairingLaws Left Right Pair → ∀ (relation : RelationObject) (inputs : DomainObject) (input : Left) (output : Right), inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = inst.1 input output ∧ inst_3.1 inputs input)) (inst.1 input output) ↔ (inst_1.1 relation (inst.1 input output) ∧ inst_3.1 inputs input)

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

  (∀ relation ∈ RelationObject ∀ inputs ∈ DomainObject), RestrictionOf Right relation inputs ⊆ relation

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Union RelationObject] [inst_4 : Inter RelationObject] [inst_5 : SDiff RelationObject] [inst_6 : EmptyCollection RelationObject] [inst_7 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ [inst_8 : Membership Left DomainObject] (relation : RelationObject) (inputs : DomainObject), inst_7.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = inst.1 input output ∧ inst_8.1 inputs input)) relation

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

  (∀ relation ∈ RelationObject ∀ inputs ∈ DomainObject), (IsFunctionalSet Left Right relation) → IsFunctionalSet Left Right (RestrictionOf Right relation inputs)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], LRA.Set.SeparationLaws Pair RelationObject → ∀ [inst_3 : Membership Left DomainObject], LRA.Set.PairingLaws Left Right Pair → ∀ (relation : RelationObject) (inputs : DomainObject), (∀ (member : Pair), inst_1.1 relation member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 relation (inst.1 input firstOutput) → inst_1.1 relation (inst.1 input secondOutput) → firstOutput = secondOutput) → (∀ (member : Pair), inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = inst.pair input output ∧ inst_3.1 inputs input)) member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = LRA.Set.OrderedPair input output ∧ input ∈ inputs)) (inst.1 input firstOutput) → inst_1.1 (inst_2.1 relation fun member => Exists fun input => Exists fun output => (member = LRA.Set.OrderedPair input output ∧ input ∈ inputs)) (inst.1 input secondOutput) → firstOutput = secondOutput)

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

  (∀ first second ∈ RelationObject), (IsFunctionalSet Left Right first ∧ IsFunctionalSet Left Right second ∧ ∀ input ∈ Left firstOutput secondOutput ∈ Right, Relates first input firstOutput → Relates second input secondOutput → firstOutput = secondOutput) → IsFunctionalSet Left Right (first ∪ second)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Union RelationObject] [inst_3 : Inter RelationObject] [inst_4 : SDiff RelationObject] [inst_5 : EmptyCollection RelationObject] [inst_6 : HasSubset RelationObject], LRA.Set.MembershipLaws Pair RelationObject → ∀ (first second : RelationObject), ((∀ (member : Pair), inst_1.1 first member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 first (inst.1 input firstOutput) → inst_1.1 first (inst.1 input secondOutput) → firstOutput = secondOutput) ∧ ((∀ (member : Pair), inst_1.1 second member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 second (inst.1 input firstOutput) → inst_1.1 second (inst.1 input secondOutput) → firstOutput = secondOutput) ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 first (inst.1 input firstOutput) → inst_1.1 second (inst.1 input secondOutput) → firstOutput = secondOutput)) → (∀ (member : Pair), inst_1.1 (inst_2.1 first second) member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 (inst_2.1 first second) (inst.1 input firstOutput) → inst_1.1 (inst_2.1 first second) (inst.1 input secondOutput) → firstOutput = secondOutput)

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

  (∀ ambientPairs ∈ RelationObject ∀ input ∈ Left ∀ output ∈ Right), (Left → Right) → Relates (GraphSetOf map ambientPairs) input output ↔ OrderedPair input output ∈ Pair ∈ ambientPairs ∧ map input = output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (map : Left → Right) (ambientPairs : RelationObject) (input : Left) (output : Right), inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = inst.1 input (map input)) (inst.1 input output) ↔ (inst_1.1 ambientPairs (inst.1 input output) ∧ map input = output)

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

  (∀ ambientPairs ∈ RelationObject), (Left → Right) → IsFunctionalSet Left Right (GraphSetOf map ambientPairs)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : LRA.Set.HasSeparation Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (map : Left → Right) (ambientPairs : RelationObject), (∀ (member : Pair), inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = inst.pair input (map input)) member → Exists fun input => Exists fun output => member = inst.1 input output ∧ ∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = LRA.Set.OrderedPair input (map input)) (inst.1 input firstOutput) → inst_1.1 (inst_2.1 ambientPairs fun member => Exists fun input => member = LRA.Set.OrderedPair input (map input)) (inst.1 input secondOutput) → firstOutput = secondOutput)

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

  (∀ relation ∈ RelationObject ∀ input ∈ Left ∀ output ∈ Right), (IsSingleValued Left Right relation ∧ ∃ someOutput ∈ Right, Relates relation input someOutput) → AppliedTo relation input hits = output

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (relation : RelationObject), (∀ (input : Left) (firstOutput secondOutput : Right), inst_1.1 relation (inst.1 input firstOutput) → inst_1.1 relation (inst.1 input secondOutput) → firstOutput = secondOutput) → ∀ (input : Left) (output : Right), inst_1.1 relation (inst.1 input output) → ∀ (hits : Exists fun someOutput => inst_1.1 relation (inst.1 input someOutput)), Classical.indefiniteDescription (LRA.Set.Relates relation input) hits = .1output

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

  (∀ relation ∈ RelationObject ∀ left right ∈ DomainObject ∀ ambientRange ∈ RangeObject), ImageOf relation (left ∪ right) ambientRange = ImageOf relation left ambientRange ∪ ImageOf relation right ambientRange

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 left right) input ∧ inst_1.1 relation (inst.1 input output)) = inst_10.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (inst.pair input output)))

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

  (∀ relation ∈ RelationObject ∀ ambientRange ∈ RangeObject), ImageOf relation ∅ ∈ DomainObject ambientRange = ∅ ∈ RangeObject

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 inst_8.1 input ∧ inst_1.1 relation (inst.1 input output)) = inst_13.1

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

  (∀ relation ∈ RelationObject ∀ smaller larger ∈ DomainObject ∀ ambientRange ∈ RangeObject), ImageOf relation smaller ambientRange ⊆ ImageOf relation larger ambientRange

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : HasSubset DomainObject] [inst_6 : HasSubset RangeObject] (relation : RelationObject) (smaller larger : DomainObject) (ambientRange : RangeObject), inst_5.1 smaller larger → inst_6.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 smaller input ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 larger input ∧ inst_1.1 relation (inst.pair input output)))

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

  (∀ relation ∈ RelationObject ∀ left right ∈ DomainObject ∀ ambientRange ∈ RangeObject), ImageOf relation (left ∩ right) ambientRange ⊆ ImageOf relation left ambientRange ∩ ImageOf relation right ambientRange

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : Inter DomainObject] [inst_6 : Inter RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 left right) input ∧ inst_1.1 relation (inst.pair input output))) (inst_6.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output))))

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

  (∀ relation ∈ RelationObject ∀ left right ∈ DomainObject ∀ ambientRange ∈ RangeObject), ImageOf relation left ambientRange \ ImageOf relation right ambientRange ⊆ ImageOf relation (left \ right) ambientRange

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : SDiff DomainObject] [inst_6 : SDiff RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_6.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output)))) (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 left right) input ∧ inst_1.1 relation (inst.pair input output)))

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

  (∀ relation ∈ RelationObject ∀ ambientRange ∈ RangeObject), (Index → DomainObject) → ImageOf relation (HasIndexedUnion.indexedUnion family) ambientRange = HasIndexedUnion.indexedUnion (fun index => ImageOf relation (family index) ambientRange)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedUnion DomainObject] [inst_6 : LRA.Set.HasIndexedUnion RangeObject] (relation : RelationObject) (family : Index → DomainObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.1 input output)) = inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (inst.pair input output))

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

  (∀ relation ∈ RelationObject ∀ ambientRange ∈ RangeObject), (Index → DomainObject) → ImageOf relation (HasIndexedIntersection.indexedIntersection family) ambientRange ⊆ HasIndexedIntersection.indexedIntersection (fun index => ImageOf relation (family index) ambientRange)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedIntersection DomainObject] [inst_6 : LRA.Set.HasIndexedIntersection RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (family : Index → DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.pair input output))) (inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output)))

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

  (∀ relation ∈ RelationObject ∀ ambientRange ∈ RangeObject), (Nat → DomainObject) → ImageOf relation (HasCountableUnion.countableUnion family) ambientRange = HasCountableUnion.countableUnion (fun index => ImageOf relation (family index) ambientRange)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : LRA.Set.HasCountableUnion DomainObject] [inst_6 : LRA.Set.HasCountableUnion RangeObject] (relation : RelationObject) (family : Nat → DomainObject) (ambientRange : RangeObject), inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.1 input output)) = inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (inst.pair input output))

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

  (∀ relation ∈ RelationObject ∀ ambientRange ∈ RangeObject), (Nat → DomainObject) → ImageOf relation (HasCountableIntersection.countableIntersection family) ambientRange ⊆ HasCountableIntersection.countableIntersection (fun index => ImageOf relation (family index) ambientRange)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ [inst_5 : LRA.Set.HasCountableIntersection DomainObject] [inst_6 : LRA.Set.HasCountableIntersection RangeObject] [inst_7 : HasSubset RangeObject] (relation : RelationObject) (family : Nat → DomainObject) (ambientRange : RangeObject), inst_7.1 (inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (inst_5.1 family) input ∧ inst_1.1 relation (inst.pair input output))) (inst_6.1 fun index => inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 (family index) input ∧ inst_1.1 relation (LRA.Set.OrderedPair input output)))

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

  (∀ first second ∈ RelationObject ∀ inputs ∈ DomainObject ∀ ambientRange ∈ RangeObject), (∀ input ∈ Left output ∈ Right, Relates first input output ↔ Relates second input output) → ImageOf first inputs ambientRange = ImageOf second inputs ambientRange

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ (first second : RelationObject) (inputs : DomainObject) (ambientRange : RangeObject), (∀ (input : Left) (output : Right), inst_1.1 first (inst.1 input output) ↔ inst_1.1 second (inst.1 input output)) → inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 inputs input ∧ inst_1.1 first (inst.1 input output)) = inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 inputs input ∧ inst_1.1 second (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ left right ∈ DomainObject ∀ ambientRange ∈ RangeObject), (∀ input : Left, input ∈ left ↔ input ∈ right) → ImageOf relation left ambientRange = ImageOf relation right ambientRange

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Right RangeObject], (LRA.Set.SeparationLaws Right RangeObject ∧ LRA.Set.ExtensionalityLaw Right RangeObject) → ∀ (relation : RelationObject) (left right : DomainObject) (ambientRange : RangeObject), (∀ (input : Left), inst_2.1 left input ↔ inst_2.1 right input) → inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 left input ∧ inst_1.1 relation (inst.1 input output)) = inst_4.1 ambientRange fun output => Exists fun input => (inst_2.1 right input ∧ inst_1.1 relation (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ left right ∈ RangeObject ∀ ambientDomain ∈ DomainObject), PreimageOf relation (left ∪ right) ambientDomain = PreimageOf relation left ambientDomain ∪ PreimageOf relation right ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (left right : RangeObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (inst_10.1 left right) output ∧ inst_1.1 relation (inst.1 input output)) = inst_5.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 left output ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 right output ∧ inst_1.1 relation (inst.pair input output)))

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

  (∀ relation ∈ RelationObject ∀ ambientDomain ∈ DomainObject), PreimageOf relation ∅ ∈ RangeObject ambientDomain = ∅ ∈ DomainObject

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject], (LRA.Set.MembershipLaws Left DomainObject ∧ LRA.Set.MembershipLaws Right RangeObject) → ∀ (relation : RelationObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 inst_13.1 output ∧ inst_1.1 relation (inst.1 input output)) = inst_8.1

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

  (∀ relation ∈ RelationObject ∀ smaller larger ∈ RangeObject ∀ ambientDomain ∈ DomainObject), PreimageOf relation smaller ambientDomain ⊆ PreimageOf relation larger ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : HasSubset DomainObject] [inst_6 : HasSubset RangeObject] (relation : RelationObject) (smaller larger : RangeObject) (ambientDomain : DomainObject), inst_6.1 smaller larger → inst_5.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 smaller output ∧ inst_1.1 relation (inst.pair input output))) (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 larger output ∧ inst_1.1 relation (inst.pair input output)))

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

  (∀ relation ∈ RelationObject ∀ outputs ∈ RangeObject ∀ ambientDomain ∈ DomainObject), PreimageOf relation outputs ambientDomain ⊆ ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : HasSubset DomainObject] (relation : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject), inst_5.1 (inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 outputs output ∧ inst_1.1 relation (inst.pair input output))) ambientDomain

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

  (∀ relation ∈ RelationObject ∀ ambientDomain ∈ DomainObject), (Index → RangeObject) → PreimageOf relation (HasIndexedUnion.indexedUnion family) ambientDomain = HasIndexedUnion.indexedUnion (fun index => PreimageOf relation (family index) ambientDomain)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ {Index : Type u} [inst_5 : LRA.Set.HasIndexedUnion DomainObject] [inst_6 : LRA.Set.HasIndexedUnion RangeObject] (relation : RelationObject) (family : Index → RangeObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (inst_6.1 family) output ∧ inst_1.1 relation (inst.1 input output)) = inst_5.1 fun index => inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (family index) output ∧ inst_1.1 relation (inst.pair input output))

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

  (∀ relation ∈ RelationObject ∀ ambientDomain ∈ DomainObject), (Nat → RangeObject) → PreimageOf relation (HasCountableUnion.countableUnion family) ambientDomain = HasCountableUnion.countableUnion (fun index => PreimageOf relation (family index) ambientDomain)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ [inst_5 : LRA.Set.HasCountableUnion DomainObject] [inst_6 : LRA.Set.HasCountableUnion RangeObject] (relation : RelationObject) (family : Nat → RangeObject) (ambientDomain : DomainObject), inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (inst_6.1 family) output ∧ inst_1.1 relation (inst.1 input output)) = inst_5.1 fun index => inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 (family index) output ∧ inst_1.1 relation (inst.pair input output))

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

  (∀ first second ∈ RelationObject ∀ outputs ∈ RangeObject ∀ ambientDomain ∈ DomainObject), (∀ input ∈ Left output ∈ Right, Relates first input output ↔ Relates second input output) → PreimageOf first outputs ambientDomain = PreimageOf second outputs ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ (first second : RelationObject) (outputs : RangeObject) (ambientDomain : DomainObject), (∀ (input : Left) (output : Right), inst_1.1 first (inst.1 input output) ↔ inst_1.1 second (inst.1 input output)) → inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 outputs output ∧ inst_1.1 first (inst.1 input output)) = inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 outputs output ∧ inst_1.1 second (inst.1 input output))

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

  (∀ relation ∈ RelationObject ∀ left right ∈ RangeObject ∀ ambientDomain ∈ DomainObject), (∀ output : Right, output ∈ left ↔ output ∈ right) → PreimageOf relation left ambientDomain = PreimageOf relation right ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], (LRA.Set.SeparationLaws Left DomainObject ∧ LRA.Set.ExtensionalityLaw Left DomainObject) → ∀ (relation : RelationObject) (left right : RangeObject) (ambientDomain : DomainObject), (∀ (output : Right), inst_3.1 left output ↔ inst_3.1 right output) → inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 left output ∧ inst_1.1 relation (inst.1 input output)) = inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 right output ∧ inst_1.1 relation (inst.1 input output))

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

  (∀ first ∈ FirstObject ∀ second ∈ SecondObject ∀ composite ∈ CompositeObject ∀ inputs ∈ DomainObject ∀ ambientMid ∈ MidObject ∀ ambientRange ∈ RangeObject), (∀ input ∈ Left output ∈ Right, Relates composite input output ↔ ∃ middle ∈ Mid, Relates first input middle ∧ Relates second middle output) → ImageOf composite inputs ambientRange = ImageOf second (ImageOf first inputs ambientMid) ambientRange

Predicate logic (unfolded):

  ∀ {Left Mid Right FirstPair SecondPair CompositePair : Type u} {FirstObject SecondObject CompositeObject DomainObject MidObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Mid FirstPair] [inst_1 : LRA.Set.HasPairing Mid Right SecondPair] [inst_2 : LRA.Set.HasPairing Left Right CompositePair] [inst_3 : Membership FirstPair FirstObject] [inst_4 : Membership SecondPair SecondObject] [inst_5 : Membership CompositePair CompositeObject] [inst_6 : Membership Left DomainObject] [inst_7 : Membership Mid MidObject] [inst_8 : Membership Right RangeObject] [inst_9 : LRA.Set.HasSeparation Mid MidObject] [inst_10 : LRA.Set.HasSeparation Right RangeObject], LRA.Set.ExtensionalityLaw Right RangeObject → ∀ (first : FirstObject) (second : SecondObject) (composite : CompositeObject) (inputs : DomainObject) (ambientMid : MidObject) (ambientRange : RangeObject), (∀ (input : Left) (output : Right), inst_5.1 composite (inst_2.1 input output) ↔ Exists fun middle => (inst_3.1 first (inst.1 input middle) ∧ inst_4.1 second (inst_1.1 middle output))) → inst_10.1 ambientRange fun output => Exists fun input => (inst_6.1 inputs input ∧ inst_5.1 composite (inst_2.1 input output)) = inst_10.1 ambientRange fun output => Exists fun input => (inst_7.1 (inst_9.1 ambientMid fun output => Exists fun input => (inst_6.1 inputs input ∧ LRA.Set.OrderedPair input output ∈ first)) input ∧ inst_4.1 second (inst_1.1 input output))

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

  (∀ first ∈ FirstObject ∀ second ∈ SecondObject ∀ composite ∈ CompositeObject ∀ outputs ∈ RangeObject ∀ ambientDomain ∈ DomainObject ∀ ambientMid ∈ MidObject), (∀ input ∈ Left output ∈ Right, Relates composite input output ↔ ∃ middle ∈ Mid, Relates first input middle ∧ Relates second middle output) → PreimageOf composite outputs ambientDomain = PreimageOf first (PreimageOf second outputs ambientMid) ambientDomain

Predicate logic (unfolded):

  ∀ {Left Mid Right FirstPair SecondPair CompositePair : Type u} {FirstObject SecondObject CompositeObject DomainObject MidObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Mid FirstPair] [inst_1 : LRA.Set.HasPairing Mid Right SecondPair] [inst_2 : LRA.Set.HasPairing Left Right CompositePair] [inst_3 : Membership FirstPair FirstObject] [inst_4 : Membership SecondPair SecondObject] [inst_5 : Membership CompositePair CompositeObject] [inst_6 : Membership Left DomainObject] [inst_7 : Membership Mid MidObject] [inst_8 : Membership Right RangeObject] [inst_9 : LRA.Set.HasSeparation Left DomainObject] [inst_10 : LRA.Set.HasSeparation Mid MidObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (first : FirstObject) (second : SecondObject) (composite : CompositeObject) (outputs : RangeObject) (ambientDomain : DomainObject) (ambientMid : MidObject), (∀ (input : Left) (output : Right), inst_5.1 composite (inst_2.1 input output) ↔ Exists fun middle => (inst_3.1 first (inst.1 input middle) ∧ inst_4.1 second (inst_1.1 middle output))) → inst_9.1 ambientDomain fun input => Exists fun output => (inst_8.1 outputs output ∧ inst_5.1 composite (inst_2.1 input output)) = inst_9.1 ambientDomain fun input => Exists fun output => (inst_7.1 (inst_10.1 ambientMid fun input => Exists fun output => (inst_8.1 outputs output ∧ LRA.Set.OrderedPair input output ∈ second)) output ∧ inst_3.1 first (inst.1 input output))

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

  (∀ composite ∈ RelationObject ∀ smaller larger ∈ RangeObject ∀ ambientDomain ∈ DomainObject), PreimageOf composite smaller ambientDomain ⊆ PreimageOf composite larger ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] (a : Membership Left DomainObject) [inst_2 : Membership Right RangeObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject] [inst_4 : HasSubset DomainObject] [inst_5 : HasSubset RangeObject] (composite : RelationObject) (smaller larger : RangeObject) (ambientDomain : DomainObject), inst_5.1 smaller larger → inst_4.1 (inst_3.1 ambientDomain fun input => Exists fun output => (inst_2.1 smaller output ∧ inst_1.1 composite (inst.pair input output))) (inst_3.1 ambientDomain fun input => Exists fun output => (inst_2.1 larger output ∧ inst_1.1 composite (inst.pair input output)))

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

  (∀ identity ∈ RelationObject ∀ inputs ambientDomain ∈ DomainObject), (∀ leftElement rightElement : Left, Relates identity leftElement rightElement ↔ leftElement = rightElement ∧ ∀ input : Left, input ∈ inputs → input ∈ ambientDomain) → ImageOf identity inputs ambientDomain = inputs

Predicate logic (unfolded):

  ∀ {Left Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Left Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (identity : RelationObject) (inputs ambientDomain : DomainObject), (∀ (leftElement rightElement : Left), inst_1.1 identity (inst.1 leftElement rightElement) ↔ leftElement = rightElement ∧ ∀ (input : Left), inst_2.1 inputs input → inst_2.1 ambientDomain input) → inst_3.1 ambientDomain fun output => Exists fun input => (inst_2.1 inputs input ∧ inst_1.1 identity (inst.1 input output)) = inputs

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

  (∀ identity ∈ RelationObject ∀ outputs ambientDomain ∈ DomainObject), (∀ leftElement rightElement : Left, Relates identity leftElement rightElement ↔ leftElement = rightElement ∧ ∀ output : Left, output ∈ outputs → output ∈ ambientDomain) → PreimageOf identity outputs ambientDomain = outputs

Predicate logic (unfolded):

  ∀ {Left Pair : Type u} {RelationObject DomainObject : Type v} [inst : LRA.Set.HasPairing Left Left Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (identity : RelationObject) (outputs ambientDomain : DomainObject), (∀ (leftElement rightElement : Left), inst_1.1 identity (inst.1 leftElement rightElement) ↔ leftElement = rightElement ∧ ∀ (output : Left), inst_2.1 outputs output → inst_2.1 ambientDomain output) → inst_3.1 ambientDomain fun input => Exists fun output => (inst_2.1 outputs output ∧ inst_1.1 identity (inst.1 input output)) = outputs

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

  (∀ relation ∈ RelationObject ∀ outputs ∈ RangeObject ∀ output ∈ Right ∀ ambientDomain ∈ DomainObject), (∀ candidate : Right, candidate ∈ outputs ↔ candidate = output) → PreimageOf relation outputs ambientDomain = FiberOf relation output ambientDomain

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {RelationObject DomainObject RangeObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : Membership Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : LRA.Set.HasSeparation Left DomainObject], LRA.Set.ExtensionalityLaw Left DomainObject → ∀ (relation : RelationObject) (outputs : RangeObject) (output : Right) (ambientDomain : DomainObject), (∀ (candidate : Right), inst_3.1 outputs candidate ↔ candidate = output) → inst_4.1 ambientDomain fun input => Exists fun output => (inst_3.1 outputs output ∧ inst_1.1 relation (inst.1 input output)) = inst_4.1 ambientDomain fun input => inst_1.1 relation (inst.1 input output)

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

end RelationLaws

end LRA.Set
