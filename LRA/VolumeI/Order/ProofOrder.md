# Volume I Order Proof Order

This checklist contains every Lean `theorem` declaration recursively under `LRA/VolumeI/Order`. Modules are ordered by their import dependencies, and theorems within each module retain source order.

Each entry is a human mathematical statement rather than a repetition of the Lean declaration. The prose introduces the ambient sets and structures with “Let …” and states the mathematical claim in ordinary terminology. The source link remains available for the exact formal signature and implementation-level capabilities.

**Inventory:** 339 theorems in 116 modules.

## Ordering rules

1. Complete modules from top to bottom.
2. Within each module, complete entries from top to bottom.
3. Imported definitions and earlier theorem entries may be used in later proofs.
4. Failure-mode theorems are proof obligations and remain in dependency order.

## Theorem checklist

### 1. `Bounds/UpperBound/Theorems.lean`

- [ ] **UpperBoundOfEmpty** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every element is vacuously an upper bound of the empty represented subset. ([source](./Bounds/UpperBound/Theorems.lean#L19))
- [ ] **UpperBoundOfSubcollection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an upper bound of a larger represented subset bounds every subcollection. ([source](./Bounds/UpperBound/Theorems.lean#L37))
- [ ] **UpperBoundOfUnion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a common upper bound of two represented subsets bounds their union. ([source](./Bounds/UpperBound/Theorems.lean#L53))
- [ ] **UpperBoundOfUnionIff** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an element is an upper bound of the union of two subsets if and only if it is an upper bound of each subset separately. ([source](./Bounds/UpperBound/Theorems.lean#L79))
- [ ] **UpperBoundOfIntersection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an upper bound of either set is an upper bound of their intersection. ([source](./Bounds/UpperBound/Theorems.lean#L110))
- [ ] **UpperBoundOfDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every upper bound of a set bounds each represented relative difference. ([source](./Bounds/UpperBound/Theorems.lean#L125))
- [ ] **UpperBoundOfSymmetricDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a common upper bound of two sets bounds their symmetric difference. ([source](./Bounds/UpperBound/Theorems.lean#L144))
- [ ] **UpperBoundOfIndexedUnionIff** — Let \(P\) be a set, \(I\) be an index set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an element bounds an indexed union above exactly when it bounds every member of the family above. ([source](./Bounds/UpperBound/Theorems.lean#L167))
- [ ] **UpperBoundOfIndexedIntersection** — Let \(P\) be a set, \(I\) be an index set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an upper bound of any selected family member bounds the indexed intersection above. ([source](./Bounds/UpperBound/Theorems.lean#L187))

### 2. `Bounds/BoundedAbove/Theorems.lean`

- [ ] **BoundedAboveOfSubcollection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then every represented subcollection of a bounded-above set is bounded above. ([source](./Bounds/BoundedAbove/Theorems.lean#L13))
- [ ] **UnionBoundedAboveIffPiecesBoundedAbove** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then in a transitive total order, a union is bounded above exactly when both pieces are. ([source](./Bounds/BoundedAbove/Theorems.lean#L24))
- [ ] **IntersectionBoundedAbove** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then an intersection is bounded above whenever either constituent is. ([source](./Bounds/BoundedAbove/Theorems.lean#L40))
- [ ] **DifferenceBoundedAbove** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then a relative difference inherits boundedness above from its left operand. ([source](./Bounds/BoundedAbove/Theorems.lean#L55))
- [ ] **SymmetricDifferenceBoundedAbove** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then a symmetric difference is bounded above when both operands are. ([source](./Bounds/BoundedAbove/Theorems.lean#L74))

### 3. `Bounds/LowerBound/Theorems.lean`

- [ ] **LowerBoundOfEmpty** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every element is vacuously a lower bound of the empty represented subset. ([source](./Bounds/LowerBound/Theorems.lean#L19))
- [ ] **LowerBoundOfSubcollection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a lower bound of a larger represented subset bounds every subcollection. ([source](./Bounds/LowerBound/Theorems.lean#L31))
- [ ] **LowerBoundOfUnion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a common lower bound of two represented subsets bounds their union. ([source](./Bounds/LowerBound/Theorems.lean#L42))
- [ ] **LowerBoundOfUnionIff** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an element is a lower bound of the union of two subsets if and only if it is a lower bound of each subset separately. ([source](./Bounds/LowerBound/Theorems.lean#L56))
- [ ] **LowerBoundOfIntersection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a lower bound of either set is a lower bound of their intersection. ([source](./Bounds/LowerBound/Theorems.lean#L70))
- [ ] **LowerBoundOfDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every lower bound of a set bounds each represented relative difference. ([source](./Bounds/LowerBound/Theorems.lean#L85))
- [ ] **LowerBoundOfSymmetricDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a common lower bound of two sets bounds their symmetric difference. ([source](./Bounds/LowerBound/Theorems.lean#L104))
- [ ] **LowerBoundOfIndexedUnionIff** — Let \(P\) be a set, \(I\) be an index set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an element bounds an indexed union below exactly when it bounds every member of the family below. ([source](./Bounds/LowerBound/Theorems.lean#L127))
- [ ] **LowerBoundOfIndexedIntersection** — Let \(P\) be a set, \(I\) be an index set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a lower bound of any selected family member bounds the indexed intersection below. ([source](./Bounds/LowerBound/Theorems.lean#L147))

### 4. `Bounds/BoundedBelow/Theorems.lean`

- [ ] **BoundedBelowOfSubcollection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then every represented subcollection of a bounded-below set is bounded below. ([source](./Bounds/BoundedBelow/Theorems.lean#L13))
- [ ] **UnionBoundedBelowIffPiecesBoundedBelow** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then in a transitive total order, a union is bounded below exactly when both pieces are. ([source](./Bounds/BoundedBelow/Theorems.lean#L24))
- [ ] **IntersectionBoundedBelow** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then an intersection is bounded below whenever either constituent is. ([source](./Bounds/BoundedBelow/Theorems.lean#L40))
- [ ] **DifferenceBoundedBelow** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then a relative difference inherits boundedness below from its left operand. ([source](./Bounds/BoundedBelow/Theorems.lean#L55))
- [ ] **SymmetricDifferenceBoundedBelow** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then a symmetric difference is bounded below when both operands are. ([source](./Bounds/BoundedBelow/Theorems.lean#L74))

### 5. `Bounds/Bounded/Theorems.lean`

- [ ] **BoundedOfSubcollection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then every represented subcollection of a bounded set is bounded. ([source](./Bounds/Bounded/Theorems.lean#L12))
- [ ] **UnionBoundedIffPiecesBounded** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then in a transitive total order, a union is bounded exactly when both pieces are. ([source](./Bounds/Bounded/Theorems.lean#L23))
- [ ] **IntersectionBounded** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then an intersection is bounded whenever either constituent is bounded. ([source](./Bounds/Bounded/Theorems.lean#L38))
- [ ] **DifferenceBounded** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then a relative difference inherits boundedness from its left operand. ([source](./Bounds/Bounded/Theorems.lean#L52))
- [ ] **SymmetricDifferenceBounded** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then a symmetric difference is bounded when both operands are bounded. ([source](./Bounds/Bounded/Theorems.lean#L71))

### 6. `Bounds/Bounded/FailureModes.lean`

- [ ] **IntegerUniverseFailsBounded** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the integers are not bounded in their usual order. ([source](./Bounds/Bounded/FailureModes.lean#L37))
- [ ] **EveryBoundedRealSetHasUnboundedComplement** — Let \(\mathbb R\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the complement of every bounded predicate subset of the real line is unbounded both above and below. ([source](./Bounds/Bounded/FailureModes.lean#L68))

### 7. `Bounds/BoundedAbove/FailureModes.lean`

- [ ] **IntegerUniverseFailsBoundedAbove** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the integers are not bounded above in their usual order. ([source](./Bounds/BoundedAbove/FailureModes.lean#L31))

### 8. `Bounds/BoundedBelow/FailureModes.lean`

- [ ] **IntegerUniverseFailsBoundedBelow** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the integers are not bounded below in their usual order. ([source](./Bounds/BoundedBelow/FailureModes.lean#L31))

### 9. `Bounds/BoundSets/Theorems.lean`

- [ ] **UpperBoundsMembership** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then membership in the represented upper-bound set is exactly the upper-bound predicate. ([source](./Bounds/BoundSets/Theorems.lean#L33))
- [ ] **LowerBoundsMembership** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then membership in the represented lower-bound set is exactly the lower-bound predicate. ([source](./Bounds/BoundSets/Theorems.lean#L48))
- [ ] **UpperBoundsAntitoneUnderInclusion** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then enlarging a represented subset can only shrink its set of upper bounds. ([source](./Bounds/BoundSets/Theorems.lean#L63))
- [ ] **LowerBoundsAntitoneUnderInclusion** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then enlarging a represented subset can only shrink its set of lower bounds. ([source](./Bounds/BoundSets/Theorems.lean#L78))
- [ ] **UpperBoundsOfEmpty** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then every element vacuously bounds the empty represented subset above. ([source](./Bounds/BoundSets/Theorems.lean#L92))
- [ ] **LowerBoundsOfEmpty** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then every element vacuously bounds the empty represented subset below. ([source](./Bounds/BoundSets/Theorems.lean#L105))
- [ ] **UpperBoundsOfIndexedUnion** — Let the displayed ordered structure be given, \(I\) be an index set, equip that structure with the binary relation used in the theorem. Then the upper bounds of an indexed union are the indexed intersection of the upper-bound sets of its members. ([source](./Bounds/BoundSets/Theorems.lean#L137))
- [ ] **LowerBoundsOfIndexedUnion** — Let the displayed ordered structure be given, \(I\) be an index set, equip that structure with the binary relation used in the theorem. Then the lower bounds of an indexed union are the indexed intersection of the lower-bound sets of its members. ([source](./Bounds/BoundSets/Theorems.lean#L154))
- [ ] **IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection** — Let the displayed ordered structure be given, \(I\) be an index set, equip that structure with the binary relation used in the theorem. Then every bound that bounds at least one member of a family above also bounds the indexed intersection above. ([source](./Bounds/BoundSets/Theorems.lean#L171))
- [ ] **IndexedUnionOfLowerBoundsContainedInLowerBoundsOfIntersection** — Let the displayed ordered structure be given, \(I\) be an index set, equip that structure with the binary relation used in the theorem. Then every bound that bounds at least one member of a family below also bounds the indexed intersection below. ([source](./Bounds/BoundSets/Theorems.lean#L189))

### 10. `Bounds/BoundSets/FailureModes.lean`

- [ ] **IntegerSingletonsWitnessUpperBoundsIntersectionFailure** — Let \(\mathbb Z\), the two-element Boolean set carry their displayed structures, the subsets occurring below be subsets of the relevant carrier. Then the disjoint singleton integer family shows that upper bounds of an indexed intersection can strictly exceed the union of the memberwise upper-bound sets. ([source](./Bounds/BoundSets/FailureModes.lean#L40))
- [ ] **IntegerSingletonsWitnessLowerBoundsIntersectionFailure** — Let \(\mathbb Z\), the two-element Boolean set carry their displayed structures, the subsets occurring below be subsets of the relevant carrier. Then the disjoint singleton integer family shows that lower bounds of an indexed intersection can strictly exceed the union of the memberwise lower-bound sets. ([source](./Bounds/BoundSets/FailureModes.lean#L74))
- [ ] **DisjointIntegerSingletonsCreateVacuousBounds** — Let \(\mathbb Z\), the two-element Boolean set carry their displayed structures, the subsets occurring below be subsets of the relevant carrier. Then the indexed intersection of the singleton integer sets {0} and {1} is empty, so every integer vacuously bounds it above and below. ([source](./Bounds/BoundSets/FailureModes.lean#L110))

### 11. `Bounds/BoundSets/Relationships.lean`

- [ ] **SubsetOfLowerBoundsOfUpperBounds** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then every represented subset is contained in the lower bounds of all of its upper bounds. ([source](./Bounds/BoundSets/Relationships.lean#L31))
- [ ] **SubsetOfUpperBoundsOfLowerBounds** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then every represented subset is contained in the upper bounds of all of its lower bounds. ([source](./Bounds/BoundSets/Relationships.lean#L45))
- [ ] **UpperBoundsLowerBoundsUpperBounds** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then applying upper, lower, and upper-bound formation in succession returns the original upper-bound set. ([source](./Bounds/BoundSets/Relationships.lean#L59))
- [ ] **LowerBoundsUpperBoundsLowerBounds** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then applying lower, upper, and lower-bound formation in succession returns the original lower-bound set. ([source](./Bounds/BoundSets/Relationships.lean#L75))
- [ ] **LowerUpperClosureIsExtensive** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then lower-upper closure contains the represented subset. ([source](./Bounds/BoundSets/Relationships.lean#L90))
- [ ] **LowerUpperClosureIsMonotone** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then lower-upper closure preserves represented subset inclusion. ([source](./Bounds/BoundSets/Relationships.lean#L103))
- [ ] **LowerUpperClosureIsIdempotent** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then applying lower-upper closure twice has the same effect as applying it once. ([source](./Bounds/BoundSets/Relationships.lean#L119))
- [ ] **UpperLowerClosureIsExtensive** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then upper-lower closure contains the represented subset. ([source](./Bounds/BoundSets/Relationships.lean#L133))
- [ ] **UpperLowerClosureIsMonotone** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then upper-lower closure preserves represented subset inclusion. ([source](./Bounds/BoundSets/Relationships.lean#L146))
- [ ] **UpperLowerClosureIsIdempotent** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then applying upper-lower closure twice has the same effect as applying it once. ([source](./Bounds/BoundSets/Relationships.lean#L162))

### 12. `Bounds/GreatestElement/FailureModes.lean`

- [ ] **OneFailsGreatestElementOfOpenUnitInterval** — Let \(\mathbb R\) carry the operations and order used here. Then the endpoint one is not a greatest element because it is omitted. ([source](./Bounds/GreatestElement/FailureModes.lean#L32))

### 13. `Bounds/GreatestElement/Relationships.lean`

- [ ] **GreatestElementIsMaximal** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in an antisymmetric relation, every greatest element is maximal. ([source](./Bounds/GreatestElement/Relationships.lean#L12))
- [ ] **GreatestElementIsUniqueMaximalElement** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a greatest element is the unique maximal element of its represented subset. ([source](./Bounds/GreatestElement/Relationships.lean#L23))
- [ ] **MaximalElementIsGreatestInLinearOrder** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in a linear order, every maximal element is greatest. ([source](./Bounds/GreatestElement/Relationships.lean#L35))
- [ ] **GreatestElementIsSupremum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a greatest element is a supremum. ([source](./Bounds/GreatestElement/Relationships.lean#L46))
- [ ] **GreatestElementIffSupremumAndMembership** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then being greatest is equivalent to being a supremum that belongs to the subset. ([source](./Bounds/GreatestElement/Relationships.lean#L56))

### 14. `Bounds/MaximalElement/MathlibAdapters.lean`

- [ ] **NonemptyFiniteSubsetHasMaximalElement** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(\preceq\) be a binary relation on \(P\). Then every nonempty finite predicate subset of a partial order has a maximal element. ([source](./Bounds/MaximalElement/MathlibAdapters.lean#L12))

### 15. `Bounds/GreatestElement/MathlibAdapters.lean`

- [ ] **NonemptyFiniteSubsetHasGreatestElement** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(\preceq\) be a binary relation on \(P\). Then every nonempty finite predicate subset of a linear order has a greatest element. ([source](./Bounds/GreatestElement/MathlibAdapters.lean#L16))

### 16. `Bounds/GreatestElement/Theorems.lean`

- [ ] **GreatestElementUnique** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then antisymmetry makes a greatest element unique. ([source](./Bounds/GreatestElement/Theorems.lean#L12))
- [ ] **GreatestElementRetainedByIntersection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a greatest element remains greatest in an intersection that retains it. ([source](./Bounds/GreatestElement/Theorems.lean#L30))
- [ ] **GreatestElementRetainedByDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a greatest element remains greatest after a deletion that does not remove it. ([source](./Bounds/GreatestElement/Theorems.lean#L50))
- [ ] **GreatestElementRetainedBySymmetricDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a greatest element of the union remains greatest in a symmetric difference that retains it. ([source](./Bounds/GreatestElement/Theorems.lean#L70))
- [ ] **GreatestElementOfUnion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a greatest element of one operand that bounds the other is greatest in the union. ([source](./Bounds/GreatestElement/Theorems.lean#L92))

### 17. `Bounds/GreatestLowerBoundProperty/FailureModes.lean`

- [ ] **RationalOrderFailsGreatestLowerBoundProperty** — Let the displayed ordered structure be given, the subsets occurring below be subsets of the relevant carrier. Then the rationals fail the greatest-lower-bound property. ([source](./Bounds/GreatestLowerBoundProperty/FailureModes.lean#L31))

### 18. `Bounds/Infimum/Theorems.lean`

- [ ] **InfimumUnique** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then antisymmetry makes an infimum unique. ([source](./Bounds/Infimum/Theorems.lean#L15))
- [ ] **InfimumOfSingleton** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in a reflexive relation, an element is an infimum of its represented singleton. ([source](./Bounds/Infimum/Theorems.lean#L34))
- [ ] **InfimumIsLowerBound** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an infimum is a lower bound of the represented subset. ([source](./Bounds/Infimum/Theorems.lean#L47))
- [ ] **EveryLowerBoundRelatedToInfimum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every lower bound of a represented subset lies below its infimum. ([source](./Bounds/Infimum/Theorems.lean#L57))
- [ ] **LowerBoundIffRelatedToInfimum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then once an infimum exists, lower bounds are exactly the elements below it. ([source](./Bounds/Infimum/Theorems.lean#L68))
- [ ] **InfimumMonotoneUnderInclusion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then infima are antitone under inclusion of represented subsets. ([source](./Bounds/Infimum/Theorems.lean#L79))
- [ ] **InfimaCompareUnderPointwiseDomination** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then pointwise domination of one represented subset by another compares their infima. ([source](./Bounds/Infimum/Theorems.lean#L91))
- [ ] **InfimumInSubsetIsLeastElement** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an infimum that belongs to its subset is the least element. ([source](./Bounds/Infimum/Theorems.lean#L107))
- [ ] **InfimumOfUnion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\), \(c\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the meet of two existing infima is the infimum of their union. ([source](./Bounds/Infimum/Theorems.lean#L118))
- [ ] **ContainingInfimumRelatedToInfimumOfIntersection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the infimum of either containing operand is below the infimum of their intersection. ([source](./Bounds/Infimum/Theorems.lean#L142))
- [ ] **ContainingInfimumRelatedToInfimumOfDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the infimum of a set is below the infimum of each relative difference. ([source](./Bounds/Infimum/Theorems.lean#L164))
- [ ] **UnionInfimumRelatedToInfimumOfSymmetricDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the infimum of a union is below the infimum of its symmetric difference. ([source](./Bounds/Infimum/Theorems.lean#L184))
- [ ] **InfimumOfIndexedUnion** — Let \(P\) be a set, \(I\) be an index set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then infima of all family members, together with their greatest common lower bound, assemble into the infimum of the indexed union. ([source](./Bounds/Infimum/Theorems.lean#L207))

### 19. `Bounds/GreatestLowerBoundProperty/Theorems.lean`

- [ ] **GreatestLowerBoundPropertyGivesUniqueInfimum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then the greatest-lower-bound property gives a unique infimum in an antisymmetric relation. ([source](./Bounds/GreatestLowerBoundProperty/Theorems.lean#L9))

### 20. `Bounds/Infimum/FailureModes.lean`

- [ ] **EmptyIntegerSetFailsInfimum** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the empty set has no infimum in the integers, which have no top element. ([source](./Bounds/Infimum/FailureModes.lean#L31))
- [ ] **IntegerSingletonComplementHasNoInfimum** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then complementation has no general infimum formula: {0} has infimum 0, while its integer complement is unbounded below and has no integer infimum. ([source](./Bounds/Infimum/FailureModes.lean#L58))
- [ ] **IntegerSingletonDifferenceHasNoInfimum** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the two operand infima do not determine an infimum of their difference: {0} \ {0} is empty. ([source](./Bounds/Infimum/FailureModes.lean#L84))

### 21. `Bounds/Infimum/Relationships.lean`

- [ ] **InfimumOfConverseIffSupremum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then infima in the converse relation are suprema in the original relation. ([source](./Bounds/Infimum/Relationships.lean#L11))
- [ ] **InfimumOfEmptyIffTop** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a candidate is the infimum of the empty set exactly when it is a top element. ([source](./Bounds/Infimum/Relationships.lean#L21))
- [ ] **InfimumIffSupremumOfLowerBounds** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then an infimum is equivalently the supremum of the represented set of lower bounds. ([source](./Bounds/Infimum/Relationships.lean#L34))

### 22. `Bounds/LeastElement/FailureModes.lean`

- [ ] **ZeroFailsLeastElementOfOpenUnitInterval** — Let \(\mathbb R\) carry the operations and order used here. Then the endpoint zero is not a least element because it is omitted. ([source](./Bounds/LeastElement/FailureModes.lean#L32))

### 23. `Bounds/LeastElement/Relationships.lean`

- [ ] **LeastElementIsMinimal** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in an antisymmetric relation, every least element is minimal. ([source](./Bounds/LeastElement/Relationships.lean#L13))
- [ ] **LeastElementIsUniqueMinimalElement** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a least element is the unique minimal element of its represented subset. ([source](./Bounds/LeastElement/Relationships.lean#L24))
- [ ] **MinimalElementIsLeastInLinearOrder** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in a linear order, every minimal element is least. ([source](./Bounds/LeastElement/Relationships.lean#L36))
- [ ] **LeastElementIsInfimum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a least element is an infimum. ([source](./Bounds/LeastElement/Relationships.lean#L47))
- [ ] **LeastElementIffInfimumAndMembership** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then being least is equivalent to being an infimum that belongs to the subset. ([source](./Bounds/LeastElement/Relationships.lean#L57))

### 24. `Bounds/MinimalElement/MathlibAdapters.lean`

- [ ] **NonemptyFiniteSubsetHasMinimalElement** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(\preceq\) be a binary relation on \(P\). Then every nonempty finite predicate subset of a partial order has a minimal element. ([source](./Bounds/MinimalElement/MathlibAdapters.lean#L12))

### 25. `Bounds/LeastElement/MathlibAdapters.lean`

- [ ] **NonemptyFiniteSubsetHasLeastElement** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(\preceq\) be a binary relation on \(P\). Then every nonempty finite predicate subset of a linear order has a least element. ([source](./Bounds/LeastElement/MathlibAdapters.lean#L16))

### 26. `Bounds/LeastElement/Theorems.lean`

- [ ] **LeastElementUnique** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then antisymmetry makes a least element unique. ([source](./Bounds/LeastElement/Theorems.lean#L12))
- [ ] **LeastElementRetainedByIntersection** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a least element remains least in an intersection that retains it. ([source](./Bounds/LeastElement/Theorems.lean#L30))
- [ ] **LeastElementRetainedByDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a least element remains least after a deletion that does not remove it. ([source](./Bounds/LeastElement/Theorems.lean#L50))
- [ ] **LeastElementRetainedBySymmetricDifference** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a least element of the union remains least in a symmetric difference that retains it. ([source](./Bounds/LeastElement/Theorems.lean#L70))
- [ ] **LeastElementOfUnion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a least element of one operand that bounds the other is least in the union. ([source](./Bounds/LeastElement/Theorems.lean#L91))

### 27. `Bounds/LeastUpperBoundProperty/FailureModes.lean`

- [ ] **RationalOrderFailsLeastUpperBoundProperty** — Let the displayed ordered structure be given, the subsets occurring below be subsets of the relevant carrier. Then the rationals fail the least-upper-bound property. ([source](./Bounds/LeastUpperBoundProperty/FailureModes.lean#L31))

### 28. `Bounds/Supremum/Theorems.lean`

- [ ] **SupremumUnique** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then antisymmetry makes a supremum unique. ([source](./Bounds/Supremum/Theorems.lean#L15))
- [ ] **SupremumOfSingleton** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in a reflexive relation, an element is a supremum of its represented singleton. ([source](./Bounds/Supremum/Theorems.lean#L34))
- [ ] **SupremumIsUpperBound** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a supremum is an upper bound of the represented subset. ([source](./Bounds/Supremum/Theorems.lean#L47))
- [ ] **SupremumRelatedToEveryUpperBound** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a supremum lies below every upper bound of the represented subset. ([source](./Bounds/Supremum/Theorems.lean#L57))
- [ ] **UpperBoundIffSupremumRelated** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then once a supremum exists, upper bounds are exactly the elements above it. ([source](./Bounds/Supremum/Theorems.lean#L68))
- [ ] **SupremumMonotoneUnderInclusion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then suprema are monotone under inclusion of represented subsets. ([source](./Bounds/Supremum/Theorems.lean#L79))
- [ ] **SupremaCompareUnderPointwiseDomination** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then pointwise domination of one represented subset by another compares their suprema. ([source](./Bounds/Supremum/Theorems.lean#L93))
- [ ] **SupremumInSubsetIsGreatestElement** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a supremum that belongs to its subset is the greatest element. ([source](./Bounds/Supremum/Theorems.lean#L111))
- [ ] **SupremumOfUnion** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\), \(c\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the join of two existing suprema is the supremum of their union. ([source](./Bounds/Supremum/Theorems.lean#L122))
- [ ] **SupremumOfIntersectionRelatedToContainingSupremum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the supremum of an intersection is below the supremum of either containing operand. ([source](./Bounds/Supremum/Theorems.lean#L148))
- [ ] **SupremumOfDifferenceRelatedToContainingSupremum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the supremum of a relative difference is below the supremum of its left operand. ([source](./Bounds/Supremum/Theorems.lean#L171))
- [ ] **SupremumOfSymmetricDifferenceRelatedToUnionSupremum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(A\), \(B\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the supremum of a symmetric difference is below the supremum of the union. ([source](./Bounds/Supremum/Theorems.lean#L191))
- [ ] **SupremumOfIndexedUnion** — Let \(P\) be a set, \(I\) be an index set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then suprema of all family members, together with their least common upper bound, assemble into the supremum of the indexed union. ([source](./Bounds/Supremum/Theorems.lean#L215))

### 29. `Bounds/LeastUpperBoundProperty/Theorems.lean`

- [ ] **LeastUpperBoundPropertyGivesUniqueSupremum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then the least-upper-bound property gives a unique supremum in an antisymmetric relation. ([source](./Bounds/LeastUpperBoundProperty/Theorems.lean#L9))

### 30. `Bounds/LowerBound/FailureModes.lean`

- [ ] **OneFailsLowerBoundOfOpenUnitInterval** — Let \(\mathbb R\) carry the operations and order used here. Then one fails as a lower bound of the open unit interval. ([source](./Bounds/LowerBound/FailureModes.lean#L32))

### 31. `Bounds/LowerBound/Relationships.lean`

- [ ] **LowerBoundOfConverseIffUpperBound** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then lower bounds in the converse relation are upper bounds in the original. ([source](./Bounds/LowerBound/Relationships.lean#L9))

### 32. `Bounds/MaximalElement/FailureModes.lean`

- [ ] **BooleanAntichainHasDistinctMaximalElementsButNoGreatest** — Let the two-element Boolean set carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then in the two-element antichain, both distinct elements are maximal but neither is greatest. ([source](./Bounds/MaximalElement/FailureModes.lean#L35))

### 33. `Bounds/MaximalElement/Relationships.lean`

- [ ] **MaximalElementOfConverseIffMinimalElement** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then maximal elements for the converse are minimal elements for the original. ([source](./Bounds/MaximalElement/Relationships.lean#L9))

### 34. `Bounds/MinimalElement/FailureModes.lean`

- [ ] **BooleanAntichainHasDistinctMinimalElementsButNoLeast** — Let the two-element Boolean set carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then in the two-element antichain, both distinct elements are minimal but neither is least. ([source](./Bounds/MinimalElement/FailureModes.lean#L35))

### 35. `Bounds/MinimalElement/Relationships.lean`

- [ ] **MinimalElementOfConverseIffMaximalElement** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then minimal elements for the converse are maximal elements for the original. ([source](./Bounds/MinimalElement/Relationships.lean#L9))

### 36. `Bounds/Supremum/FailureModes.lean`

- [ ] **SupremaNeedNotBeUniqueInPreorder** — Let the two-element Boolean set carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then antisymmetry is necessary for uniqueness; in the universal Boolean preorder both distinct elements are suprema of the full subset. ([source](./Bounds/Supremum/FailureModes.lean#L34))
- [ ] **IntegerSingletonComplementHasNoSupremum** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then complementation has no general supremum formula: {0} has supremum 0, while its integer complement is unbounded above and has no integer supremum. ([source](./Bounds/Supremum/FailureModes.lean#L61))
- [ ] **IntegerSingletonDifferenceHasNoSupremum** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the two operand suprema do not determine a supremum of their difference: {0} \ {0} is empty. ([source](./Bounds/Supremum/FailureModes.lean#L87))

### 37. `Bounds/Supremum/Relationships.lean`

- [ ] **SupremumOfConverseIffInfimum** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then suprema in the converse relation are infima in the original relation. ([source](./Bounds/Supremum/Relationships.lean#L12))
- [ ] **SupremumOfEmptyIffBottom** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a candidate is the supremum of the empty set exactly when it is a bottom element. ([source](./Bounds/Supremum/Relationships.lean#L22))
- [ ] **SupremumIffInfimumOfUpperBounds** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a supremum is equivalently the infimum of the represented set of upper bounds. ([source](./Bounds/Supremum/Relationships.lean#L35))
- [ ] **InfimumRelatedToSupremumOfNonemptySubset** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then for a nonempty represented subset, every infimum lies below every supremum. ([source](./Bounds/Supremum/Relationships.lean#L49))

### 38. `Bounds/UpperBound/FailureModes.lean`

- [ ] **ZeroFailsUpperBoundOfOpenUnitInterval** — Let \(\mathbb R\) carry the operations and order used here. Then zero fails as an upper bound of the open unit interval. ([source](./Bounds/UpperBound/FailureModes.lean#L32))

### 39. `Bounds/UpperBound/Relationships.lean`

- [ ] **UpperBoundOfConverseIffLowerBound** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then upper bounds in the converse relation are lower bounds in the original. ([source](./Bounds/UpperBound/Relationships.lean#L9))

### 40. `Constructions/LexicographicOrder/Theorems.lean`

- [ ] **LexicographicProductIsStrictLinearOrder** — Let \(P\), \(Q\) be sets, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively. Then the lexicographic product of strict linear orders is strict linear. ([source](./Constructions/LexicographicOrder/Theorems.lean#L9))

### 41. `Constructions/ProductOrder/FailureModes.lean`

- [ ] **ProductOfLinearOrdersNeedNotBeLinear** — Let \(\mathbb N\) carry the operations and order used here. Then product orders need not be linear, even when both factors are linear. ([source](./Constructions/ProductOrder/FailureModes.lean#L29))

### 42. `Constructions/ProductOrder/Theorems.lean`

- [ ] **ProductOfPartialOrdersIsPartialOrder** — Let \(P\), \(Q\) be sets, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively. Then the product of two partial orders is a partial order. ([source](./Constructions/ProductOrder/Theorems.lean#L9))

### 43. `Relations/CoverRelation/Theorems.lean`

- [ ] **CoverRelationImpliesStrictRelation** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every cover pair is related by the underlying strict relation. ([source](./Relations/CoverRelation/Theorems.lean#L8))

### 44. `Relations/GreaterThan/Relationships.lean`

- [ ] **GreaterThanIsPartialOrderIff** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then partial-order laws are invariant under reversing the relation. ([source](./Relations/GreaterThan/Relationships.lean#L12))
- [ ] **GreaterThanIsStrictOrderIff** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then strict-order laws are invariant under reversing the relation. ([source](./Relations/GreaterThan/Relationships.lean#L19))
- [ ] **GreaterThanIsLinearOrderIff** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then linear-order laws are invariant under reversing the relation. ([source](./Relations/GreaterThan/Relationships.lean#L26))
- [ ] **GreaterThanIsStrictLinearOrderIff** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then strict-linear-order laws are invariant under reversing the relation. ([source](./Relations/GreaterThan/Relationships.lean#L33))

### 45. `Relations/GreaterThanOrEqual/Relationships.lean`

- [ ] **GreaterThanOrEqualIsConverseOfLessThanOrEqual** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then reversing an adjoined-equality relation gives greater-than-or-equal. ([source](./Relations/GreaterThanOrEqual/Relationships.lean#L9))

### 46. `Density/DenseLinearOrder/FailureModes.lean`

- [ ] **IntegerStrictOrderIsNotDenseLinearOrder** — Let \(\mathbb Z\) carry the operations and order used here. Then the integer strict order is linear but not dense. ([source](./Density/DenseLinearOrder/FailureModes.lean#L26))

### 47. `Density/DenseOrder/FailureModes.lean`

- [ ] **ReflexiveRelationIsRawDense** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every reflexive relation satisfies the raw density predicate by choosing the left endpoint as the middle witness. ([source](./Density/DenseOrder/FailureModes.lean#L28))

### 48. `Density/DenseOrder/Theorems.lean`

- [ ] **DenseOrderOfStrictPartIffDense** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then for a partial order, density of its strict part is exactly dense order. ([source](./Density/DenseOrder/Theorems.lean#L11))
- [ ] **DenseOrderHasNoCovers** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then a dense strict order has no cover pairs and hence no Hasse edges. ([source](./Density/DenseOrder/Theorems.lean#L20))

### 49. `Directedness/Chain/FailureModes.lean`

- [ ] **TwoAndThreeFailDivisibilityChain** — Let \(\mathbb N\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then two and three are incomparable by divisibility, so their represented subset is not a chain. ([source](./Directedness/Chain/FailureModes.lean#L33))

### 50. `Directedness/Chain/Relationships.lean`

- [ ] **NonemptyChainIsDirected** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then every nonempty chain for a reflexive relation is directed. ([source](./Directedness/Chain/Relationships.lean#L9))

### 51. `Directedness/Directed/FailureModes.lean`

- [ ] **DirectedDoesNotImplyChain** — Let \(\mathbb N\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the divisibility-directed subset {2, 3, 6} is not a chain. ([source](./Directedness/Directed/FailureModes.lean#L46))
- [ ] **SubsetOfDirectedSetNeedNotBeDirected** — Let \(\mathbb N\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier, equip that structure with the binary relation used in the theorem. Then a represented subset of a directed set need not itself be directed. ([source](./Directedness/Directed/FailureModes.lean#L59))

### 52. `Directedness/Directed/Theorems.lean`

- [ ] **MaximalElementOfDirectedSubsetIsGreatest** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a maximal element of a directed subset of a partial order is greatest. ([source](./Directedness/Directed/Theorems.lean#L13))
- [ ] **ProductOfDirectedSubsetsIsDirected** — Let \(P\), \(Q\), \(R\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(A\), \(B\) be represented subsets of the appropriate carriers, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively. Then the coordinatewise product of two directed represented subsets is directed. ([source](./Directedness/Directed/Theorems.lean#L26))

### 53. `Interoperability/Mathlib/Bounds.lean`

- [ ] **upperBound_iff_mem_upperBounds** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(a\) belong to \(P\). Then LRA upper bounds specialize to Mathlib's upperBounds. ([source](./Interoperability/Mathlib/Bounds.lean#L37))
- [ ] **lowerBound_iff_mem_lowerBounds** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(a\) belong to \(P\). Then LRA lower bounds specialize to Mathlib's lowerBounds. ([source](./Interoperability/Mathlib/Bounds.lean#L44))
- [ ] **leastElement_iff_isLeast** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(a\) belong to \(P\). Then LRA least elements specialize to Mathlib's IsLeast. ([source](./Interoperability/Mathlib/Bounds.lean#L51))
- [ ] **greatestElement_iff_isGreatest** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(a\) belong to \(P\). Then LRA greatest elements specialize to Mathlib's IsGreatest. ([source](./Interoperability/Mathlib/Bounds.lean#L58))
- [ ] **supremum_iff_isLUB** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(a\) belong to \(P\). Then LRA suprema specialize to Mathlib's IsLUB. ([source](./Interoperability/Mathlib/Bounds.lean#L65))
- [ ] **infimum_iff_isGLB** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(a\) belong to \(P\). Then LRA infima specialize to Mathlib's IsGLB. ([source](./Interoperability/Mathlib/Bounds.lean#L72))
- [ ] **boundedAbove_iff_bddAbove** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier. Then LRA bounded-above subsets specialize to Mathlib's BddAbove. ([source](./Interoperability/Mathlib/Bounds.lean#L79))
- [ ] **boundedBelow_iff_bddBelow** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier. Then LRA bounded-below subsets specialize to Mathlib's BddBelow. ([source](./Interoperability/Mathlib/Bounds.lean#L86))

### 54. `Lattices/CompleteLattice/FailureModes.lean`

- [ ] **IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the integers have the least-upper-bound property for nonempty bounded-above subsets but are not a complete lattice. ([source](./Lattices/CompleteLattice/FailureModes.lean#L31))

### 55. `Lattices/CompleteLattice/MathlibAdapters.lean`

- [ ] **FiniteLatticeIsComplete** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(\preceq\) be a binary relation on \(P\). Then every nonempty finite lattice is complete for predicate subsets. ([source](./Lattices/CompleteLattice/MathlibAdapters.lean#L11))

### 56. `Lattices/CompleteLattice/Relationships.lean`

- [ ] **ConverseIsCompleteLatticeIff** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(\preceq\) be a binary relation on \(P\). Then complete-lattice structure is invariant under order duality. ([source](./Lattices/CompleteLattice/Relationships.lean#L8))

### 57. `Lattices/CompleteLattice/Theorems.lean`

- [ ] **CompleteLatticeHasBottomAndTop** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(\preceq\) be a binary relation on \(P\). Then a complete lattice over a generic set backend with an empty set has bottom and top elements. ([source](./Lattices/CompleteLattice/Theorems.lean#L12))
- [ ] **AllSupremaImplyCompleteLattice** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(\preceq\) be a binary relation on \(P\). Then for a generic set backend with universal-set and separation capabilities, a partial order with suprema for all represented subsets is a complete lattice; infima arise as suprema of represented sets of lower bounds. ([source](./Lattices/CompleteLattice/Theorems.lean#L30))
- [ ] **AllInfimaImplyCompleteLattice** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(\preceq\) be a binary relation on \(P\). Then dually, infima for all represented subsets determine a complete lattice. ([source](./Lattices/CompleteLattice/Theorems.lean#L47))
- [ ] **CompleteLatticeIsLattice** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(\preceq\) be a binary relation on \(P\). Then a complete lattice over a backend that represents pairs is a lattice. ([source](./Lattices/CompleteLattice/Theorems.lean#L64))

### 58. `Lattices/DistributiveLattice/FailureModes.lean`

- [ ] **M3IsNondistributiveLattice** — Let the displayed ordered structure be given. Then the diamond M₃ is a lattice but is not distributive. ([source](./Lattices/DistributiveLattice/FailureModes.lean#L50))
- [ ] **N5IsNondistributiveLattice** — Let the displayed ordered structure be given. Then the pentagon N₅ is a lattice but is not distributive. ([source](./Lattices/DistributiveLattice/FailureModes.lean#L61))

### 59. `Lattices/DistributiveLattice/Theorems.lean`

- [ ] **DistributiveLatticeIsLattice** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every distributive lattice is a lattice. ([source](./Lattices/DistributiveLattice/Theorems.lean#L8))
- [ ] **JoinDistributesOverMeet** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\),\ldots belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then join distributes over meet in a distributive lattice. ([source](./Lattices/DistributiveLattice/Theorems.lean#L16))
- [ ] **MeetDistributesOverJoin** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\),\ldots belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then meet distributes over join in a distributive lattice. ([source](./Lattices/DistributiveLattice/Theorems.lean#L30))

### 60. `Lattices/Join/FailureModes.lean`

- [ ] **TwoFailsJoinOfTwoAndThree** — Let \(\mathbb N\) carry the operations and order used here. Then two fails as the join of two and three under the usual order. ([source](./Lattices/Join/FailureModes.lean#L29))

### 61. `Lattices/Join/Relationships.lean`

- [ ] **JoinOfConverseIffMeet** — Let \(P\) be a set, \(a\), \(b\), \(c\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then joins for the converse relation are meets for the original relation. ([source](./Lattices/Join/Relationships.lean#L9))

### 62. `Lattices/Join/Theorems.lean`

- [ ] **JoinUnique** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then antisymmetry makes a binary join unique. ([source](./Lattices/Join/Theorems.lean#L8))
- [ ] **JoinCommutes** — Let \(P\) be a set, \(a\), \(b\), \(c\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the order of the two inputs does not affect the join predicate. ([source](./Lattices/Join/Theorems.lean#L19))
- [ ] **JoinIdempotent** — Let \(P\) be a set, \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then reflexivity makes an element the join of itself with itself. ([source](./Lattices/Join/Theorems.lean#L27))
- [ ] **JoinAssociative** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\),\ldots belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then whenever the displayed joins exist in a partial order, the two associations agree. ([source](./Lattices/Join/Theorems.lean#L36))

### 63. `Lattices/JoinSemilattice/FailureModes.lean`

- [ ] **BooleanEqualityFailsJoinSemilattice** — Let the two-element Boolean set carry the operations and order used here. Then equality on two distinct booleans has no join for false and true. ([source](./Lattices/JoinSemilattice/FailureModes.lean#L28))

### 64. `Lattices/JoinSemilattice/Theorems.lean`

- [ ] **JoinSemilatticeHasJoin** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every pair in a join-semilattice has a join. ([source](./Lattices/JoinSemilattice/Theorems.lean#L8))

### 65. `Lattices/Lattice/FailureModes.lean`

- [ ] **BooleanEqualityFailsLattice** — Let the two-element Boolean set carry the operations and order used here. Then equality on two distinct booleans is a partial order but not a lattice. ([source](./Lattices/Lattice/FailureModes.lean#L28))

### 66. `Lattices/Lattice/Relationships.lean`

- [ ] **LatticeIffJoinAndMeetSemilattice** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then a lattice is exactly both a join-semilattice and a meet-semilattice. ([source](./Lattices/Lattice/Relationships.lean#L10))
- [ ] **ConverseIsLatticeIff** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then lattice structure is invariant under order duality. ([source](./Lattices/Lattice/Relationships.lean#L17))

### 67. `Lattices/Lattice/Theorems.lean`

- [ ] **LatticeHasJoin** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every pair in a lattice has a join. ([source](./Lattices/Lattice/Theorems.lean#L8))
- [ ] **LatticeHasMeet** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every pair in a lattice has a meet. ([source](./Lattices/Lattice/Theorems.lean#L17))
- [ ] **JoinEqualsRightIffRelated** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then connecting lemma: right is the join of left and right exactly when left ≤ right. ([source](./Lattices/Lattice/Theorems.lean#L26))
- [ ] **MeetEqualsLeftIffRelated** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then in a partial order, an element is the meet of itself with a second element if and only if it lies below that second element. ([source](./Lattices/Lattice/Theorems.lean#L35))
- [ ] **MeetWithJoinAbsorbs** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then order-theoretic absorption: meeting an element with its join returns it. ([source](./Lattices/Lattice/Theorems.lean#L44))
- [ ] **JoinWithMeetAbsorbs** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then dual order-theoretic absorption. ([source](./Lattices/Lattice/Theorems.lean#L55))
- [ ] **JoinOfMeetsRelatedToMeetWithJoin** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\),\ldots belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then one distributive inequality holds in every lattice. ([source](./Lattices/Lattice/Theorems.lean#L66))
- [ ] **JoinWithMeetRelatedToMeetOfJoins** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\),\ldots belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the dual distributive inequality holds in every lattice. ([source](./Lattices/Lattice/Theorems.lean#L80))

### 68. `Lattices/Meet/FailureModes.lean`

- [ ] **ThreeFailsMeetOfTwoAndThree** — Let \(\mathbb N\) carry the operations and order used here. Then three fails as the meet of two and three under the usual order. ([source](./Lattices/Meet/FailureModes.lean#L29))

### 69. `Lattices/Meet/Relationships.lean`

- [ ] **MeetOfConverseIffJoin** — Let \(P\) be a set, \(a\), \(b\), \(c\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then meets for the converse relation are joins for the original relation. ([source](./Lattices/Meet/Relationships.lean#L9))

### 70. `Lattices/Meet/Theorems.lean`

- [ ] **MeetUnique** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then antisymmetry makes a binary meet unique. ([source](./Lattices/Meet/Theorems.lean#L8))
- [ ] **MeetCommutes** — Let \(P\) be a set, \(a\), \(b\), \(c\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the order of the two inputs does not affect the meet predicate. ([source](./Lattices/Meet/Theorems.lean#L19))
- [ ] **MeetIdempotent** — Let \(P\) be a set, \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then reflexivity makes an element the meet of itself with itself. ([source](./Lattices/Meet/Theorems.lean#L27))
- [ ] **MeetAssociative** — Let \(P\) be a set, \(a\), \(b\), \(c\), \(u\),\ldots belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then whenever the displayed meets exist in a partial order, the two associations agree. ([source](./Lattices/Meet/Theorems.lean#L36))

### 71. `Lattices/MeetSemilattice/FailureModes.lean`

- [ ] **BooleanEqualityFailsMeetSemilattice** — Let the two-element Boolean set carry the operations and order used here. Then equality on two distinct booleans has no meet for false and true. ([source](./Lattices/MeetSemilattice/FailureModes.lean#L28))

### 72. `Lattices/MeetSemilattice/Theorems.lean`

- [ ] **MeetSemilatticeHasMeet** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every pair in a meet-semilattice has a meet. ([source](./Lattices/MeetSemilattice/Theorems.lean#L8))

### 73. `Morphisms/Antitone/FailureModes.lean`

- [ ] **NaturalIdentityFailsAntitone** — Let \(\mathbb N\) carry the operations and order used here. Then the identity map on natural numbers is not antitone. ([source](./Morphisms/Antitone/FailureModes.lean#L30))

### 74. `Morphisms/Antitone/Theorems.lean`

- [ ] **AntitoneCompAntitoneIsMonotone** — Let \(P\), \(Q\), \(R\) be sets, equip the relevant carriers with the binary relations specified below, and let the named functions have the stated domains and codomains. Then composing two antitone maps produces a monotone map. ([source](./Morphisms/Antitone/Theorems.lean#L14))
- [ ] **AntitoneThenMonotoneIsAntitone** — Let \(P\), \(Q\), \(R\) be sets, equip the relevant carriers with the binary relations specified below, and let the named functions have the stated domains and codomains. Then an antitone map followed by a monotone map is antitone. ([source](./Morphisms/Antitone/Theorems.lean#L27))
- [ ] **MonotoneThenAntitoneIsAntitone** — Let \(P\), \(Q\), \(R\) be sets, equip the relevant carriers with the binary relations specified below, and let the named functions have the stated domains and codomains. Then a monotone map followed by an antitone map is antitone. ([source](./Morphisms/Antitone/Theorems.lean#L40))
- [ ] **AntitoneSendsUpperBoundToImageLowerBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an antitone map sends an upper bound to a lower bound of the direct image. ([source](./Morphisms/Antitone/Theorems.lean#L57))
- [ ] **AntitoneSendsLowerBoundToImageUpperBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an antitone map sends a lower bound to an upper bound of the direct image. ([source](./Morphisms/Antitone/Theorems.lean#L76))
- [ ] **AntitoneImageUpperBoundsIntoLowerBounds** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then the image of source upper bounds lies in the lower bounds of the image. ([source](./Morphisms/Antitone/Theorems.lean#L95))
- [ ] **AntitoneUpperBoundsPreimageLowerBoundsContainment** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then source upper bounds lie in the preimage of the image's lower bounds. ([source](./Morphisms/Antitone/Theorems.lean#L118))
- [ ] **AntitoneImageLowerBoundsIntoUpperBounds** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then the image of source lower bounds lies in the upper bounds of the image. ([source](./Morphisms/Antitone/Theorems.lean#L141))
- [ ] **AntitoneLowerBoundsPreimageUpperBoundsContainment** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then source lower bounds lie in the preimage of the image's upper bounds. ([source](./Morphisms/Antitone/Theorems.lean#L164))

### 75. `Morphisms/Monotone/Theorems.lean`

- [ ] **MonotoneIdentity** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the identity map is monotone. ([source](./Morphisms/Monotone/Theorems.lean#L13))
- [ ] **MonotoneComp** — Let \(P\), \(Q\), \(R\) be sets, equip the relevant carriers with the binary relations specified below, and let the named functions have the stated domains and codomains. Then monotone maps compose. ([source](./Morphisms/Monotone/Theorems.lean#L20))
- [ ] **MonotoneSendsUpperBoundToImageUpperBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then a monotone map sends an upper bound to an upper bound of the direct image. ([source](./Morphisms/Monotone/Theorems.lean#L36))
- [ ] **MonotoneSendsLowerBoundToImageLowerBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then a monotone map sends a lower bound to a lower bound of the direct image. ([source](./Morphisms/Monotone/Theorems.lean#L55))
- [ ] **MonotoneImageUpperBoundsContainment** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then the image of the source upper-bound family lies in the image-set upper-bound family. ([source](./Morphisms/Monotone/Theorems.lean#L74))
- [ ] **MonotoneUpperBoundsPreimageContainment** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then source upper bounds lie in the preimage of the image-set upper-bound family. ([source](./Morphisms/Monotone/Theorems.lean#L98))
- [ ] **MonotoneImageLowerBoundsContainment** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then the image of the source lower-bound family lies in the image-set lower-bound family. ([source](./Morphisms/Monotone/Theorems.lean#L121))
- [ ] **MonotoneLowerBoundsPreimageContainment** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then source lower bounds lie in the preimage of the image-set lower-bound family. ([source](./Morphisms/Monotone/Theorems.lean#L144))

### 76. `Morphisms/Monotone/FailureModes.lean`

- [ ] **IntegerNegationFailsMonotone** — Let \(\mathbb Z\) carry the operations and order used here. Then negation reverses, rather than preserves, the usual integer order. ([source](./Morphisms/Monotone/FailureModes.lean#L30))

### 77. `Morphisms/OrderEmbedding/FailureModes.lean`

- [ ] **MonotoneBijectionNeedNotHaveMonotoneInverse** — Let the two-element Boolean set carry the operations and order used here, equip that structure with the binary relation used in the theorem. Then the identity from the two-element antichain to the two-element chain is a monotone bijection, but its inverse is not monotone and the map is not an order embedding. ([source](./Morphisms/OrderEmbedding/FailureModes.lean#L43))

### 78. `Morphisms/OrderEmbedding/Theorems.lean`

- [ ] **OrderEmbeddingInjective** — Let \(P\), \(Q\) be sets, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an embedding between partial orders is injective. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L16))
- [ ] **OrderEmbeddingComp** — Let \(P\), \(Q\), \(R\) be sets, equip the relevant carriers with the binary relations specified below, and let the named functions have the stated domains and codomains. Then order embeddings compose. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L29))
- [ ] **OrderEmbeddingSendsUpperBoundToImageUpperBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an order embedding transports upper bounds to upper bounds of direct images. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L48))
- [ ] **OrderEmbeddingSendsLowerBoundToImageLowerBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an order embedding transports lower bounds to lower bounds of direct images. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L67))
- [ ] **OrderEmbeddingUpperBoundsPreimageIff** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an embedding characterizes source upper bounds by a preimage of target upper bounds. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L86))
- [ ] **OrderEmbeddingLowerBoundsPreimageIff** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an embedding characterizes source lower bounds by a preimage of target lower bounds. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L109))
- [ ] **OrderEmbeddingPreservesGreatestElement** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an order embedding transports greatest elements to greatest elements of images. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L132))
- [ ] **OrderEmbeddingPreservesLeastElement** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an order embedding transports least elements to least elements of images. ([source](./Morphisms/OrderEmbedding/Theorems.lean#L152))

### 79. `Morphisms/OrderIsomorphism/FailureModes.lean`

- [ ] **BooleanConstantMapsFailOrderIsomorphism** — Let the two-element Boolean set carry the operations and order used here. Then constant maps cannot form an order isomorphism on the two-element chain. ([source](./Morphisms/OrderIsomorphism/FailureModes.lean#L30))

### 80. `Morphisms/OrderIsomorphism/Theorems.lean`

- [ ] **OrderIsomorphismPreservesSupremum** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then order isomorphisms carry suprema to suprema of generic direct images. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L17))
- [ ] **OrderIsomorphismPreservesUpperBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then order isomorphisms carry upper bounds to upper bounds of direct images. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L38))
- [ ] **OrderIsomorphismPreservesLowerBound** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then order isomorphisms carry lower bounds to lower bounds of direct images. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L59))
- [ ] **OrderIsomorphismPreservesInfimum** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then order isomorphisms carry infima to infima of generic direct images. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L80))
- [ ] **OrderIsomorphismToConverseSendsSupremumToInfimum** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an isomorphism into the converse order carries suprema to infima. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L101))
- [ ] **OrderIsomorphismToConverseSendsInfimumToSupremum** — Let \(P\), \(Q\) be sets, \(\mathcal S_P\) and \(\mathcal S_Q\) be represented families of subsets of the corresponding carriers, \(S\) be a represented subset of the appropriate carrier, \(a\) be an element of the appropriate carrier, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then an isomorphism into the converse order carries infima to suprema. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L123))
- [ ] **OrderIsomorphismPreservesJoin** — Let \(P\), \(Q\) be sets, \(a\), \(b\), \(c\) be elements of the appropriate carriers, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then order isomorphisms preserve every existing binary join. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L145))
- [ ] **OrderIsomorphismPreservesMeet** — Let \(P\), \(Q\) be sets, \(a\), \(b\), \(c\) be elements of the appropriate carriers, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then order isomorphisms preserve every existing binary meet. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L158))
- [ ] **OrderIsomorphismInverse** — Let \(P\), \(Q\) be sets, \(\preceq_P\) and \(\preceq_Q\) be binary relations on \(P\) and \(Q\), respectively, and let the named functions have the stated domains and codomains. Then swapping the maps of an order isomorphism gives its inverse isomorphism. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L171))
- [ ] **OrderIsomorphismComp** — Let \(P\), \(Q\), \(R\) be sets, equip the relevant carriers with the binary relations specified below, and let the named functions have the stated domains and codomains. Then order isomorphisms compose. ([source](./Morphisms/OrderIsomorphism/Theorems.lean#L182))

### 81. `OrderedSets/LinearOrder/Theorems.lean`

- [ ] **TotalImpliesReflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then a total relation is reflexive. ([source](./OrderedSets/LinearOrder/Theorems.lean#L8))
- [ ] **LinearOrderIsPartialOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every linear order is a partial order. ([source](./OrderedSets/LinearOrder/Theorems.lean#L16))
- [ ] **LinearOrderIsTotal** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every linear order is total. ([source](./OrderedSets/LinearOrder/Theorems.lean#L24))

### 82. `OrderedSets/PartialOrder/Characterizations.lean`

- [ ] **PartialOrderIsReflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation in a partial order is reflexive. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L15))
- [ ] **PartialOrderIsAntisymmetric** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation in a partial order is antisymmetric. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L32))
- [ ] **PartialOrderIsTransitive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation in a partial order is transitive. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L49))
- [ ] **PartialOrderRelationIsReflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation packaged by a partial-order relation is reflexive. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L65))
- [ ] **PartialOrderRelationIsAntisymmetric** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation packaged by a partial-order relation is antisymmetric. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L80))
- [ ] **PartialOrderRelationIsTransitive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation packaged by a partial-order relation is transitive. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L95))
- [ ] **NonStrictRelationIsReflexive** — Let \(P\) be a set. Then compatibility theorem: a non-strict partial order relation is reflexive. ([source](./OrderedSets/PartialOrder/Characterizations.lean#L110))

### 83. `OrderedSets/Preorder/Characterizations.lean`

- [ ] **PreorderRelationIsReflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation packaged by a preorder is reflexive. ([source](./OrderedSets/Preorder/Characterizations.lean#L14))
- [ ] **PreorderRelationIsTransitive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation packaged by a preorder is transitive. ([source](./OrderedSets/Preorder/Characterizations.lean#L29))

### 84. `OrderedSets/Preorder/Relationships.lean`

- [ ] **PreorderEquivalenceIsEquivalence** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then mutual reachability in a preorder is an equivalence relation. ([source](./OrderedSets/Preorder/Relationships.lean#L34))
- [ ] **PreorderQuotientRelationIsPartialOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then quotienting a preorder by mutual reachability produces a partial order. ([source](./OrderedSets/Preorder/Relationships.lean#L67))

### 85. `OrderedSets/PartialOrder/Relationships.lean`

- [ ] **StrictPartIff** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\). Then the strict part unfolds to non-strict comparison plus inequality. ([source](./OrderedSets/PartialOrder/Relationships.lean#L39))
- [ ] **StrictPartIffNotConverse** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\). Then the strict part of a non-strict partial order agrees with the preorder-compatible strict part because antisymmetry is available. ([source](./OrderedSets/PartialOrder/Relationships.lean#L59))
- [ ] **StrictPartRelationIsStrictOrder** — Let \(P\) be a set. Then **[Theorem — StrictPartRelationIsStrictOrder]** The strict part relation of a non-strict partial order satisfies the strict order laws. ([source](./OrderedSets/PartialOrder/Relationships.lean#L81))
- [ ] **StrictPartIsStrictOrder** — Let \(P\) be a set. Then the strict part of a non-strict partial order is a strict order. ([source](./OrderedSets/PartialOrder/Relationships.lean#L116))
- [ ] **DualRelationIsPartialOrder** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then **[Theorem — DualRelationIsPartialOrder]** The converse relation of a non-strict partial order satisfies the partial-order laws. ([source](./OrderedSets/PartialOrder/Relationships.lean#L136))
- [ ] **DualIsPartialOrder** — Let \(P\) be a set. Then the dual relation of a partial order is again a partial order. ([source](./OrderedSets/PartialOrder/Relationships.lean#L172))

### 86. `OrderedSets/PartialOrder/Theorems.lean`

- [ ] **NonStrictRelatesSelf** — Let \(P\) be a set, \(a\) belong to \(P\). Then every element is related to itself by a non-strict partial order. ([source](./OrderedSets/PartialOrder/Theorems.lean#L15))
- [ ] **NonStrictMutualRelationImpliesEqual** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\). Then two elements mutually related by a non-strict partial order are equal. ([source](./OrderedSets/PartialOrder/Theorems.lean#L34))
- [ ] **PartialOrderHasNoNontrivialTwoElementCycles** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\). Then there are no nontrivial two-element cycles in a partial order: if two elements are mutually related, the cycle collapses to equality. ([source](./OrderedSets/PartialOrder/Theorems.lean#L54))

### 87. `OrderedSets/Poset/Characterizations.lean`

- [ ] **PosetOrderIsPartialOrder** — Let the displayed ordered structure be given. Then the order relation packaged by a poset is a partial order. ([source](./OrderedSets/Poset/Characterizations.lean#L15))
- [ ] **PosetOrderIsReflexive** — Let the displayed ordered structure be given. Then the order relation packaged by a poset is reflexive. ([source](./OrderedSets/Poset/Characterizations.lean#L29))
- [ ] **PosetOrderIsAntisymmetric** — Let the displayed ordered structure be given. Then the order relation packaged by a poset is antisymmetric. ([source](./OrderedSets/Poset/Characterizations.lean#L44))
- [ ] **PosetOrderIsTransitive** — Let the displayed ordered structure be given. Then the order relation packaged by a poset is transitive. ([source](./OrderedSets/Poset/Characterizations.lean#L59))

### 88. `OrderedSets/Poset/FailureModes.lean`

- [ ] **NatStrictOrderFailsPosetLaws** — Let \(\mathbb N\) carry the operations and order used here. Then the usual strict order on natural numbers is not a poset order, because it is not reflexive. ([source](./OrderedSets/Poset/FailureModes.lean#L35))

### 89. `OrderedSets/Poset/Relationships.lean`

- [ ] **PosetOrderIsPreorder** — Let the displayed ordered structure be given. Then every poset order is a preorder. ([source](./OrderedSets/Poset/Relationships.lean#L14))

### 90. `OrderedSets/Poset/Theorems.lean`

- [ ] **PosetElementRelatesToItself** — Let the displayed ordered structure be given. Then every element of a poset is below itself in the packaged non-strict order. ([source](./OrderedSets/Poset/Theorems.lean#L14))
- [ ] **PosetMutualOrderImpliesEqual** — Let the displayed ordered structure be given. Then two mutually related elements of a poset are equal. ([source](./OrderedSets/Poset/Theorems.lean#L31))
- [ ] **PosetOrderTrans** — Let the displayed ordered structure be given. Then the non-strict order in a poset composes transitively. ([source](./OrderedSets/Poset/Theorems.lean#L50))

### 91. `OrderedSets/Preorder/Theorems.lean`

- [ ] **PreorderRelatesSelf** — Let \(P\) be a set, \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every element is related to itself by a preorder. ([source](./OrderedSets/Preorder/Theorems.lean#L14))

### 92. `OrderedSets/StrictLinearOrder/FailureModes.lean`

- [ ] **BooleanEqualityFailsStrictLinearOrder** — Let the two-element Boolean set carry the operations and order used here. Then equality is reflexive, so it cannot be a strict linear order. ([source](./OrderedSets/StrictLinearOrder/FailureModes.lean#L28))

### 93. `OrderedSets/StrictLinearOrder/Theorems.lean`

- [ ] **ExactlyTrichotomousImpliesIrreflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then exact trichotomy by itself forces irreflexivity. ([source](./OrderedSets/StrictLinearOrder/Theorems.lean#L8))
- [ ] **StrictLinearOrderIsStrictOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every strict linear order is a strict order. ([source](./OrderedSets/StrictLinearOrder/Theorems.lean#L17))
- [ ] **StrictLinearOrderIsExactlyTrichotomous** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every strict linear order satisfies exact trichotomy. ([source](./OrderedSets/StrictLinearOrder/Theorems.lean#L25))

### 94. `OrderedSets/StrictOrder/Characterizations.lean`

- [ ] **StrictOrderIsIrreflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation in a strict order is irreflexive. ([source](./OrderedSets/StrictOrder/Characterizations.lean#L15))
- [ ] **StrictOrderIsTransitive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation in a strict order is transitive. ([source](./OrderedSets/StrictOrder/Characterizations.lean#L32))
- [ ] **StrictOrderIsAsymmetric** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every strict order is asymmetric. ([source](./OrderedSets/StrictOrder/Characterizations.lean#L49))
- [ ] **StrictOrderIsAntisymmetric** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then every strict order is antisymmetric, vacuously: mutual strict comparison cannot occur. ([source](./OrderedSets/StrictOrder/Characterizations.lean#L67))
- [ ] **StrictOrderRelationIsIrreflexive** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the relation packaged by a strict-order relation is irreflexive. ([source](./OrderedSets/StrictOrder/Characterizations.lean#L83))

### 95. `OrderedSets/StrictOrder/Relationships.lean`

- [ ] **ReflexiveClosureIff** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then the reflexive closure unfolds to strict comparison or equality. ([source](./OrderedSets/StrictOrder/Relationships.lean#L34))
- [ ] **ReflexiveClosureRelationIsPartialOrder** — Let \(P\) be a set. Then the reflexive closure relation of a strict order satisfies the partial-order laws. ([source](./OrderedSets/StrictOrder/Relationships.lean#L54))
- [ ] **ReflexiveClosureIsPartialOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then the reflexive closure of a strict order satisfies the partial-order laws. ([source](./OrderedSets/StrictOrder/Relationships.lean#L85))
- [ ] **StrictPartOfReflexiveClosureIff** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then taking reflexive closure and then strict part returns the original strict order relation. ([source](./OrderedSets/StrictOrder/Relationships.lean#L102))
- [ ] **ReflexiveClosureOfStrictPartIff** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\). Then taking strict part and then reflexive closure returns the original non-strict partial order relation. ([source](./OrderedSets/StrictOrder/Relationships.lean#L122))

### 96. `OrderedSets/StrictOrder/Theorems.lean`

- [ ] **StrictOrderDoesNotRelateSelf** — Let \(P\) be a set, \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a strict order never relates an element to itself. ([source](./OrderedSets/StrictOrder/Theorems.lean#L14))
- [ ] **StrictOrderHasNoTwoElementCycles** — Let \(P\) be a set, \(a\), \(b\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then a strict order has no two-element cycle. ([source](./OrderedSets/StrictOrder/Theorems.lean#L30))

### 97. `OrderedSets/StrictPoset/Characterizations.lean`

- [ ] **StrictPosetRelationIsStrictOrder** — Let the displayed ordered structure be given. Then the relation carried by a strict poset satisfies the strict-order laws. ([source](./OrderedSets/StrictPoset/Characterizations.lean#L7))
- [ ] **StrictPosetRelationIsIrreflexive** — Let the displayed ordered structure be given. Then the relation carried by a strict poset is irreflexive. ([source](./OrderedSets/StrictPoset/Characterizations.lean#L13))
- [ ] **StrictPosetRelationIsTransitive** — Let the displayed ordered structure be given. Then the relation carried by a strict poset is transitive. ([source](./OrderedSets/StrictPoset/Characterizations.lean#L20))

### 98. `OrderedSets/StrictPoset/Theorems.lean`

- [ ] **StrictPosetDoesNotRelateSelf** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then a strict poset never relates an element to itself. ([source](./OrderedSets/StrictPoset/Theorems.lean#L6))

### 99. `OrderedSets/WellOrder/FailureModes.lean`

- [ ] **IntegersAreNotWellOrdered** — Let \(\mathbb Z\) carry the operations and order used here, the subsets occurring below be subsets of the relevant carrier. Then the integers with their usual order are not well-ordered. ([source](./OrderedSets/WellOrder/FailureModes.lean#L28))

### 100. `OrderedSets/WellOrder/MathlibAdapters.lean`

- [ ] **FiniteLinearOrderIsWellOrder** — Let \(P\) be a set, \(S\) be a subset of the relevant carrier, \(\preceq\) be a binary relation on \(P\). Then every finite linear order is a well-order on predicate subsets. ([source](./OrderedSets/WellOrder/MathlibAdapters.lean#L10))

### 101. `OrderedSets/WellOrder/Relationships.lean`

- [ ] **WellOrderIffLinearAndStrictPartWellFounded** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(\preceq\) be a binary relation on \(P\). Then for a linear order, least-element and strict-minimal-element formulations of well-ordering agree. Linearity promotes local minimality to global leastness. ([source](./OrderedSets/WellOrder/Relationships.lean#L12))

### 102. `OrderedSets/WellOrder/Theorems.lean`

- [ ] **WellOrderingPrinciple** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(S\) belong to \(\mathcal S\), \(\preceq\) be a binary relation on \(P\). Then every nonempty represented subset of a well-order has a least element. ([source](./OrderedSets/WellOrder/Theorems.lean#L10))
- [ ] **WellOrderHasImmediateSuccessor** — Let \(P\) be a set, \(\mathcal S\) be a represented family of subsets of \(P\), \(a\) belong to \(P\), \(\preceq\) be a binary relation on \(P\). Then every element that has a strict successor in a well-order has a least such successor. ([source](./OrderedSets/WellOrder/Theorems.lean#L21))

### 103. `Constructions/StrictNonStrictCorrespondence/Definition.lean`

- [ ] **StrictRelationOfPosetIsStrictOrder** — Let the displayed ordered structure be given. Then the strict part of a poset order satisfies the strict-order laws. ([source](./Constructions/StrictNonStrictCorrespondence/Definition.lean#L24))
- [ ] **NonStrictRelationOfStrictPosetIsPartialOrder** — Let the displayed ordered structure be given. Then the reflexive closure of a strict poset order satisfies the partial-order laws. ([source](./Constructions/StrictNonStrictCorrespondence/Definition.lean#L36))

### 104. `Constructions/StrictNonStrictCorrespondence/Theorems.lean`

- [ ] **StrictOrderInducesPartialOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then strict orders induce partial orders by adjoining equality. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L10))
- [ ] **PartialOrderInducesStrictOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then partial orders induce strict orders by removing equality. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L18))
- [ ] **StrictLinearOrderInducesLinearOrder** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then strict linear orders induce linear orders by adjoining equality. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L26))
- [ ] **StrictNonStrictInverseCorrespondence** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then removing equality after adjoining it recovers an irreflexive relation. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L34))
- [ ] **NonStrictStrictInverseCorrespondence** — Let \(P\) be a set, \(\preceq\) be a binary relation on \(P\). Then adjoining equality to the strict part recovers a reflexive relation. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L43))
- [ ] **PosetOfStrictPosetOfPoset** — Let the displayed ordered structure be given. Then converting a poset to strict form and back recovers it. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L53))
- [ ] **StrictPosetOfPosetOfStrictPoset** — Let the displayed ordered structure be given. Then converting a strict poset to non-strict form and back recovers it. ([source](./Constructions/StrictNonStrictCorrespondence/Theorems.lean#L58))

### 105. `OrderedSets/PartialOrder/Examples.lean`

- [ ] **NaturalNumberLessEqualIsPartialOrder** — Let the displayed ordered structure be given. Then **[Theorem — Natural Number Less Equal Is Partial Order]** The usual ≤ relation on natural numbers satisfies the partial-order laws. ([source](./OrderedSets/PartialOrder/Examples.lean#L16))
- [ ] **BooleanEqualityIsPartialOrder** — Let the displayed ordered structure be given. Then **[Theorem — Boolean Equality Is Partial Order]** Equality on booleans satisfies the partial-order laws. ([source](./OrderedSets/PartialOrder/Examples.lean#L68))
- [ ] **DivisibilityIsPartialOrder** — Let the displayed ordered structure be given. Then divisibility on natural numbers is a partial order. The zero case is included: if 0 ∣ b, then b = 0, so antisymmetry still holds. ([source](./OrderedSets/PartialOrder/Examples.lean#L116))
- [ ] **PredicateSetInclusionIsPartialOrder** — Let \(P\) be a set. Then inclusion is a partial order on predicate subsets. ([source](./OrderedSets/PartialOrder/Examples.lean#L126))

### 106. `OrderedSets/LinearOrder/FailureModes.lean`

- [ ] **BooleanEqualityPartialOrderFailsTotality** — Let the displayed ordered structure be given. Then equality on booleans is a partial order but not a linear order. ([source](./OrderedSets/LinearOrder/FailureModes.lean#L27))
- [ ] **NaturalDivisibilityIsNotLinearOrder** — Let \(\mathbb N\) carry the operations and order used here. Then natural-number divisibility is not linear because, for example, 2 and 3 are incomparable. ([source](./OrderedSets/LinearOrder/FailureModes.lean#L40))

### 107. `OrderedSets/Poset/Examples.lean`

- [ ] **NaturalNumberOrderIsPartialOrder** — Let the displayed ordered structure be given. Then the usual non-strict order on natural numbers satisfies the partial-order laws. ([source](./OrderedSets/Poset/Examples.lean#L15))

### 108. `OrderedSets/Preorder/Examples.lean`

- [ ] **BooleanUniversalRelationIsPreorder** — Let the displayed ordered structure be given. Then the universal relation on booleans satisfies the preorder laws. ([source](./OrderedSets/Preorder/Examples.lean#L14))

### 109. `OrderedSets/Preorder/FailureModes.lean`

- [ ] **ImmediateSuccessorOrEqualFailsPreorder** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then the immediate-successor-or-equality relation is reflexive but not transitive, so it fails to be a preorder. ([source](./OrderedSets/Preorder/FailureModes.lean#L60))
- [ ] **NatStrictOrderFailsPreorder** — Let \(\mathbb N\) carry the operations and order used here. Then the natural strict order is transitive but non-reflexive, so it fails to be a preorder. ([source](./OrderedSets/Preorder/FailureModes.lean#L76))
- [ ] **StrictPartConstructionsDifferOnUniversalPreorder** — Let the displayed ordered structure be given. Then the inequality-based strict part and the non-converse strict part differ for preorders without antisymmetry, witnessed by the universal Boolean preorder. ([source](./OrderedSets/Preorder/FailureModes.lean#L92))

### 110. `OrderedSets/PartialOrder/FailureModes.lean`

- [ ] **ImmediateSuccessorOrEqualFailsTransitivity** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then the immediate-successor-or-equality relation is reflexive and antisymmetric but fails transitivity. ([source](./OrderedSets/PartialOrder/FailureModes.lean#L54))
- [ ] **NatStrictOrderFailsNonStrictPartialOrder** — Let \(\mathbb N\) carry the operations and order used here. Then the usual strict order on natural numbers is not a non-strict partial order, because it is not reflexive. ([source](./OrderedSets/PartialOrder/FailureModes.lean#L77))
- [ ] **BooleanUniversalRelationFailsNonStrictPartialOrder** — Let the two-element Boolean set carry the operations and order used here. Then the universal relation on booleans is not a non-strict partial order, because it is not antisymmetric. ([source](./OrderedSets/PartialOrder/FailureModes.lean#L99))
- [ ] **IntegerDivisibilityIsPreorderButNotPartialOrder** — Let \(\mathbb Z\) carry the operations and order used here. Then integer divisibility is a preorder but not a partial order: 3 and -3 divide one another without being equal. ([source](./OrderedSets/PartialOrder/FailureModes.lean#L115))

### 111. `OrderedSets/StrictOrder/Examples.lean`

- [ ] **NaturalNumberLessThanIsStrictOrder** — Let the displayed ordered structure be given. Then the usual strict order on natural numbers satisfies the strict-order laws. ([source](./OrderedSets/StrictOrder/Examples.lean#L15))

### 112. `OrderedSets/StrictOrder/FailureModes.lean`

- [ ] **NatNonStrictOrderFailsStrictOrder** — Let \(\mathbb N\) carry the operations and order used here. Then the usual non-strict order on natural numbers is not a strict order, because it is not irreflexive. ([source](./OrderedSets/StrictOrder/FailureModes.lean#L36))
- [ ] **ImmediateSuccessorFailsStrictOrder** — Let the displayed ordered structure be given, equip that structure with the binary relation used in the theorem. Then the immediate-successor relation is irreflexive but not transitive, so irreflexivity alone does not make a strict order. ([source](./OrderedSets/StrictOrder/FailureModes.lean#L63))

### 113. `Bounds/BottomElement/Theorems.lean`

- [ ] **BottomElementIffRelationToEvery** — Let the displayed ordered structure be given, the represented subsets belong to their displayed set families, equip the carriers with the displayed binary relations. Then a bottom element is exactly an element related to every carrier element. ([source](./Bounds/BottomElement/Theorems.lean#L17))

### 114. `Bounds/TopElement/Theorems.lean`

- [ ] **TopElementIffEveryRelationTo** — Let the displayed ordered structure be given, the represented subsets belong to their displayed set families, equip the carriers with the displayed binary relations. Then a top element is exactly an element every carrier element is related to. ([source](./Bounds/TopElement/Theorems.lean#L17))

### 115. `Lattices/Lattice/Consequences.lean`

- [ ] **JoinOperationCommutative** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then a chosen join operation in a partial order is commutative. ([source](./Lattices/Lattice/Consequences.lean#L36))
- [ ] **MeetOperationCommutative** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then a chosen meet operation in a partial order is commutative. ([source](./Lattices/Lattice/Consequences.lean#L51))
- [ ] **JoinOperationIdempotent** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then a chosen join operation in a partial order is idempotent. ([source](./Lattices/Lattice/Consequences.lean#L66))
- [ ] **MeetOperationIdempotent** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then a chosen meet operation in a partial order is idempotent. ([source](./Lattices/Lattice/Consequences.lean#L80))
- [ ] **JoinOperationAssociative** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then a chosen join operation in a partial order is associative. ([source](./Lattices/Lattice/Consequences.lean#L94))
- [ ] **MeetOperationAssociative** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then a chosen meet operation in a partial order is associative. ([source](./Lattices/Lattice/Consequences.lean#L110))
- [ ] **JoinMeetOperationAbsorption** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then chosen lattice join and meet satisfy the join-over-meet absorption law. ([source](./Lattices/Lattice/Consequences.lean#L126))
- [ ] **MeetJoinOperationAbsorption** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then chosen lattice meet and join satisfy the meet-over-join absorption law. ([source](./Lattices/Lattice/Consequences.lean#L142))
- [ ] **JoinMeetOperationMutualAbsorption** — Let \(P\) be a set, equip the carriers with the displayed binary relations. Then chosen lattice join and meet satisfy mutual absorption. ([source](./Lattices/Lattice/Consequences.lean#L158))

### 116. `Morphisms/Antitone/Consequences.lean`

- [ ] **Antitone.comp_antitone_is_monotone** — Let \(P\), \(Q\), \(R\) be sets, equip the carriers with the displayed binary relations. Then the composite of two antitone maps is monotone. ([source](./Morphisms/Antitone/Consequences.lean#L9))
