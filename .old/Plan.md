# ZFCSet Proof Plan With Concrete Lean Targets

This plan orders the proof work needed to turn the current `ZFCSet` scaffold
into a real ZFC-backed backend for the set-algebra signatures.

The table entries name the Lean file and the sorry'd theorem that should be
closed by each proof step.  Steps marked "new theorem" are not present yet and
should be added before the dependent sorry is closed.

## Phase 1: Bridge Unfolding And Extensionality

| Order | Lean File | Theorem To Close | Purpose |
| --- | --- | --- | --- |
| 1 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `ToPredicateSetMembershipIff` | Unfold `ToPredicateSet` to `zfcSetMembership`. This should be direct from definitions. |
| 2 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `ZFSetToPredicateSetMembershipIff` | Specialize `ToPredicateSetMembershipIff` to Mathlib `ZFSet` and `zfSetModel`. |
| 3 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `SetObjectExtensionalityFromPredicateSet` | Use `extensionalityAxiomReading` to turn predicate-set equality into equality of model-internal set objects. |

Already closed but dependent on this infrastructure:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `RawSetObjectUniqueByMembers` |
| `LRA/VolumeI/Set/ZFCSet.lean` | `EqualByMembers` |

## Phase 2: Empty Set Existence

| Order | Lean File | Theorem To Add/Close | Purpose |
| --- | --- | --- | --- |
| 4 | `LRA/VolumeI/Set/ZFC/Semantics/AxiomReadings.lean` | new theorem `emptySetAxiomReading` | Extract the element-level empty-set axiom reading: `∃ emptySet, ∀ x, ¬ zfcSetMembership M x emptySet`. |
| 5 | `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.ZFCProvidesEmptySet` | Use `emptySetAxiomReading`; prove the empty set is a subset of `UniverseSet` vacuously. |

Closes specs automatically after step 5:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.EmptySpec` |

## Phase 3: Pair And Union Witness Bridges

| Order | Lean File | Theorem To Close | Purpose |
| --- | --- | --- | --- |
| 6 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `PairSetWitnessToPredicateSet` | Convert an element-level pair-set witness into the predicate-set singleton union. |
| 7 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `BasicAxiomsProvidePairSetWitness` | Use `pairingAxiomReading` to supply a pair-set witness. |
| 8 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `UnionSetWitnessToPredicateSet` | Convert an element-level ZFC union witness into indexed predicate-set union over members of a family set. |
| 9 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `BasicAxiomsProvideUnionSetWitness` | Use `unionAxiomReading` to supply the model-internal union set. |

Existing supporting theorem, already proved:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFC/Semantics/AxiomReadings.lean` | `pairingAxiomReading` |
| `LRA/VolumeI/Set/ZFC/Semantics/AxiomReadings.lean` | `unionAxiomReading` |

## Phase 4: Binary Union

| Order | Lean File | Theorem To Close | Purpose |
| --- | --- | --- | --- |
| 10 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `BinaryUnionSetWitnessToPredicateSet` | Convert a direct element-level binary-union witness to predicate-set union. |
| 11 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `BasicAxiomsProvideBinaryUnionSetWitness` | Derive binary union from Pairing followed by Union. |
| 12 | `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.ZFCProvidesUnion` | Use `BasicAxiomsProvideBinaryUnionSetWitness`; prove the result is still a subset of `UniverseSet`. |

Closes specs automatically after step 12:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.UnionSpec` |

## Phase 5: Intersection By Separation

| Order | Lean File | Theorem To Add/Close | Purpose |
| --- | --- | --- | --- |
| 13 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `IntersectionSetWitnessToPredicateSet` | Convert an element-level intersection witness into predicate-set intersection. |
| 14 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | new theorem `SeparationProvidesIntersectionSetWitness` | Use Separation on `LeftSet` with predicate `x ∈ RightSet`. |
| 15 | `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.ZFCProvidesIntersection` | Use the Separation-derived witness; prove subset of `UniverseSet` from the left input. |

Closes specs automatically after step 15:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.IntersectionSpec` |

## Phase 6: Difference And Relative Complement

| Order | Lean File | Theorem To Add/Close | Purpose |
| --- | --- | --- | --- |
| 16 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `RelativeComplementWitnessToPredicateSet` | Convert an element-level relative-complement witness into predicate-set difference. |
| 17 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | new theorem `SeparationProvidesRelativeComplementWitness` | Use Separation on `LeftSet` with predicate `¬ x ∈ RightSet`. |
| 18 | `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.ZFCProvidesDifference` | Use the Separation-derived witness; prove subset of `UniverseSet` from the left input. |

Closes specs automatically after step 18:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.DifferenceSpec` |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.ComplementSpec` |

## Phase 7: Symmetric Difference

| Order | Lean File | Theorem To Close | Purpose |
| --- | --- | --- | --- |
| 19 | `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.ZFCProvidesSymmetricDifference` | Build `(Left \ Right) ∪ (Right \ Left)` using `ZFCProvidesDifference` and `ZFCProvidesUnion`; prove the symmetric-difference membership spec. |

Closes specs automatically after step 19:

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.SymmetricDifferenceSpec` |

## Phase 8: Full Relative Powerset Contract

The following theorem is already closed because `IsMember := fun _ => True` on
the carrier `ZFCSet Universe` means the full relative powerset of
`Universe.UniverseSet`.

| Lean File | Theorem |
| --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` | `ZFCSet.SetAlgebraLaws` |

Do not treat this as the final validation. It validates the carrier and
operation plumbing only.

## Phase 9: Proper Restricted ZFCSet Algebra

These declarations do not exist yet. Add them only after phases 2-7 have real
proofs, so they do not stack new restricted-algebra sorries on top of operation
existence sorries.

| Order | Lean File | Theorem/Definition To Add | Purpose |
| --- | --- | --- | --- |
| 20 | `LRA/VolumeI/Set/ZFCSet.lean` | new def `ZFCSet.IsEmptyOrUniversal` | Define proper algebra membership: `Set = Empty Universe ∨ Set = Universal Universe`. |
| 21 | `LRA/VolumeI/Set/ZFCSet.lean` | new def `ZFCSet.EmptyUniversalSetAlgebraSignature` | Signature with `IsMember := IsEmptyOrUniversal`. |
| 22 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.EmptyComplementIsUniversal` | Prove complement of empty is universal by `ComplementSpec`, `EmptySpec`, and extensionality. |
| 23 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.UniversalComplementIsEmpty` | Prove complement of universal is empty by `ComplementSpec` and extensionality. |
| 24 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.EmptyUniversalUnionClosure` | Prove closure of `{∅, U}` under union using `UnionSpec`. |
| 25 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.EmptyUniversalIntersectionClosure` | Prove closure of `{∅, U}` under intersection using `IntersectionSpec`. |
| 26 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.EmptyUniversalDifferenceClosure` | Prove closure of `{∅, U}` under difference using `DifferenceSpec`. |
| 27 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.EmptyUniversalSymmetricDifferenceClosure` | Prove closure of `{∅, U}` under symmetric difference using `SymmetricDifferenceSpec`. |
| 28 | `LRA/VolumeI/Set/ZFCSet.lean` | new theorem `ZFCSet.EmptyUniversalSetAlgebraLaws` | Assemble the closure lemmas into `SetAlgebraLaws`. |
| 29 | `LRA/VolumeI/Set/ZFCSet.lean` | new def `ZFCSet.EmptyUniversalSetAlgebraModel` | Bundle the restricted algebra model. |

## Phase 10: Mathlib/LRASet Switch Sorries

These are outside the ZFCSet derivation path but should also be closed.

| Lean File | Theorem To Close | Purpose |
| --- | --- | --- |
| `LRA/VolumeII/Switches/Sets/Basic.lean` | `activeSetAlgebraLaws` | Replace full-powerset plumbing sorry with a direct `constructor <;> trivial` proof. |
| `LRA/VolumeII/Switches/Sets/Basic.lean` | `activeSigmaAlgebraLaws` | Prove full powerset sigma closure by trivial membership. |
| `LRA/VolumeII/Switches/Sets/Basic.lean` | `lraSetAlgebraLaws` | Prove full predicate-set algebra closure by trivial membership. |

## Phase 11: Isomorphism/Switch Bridge Sorries

These are useful for backend comparison, but they do not block the
finite-operation ZFCSet algebra contract.

| Order | Lean File | Theorem To Close |
| --- | --- | --- |
| 30 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `ZFCModelIsomorphismMembershipIff` |
| 31 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `PullbackToPredicateSetPushForward` |
| 32 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `PushForwardToPredicateSet` |
| 33 | `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean` | `ZFCModelSwitchToZFSetMembershipIff` |

## Phase 12: Sigma Structures Later

Do not define external `Nat -> ZFCSet Universe` countable union as a ZFC
operation yet.  ZFC gives unions of model-internal families, not arbitrary
Lean-external families.

Future declarations should introduce an internal countable-family API before
attempting `SigmaRingSignature` or `SigmaAlgebraSignature` for `ZFCSet`.

Suggested future targets:

| Lean File | Declaration To Add | Purpose |
| --- | --- | --- |
| `LRA/VolumeI/Set/ZFCSet.lean` or a new `LRA/VolumeI/Set/ZFCSet/Sigma.lean` | `ZFCSet.CountableFamily` | Internal code for a countable family indexed by the model's natural-number object. |
| same | `ZFCSet.CountableUnion` | Union of an internally coded countable family. |
| same | `ZFCSet.SigmaAlgebraSignature` | Signature only after internal countable families are available. |
| same | `ZFCSet.SigmaAlgebraLaws` | Closure proof only after the internal family construction is proved. |
