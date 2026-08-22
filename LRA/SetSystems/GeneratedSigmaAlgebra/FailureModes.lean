import LRA.Set.PredicateSet.Instances
import LRA.SetSystems.GeneratedSigmaAlgebra

/-!
Failure modes for generated sigma algebras when the generator family is not
admissible on the chosen ambient set.
-/

namespace LRA.SetSystems

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]
variable [HasCountableUnion SetObject]

/-- Without an admissibility witness, the bare intersection predicate is
vacuous: if no containing sigma-algebra exists, every set object belongs to the
purported generated collection.

Logical form:

```lean
def GeneratedSigmaAlgebraCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ¬ GeneratorAdmissible ambient generator ∧
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A
```
-/
def GeneratedSigmaAlgebraCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop) : Prop :=
  ¬ GeneratorAdmissible ambient generator ∧
    ∀ A, GeneratedSigmaAlgebraCollection ambient generator A

/-- Failure of admissibility forces the bare generated-collection predicate to
contain every set object.

Logical form:

```lean
theorem NonAdmissibleGeneratorMakesGeneratedCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop)
    (notAdmissible : ¬ GeneratorAdmissible ambient generator) :
    GeneratedSigmaAlgebraCollectionVacuous ambient generator
```
-/
theorem NonAdmissibleGeneratorMakesGeneratedCollectionVacuous
    (ambient : SetObject) (generator : SetObject → Prop)
    (notAdmissible : ¬ GeneratorAdmissible ambient generator) :
    GeneratedSigmaAlgebraCollectionVacuous ambient generator := by
  sorry

/-- The empty ambient predicate set on `Nat`.

Logical form:

```lean
def EmptyNatAmbient : PredicateSet Nat := fun _ => False
```
-/
def EmptyNatAmbient : PredicateSet Nat := fun _ => False

/-- The singleton predicate set `{0}` on `Nat`.

Logical form:

```lean
def ZeroSingleton : PredicateSet Nat := fun n => n = 0
```
-/
def ZeroSingleton : PredicateSet Nat := fun n => n = 0

/-- A generator family consisting only of `{0}`.

Logical form:

```lean
def ZeroSingletonGenerator (candidate : PredicateSet Nat) : Prop :=
  candidate = ZeroSingleton
```
-/
def ZeroSingletonGenerator (candidate : PredicateSet Nat) : Prop :=
  candidate = ZeroSingleton

/-- There is no sigma-algebra on the empty ambient predicate set that contains
`{0}`.

Logical form:

```lean
theorem EmptyAmbientZeroGeneratorIsNotAdmissible :
    ¬ GeneratorAdmissible EmptyNatAmbient ZeroSingletonGenerator
```
-/
theorem EmptyAmbientZeroGeneratorIsNotAdmissible :
    ¬ GeneratorAdmissible EmptyNatAmbient ZeroSingletonGenerator := by
  sorry

/-- In the nonadmissible empty-ambient example, the bare generated-collection
predicate contains `{0}` even though `{0}` is not a subset of the ambient set.
This is the concrete contradiction that admissibility prevents.

Logical form:

```lean
theorem EmptyAmbientZeroGeneratorRealizesVacuityFailure :
    GeneratedSigmaAlgebraCollection
        EmptyNatAmbient ZeroSingletonGenerator ZeroSingleton ∧
      ¬ ZeroSingleton ⊆ EmptyNatAmbient
```
-/
theorem EmptyAmbientZeroGeneratorRealizesVacuityFailure :
    GeneratedSigmaAlgebraCollection
        EmptyNatAmbient ZeroSingletonGenerator ZeroSingleton ∧
      ¬ ZeroSingleton ⊆ EmptyNatAmbient := by
  sorry

end LRA.SetSystems
