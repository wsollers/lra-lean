import LRA.Set.Constructions.NBGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.NBGSet.Interface.ModelTheory.LStructure

/-! NBG satisfies its own exported NBG theory. -/

namespace LRA.Set.Constructions.NBG

open LRA.Set.Constructions.NBG.Axioms
open LRA.Set.Constructions.NBG.Interface.ModelTheory

/--
`AmbientTwoSortedClassStructure` TODO

Predicate logic:

  noncomputable def AmbientTwoSortedClassStructure : TwoSortedClassStructure where
    setCarrier := LRA.Set.Constructions.NBGSet
    setCarrierNonempty := ⟨TheEmptySet⟩
    classCarrier := LRA.Set.Constructions.NBGClass
    classOfSet := LRA.Set.Constructions.NBG.ClassOfSet
    setMembership := fun x y => x ∈ y
    classMembership := fun x X => x ∈ X
    orderedPair := LRA.Set.Constructions.NBG.OrderedPair

Predicate logic (unfolded):

  noncomputable def AmbientTwoSortedClassStructure : TwoSortedClassStructure where
    setCarrier := LRA.Set.Constructions.NBGSet
    setCarrierNonempty := ⟨TheEmptySet⟩
    classCarrier := LRA.Set.Constructions.NBGClass
    classOfSet := LRA.Set.Constructions.NBG.ClassOfSet
    setMembership := fun x y => x ∈ y
    classMembership := fun x X => x ∈ X
    orderedPair := LRA.Set.Constructions.NBG.OrderedPair (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def AmbientTwoSortedClassStructure : TwoSortedClassStructure where
  setCarrier := LRA.Set.Constructions.NBGSet
  setCarrierNonempty := ⟨TheEmptySet⟩
  classCarrier := LRA.Set.Constructions.NBGClass
  classOfSet := LRA.Set.Constructions.NBG.ClassOfSet
  setMembership := fun x y => x ∈ y
  classMembership := fun x X => x ∈ X
  orderedPair := LRA.Set.Constructions.NBG.OrderedPair
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
noncomputable def AmbientTwoSortedClassStructure : TwoSortedClassStructure where
  setCarrier := LRA.Set.Constructions.NBGSet
  setCarrierNonempty := ⟨TheEmptySet⟩
  classCarrier := LRA.Set.Constructions.NBGClass
  classOfSet := LRA.Set.Constructions.NBG.ClassOfSet
  setMembership := fun x y => x ∈ y
  classMembership := fun x X => x ∈ X
  orderedPair := LRA.Set.Constructions.NBG.OrderedPair

/--
`AmbientSingleSortedClassStructure` TODO

Predicate logic:

  noncomputable def AmbientSingleSortedClassStructure : SingleSortedClassStructure :=
    toSingleSortedClassStructure AmbientTwoSortedClassStructure

Predicate logic (unfolded):

  noncomputable def AmbientSingleSortedClassStructure : SingleSortedClassStructure :=
    toSingleSortedClassStructure AmbientTwoSortedClassStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def AmbientSingleSortedClassStructure : SingleSortedClassStructure :=
  toSingleSortedClassStructure AmbientTwoSortedClassStructure
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
noncomputable def AmbientSingleSortedClassStructure : SingleSortedClassStructure :=
  toSingleSortedClassStructure AmbientTwoSortedClassStructure

/--
`AmbientSingleSortedMembershipModel` TODO

Predicate logic:

  noncomputable def AmbientSingleSortedMembershipModel :=
    toFirstOrderModel AmbientSingleSortedClassStructure

Predicate logic (unfolded):

  noncomputable def AmbientSingleSortedMembershipModel :=
    toFirstOrderModel AmbientSingleSortedClassStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def AmbientSingleSortedMembershipModel :=
  toFirstOrderModel AmbientSingleSortedClassStructure
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
@[reducible] noncomputable def AmbientSingleSortedMembershipModel :=
  toFirstOrderModel AmbientSingleSortedClassStructure

/--
`ambientStructureIsStandardModelPair` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.IsStandardModelPair LRA.Set.Constructions.NBG.AmbientTwoSortedClassStructure

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.AmbientTwoSortedClassStructure.6 x (LRA.Set.Constructions.NBG.AmbientTwoSortedClassStructure.4 A) ↔ LRA.Set.Constructions.NBG.AmbientTwoSortedClassStructure.5 x A

Logical form (Lean):

```lean
theorem ambientStructureIsStandardModelPair :
    IsStandardModelPair AmbientTwoSortedClassStructure
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
theorem ambientStructureIsStandardModelPair :
    IsStandardModelPair AmbientTwoSortedClassStructure := by
  sorry

/--
`ambientStructureSupportsSingleSortedPresentation` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsSingleSortedPresentation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsSingleSortedPresentation

Logical form (Lean):

```lean
theorem ambientStructureSupportsSingleSortedPresentation :
    SupportsSingleSortedPresentation
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
theorem ambientStructureSupportsSingleSortedPresentation :
    SupportsSingleSortedPresentation := by
  sorry

/--
`ambientStructureSupportsTwoSortedPresentation` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTwoSortedPresentation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTwoSortedPresentation

Logical form (Lean):

```lean
theorem ambientStructureSupportsTwoSortedPresentation :
    SupportsTwoSortedPresentation
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
theorem ambientStructureSupportsTwoSortedPresentation :
    SupportsTwoSortedPresentation := by
  sorry

/--
`ambientStructureSupportsClassExtensionality` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality

Logical form (Lean):

```lean
theorem ambientStructureSupportsClassExtensionality :
    SupportsClassExtensionality
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
theorem ambientStructureSupportsClassExtensionality :
    SupportsClassExtensionality := by
  sorry

/--
`ambientStructureSupportsClassRegularity` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity

Logical form (Lean):

```lean
theorem ambientStructureSupportsClassRegularity :
    SupportsClassRegularity
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
theorem ambientStructureSupportsClassRegularity :
    SupportsClassRegularity := by
  sorry

/--
`ambientStructureSupportsPairing` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing

Logical form (Lean):

```lean
theorem ambientStructureSupportsPairing :
    SupportsPairing
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
theorem ambientStructureSupportsPairing :
    SupportsPairing := by
  sorry

/--
`ambientStructureSupportsUnion` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion

Logical form (Lean):

```lean
theorem ambientStructureSupportsUnion :
    SupportsUnion
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
theorem ambientStructureSupportsUnion :
    SupportsUnion := by
  sorry

/--
`ambientStructureSupportsPowerSet` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet

Logical form (Lean):

```lean
theorem ambientStructureSupportsPowerSet :
    SupportsPowerSet
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
theorem ambientStructureSupportsPowerSet :
    SupportsPowerSet := by
  sorry

/--
`ambientStructureSupportsInfinity` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity

Logical form (Lean):

```lean
theorem ambientStructureSupportsInfinity :
    SupportsInfinity
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
theorem ambientStructureSupportsInfinity :
    SupportsInfinity := by
  sorry

/--
`ambientStructureSupportsUniversalClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsUniversalClass :
    SupportsUniversalClass
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
theorem ambientStructureSupportsUniversalClass :
    SupportsUniversalClass := by
  sorry

/--
`ambientStructureSupportsElementhoodClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsElementhoodClass :
    SupportsElementhoodClass
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
theorem ambientStructureSupportsElementhoodClass :
    SupportsElementhoodClass := by
  sorry

/--
`ambientStructureSupportsIntersectionClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsIntersectionClass :
    SupportsIntersectionClass
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
theorem ambientStructureSupportsIntersectionClass :
    SupportsIntersectionClass := by
  sorry

/--
`ambientStructureSupportsComplementClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsComplementClass :
    SupportsComplementClass
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
theorem ambientStructureSupportsComplementClass :
    SupportsComplementClass := by
  sorry

/--
`ambientStructureSupportsDomainClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsDomainClass :
    SupportsDomainClass
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
theorem ambientStructureSupportsDomainClass :
    SupportsDomainClass := by
  sorry

/--
`ambientStructureSupportsCartesianExtensionClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsCartesianExtensionClass :
    SupportsCartesianExtensionClass
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
theorem ambientStructureSupportsCartesianExtensionClass :
    SupportsCartesianExtensionClass := by
  sorry

/--
`ambientStructureSupportsPermutationClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsPermutationClass :
    SupportsPermutationClass
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
theorem ambientStructureSupportsPermutationClass :
    SupportsPermutationClass := by
  sorry

/--
`ambientStructureSupportsTranspositionClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass

Logical form (Lean):

```lean
theorem ambientStructureSupportsTranspositionClass :
    SupportsTranspositionClass
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
theorem ambientStructureSupportsTranspositionClass :
    SupportsTranspositionClass := by
  sorry

/--
`ambientStructureSupportsReplacement` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement

Logical form (Lean):

```lean
theorem ambientStructureSupportsReplacement :
    SupportsReplacement
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
theorem ambientStructureSupportsReplacement :
    SupportsReplacement := by
  sorry

/--
`ambientStructureSupportsGlobalChoice` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice

Logical form (Lean):

```lean
theorem ambientStructureSupportsGlobalChoice :
    SupportsGlobalChoice
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
theorem ambientStructureSupportsGlobalChoice :
    SupportsGlobalChoice := by
  sorry

/--
`ambientFiniteNBGAxiomHolds` TODO

Predicate logic:

  ∀ (axiomName : LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName), LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomHolds axiomName

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    axiomName : FiniteNBGAxiomName
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName.rec ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice) Unit.unit) axiomName

Logical form (Lean):

```lean
theorem ambientFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName
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
theorem ambientFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName := by
  sorry

/--
`ambientStructureSatisfiesFiniteNBGAxiomatization` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesFiniteNBGAxiomatization

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesFiniteNBGAxiomatization

Logical form (Lean):

```lean
theorem ambientStructureSatisfiesFiniteNBGAxiomatization :
    SatisfiesFiniteNBGAxiomatization
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
theorem ambientStructureSatisfiesFiniteNBGAxiomatization :
    SatisfiesFiniteNBGAxiomatization := by
  sorry

/--
`ambientStructureSatisfiesNBG` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesNBG

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesNBG

Logical form (Lean):

```lean
theorem ambientStructureSatisfiesNBG :
    SatisfiesNBG
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
theorem ambientStructureSatisfiesNBG :
    SatisfiesNBG := by
  sorry

end LRA.Set.Constructions.NBG
