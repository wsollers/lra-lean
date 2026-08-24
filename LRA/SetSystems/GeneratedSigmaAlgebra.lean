import LRA.SetSystems.SigmaAlgebra

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

/--
`GeneratedSigmaAlgebraCollection` TODO

Predicate logic:

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (a : SetObject) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.IsMember G) → sigma.IsMember a

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (a : SetObject) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 a

Logical form (Lean):

```lean
def GeneratedSigmaAlgebraCollection
    (ambient : SetObject) (generator : SetObject → Prop) :
    SetObject → Prop :=
  fun A =>
    ∀ sigma : SigmaAlgebraOfSets ambient,
      (∀ G, generator G → sigma.IsMember G) → sigma.IsMember A
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
def GeneratedSigmaAlgebraCollection
    (ambient : SetObject) (generator : SetObject → Prop) :
    SetObject → Prop :=
  fun A =>
    ∀ sigma : SigmaAlgebraOfSets ambient,
      (∀ G, generator G → sigma.IsMember G) → sigma.IsMember A

/--
`GeneratorAdmissible` TODO

Predicate logic:

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop), Exists fun sigma => ∀ (G : SetObject), generator G → sigma.IsMember G

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop), Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G

Logical form (Lean):

```lean
def GeneratorAdmissible
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ∃ sigma : SigmaAlgebraOfSets ambient,
    ∀ G, generator G → sigma.IsMember G
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
def GeneratorAdmissible
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ∃ sigma : SigmaAlgebraOfSets ambient,
    ∀ G, generator G → sigma.IsMember G

/--
`GeneratedSigmaAlgebraMembersAreSubsets` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → ∀ A, GeneratedSigmaAlgebraCollection A generator A → A ⊆ A

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop), (Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → ∀ (A : SetObject), (∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A) → inst_4.1 A ambient

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraMembersAreSubsets
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A →
      A ⊆ ambient
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
theorem GeneratedSigmaAlgebraMembersAreSubsets
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A →
      A ⊆ ambient := by
  sorry

/--
`GeneratedSigmaAlgebraEmptyIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → GeneratedSigmaAlgebraCollection A generator ∅ ∈ SetObject

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 inst_3.1

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraEmptyIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    GeneratedSigmaAlgebraCollection ambient generator (∅ : SetObject)
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
theorem GeneratedSigmaAlgebraEmptyIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    GeneratedSigmaAlgebraCollection ambient generator (∅ : SetObject) := by
  sorry

/--
`GeneratedSigmaAlgebraUnionIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → ∀ A B, GeneratedSigmaAlgebraCollection A generator A → GeneratedSigmaAlgebraCollection A generator B → GeneratedSigmaAlgebraCollection A generator (A ∪ B)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (A B : SetObject), (∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A ∧ ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 B) → ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 (inst.1 A B)

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraUnionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∪ B)
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
theorem GeneratedSigmaAlgebraUnionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∪ B) := by
  sorry

/--
`GeneratedSigmaAlgebraIntersectionIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → ∀ A B, GeneratedSigmaAlgebraCollection A generator A → GeneratedSigmaAlgebraCollection A generator B → GeneratedSigmaAlgebraCollection A generator (A ∩ B)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (A B : SetObject), (∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A ∧ ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 B) → ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 (inst_1.1 A B)

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraIntersectionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∩ B)
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
theorem GeneratedSigmaAlgebraIntersectionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∩ B) := by
  sorry

/--
`GeneratedSigmaAlgebraDifferenceIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → ∀ A B, GeneratedSigmaAlgebraCollection A generator A → GeneratedSigmaAlgebraCollection A generator B → GeneratedSigmaAlgebraCollection A generator (A \ B)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (A B : SetObject), (∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A ∧ ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 B) → ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 (inst_2.1 A B)

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraDifferenceIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A \ B)
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
theorem GeneratedSigmaAlgebraDifferenceIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A \ B) := by
  sorry

/--
`GeneratedSigmaAlgebraSymmetricDifferenceIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → ∀ A B, GeneratedSigmaAlgebraCollection A generator A → GeneratedSigmaAlgebraCollection A generator B → GeneratedSigmaAlgebraCollection A generator (A ∆ B)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (A B : SetObject), (∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A ∧ ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 B) → ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 (inst_5.1 A B)

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraSymmetricDifferenceIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∆ B)
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
theorem GeneratedSigmaAlgebraSymmetricDifferenceIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ A B,
      GeneratedSigmaAlgebraCollection ambient generator A →
      GeneratedSigmaAlgebraCollection ambient generator B →
      GeneratedSigmaAlgebraCollection ambient generator (A ∆ B) := by
  sorry

/--
`GeneratedSigmaAlgebraAmbientIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → GeneratedSigmaAlgebraCollection A generator A

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 ambient

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraAmbientIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    GeneratedSigmaAlgebraCollection ambient generator ambient
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
theorem GeneratedSigmaAlgebraAmbientIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    GeneratedSigmaAlgebraCollection ambient generator ambient := by
  sorry

/--
`GeneratedSigmaAlgebraCountableUnionIsMember` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → ∀ family : Nat → SetObject, (∀ index, GeneratedSigmaAlgebraCollection A generator (family index)) → GeneratedSigmaAlgebraCollection A generator (HasCountableUnion.countableUnion family)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (family : Nat → SetObject), (∀ (index : Nat) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 (family index)) → ∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 (inst_6.1 family)

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraCountableUnionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ family : Nat → SetObject,
      (∀ index, GeneratedSigmaAlgebraCollection ambient generator
        (family index)) →
        GeneratedSigmaAlgebraCollection ambient generator
          (HasCountableUnion.countableUnion family)
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
theorem GeneratedSigmaAlgebraCountableUnionIsMember
    (ambient : SetObject) (generator : SetObject → Prop) :
    ∀ family : Nat → SetObject,
      (∀ index, GeneratedSigmaAlgebraCollection ambient generator
        (family index)) →
        GeneratedSigmaAlgebraCollection ambient generator
          (HasCountableUnion.countableUnion family) := by
  sorry

/--
`GeneratedSigmaAlgebra` TODO

Predicate logic:

  def GeneratedSigmaAlgebra
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    SigmaAlgebraOfSets ambient where
  IsMember

Predicate logic (unfolded):

  def GeneratedSigmaAlgebra
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    SigmaAlgebraOfSets ambient where
  IsMember (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GeneratedSigmaAlgebra
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    SigmaAlgebraOfSets ambient where
  IsMember
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
def GeneratedSigmaAlgebra
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator) :
    SigmaAlgebraOfSets ambient where
  IsMember := GeneratedSigmaAlgebraCollection ambient generator
  MembersAreSubsets :=
    GeneratedSigmaAlgebraMembersAreSubsets ambient generator admissible
  EmptyIsMember := GeneratedSigmaAlgebraEmptyIsMember ambient generator
  UnionIsMember := GeneratedSigmaAlgebraUnionIsMember ambient generator
  IntersectionIsMember :=
    GeneratedSigmaAlgebraIntersectionIsMember ambient generator
  DifferenceIsMember := GeneratedSigmaAlgebraDifferenceIsMember ambient generator
  SymmetricDifferenceIsMember :=
    GeneratedSigmaAlgebraSymmetricDifferenceIsMember ambient generator
  AmbientIsMember := GeneratedSigmaAlgebraAmbientIsMember ambient generator
  CountableUnionIsMember :=
    GeneratedSigmaAlgebraCountableUnionIsMember ambient generator

/--
`GeneratedSigmaAlgebraContainsGenerator` TODO

Predicate logic:

  (∀ A ∈ U ∀ B ∈ U), (SetObject → Prop) → (GeneratedSigmaAlgebra A generator admissible).IsMember B

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (admissible : Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) (G : SetObject), generator G → (LRA.SetSystems.GeneratedSigmaAlgebra ambient generator admissible).toRingOfSets.1 G

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraContainsGenerator
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator)
    (G : SetObject) (GIsGenerator : generator G) :
    (GeneratedSigmaAlgebra ambient generator admissible).IsMember G
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
theorem GeneratedSigmaAlgebraContainsGenerator
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator)
    (G : SetObject) (GIsGenerator : generator G) :
    (GeneratedSigmaAlgebra ambient generator admissible).IsMember G := by
  sorry

/--
`GeneratedSigmaAlgebraMinimal` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop ∧ ∀ G, generator G → sigma.IsMember G) → ∀ A, (GeneratedSigmaAlgebra A generator admissible).IsMember A → sigma.IsMember A

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop) (admissible : Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → ∀ (A : SetObject), (LRA.SetSystems.GeneratedSigmaAlgebra ambient generator admissible).toRingOfSets.1 A → sigma.toRingOfSets.1 A

Logical form (Lean):

```lean
theorem GeneratedSigmaAlgebraMinimal
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator)
    (sigma : SigmaAlgebraOfSets ambient)
    (sigmaAdmitsGenerators : ∀ G, generator G → sigma.IsMember G) :
    ∀ A, (GeneratedSigmaAlgebra ambient generator admissible).IsMember A →
      sigma.IsMember A
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
theorem GeneratedSigmaAlgebraMinimal
    (ambient : SetObject) (generator : SetObject → Prop)
    (admissible : GeneratorAdmissible ambient generator)
    (sigma : SigmaAlgebraOfSets ambient)
    (sigmaAdmitsGenerators : ∀ G, generator G → sigma.IsMember G) :
    ∀ A, (GeneratedSigmaAlgebra ambient generator admissible).IsMember A →
      sigma.IsMember A := by
  sorry

/--
`BorelSigmaAlgebra` TODO

Predicate logic:

  def BorelSigmaAlgebra
    (ambient : SetObject) (opens : SetObject → Prop)
    (opensAdmissible : GeneratorAdmissible ambient opens) :
    SigmaAlgebraOfSets ambient :=
  GeneratedSigmaAlgebra ambient opens opensAdmissible

Predicate logic (unfolded):

  def BorelSigmaAlgebra
    (ambient : SetObject) (opens : SetObject → Prop)
    (opensAdmissible : GeneratorAdmissible ambient opens) :
    SigmaAlgebraOfSets ambient :=
  GeneratedSigmaAlgebra ambient opens opensAdmissible (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BorelSigmaAlgebra
    (ambient : SetObject) (opens : SetObject → Prop)
    (opensAdmissible : GeneratorAdmissible ambient opens) :
    SigmaAlgebraOfSets ambient :=
  GeneratedSigmaAlgebra ambient opens opensAdmissible
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
def BorelSigmaAlgebra
    (ambient : SetObject) (opens : SetObject → Prop)
    (opensAdmissible : GeneratorAdmissible ambient opens) :
    SigmaAlgebraOfSets ambient :=
  GeneratedSigmaAlgebra ambient opens opensAdmissible

end LRA.SetSystems
