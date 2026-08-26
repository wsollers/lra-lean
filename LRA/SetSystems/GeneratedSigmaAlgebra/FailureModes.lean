import LRA.Set.Constructions.TypeSet.Instances
import LRA.SetSystems.GeneratedSigmaAlgebra

namespace LRA.SetSystems

open LRA.Set
open LRA.Set.Constructions

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

/--
`GeneratedSigmaAlgebraCollectionVacuous` TODO

Predicate logic:

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop), (¬ LRA.SetSystems.GeneratorAdmissible ambient generator ∧ ∀ (A : SetObject), LRA.SetSystems.GeneratedSigmaAlgebraCollection ambient generator A)

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop), ((Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → False ∧ ∀ (A : SetObject) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A)

Logical form (Lean):

```lean
def GeneratedSigmaAlgebraCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ¬ GeneratorAdmissible ambient generator ∧
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def GeneratedSigmaAlgebraCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ¬ GeneratorAdmissible ambient generator ∧
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A

/--
`NonAdmissibleGeneratorMakesGeneratedCollectionVacuous` TODO

Predicate logic:

  (∀ A ∈ U), (SetObject → Prop) → GeneratedSigmaAlgebraCollectionVacuous A generator

Predicate logic (unfolded):

  ∀ {SetObject : Type v} [inst : Union SetObject] [inst_1 : Inter SetObject] [inst_2 : SDiff SetObject] [inst_3 : EmptyCollection SetObject] [inst_4 : HasSubset SetObject] [inst_5 : LRA.Set.HasSymmDiff SetObject] [inst_6 : LRA.Set.HasCountableUnion SetObject] (ambient : SetObject) (generator : SetObject → Prop), ((Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → False) → ((Exists fun sigma => ∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → False ∧ ∀ (A : SetObject) (sigma : LRA.SetSystems.SigmaAlgebraOfSets ambient), (∀ (G : SetObject), generator G → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 A)

Logical form (Lean):

```lean
theorem NonAdmissibleGeneratorMakesGeneratedCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop)
    (notAdmissible : ¬ GeneratorAdmissible ambient generator) :
    GeneratedSigmaAlgebraCollectionVacuous ambient generator
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
theorem NonAdmissibleGeneratorMakesGeneratedCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop)
    (notAdmissible : ¬ GeneratorAdmissible ambient generator) :
    GeneratedSigmaAlgebraCollectionVacuous ambient generator := by
  sorry

/--
`EmptyNatAmbient` TODO

Predicate logic:

  ∀ (a : Nat), False

Predicate logic (unfolded):

  ∀ (a : Nat), False

Logical form (Lean):

```lean
def EmptyNatAmbient : TypeSet Nat := fun _ => False
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
def EmptyNatAmbient : TypeSet Nat := fun _ => False

/--
`ZeroSingleton` TODO

Predicate logic:

  ∀ (a : Nat), a = 0

Predicate logic (unfolded):

  ∀ (a : Nat), a = instOfNatNat 0.1

Logical form (Lean):

```lean
def ZeroSingleton : TypeSet Nat := fun n => n = 0
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
def ZeroSingleton : TypeSet Nat := fun n => n = 0

/--
`ZeroSingletonGenerator` TODO

Predicate logic:

  ∀ (candidate : LRA.Set.Constructions.TypeSet Nat), candidate = LRA.SetSystems.ZeroSingleton

Predicate logic (unfolded):

  ∀ (candidate : Nat → Prop), candidate = LRA.SetSystems.ZeroSingleton

Logical form (Lean):

```lean
def ZeroSingletonGenerator (candidate : TypeSet Nat) : Prop :=
  candidate = ZeroSingleton
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
def ZeroSingletonGenerator (candidate : TypeSet Nat) : Prop :=
  candidate = ZeroSingleton

/--
`EmptyAmbientZeroGeneratorIsNotAdmissible` TODO

Predicate logic:

  ¬ GeneratorAdmissible EmptyNatAmbient ZeroSingletonGenerator

Predicate logic (unfolded):

  (Exists fun sigma => ∀ (G : Nat → Prop), G = LRA.SetSystems.ZeroSingleton → sigma.toRingOfSets.1 G) → False

Logical form (Lean):

```lean
theorem EmptyAmbientZeroGeneratorIsNotAdmissible :
    ¬ GeneratorAdmissible EmptyNatAmbient ZeroSingletonGenerator
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
theorem EmptyAmbientZeroGeneratorIsNotAdmissible :
    ¬ GeneratorAdmissible EmptyNatAmbient ZeroSingletonGenerator := by
  sorry

/--
`EmptyAmbientZeroGeneratorRealizesVacuityFailure` TODO

Predicate logic:

  GeneratedSigmaAlgebraCollection EmptyNatAmbient ZeroSingletonGenerator ZeroSingleton ∧ ¬ ZeroSingleton ⊆ EmptyNatAmbient

Predicate logic (unfolded):

  (∀ (sigma : LRA.SetSystems.SigmaAlgebraOfSets LRA.SetSystems.EmptyNatAmbient), (∀ (G : Nat → Prop), G = LRA.SetSystems.ZeroSingleton → sigma.toRingOfSets.1 G) → sigma.toRingOfSets.1 LRA.SetSystems.ZeroSingleton ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 LRA.SetSystems.ZeroSingleton LRA.SetSystems.EmptyNatAmbient → False)

Logical form (Lean):

```lean
theorem EmptyAmbientZeroGeneratorRealizesVacuityFailure :
    GeneratedSigmaAlgebraCollection
        EmptyNatAmbient ZeroSingletonGenerator ZeroSingleton ∧
      ¬ ZeroSingleton ⊆ EmptyNatAmbient
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem EmptyAmbientZeroGeneratorRealizesVacuityFailure :
    GeneratedSigmaAlgebraCollection
        EmptyNatAmbient ZeroSingletonGenerator ZeroSingleton ∧
      ¬ ZeroSingleton ⊆ EmptyNatAmbient := by
  sorry

end LRA.SetSystems
