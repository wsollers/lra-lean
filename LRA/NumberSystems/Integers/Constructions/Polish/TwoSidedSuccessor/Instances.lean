
import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Behavior
import LRA.NumberSystems.IntegerStructure
import LRA.Set.Constructions.TypeSet

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open LRA.AlgebraicStructures
open LRA.Order

instance : OfNat Z 0 := ⟨Z.zero⟩

instance : OfNat Z 1 := ⟨one⟩

instance : Sub Z := ⟨fun firstInteger secondInteger => firstInteger + -secondInteger⟩

instance : HasSuccessor Z := ⟨succ⟩

instance : HasPredecessor Z := ⟨pred⟩

instance : AdditiveSemigroupLaws Z := by
  sorry
instance : AdditiveCommutativeLaws Z := by
  sorry
/--
`z_sub_eq_add_neg` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger - secondInteger = firstInteger + -secondInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHSub.1 firstInteger secondInteger = instHAdd.1 firstInteger (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 secondInteger)

Logical form (Lean):

```lean
theorem z_sub_eq_add_neg (firstInteger secondInteger : Z) :
    firstInteger - secondInteger = firstInteger + -secondInteger
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
theorem z_sub_eq_add_neg (firstInteger secondInteger : Z) :
    firstInteger - secondInteger = firstInteger + -secondInteger := by
  sorry
instance : AdditiveIdentityLaws Z := by
  sorry
instance : AdditiveInverseLaws Z := by
  sorry
instance : SubtractionCompatibilityLaw Z := by
  sorry
instance : MultiplicativeSemigroupLaws Z := by
  sorry
instance : MultiplicativeCommutativeLaws Z := by
  sorry
instance : MultiplicativeIdentityLaws Z := by
  sorry
/--
`z_mul_zero` TODO

Predicate logic:

  (∀ integer ∈ Z), integer * Z.zero = Z.zero

Predicate logic (unfolded):

  ∀ (integer : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 integer LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem z_mul_zero (integer : Z) : integer * Z.zero = Z.zero
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
theorem z_mul_zero (integer : Z) : integer * Z.zero = Z.zero := by
  sorry
instance : ZeroAbsorbingLaws Z := by
  sorry
instance : DistributiveLaws Z := by
  sorry
/--
`z_one_ne_zero` TODO

Predicate logic:

  one ∈ Z ≠ Z.zero

Predicate logic (unfolded):

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero → False

Logical form (Lean):

```lean
theorem z_one_ne_zero : (one : Z) ≠ Z.zero
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
theorem z_one_ne_zero : (one : Z) ≠ Z.zero := by
  sorry
instance : NontrivialityLaw Z := by
  sorry
/--
`z_eq_zero_of_mul_eq_zero` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger * secondInteger = Z.zero -> firstInteger = Z.zero ∨ secondInteger = Z.zero

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 firstInteger secondInteger = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero → Or (firstInteger = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) (secondInteger = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero)

Logical form (Lean):

```lean
theorem z_eq_zero_of_mul_eq_zero (firstInteger secondInteger : Z) :
    firstInteger * secondInteger = Z.zero ->
      firstInteger = Z.zero ∨ secondInteger = Z.zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem z_eq_zero_of_mul_eq_zero (firstInteger secondInteger : Z) :
    firstInteger * secondInteger = Z.zero ->
      firstInteger = Z.zero ∨ secondInteger = Z.zero := by
  sorry
instance : NoZeroDivisorsLaw Z := by
  sorry
/--
`z_le_trans` TODO

Predicate logic:

  (∀ firstInteger secondInteger thirdInteger ∈ Z), firstInteger ≤ secondInteger -> secondInteger ≤ thirdInteger -> firstInteger ≤ thirdInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger thirdInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger secondInteger ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 secondInteger thirdInteger) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger thirdInteger

Logical form (Lean):

```lean
theorem z_le_trans (firstInteger secondInteger thirdInteger : Z) :
    firstInteger ≤ secondInteger ->
      secondInteger ≤ thirdInteger -> firstInteger ≤ thirdInteger
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
theorem z_le_trans (firstInteger secondInteger thirdInteger : Z) :
    firstInteger ≤ secondInteger ->
      secondInteger ≤ thirdInteger -> firstInteger ≤ thirdInteger := by
  sorry
/--
`z_le_antisymm` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger ≤ secondInteger -> secondInteger ≤ firstInteger -> firstInteger = secondInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger secondInteger ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 secondInteger firstInteger) → firstInteger = secondInteger

Logical form (Lean):

```lean
theorem z_le_antisymm (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger ->
      secondInteger ≤ firstInteger -> firstInteger = secondInteger
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
theorem z_le_antisymm (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger ->
      secondInteger ≤ firstInteger -> firstInteger = secondInteger := by
  sorry
instance : PartialOrderLaws Z := by
  sorry
/--
`z_le_total` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger ≤ secondInteger ∨ secondInteger ≤ firstInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger secondInteger) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 secondInteger firstInteger)

Logical form (Lean):

```lean
theorem z_le_total (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger ∨ secondInteger ≤ firstInteger
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem z_le_total (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger ∨ secondInteger ≤ firstInteger := by
  sorry
instance : TotalOrderLaw Z := by
  sorry
/--
`z_lt_iff_le_not_le` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger < secondInteger ↔ firstInteger ≤ secondInteger ∧ ¬ secondInteger ≤ firstInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 firstInteger secondInteger ↔ (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger secondInteger ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 secondInteger firstInteger → False)

Logical form (Lean):

```lean
theorem z_lt_iff_le_not_le (firstInteger secondInteger : Z) :
    firstInteger < secondInteger ↔
      firstInteger ≤ secondInteger ∧ ¬ secondInteger ≤ firstInteger
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
theorem z_lt_iff_le_not_le (firstInteger secondInteger : Z) :
    firstInteger < secondInteger ↔
      firstInteger ≤ secondInteger ∧ ¬ secondInteger ≤ firstInteger := by
  sorry
instance : StrictOrderCompatibilityLaw Z := by
  sorry
/--
`z_add_le_add_left` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger ≤ secondInteger -> ∀ translation : Z, translation + firstInteger ≤ translation + secondInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger secondInteger → ∀ (translation : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 (instHAdd.1 translation firstInteger) (instHAdd.1 translation secondInteger)

Logical form (Lean):

```lean
theorem z_add_le_add_left (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger -> ∀ translation : Z,
      translation + firstInteger ≤ translation + secondInteger
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
theorem z_add_le_add_left (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger -> ∀ translation : Z,
      translation + firstInteger ≤ translation + secondInteger := by
  sorry
/--
`z_add_le_add_right` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), firstInteger ≤ secondInteger -> ∀ translation : Z, firstInteger + translation ≤ secondInteger + translation

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 firstInteger secondInteger → ∀ (translation : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 (instHAdd.1 firstInteger translation) (instHAdd.1 secondInteger translation)

Logical form (Lean):

```lean
theorem z_add_le_add_right (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger -> ∀ translation : Z,
      firstInteger + translation ≤ secondInteger + translation
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
theorem z_add_le_add_right (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger -> ∀ translation : Z,
      firstInteger + translation ≤ secondInteger + translation := by
  sorry
instance : AdditionRespectsOrderLaws Z := by
  sorry
/--
`z_mul_nonneg` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), Z.zero ≤ firstInteger -> Z.zero ≤ secondInteger -> Z.zero ≤ firstInteger * secondInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero firstInteger ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero secondInteger) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero (instHMul.1 firstInteger secondInteger)

Logical form (Lean):

```lean
theorem z_mul_nonneg (firstInteger secondInteger : Z) :
    Z.zero ≤ firstInteger -> Z.zero ≤ secondInteger -> Z.zero ≤ firstInteger * secondInteger
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
theorem z_mul_nonneg (firstInteger secondInteger : Z) :
    Z.zero ≤ firstInteger -> Z.zero ≤ secondInteger -> Z.zero ≤ firstInteger * secondInteger := by
  sorry
instance : MultiplicationRespectsOrderLaws Z := by
  sorry
/--
`z_no_strict_between_add_one` TODO

Predicate logic:

  (∀ integer ∈ Z), ¬ ∃ middle ∈ Z, integer < middle ∧ middle < integer + 1

Predicate logic (unfolded):

  ∀ (integer : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), (Exists fun middle => (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 integer middle ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 middle (instHAdd.1 integer LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instOfNatZOfNatNat_1.1))) → False

Logical form (Lean):

```lean
theorem z_no_strict_between_add_one (integer : Z) :
    ¬ ∃ middle : Z, integer < middle ∧ middle < integer + 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem z_no_strict_between_add_one (integer : Z) :
    ¬ ∃ middle : Z, integer < middle ∧ middle < integer + 1 := by
  sorry
instance : OrderDiscretenessLaw Z := by
  sorry
/--
`z_succ_injective` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), Succ firstInteger = Succ secondInteger -> firstInteger = secondInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instHasSuccessorZ.1 firstInteger = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instHasSuccessorZ.1 secondInteger → firstInteger = secondInteger

Logical form (Lean):

```lean
theorem z_succ_injective (firstInteger secondInteger : Z) :
    Succ firstInteger = Succ secondInteger -> firstInteger = secondInteger
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
theorem z_succ_injective (firstInteger secondInteger : Z) :
    Succ firstInteger = Succ secondInteger -> firstInteger = secondInteger := by
  sorry
/--
`z_pred_injective` TODO

Predicate logic:

  (∀ firstInteger secondInteger ∈ Z), Pred firstInteger = Pred secondInteger -> firstInteger = secondInteger

Predicate logic (unfolded):

  ∀ (firstInteger secondInteger : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instHasPredecessorZ.1 firstInteger = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instHasPredecessorZ.1 secondInteger → firstInteger = secondInteger

Logical form (Lean):

```lean
theorem z_pred_injective (firstInteger secondInteger : Z) :
    Pred firstInteger = Pred secondInteger -> firstInteger = secondInteger
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
theorem z_pred_injective (firstInteger secondInteger : Z) :
    Pred firstInteger = Pred secondInteger -> firstInteger = secondInteger := by
  sorry
instance : SuccessorLaws Z := by
  sorry
/--
`z_succ_eq_add_one` TODO

Predicate logic:

  (∀ integer ∈ Z), succ integer = integer + one

Predicate logic (unfolded):

  ∀ (integer : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) integer = instHAdd.1 integer LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one

Logical form (Lean):

```lean
theorem z_succ_eq_add_one (integer : Z) : succ integer = integer + one
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
theorem z_succ_eq_add_one (integer : Z) : succ integer = integer + one := by
  sorry
instance : SuccessorAdditionLaw Z := by
  sorry
instance : SuccessorMultiplicationLaws Z := by
  sorry
/--
`z_succ_aperiodic` TODO

Predicate logic:

  (∀ iterationCount ∈ Nat), 0 < iterationCount -> SuccIterate iterationCount 0 ∈ Z ≠ 0

Predicate logic (unfolded):

  ∀ (iterationCount : Nat), (instLTNat.1 (instOfNatNat 0).1 iterationCount ∧ LRA.AlgebraicStructures.SuccIterate iterationCount LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instOfNatZOfNatNat.1 = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instOfNatZOfNatNat.1) → False

Logical form (Lean):

```lean
theorem z_succ_aperiodic (iterationCount : Nat) :
    0 < iterationCount -> SuccIterate iterationCount (0 : Z) ≠ 0
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
theorem z_succ_aperiodic (iterationCount : Nat) :
    0 < iterationCount -> SuccIterate iterationCount (0 : Z) ≠ 0 := by
  sorry
/--
`z_succ_aperiodic_all` is the bundled discreteness witness in the shape
required by `DiscretenessLaw`.
-/
theorem z_succ_aperiodic_all (integer : Z) (iterationCount : Nat) :
    0 < iterationCount -> SuccIterate iterationCount integer ≠ integer := by
  sorry
/--
`z_two_sided_induction` TODO

Predicate logic:

  (Z → Prop) → motive 0 -> (∀ integer, motive integer -> motive (Succ integer)) -> (∀ integer, motive integer -> motive (Pred integer)) -> ∀ integer, motive integer

Predicate logic (unfolded):

  ∀ (motive : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z → Prop), (motive LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instOfNatZOfNatNat.1 ∧ (∀ (integer : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), motive integer → motive (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instHasSuccessorZ.1 integer) ∧ ∀ (integer : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), motive integer → motive (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instHasPredecessorZ.1 integer))) → ∀ (integer : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), motive integer

Logical form (Lean):

```lean
theorem z_two_sided_induction (motive : Z → Prop) :
    motive 0 ->
      (∀ integer, motive integer -> motive (Succ integer)) ->
      (∀ integer, motive integer -> motive (Pred integer)) ->
      ∀ integer, motive integer
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
theorem z_two_sided_induction (motive : Z → Prop) :
    motive 0 ->
      (∀ integer, motive integer -> motive (Succ integer)) ->
      (∀ integer, motive integer -> motive (Pred integer)) ->
      ∀ integer, motive integer := by
  sorry
instance : DiscretenessLaw Z := by
  sorry
example : CommutativeRingLaws Z := inferInstance
example : RingLaws Z := inferInstance
example : IntegralDomainLaws Z := inferInstance
example : LinearOrderLaws Z := inferInstance
example : OrderedRingLaws Z := inferInstance

example (a b : Z) : a * Succ b = a * b + a := MulSucc a b
example (a b c : Z) : a * (b + c) = a * b + a * c := LeftDistributive a b c
example (a : Z) : a - a = a + -a := SubEqAddNeg a a

/--
`polish_integer_structure_induction` TODO

Predicate logic:

  Z.zero ∈ subset -> ∀ element ∈ Z, element ∈ subset -> succ element ∈ subset -> ∀ element ∈ Z, element ∈ subset -> pred element ∈ subset -> ∀ element : Z, element ∈ subset

Predicate logic (unfolded):

  ∀ (subset : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z → Prop), (LRA.Set.instMembershipPredicateSet.1 subset LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero ∧ (∀ (element : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.Set.instMembershipPredicateSet.1 subset element → LRA.Set.instMembershipPredicateSet.1 subset (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) element) ∧ ∀ (element : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.Set.instMembershipPredicateSet.1 subset element → LRA.Set.instMembershipPredicateSet.1 subset (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) element))) → ∀ (element : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.Set.instMembershipPredicateSet.1 subset element

Logical form (Lean):

```lean
theorem polish_integer_structure_induction
    (subset : LRA.Set.Constructions.TypeSet Z) :
    Z.zero ∈ subset ->
      (∀ element : Z, element ∈ subset -> succ element ∈ subset) ->
      (∀ element : Z, element ∈ subset -> pred element ∈ subset) ->
      ∀ element : Z, element ∈ subset
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
theorem polish_integer_structure_induction
    (subset : LRA.Set.Constructions.TypeSet Z) :
    Z.zero ∈ subset ->
      (∀ element : Z, element ∈ subset -> succ element ∈ subset) ->
      (∀ element : Z, element ∈ subset -> pred element ∈ subset) ->
      ∀ element : Z, element ∈ subset := by
  sorry
/--
`polish_integer_structure_aperiodic` TODO

Predicate logic:

  ∀ iterations : Nat, 0 < iterations -> LRA.NumberSystems.IntegerStructure.iterate succ iterations Z.zero ≠ Z.zero

Predicate logic (unfolded):

  ∀ (iterations : Nat), (instLTNat.1 (instOfNatNat 0).1 iterations ∧ LRA.NumberSystems.IntegerStructure.iterate LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ iterations LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) → False

Logical form (Lean):

```lean
theorem polish_integer_structure_aperiodic :
    ∀ iterations : Nat, 0 < iterations ->
      LRA.NumberSystems.IntegerStructure.iterate succ iterations Z.zero ≠ Z.zero
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
theorem polish_integer_structure_aperiodic :
    ∀ iterations : Nat, 0 < iterations ->
      LRA.NumberSystems.IntegerStructure.iterate succ iterations Z.zero ≠ Z.zero := by
  sorry
/--
`PolishRealizesIntegerStructure` TODO

Predicate logic:

  noncomputable def PolishRealizesIntegerStructure :
    LRA.NumberSystems.IntegerStructure.IntegerStructure Z (LRA.Set.Constructions.TypeSet Z) where
  zero := Z.zero
  one := one
  negativeOne := -one
  successor := succ
  predecessor := pred
  predecessor_successor := pred_succ
  successor_predecessor := succ_pred
  successor_zero := succ_zero_eq_one
  predecessor_zero := pred_zero_eq_neg_one
  aperiodic := polish_integer_structure_aperiodic
  induction := polish_integer_structure_induction

Predicate logic (unfolded):

  noncomputable def PolishRealizesIntegerStructure :
    LRA.NumberSystems.IntegerStructure.IntegerStructure Z (LRA.Set.Constructions.TypeSet Z) where
  zero := Z.zero
  one := one
  negativeOne := -one
  successor := succ
  predecessor := pred
  predecessor_successor := pred_succ
  successor_predecessor := succ_pred
  successor_zero := succ_zero_eq_one
  predecessor_zero := pred_zero_eq_neg_one
  aperiodic := polish_integer_structure_aperiodic
  induction := polish_integer_structure_induction (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PolishRealizesIntegerStructure :
    LRA.NumberSystems.IntegerStructure.IntegerStructure Z (LRA.Set.Constructions.TypeSet Z) where
  zero := Z.zero
  one := one
  negativeOne := -one
  successor := succ
  predecessor := pred
  predecessor_successor := pred_succ
  successor_predecessor := succ_pred
  successor_zero := succ_zero_eq_one
  predecessor_zero := pred_zero_eq_neg_one
  aperiodic := polish_integer_structure_aperiodic
  induction := polish_integer_structure_induction
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
noncomputable def PolishRealizesIntegerStructure :
    LRA.NumberSystems.IntegerStructure.IntegerStructure Z (LRA.Set.Constructions.TypeSet Z) where
  zero := Z.zero
  one := one
  negativeOne := -one
  successor := succ
  predecessor := pred
  predecessor_successor := pred_succ
  successor_predecessor := succ_pred
  successor_zero := succ_zero_eq_one
  predecessor_zero := pred_zero_eq_neg_one
  aperiodic := polish_integer_structure_aperiodic
  induction := polish_integer_structure_induction

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
