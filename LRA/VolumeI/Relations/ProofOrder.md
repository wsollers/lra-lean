# Volume I Relations Proof Order

This checklist contains every Lean `theorem` declaration recursively under
`LRA/VolumeI/Relations`. Modules follow their import dependencies, and theorem
entries retain source order.

**Inventory:** 24 theorems in 6 modules.

## Ordering rules

1. Complete modules from top to bottom.
2. Within each module, complete entries from top to bottom.
3. Imported definitions and earlier theorem entries may be used in later proofs.
4. The equivalence-class results precede quotient-set and partition results.

## Theorem checklist

### 1. `Basic/Theorems.lean`

- [ ] **ConverseInvolutive** — Let a binary relation be given. Then taking its converse twice recovers the original relation. ([source](./Basic/Theorems.lean#L24))
- [ ] **ReflexiveConverseIff** — Let a binary relation be given. Then its converse is reflexive exactly when the original relation is reflexive. ([source](./Basic/Theorems.lean#L43))
- [ ] **IrreflexiveConverseIff** — Let a binary relation be given. Then its converse is irreflexive exactly when the original relation is irreflexive. ([source](./Basic/Theorems.lean#L62))
- [ ] **TransitiveConverseIff** — Let a binary relation be given. Then its converse is transitive exactly when the original relation is transitive. ([source](./Basic/Theorems.lean#L81))
- [ ] **AntisymmetricConverseIff** — Let a binary relation be given. Then its converse is antisymmetric exactly when the original relation is antisymmetric. ([source](./Basic/Theorems.lean#L100))
- [ ] **TotalConverseIff** — Let a binary relation be given. Then its converse is total exactly when the original relation is total. ([source](./Basic/Theorems.lean#L119))
- [ ] **DenseConverseIff** — Let a binary relation be given. Then its converse is dense exactly when the original relation is dense. ([source](./Basic/Theorems.lean#L138))

### 2. `Equivalence/EquivalenceClass.lean`

- [ ] **EquivalenceClassExists** — Let an ambient represented set, a relation, and a representative be given. Then the representative's equivalence class exists. ([source](./Equivalence/EquivalenceClass.lean#L94))
- [ ] **EquivalenceClassUnique** — Let an ambient represented set, a relation, and a representative be given. Then the representative's equivalence class is unique. ([source](./Equivalence/EquivalenceClass.lean#L121))
- [ ] **EquivalenceClassExistsAndUnique** — Let an ambient represented set, a relation, and a representative be given. Then there exists exactly one equivalence class satisfying the memberwise specification. ([source](./Equivalence/EquivalenceClass.lean#L148))
- [ ] **EquivalenceClassMembershipIff** — Let an ambient represented set, a relation, and two elements be given. Then membership in the constructed equivalence class is exactly ambient membership together with relatedness to the representative. ([source](./Equivalence/EquivalenceClass.lean#L174))
- [ ] **RelatedRepresentativesHaveSameEquivalenceClass** — Let an equivalence relation and two related representatives be given. Then they determine the same equivalence class in every ambient represented set. ([source](./Equivalence/EquivalenceClass.lean#L201))

### 3. `Equivalence/QuotientSet.lean`

- [ ] **QuotientSetExists** — Let an ambient represented set and a relation be given. Then the quotient set exists. ([source](./Equivalence/QuotientSet.lean#L119))
- [ ] **QuotientSetUnique** — Let an ambient represented set and a relation be given. Then the quotient set is uniquely determined by its memberwise specification. ([source](./Equivalence/QuotientSet.lean#L143))
- [ ] **QuotientSetExistsAndUnique** — Let an ambient represented set and a relation be given. Then there exists exactly one quotient set satisfying the memberwise specification. ([source](./Equivalence/QuotientSet.lean#L168))
- [ ] **QuotientSetMembership** — Let an ambient represented set, a relation, and a candidate block be given. Then membership in the quotient set is exactly being an induced equivalence class. ([source](./Equivalence/QuotientSet.lean#L195))
- [ ] **QuotientProjectionWellDefined** — Let an equivalence relation and two related representatives be given. Then the quotient projection assigns them the same class. ([source](./Equivalence/QuotientSet.lean#L280))
- [ ] **QuotientClassElementWellDefined** — Let an equivalence relation and two related representatives be given. Then their collection-facing quotient class elements are equal. ([source](./Equivalence/QuotientSet.lean#L311))

### 4. `Equivalence/Partition.lean`

- [ ] **PartitionBlockContained** — Let an ambient represented set, an equivalence relation, a carrier representative, and a candidate be given. Then membership in the representative's block implies ambient membership. ([source](./Equivalence/Partition.lean#L68))
- [ ] **EquivalenceClassesCoverAmbient** — Let an ambient represented set and an equivalence relation be given. Then every ambient member belongs to an indexed equivalence-class block. ([source](./Equivalence/Partition.lean#L97))
- [ ] **EquivalenceClassBlocksNonempty** — Let an ambient represented set and an equivalence relation be given. Then every indexed equivalence-class block is nonempty. ([source](./Equivalence/Partition.lean#L124))
- [ ] **EquivalenceClassBlocksDisjointOrEqual** — Let an ambient represented set and an equivalence relation be given. Then any two overlapping equivalence-class blocks are equal. ([source](./Equivalence/Partition.lean#L154))

### 5. `Equivalence/FundamentalTheorem.lean`

- [ ] **FundamentalTheoremOfEquivalenceRelations** — Let an ambient represented set and an equivalence relation be given. Then the partition into equivalence classes recovers the original relation on that carrier. ([source](./Equivalence/FundamentalTheorem.lean#L59))

### 6. `WellFounded/Theorems.lean`

- [ ] **MinimalElementPrinciple** — Let a well-founded relation and a nonempty represented subset be given. Then the subset has a minimal element. ([source](./WellFounded/Theorems.lean#L24))
