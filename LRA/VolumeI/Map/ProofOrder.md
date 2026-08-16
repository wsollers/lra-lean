# Volume I Map Proof Order

This checklist contains every Lean `theorem` declaration recursively under `LRA/VolumeI/Map`. Modules are ordered by their import dependencies, and theorems within each module retain source order.

Each entry is a human mathematical statement rather than a repetition of the Lean declaration. The prose introduces the ambient sets and structures with “Let …” and states the mathematical claim in ordinary terminology. The source link remains available for the exact formal signature and implementation-level capabilities.

**Inventory:** 159 theorems in 33 modules.

## Ordering rules

1. Complete modules from top to bottom.
2. Within each module, complete entries from top to bottom.
3. Imported definitions and earlier theorem entries may be used in later proofs.
4. Failure-mode theorems are proof obligations and remain in dependency order.

## Theorem checklist

### 1. `Operation/Laws/Absorbing/Theorems.lean`

- [ ] **LeftAbsorbing** — Let the displayed map-theoretic structures be given. Then apply a left-absorbing law to an element. ([source](./Operation/Laws/Absorbing/Theorems.lean#L25))
- [ ] **RightAbsorbing** — Let the displayed map-theoretic structures be given. Then apply a right-absorbing law to an element. ([source](./Operation/Laws/Absorbing/Theorems.lean#L48))
- [ ] **TwoSidedAbsorbing** — Let the displayed map-theoretic structures be given. Then a two-sided absorbing law supplies a left absorbing law. ([source](./Operation/Laws/Absorbing/Theorems.lean#L70))
- [ ] **TwoSidedAbsorbing** — Let the displayed map-theoretic structures be given. Then a two-sided absorbing law supplies a right absorbing law. ([source](./Operation/Laws/Absorbing/Theorems.lean#L91))
- [ ] **TwoSidedAbsorbing** — Let the displayed map-theoretic structures be given. Then left and right absorbing laws assemble into a two-sided absorbing law. ([source](./Operation/Laws/Absorbing/Theorems.lean#L113))

### 2. `Operation/Laws/Associative/Theorems.lean`

- [ ] **Associative** — Let the named maps be given. Then apply an associativity law to three elements. ([source](./Operation/Laws/Associative/Theorems.lean#L25))

### 3. `Operation/Laws/Commutative/Theorems.lean`

- [ ] **Commutative** — Let the named maps be given. Then apply a commutativity law to two elements. ([source](./Operation/Laws/Commutative/Theorems.lean#L24))

### 4. `Operation/Laws/Distributive/Theorems.lean`

- [ ] **LeftDistributive** — Let the displayed map-theoretic structures be given. Then apply a left-distributive law to three elements. ([source](./Operation/Laws/Distributive/Theorems.lean#L25))
- [ ] **RightDistributive** — Let the displayed map-theoretic structures be given. Then apply a right-distributive law to three elements. ([source](./Operation/Laws/Distributive/Theorems.lean#L48))
- [ ] **TwoSidedDistributive** — Let the displayed map-theoretic structures be given. Then a two-sided distributive law supplies a left distributive law. ([source](./Operation/Laws/Distributive/Theorems.lean#L69))
- [ ] **TwoSidedDistributive** — Let the displayed map-theoretic structures be given. Then a two-sided distributive law supplies a right distributive law. ([source](./Operation/Laws/Distributive/Theorems.lean#L88))
- [ ] **TwoSidedDistributive** — Let the displayed map-theoretic structures be given. Then left and right distributive laws assemble into a two-sided distributive law. ([source](./Operation/Laws/Distributive/Theorems.lean#L108))

### 5. `Operation/Laws/Idempotent/Theorems.lean`

- [ ] **Idempotent** — Let the displayed map-theoretic structures be given. Then apply an idempotence law to an element. ([source](./Operation/Laws/Idempotent/Theorems.lean#L24))

### 6. `Operation/Laws/Identity/Theorems.lean`

- [ ] **LeftIdentity** — Let the displayed map-theoretic structures be given. Then apply a left-identity law to an element. ([source](./Operation/Laws/Identity/Theorems.lean#L25))
- [ ] **RightIdentity** — Let the displayed map-theoretic structures be given. Then apply a right-identity law to an element. ([source](./Operation/Laws/Identity/Theorems.lean#L48))
- [ ] **TwoSidedIdentity** — Let the displayed map-theoretic structures be given. Then a two-sided identity supplies a left identity. ([source](./Operation/Laws/Identity/Theorems.lean#L70))
- [ ] **TwoSidedIdentity** — Let the displayed map-theoretic structures be given. Then a two-sided identity supplies a right identity. ([source](./Operation/Laws/Identity/Theorems.lean#L91))
- [ ] **TwoSidedIdentity** — Let the displayed map-theoretic structures be given. Then left and right identity laws assemble into a two-sided identity law. ([source](./Operation/Laws/Identity/Theorems.lean#L113))

### 7. `Operation/Laws/Inverse/Theorems.lean`

- [ ] **LeftInverse** — Let the named maps be given. Then apply a left-inverse law to an element. ([source](./Operation/Laws/Inverse/Theorems.lean#L26))
- [ ] **RightInverse** — Let the named maps be given. Then apply a right-inverse law to an element. ([source](./Operation/Laws/Inverse/Theorems.lean#L51))
- [ ] **TwoSidedInverse** — Let the named maps be given. Then a two-sided inverse law supplies a left inverse law. ([source](./Operation/Laws/Inverse/Theorems.lean#L75))
- [ ] **TwoSidedInverse** — Let the named maps be given. Then a two-sided inverse law supplies a right inverse law. ([source](./Operation/Laws/Inverse/Theorems.lean#L98))
- [ ] **TwoSidedInverse** — Let the named maps be given. Then left and right inverse laws assemble into a two-sided inverse law. ([source](./Operation/Laws/Inverse/Theorems.lean#L122))

### 8. `SetTheoretic/Theorems.lean`

- [ ] **RelationGraphMemberCoordinates** — Let a bundled set-theoretic relation and a member of its graph be given. Then the graph member is an ordered pair whose coordinates lie in the displayed left and right domains. ([source](./SetTheoretic/Theorems.lean#L29))
- [ ] **EvaluationExists** — Let a bundled set-theoretic map and an element of its domain be given. Then the graph relates that input to some codomain element. ([source](./SetTheoretic/Theorems.lean#L66))
- [ ] **EvaluationUnique** — Let a bundled set-theoretic map and two graph values at one input be given. Then the two values are equal. ([source](./SetTheoretic/Theorems.lean#L101))
- [ ] **SetTheoreticMapExt** — Let two bundled set-theoretic maps have equal domains, codomains, and graphs. Then the bundled maps are equal. ([source](./SetTheoretic/Theorems.lean#L137))

### 9. `SetTheoretic/Relationships.lean`

- [ ] **SingleValuedOfIsSetTheoreticMap** — Let the displayed domain, the displayed codomain be given. Then the graph of a set-theoretic map triple is single-valued. ([source](./SetTheoretic/Relationships.lean#L40))
- [ ] **BundledSingleValued** — Let the displayed domain, the displayed codomain, the named maps be given. Then the graph of a bundled set-theoretic map is single-valued. ([source](./SetTheoretic/Relationships.lean#L80))
- [ ] **TypedMapGraphRepresentation** — Let a typed map, coordinate encodings, encoded domains, and an ambient pair set be given. Then there is a bundled set-theoretic map whose graph represents the encoded typed map. ([source](./SetTheoretic/Relationships.lean#L134))

### 10. `Graph/FailureModes.lean`

- [ ] **EmptyRelationSingleValued** — Let the displayed domain, the displayed codomain be given. Then the empty relation is single-valued for vacuous reasons. ([source](./Graph/FailureModes.lean#L58))

### 11. `Composition/Theorems.lean`

- [ ] **ComposeApply** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then evaluation of composition. ([source](./Composition/Theorems.lean#L27))
- [ ] **ComposeLeftIdentity** — Let the displayed domain, the displayed codomain, the named maps be given. Then left identity law for composition. ([source](./Composition/Theorems.lean#L48))
- [ ] **ComposeRightIdentity** — Let the displayed domain, the displayed codomain, the named maps be given. Then right identity law for composition. ([source](./Composition/Theorems.lean#L67))
- [ ] **ComposeAssociative** — Let the named maps be given. Then associativity of composition. ([source](./Composition/Theorems.lean#L89))

### 12. `Injective/FailureModes.lean`

- [ ] **HasCollisionIffNotInjective** — Let the displayed domain, the displayed codomain, the named maps be given. Then a collision is exactly a failure of injectivity. ([source](./Injective/FailureModes.lean#L41))
- [ ] **CollapseHasCollision** — Let the displayed map-theoretic structures be given. Then the Boolean collapse map has a collision. ([source](./Injective/FailureModes.lean#L58))
- [ ] **CollapseNotInjective** — Let the displayed map-theoretic structures be given. Then the Boolean collapse map is not injective. ([source](./Injective/FailureModes.lean#L73))

### 13. `Injective/Theorems.lean`

- [ ] **injective_iff_standard** — Let the displayed domain, the displayed codomain, the named maps be given. Then the LRA map definition agrees with Lean's standard injectivity predicate. ([source](./Injective/Theorems.lean#L25))

### 14. `Preimage/Theorems.lean`

- [ ] **PreimageMembershipIff** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then membership in the constructed preimage is exactly membership of the value in the target. ([source](./Preimage/Theorems.lean#L43))
- [ ] **PreimageExists** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for every target set, a preimage set exists. ([source](./Preimage/Theorems.lean#L70))
- [ ] **PreimageUnique** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a preimage set is uniquely determined by its memberwise specification. ([source](./Preimage/Theorems.lean#L94))
- [ ] **PreimageExistsAndUnique** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for every target set, there is exactly one preimage set. ([source](./Preimage/Theorems.lean#L118))
- [ ] **PreimageUniversal** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the preimage of the whole codomain is the whole domain. ([source](./Preimage/Theorems.lean#L156))
- [ ] **PreimageEmpty** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves the empty set. ([source](./Preimage/Theorems.lean#L174))
- [ ] **PreimageUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves binary union. ([source](./Preimage/Theorems.lean#L194))
- [ ] **PreimageIntersection** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves binary intersection. ([source](./Preimage/Theorems.lean#L216))
- [ ] **PreimageDifference** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves set difference. ([source](./Preimage/Theorems.lean#L238))
- [ ] **PreimageComplement** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves complement. ([source](./Preimage/Theorems.lean#L259))
- [ ] **PreimageSymmetricDifference** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves symmetric difference. ([source](./Preimage/Theorems.lean#L280))
- [ ] **PreimageSubsetUniversal** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a preimage is a subset of the domain universe. ([source](./Preimage/Theorems.lean#L301))
- [ ] **PreimageMonotone** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage is monotone with respect to target inclusion. ([source](./Preimage/Theorems.lean#L322))
- [ ] **PreimageCongrFunction** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then pointwise equal maps have equal preimages of every target set. ([source](./Preimage/Theorems.lean#L344))
- [ ] **PreimageCongrSet** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then equal target sets have equal preimages. ([source](./Preimage/Theorems.lean#L366))
- [ ] **PreimageDifferenceUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a mixed preimage drill combining difference and union. ([source](./Preimage/Theorems.lean#L389))
- [ ] **PreimageIndexedUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves arbitrary indexed unions. ([source](./Preimage/Theorems.lean#L424))
- [ ] **PreimageIndexedIntersection** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves arbitrary indexed intersections. ([source](./Preimage/Theorems.lean#L449))
- [ ] **PreimageCountableUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves countable unions. ([source](./Preimage/Theorems.lean#L484))
- [ ] **PreimageCountableIntersection** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then preimage preserves countable intersections. ([source](./Preimage/Theorems.lean#L509))
- [ ] **PreimageIdentity** — Let the represented source and target sets be given. Then preimage under the identity map is the original set. ([source](./Preimage/Theorems.lean#L547))
- [ ] **PreimageComposition** — Let the displayed intermediate set, the named maps be given. Then pulling back along a composite is the same as pulling back in two steps. ([source](./Preimage/Theorems.lean#L594))
- [ ] **PreimageCompositionMonotone** — Let two composable maps and nested target sets be given. Then the corresponding preimages under the composite are nested. ([source](./Preimage/Theorems.lean#L637))

### 15. `Image/Theorems.lean`

- [ ] **ImageMembershipIff** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then membership in the constructed direct image is exactly being hit by a source member. ([source](./Image/Theorems.lean#L46))
- [ ] **ImageExists** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for every source set, a direct image set exists. ([source](./Image/Theorems.lean#L74))
- [ ] **ImageUnique** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a direct image set is uniquely determined by its memberwise specification. ([source](./Image/Theorems.lean#L98))
- [ ] **ImageExistsAndUnique** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for every source set, there is exactly one direct image set. ([source](./Image/Theorems.lean#L122))
- [ ] **ImageCongrFunction** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then pointwise equal maps have equal images of every source set. ([source](./Image/Theorems.lean#L148))
- [ ] **ImageCongrSet** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then equal source sets have equal direct images. ([source](./Image/Theorems.lean#L172))
- [ ] **ImageEmpty** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the direct image of the empty set is empty. ([source](./Image/Theorems.lean#L203))
- [ ] **ImageUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then direct image distributes over binary union. ([source](./Image/Theorems.lean#L223))
- [ ] **ImageIntersectionSubsetIntersectionImages** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the image of an intersection is contained in the intersection of the images. ([source](./Image/Theorems.lean#L245))
- [ ] **DifferenceImagesSubsetImageDifference** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the difference of two images is contained in the image of the difference. ([source](./Image/Theorems.lean#L267))
- [ ] **ImageDifferenceOfInjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for injective maps, direct image preserves set difference. ([source](./Image/Theorems.lean#L290))
- [ ] **ImageIntersectionOfInjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for injective maps, direct image preserves binary intersection. ([source](./Image/Theorems.lean#L314))
- [ ] **ImageMonotone** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then direct image is monotone with respect to source inclusion. ([source](./Image/Theorems.lean#L337))
- [ ] **ImageIndexedUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then direct image preserves arbitrary indexed unions. ([source](./Image/Theorems.lean#L368))
- [ ] **ImageIndexedIntersectionSubset** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the direct image of an arbitrary indexed intersection is contained in the indexed intersection of the direct images. ([source](./Image/Theorems.lean#L394))
- [ ] **ImageIndexedIntersectionOfInjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for injective maps, direct image preserves arbitrary indexed intersections. ([source](./Image/Theorems.lean#L421))
- [ ] **ImageCountableUnion** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then direct image preserves countable unions. ([source](./Image/Theorems.lean#L456))
- [ ] **ImageCountableIntersectionSubset** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the direct image of a countable intersection is contained in the countable intersection of the direct images. ([source](./Image/Theorems.lean#L482))
- [ ] **ImageCountableIntersectionOfInjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for injective maps, direct image preserves countable intersections. ([source](./Image/Theorems.lean#L509))
- [ ] **ImagePreimageSubsetAdjunction** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then image/preimage adjunction: a source lies in the preimage of a target exactly when its image lies in that target. ([source](./Image/Theorems.lean#L546))
- [ ] **MapsIntoIffImageSubset** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the neighborhood-style statement f(A) is contained in B is the same as saying that every point of A is mapped into B. ([source](./Image/Theorems.lean#L571))
- [ ] **MapsIntoIffSubsetPreimage** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then equivalently, mapping a source into a target says that the source is contained in the preimage of the target. ([source](./Image/Theorems.lean#L596))
- [ ] **SourceSubsetPreimageImage** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then every source is contained in the preimage of its image. ([source](./Image/Theorems.lean#L620))
- [ ] **ImagePreimageSubset** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the image of a preimage is contained in the target. ([source](./Image/Theorems.lean#L644))
- [ ] **ImagePreimageOfSurjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for surjective maps, the image of a preimage is the original target. ([source](./Image/Theorems.lean#L669))
- [ ] **ImagePreimageEqIntersectionRange** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the image of a preimage is the target set restricted to the range of the map. ([source](./Image/Theorems.lean#L694))
- [ ] **ImagePreimageEqOfSubsetRange** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then if the target set lies inside the range, the image of its preimage is the target set. ([source](./Image/Theorems.lean#L721))
- [ ] **PreimageImageOfInjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for injective maps, a source is exactly the preimage of its image. ([source](./Image/Theorems.lean#L748))
- [ ] **ImageIdentity** — Let the represented source and target sets be given. Then image under the identity map is the original set. ([source](./Image/Theorems.lean#L786))
- [ ] **FiniteImageIff** — Let the displayed domain, the displayed codomain, the represented source set, and the named map be given. Then the finite-image predicate is exactly the existence of a finite list enumerating the codomain values hit by source elements. ([source](./Image/Theorems.lean#L819))
- [ ] **FiniteRangeIffFiniteImage** — Let the displayed domain, the displayed codomain, the represented ambient domain set, and the named map be given. Then finite range is finite image of the chosen ambient domain. ([source](./Image/Theorems.lean#L843))
- [ ] **ImageComposition** — Let the displayed intermediate set, the named maps be given. Then pushing forward along a composite is the same as pushing forward in two steps. ([source](./Image/Theorems.lean#L890))

### 16. `Restriction/Theorems.lean`

- [ ] **RestrictionRestrictsTo** — Let the displayed domain, the displayed codomain, the named maps be given. Then the constructed restriction satisfies the restriction predicate. ([source](./Restriction/Theorems.lean#L30))
- [ ] **RestrictionEqualsComposition** — Let the displayed domain, the displayed codomain, the named maps be given. Then restriction along an inclusion-like map is composition with that inclusion. ([source](./Restriction/Theorems.lean#L51))
- [ ] **RestrictionInjective** — Let the displayed domain, the displayed codomain, the named maps be given. Then restricting an injective map along an injective inclusion-like map is injective. ([source](./Restriction/Theorems.lean#L75))
- [ ] **RestrictionSurjectiveOfSurjective** — Let the displayed domain, the displayed codomain, the named maps be given. Then if the original map is surjective and the inclusion-like map is surjective onto the original domain, the restriction is surjective onto the same codomain. ([source](./Restriction/Theorems.lean#L101))

### 17. `Surjective/FailureModes.lean`

- [ ] **MissesValueIffNotSurjective** — Let the displayed domain, the displayed codomain, the named maps be given. Then missing a value is exactly a failure of surjectivity. ([source](./Surjective/FailureModes.lean#L41))
- [ ] **ShiftMissesZero** — Let the displayed map-theoretic structures be given. Then the successor shift misses zero. ([source](./Surjective/FailureModes.lean#L58))
- [ ] **ShiftNotSurjective** — Let the displayed map-theoretic structures be given. Then the successor shift is not surjective. ([source](./Surjective/FailureModes.lean#L73))

### 18. `Surjective/Theorems.lean`

- [ ] **surjective_iff_standard** — Let the displayed domain, the displayed codomain, the named maps be given. Then the LRA map definition agrees with Lean's standard surjectivity predicate. ([source](./Surjective/Theorems.lean#L25))

### 19. `Fiber/Theorems.lean`

- [ ] **FibreMembership** — Let the displayed domain, the displayed codomain, the named maps be given. Then the British-spelled Fibre alias has the same membership condition as Fiber. ([source](./Fiber/Theorems.lean#L26))
- [ ] **LevelSetMembership** — Let the displayed domain, the displayed codomain, the named maps be given. Then a level set is the fiber over the selected value. ([source](./Fiber/Theorems.lean#L49))
- [ ] **KernelRelationReflexive** — Let the displayed domain, the displayed codomain, the named maps be given. Then the kernel relation is reflexive. ([source](./Fiber/Theorems.lean#L70))
- [ ] **KernelRelationSymmetric** — Let the displayed domain, the displayed codomain, the named maps be given. Then the kernel relation is symmetric. ([source](./Fiber/Theorems.lean#L91))
- [ ] **KernelRelationTransitive** — Let the displayed domain, the displayed codomain, the named maps be given. Then the kernel relation is transitive. ([source](./Fiber/Theorems.lean#L115))
- [ ] **FiberSaturatedByMap** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then every fiber is saturated by the kernel relation of its map. ([source](./Fiber/Theorems.lean#L142))

### 20. `Graph/Relationships.lean`

- [ ] **GraphSingleValued** — Let the displayed domain, the displayed codomain, the named maps be given. Then the graph relation of a typed map is single-valued. ([source](./Graph/Relationships.lean#L24))
- [ ] **GraphTotalOverDomain** — Let the displayed domain, the displayed codomain, the named maps be given. Then the graph relation of a typed map is total over the map's domain. ([source](./Graph/Relationships.lean#L43))
- [ ] **GraphFunctionalRelation** — Let the displayed domain, the displayed codomain, the named maps be given. Then the graph relation of a typed map is functional. ([source](./Graph/Relationships.lean#L62))

### 21. `Preimage/Relationships.lean`

- [ ] **PreimageContainsInputOfTargetMember** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then if an input maps into the target, then it belongs to any set satisfying the preimage predicate. ([source](./Preimage/Relationships.lean#L35))
- [ ] **TargetMemberOfPreimageMember** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then membership in a preimage predicate means the input's value lies in the target. ([source](./Preimage/Relationships.lean#L70))
- [ ] **IsPreimageOfSingletonLikeIffIsFiberOf** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then the preimage of a singleton-like target is exactly the fiber over its point. ([source](./Preimage/Relationships.lean#L106))

### 22. `Retraction/Relationships.lean`

- [ ] **InjectiveOfRetraction** — Let the named maps be given. Then if retraction retracts an inclusion-like map, then the inclusion-like map is injective. ([source](./Retraction/Relationships.lean#L28))

### 23. `Section/Relationships.lean`

- [ ] **SurjectiveOfSection** — Let the displayed domain, the displayed codomain, the named maps be given. Then if a map has a section, then it is surjective. ([source](./Section/Relationships.lean#L27))

### 24. `Composition/Relationships.lean`

- [ ] **InjectiveCompose** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then the composition of injective maps is injective. ([source](./Composition/Relationships.lean#L30))
- [ ] **SurjectiveCompose** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then the composition of surjective maps is surjective. ([source](./Composition/Relationships.lean#L55))
- [ ] **BijectiveCompose** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then the composition of bijective maps is bijective. ([source](./Composition/Relationships.lean#L80))
- [ ] **LeftInverseCompose** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then left inverses compose in reverse order. ([source](./Composition/Relationships.lean#L111))
- [ ] **RightInverseCompose** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then right inverses compose in reverse order. ([source](./Composition/Relationships.lean#L148))
- [ ] **TwoSidedInverseCompose** — Let the displayed domain, the displayed codomain, the displayed intermediate set, the named maps be given. Then two-sided inverses compose in reverse order. ([source](./Composition/Relationships.lean#L185))

### 25. `Identity/Theorems.lean`

- [ ] **IdentityMapApply** — Let the displayed domain be given. Then evaluation of the identity map. ([source](./Identity/Theorems.lean#L24))
- [ ] **IdentityMapInjective** — Let the displayed domain be given. Then the identity map is injective. ([source](./Identity/Theorems.lean#L42))
- [ ] **IdentityMapSurjective** — Let the displayed domain be given. Then the identity map is surjective. ([source](./Identity/Theorems.lean#L59))
- [ ] **IdentityMapBijective** — Let the displayed domain be given. Then the identity map is bijective. ([source](./Identity/Theorems.lean#L76))

### 26. `Operation/Theorems.lean`

- [ ] **EndomapCompositionAssociative** — Let the displayed map-theoretic structures be given. Then endomap composition is associative. ([source](./Operation/Theorems.lean#L26))
- [ ] **EndomapCompositionIdentity** — Let the displayed map-theoretic structures be given. Then the identity map is a two-sided identity for endomap composition. ([source](./Operation/Theorems.lean#L45))
- [ ] **BijectiveEndomapHasCompositionInverse** — Let the named maps be given. Then a bijective endomap has a two-sided inverse element under endomap composition. ([source](./Operation/Theorems.lean#L69))
- [ ] **PointwiseAssociative** — Let the displayed domain, the displayed codomain be given. Then associativity transfers pointwise to function spaces. ([source](./Operation/Theorems.lean#L100))
- [ ] **PointwiseTwoSidedIdentity** — Let the displayed domain, the displayed codomain be given. Then two-sided identity laws transfer pointwise to function spaces. ([source](./Operation/Theorems.lean#L125))
- [ ] **PointwiseTwoSidedInverse** — Let the displayed domain, the displayed codomain, the named maps be given. Then two-sided inverse laws transfer pointwise to function spaces. ([source](./Operation/Theorems.lean#L154))

### 27. `Image/Relationships.lean`

- [ ] **ImageContainsValueOfSourceMember** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then members of the source map into any set satisfying the image predicate. ([source](./Image/Relationships.lean#L35))
- [ ] **ExistsSourceMemberOfImageMember** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then membership in an image predicate gives a source witness. ([source](./Image/Relationships.lean#L70))
- [ ] **SurjectiveOfImageCoversCodomain** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then if an image of an ambient source contains every codomain element, then the map is surjective. ([source](./Image/Relationships.lean#L105))
- [ ] **ImageWitnessUniqueOfInjective** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for an injective map, two source witnesses for the same image member are equal. ([source](./Image/Relationships.lean#L141))

### 28. `Inverse/Theorems.lean`

- [ ] **InverseFunctionLeftCancellation** — Let the displayed domain, the displayed codomain, the named maps be given. Then an inverse function cancels the original map on the left. ([source](./Inverse/Theorems.lean#L33))
- [ ] **InverseFunctionRightCancellation** — Let the displayed domain, the displayed codomain, the named maps be given. Then an inverse function cancels the original map on the right. ([source](./Inverse/Theorems.lean#L55))
- [ ] **TwoSidedInverseBijective** — Let the displayed domain, the displayed codomain, the named maps be given. Then any two-sided inverse is bijective as a map in the reverse direction. ([source](./Inverse/Theorems.lean#L77))
- [ ] **InverseFunctionBijective** — Let the displayed domain, the displayed codomain, the named maps be given. Then an inverse function is bijective. ([source](./Inverse/Theorems.lean#L98))
- [ ] **LeftInverseImpliesLeftInverseOn** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a global left inverse restricts to any source set. ([source](./Inverse/Theorems.lean#L121))
- [ ] **RightInverseImpliesRightInverseOn** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a global right inverse restricts to any target set. ([source](./Inverse/Theorems.lean#L146))
- [ ] **TwoSidedInverseImpliesTwoSidedInverseOn** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then a two-sided inverse restricts to any chosen source and target. ([source](./Inverse/Theorems.lean#L173))
- [ ] **RightInverseOnImageOfLeftInverseOn** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then if an inverse recovers every point of a source after applying the map, then it is a right inverse on the image of that source. ([source](./Inverse/Theorems.lean#L215))
- [ ] **TwoSidedInverseOnImageOfLeftInverseOn** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then an inverse on a source is automatically a two-sided inverse between the source and its image. ([source](./Inverse/Theorems.lean#L242))
- [ ] **PreimageEqualsImageOfInverseFunction** — Let the displayed domain, the displayed codomain, the represented source and target sets, the named maps be given. Then for a bijective map with inverse function, set-valued preimage agrees with direct image under the inverse function. ([source](./Inverse/Theorems.lean#L284))

### 29. `Fiber/Relationships.lean`

- [ ] **FiberMembership** — Let the displayed domain, the displayed codomain, the named maps be given. Then membership in the predicate fiber is equality to the selected output. ([source](./Fiber/Relationships.lean#L28))
- [ ] **InjectiveIffFibersSubsingleton** — Let the displayed domain, the displayed codomain, the named maps be given. Then a map is injective exactly when every predicate fiber has at most one member. ([source](./Fiber/Relationships.lean#L53))
- [ ] **SurjectiveIffEveryFiberNonempty** — Let the displayed domain, the displayed codomain, the named maps be given. Then a map is surjective exactly when every predicate fiber is nonempty. ([source](./Fiber/Relationships.lean#L77))

### 30. `Identity/Relationships.lean`

- [ ] **IdentityMapTwoSidedInverse** — Let the displayed domain be given. Then the identity map is its own two-sided inverse. ([source](./Identity/Relationships.lean#L26))

### 31. `Inverse/Relationships.lean`

- [ ] **InjectiveOfLeftInverse** — Let the displayed domain, the displayed codomain, the named maps be given. Then having a left inverse forces the original map to be injective. ([source](./Inverse/Relationships.lean#L28))
- [ ] **SurjectiveOfRightInverse** — Let the displayed domain, the displayed codomain, the named maps be given. Then having a right inverse forces the original map to be surjective. ([source](./Inverse/Relationships.lean#L51))
- [ ] **InjectiveAndSurjectiveOfTwoSidedInverse** — Let the displayed domain, the displayed codomain, the named maps be given. Then a two-sided inverse gives injectivity and surjectivity. ([source](./Inverse/Relationships.lean#L74))

### 32. `Bijective/Relationships.lean`

- [ ] **BijectiveIffInjectiveAndSurjective** — Let the displayed domain, the displayed codomain, the named maps be given. Then bijectivity is exactly injectivity together with surjectivity. ([source](./Bijective/Relationships.lean#L28))
- [ ] **BijectiveOfTwoSidedInverse** — Let the displayed domain, the displayed codomain, the named maps be given. Then a map with a two-sided inverse is bijective. ([source](./Bijective/Relationships.lean#L50))

### 33. `Relation/Relationships.lean`

- [ ] **GraphRelationDomain** — Let a typed map and an input be given. Then the input belongs to the relation domain of the map's graph. ([source](./Relation/Relationships.lean#L28))
- [ ] **GraphRelationRangeIff** — Let a typed map and a codomain element be given. Then the element lies in the relation range of the graph exactly when the map hits it. ([source](./Relation/Relationships.lean#L51))
- [ ] **GraphRelationImageEqualsMapImage** — Let a typed map and a represented source set be given. Then image under the graph relation equals direct image under the map. ([source](./Relation/Relationships.lean#L75))
- [ ] **GraphRelationPreimageEqualsMapPreimage** — Let a typed map and a represented target set be given. Then preimage under the graph relation equals preimage under the map. ([source](./Relation/Relationships.lean#L108))
