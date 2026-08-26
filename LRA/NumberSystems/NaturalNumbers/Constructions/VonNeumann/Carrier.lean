import LRA.Set.Constructions.ZFCSet.Axioms

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheInfinityWitness` TODO

Predicate logic:

  noncomputable def TheInfinityWitness : LRA.Set.Constructions.ZFCSet :=
  Classical.choose Infinity

Predicate logic (unfolded):

  noncomputable def TheInfinityWitness : LRA.Set.Constructions.ZFCSet :=
  Classical.choose Infinity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheInfinityWitness : LRA.Set.Constructions.ZFCSet :=
  Classical.choose Infinity
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
noncomputable def TheInfinityWitness : LRA.Set.Constructions.ZFCSet :=
  Classical.choose Infinity

/--
`TheInfinityWitnessIsInductiveSet` TODO

Predicate logic:

  IsInductiveSet TheInfinityWitness

Predicate logic (unfolded):

  (Exists fun empty => (LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.TheInfinityWitness empty ∧ ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 empty x → False) ∧ ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.TheInfinityWitness x → Exists fun successor => (LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.TheInfinityWitness successor ∧ ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)))

Logical form (Lean):

```lean
theorem TheInfinityWitnessIsInductiveSet :
    IsInductiveSet TheInfinityWitness
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
theorem TheInfinityWitnessIsInductiveSet :
    IsInductiveSet TheInfinityWitness := by
  sorry

/--
`VonNeumannSuccessor` TODO

Predicate logic:

  noncomputable def VonNeumannSuccessor (x : LRA.Set.Constructions.ZFCSet) : LRA.Set.Constructions.ZFCSet :=
  TheUnion x (TheSingleton x)

Predicate logic (unfolded):

  noncomputable def VonNeumannSuccessor (x : LRA.Set.Constructions.ZFCSet) : LRA.Set.Constructions.ZFCSet :=
  TheUnion x (TheSingleton x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def VonNeumannSuccessor (x : LRA.Set.Constructions.ZFCSet) : LRA.Set.Constructions.ZFCSet :=
  TheUnion x (TheSingleton x)
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
noncomputable def VonNeumannSuccessor (x : LRA.Set.Constructions.ZFCSet) : LRA.Set.Constructions.ZFCSet :=
  TheUnion x (TheSingleton x)

/--
`VonNeumannSuccessorIsSuccessorOf` TODO

Predicate logic:

  (∀ x ∈ LRA.Set.Constructions.ZFCSet), IsSuccessorOf x (VonNeumannSuccessor x)

Predicate logic (unfolded):

  ∀ (x : LRA.Set.Constructions.ZFCSet) (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet x (LRA.Set.Constructions.ZFCSet.Axioms.TheSingleton x))) ⋯).val w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)

Logical form (Lean):

```lean
theorem VonNeumannSuccessorIsSuccessorOf (x : LRA.Set.Constructions.ZFCSet) :
    IsSuccessorOf x (VonNeumannSuccessor x)
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
theorem VonNeumannSuccessorIsSuccessorOf (x : LRA.Set.Constructions.ZFCSet) :
    IsSuccessorOf x (VonNeumannSuccessor x) := by
  sorry

/--
`Omega` TODO

Predicate logic:

  noncomputable def Omega : LRA.Set.Constructions.ZFCSet :=
  TheSeparatedSubset TheInfinityWitness
    (fun x => ∀ B : LRA.Set.Constructions.ZFCSet, IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B)

Predicate logic (unfolded):

  noncomputable def Omega : LRA.Set.Constructions.ZFCSet :=
  TheSeparatedSubset TheInfinityWitness
    (fun x => ∀ B : LRA.Set.Constructions.ZFCSet, IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def Omega : LRA.Set.Constructions.ZFCSet :=
  TheSeparatedSubset TheInfinityWitness
    (fun x => ∀ B : LRA.Set.Constructions.ZFCSet, IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B)
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
noncomputable def Omega : LRA.Set.Constructions.ZFCSet :=
  TheSeparatedSubset TheInfinityWitness
    (fun x => ∀ B : LRA.Set.Constructions.ZFCSet, IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B)

/--
`OmegaIsInductiveSet` TODO

Predicate logic:

  IsInductiveSet Omega

Predicate logic (unfolded):

  (Exists fun empty => (LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Omega empty ∧ ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 empty x → False) ∧ ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Omega x → Exists fun successor => (LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Omega successor ∧ ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)))

Logical form (Lean):

```lean
theorem OmegaIsInductiveSet : IsInductiveSet Omega
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
theorem OmegaIsInductiveSet : IsInductiveSet Omega := by
  sorry

/--
`TheEmptySetInOmega` TODO

Predicate logic:

  TheEmptySet ∈ Omega

Predicate logic (unfolded):

  LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Omega LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySet

Logical form (Lean):

```lean
theorem TheEmptySetInOmega : TheEmptySet ∈ Omega
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
theorem TheEmptySetInOmega : TheEmptySet ∈ Omega := by
  sorry

/--
`OmegaClosedUnderSuccessor` TODO

Predicate logic:

  ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ Omega → VonNeumannSuccessor x ∈ Omega

Predicate logic (unfolded):

  ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Omega x → LRA.Set.instMembershipZFCSet.1 LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Omega (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet x (LRA.Set.Constructions.ZFCSet.Axioms.TheSingleton x))) ⋯).1

Logical form (Lean):

```lean
theorem OmegaClosedUnderSuccessor :
    ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ Omega → VonNeumannSuccessor x ∈ Omega
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
theorem OmegaClosedUnderSuccessor :
    ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ Omega → VonNeumannSuccessor x ∈ Omega := by
  sorry

/--
`NaturalElement` TODO

Predicate logic:

  def NaturalElement : Type := {x : LRA.Set.Constructions.ZFCSet // x ∈ Omega}

Predicate logic (unfolded):

  def NaturalElement : Type := {x : LRA.Set.Constructions.ZFCSet // x ∈ Omega} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalElement : Type := {x : LRA.Set.Constructions.ZFCSet // x ∈ Omega}
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
def NaturalElement : Type := {x : LRA.Set.Constructions.ZFCSet // x ∈ Omega}

instance (priority := high) : Membership NaturalElement LRA.Set.Constructions.ZFCSet where
  mem containingSet element := element.val ∈ containingSet

/--
`NaturalZero` TODO

Predicate logic:

  noncomputable def NaturalZero : NaturalElement :=
  ⟨TheEmptySet, TheEmptySetInOmega⟩

Predicate logic (unfolded):

  noncomputable def NaturalZero : NaturalElement :=
  ⟨TheEmptySet, TheEmptySetInOmega⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def NaturalZero : NaturalElement :=
  ⟨TheEmptySet, TheEmptySetInOmega⟩
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
noncomputable def NaturalZero : NaturalElement :=
  ⟨TheEmptySet, TheEmptySetInOmega⟩

/--
`NaturalSuccessor` TODO

Predicate logic:

  noncomputable def NaturalSuccessor (element : NaturalElement) : NaturalElement :=
  ⟨VonNeumannSuccessor element.val, OmegaClosedUnderSuccessor element.val element.property⟩

Predicate logic (unfolded):

  noncomputable def NaturalSuccessor (element : NaturalElement) : NaturalElement :=
  ⟨VonNeumannSuccessor element.val, OmegaClosedUnderSuccessor element.val element.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def NaturalSuccessor (element : NaturalElement) : NaturalElement :=
  ⟨VonNeumannSuccessor element.val, OmegaClosedUnderSuccessor element.val element.property⟩
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
noncomputable def NaturalSuccessor (element : NaturalElement) : NaturalElement :=
  ⟨VonNeumannSuccessor element.val, OmegaClosedUnderSuccessor element.val element.property⟩

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
