
import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interop.Mathlib.ZFSet.Pairing
import LRA.Set.Interface.RelationSets

namespace LRA.Set.MathlibZFSet

open LRA.Set

/--
`RelatesIffPairMember` TODO

Predicate logic:

  (∀ relation input output ∈ ZFSet), Relates relation input output ↔ ZFSet.pair input output ∈ relation

Predicate logic (unfolded):

  ∀ (relation input output : ZFSet), SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output) ↔ SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 input) (ZFSet.instSingleton.1 (ZFSet.instInsert.1 input (ZFSet.instSingleton.1 output))))

Logical form (Lean):

```lean
theorem RelatesIffPairMember (relation input output : ZFSet) :
    Relates relation input output ↔
      ZFSet.pair input output ∈ relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem RelatesIffPairMember (relation input output : ZFSet) :
    Relates relation input output ↔
      ZFSet.pair input output ∈ relation := by
  sorry

/--
`IsPairwiseOfSubsetProd` TODO

Predicate logic:

  IsPairwise ZFSet ZFSet relation

Predicate logic (unfolded):

  ∀ {domain codomain relation : ZFSet}, ZFSet.instPartialOrder.toLE.1 relation (Quot.lift (fun x => Quot.mk PSet.setoid.r (PSet.sep (fun y => (fun z => Exists fun a => (SetLike.instMembership.mem domain a ∧ Exists fun b => (SetLike.instMembership.mem codomain b ∧ (z = a.pair b ∧ (fun x x_1 => True) a b)))) (ZFSet.mk y)) x)) ⋯ (ZFSet.instUnion.union domain codomain).powerset.powerset) → ∀ (member : ZFSet), SetLike.instMembership.1 relation member → Exists fun input => Exists fun output => member = LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output

Logical form (Lean):

```lean
theorem IsPairwiseOfSubsetProd {domain codomain relation : ZFSet}
    (inside : relation ⊆ ZFSet.prod domain codomain) :
    IsPairwise ZFSet ZFSet relation
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
theorem IsPairwiseOfSubsetProd {domain codomain relation : ZFSet}
    (inside : relation ⊆ ZFSet.prod domain codomain) :
    IsPairwise ZFSet ZFSet relation := by
  sorry

/--
`IsSingleValuedOfIsFunc` TODO

Predicate logic:

  IsSingleValued ZFSet ZFSet relation

Predicate logic (unfolded):

  ∀ {domain codomain relation : ZFSet}, (ZFSet.instPartialOrder.toLE.1 relation (Quot.map (PSet.sep fun y => (fun z => Exists fun a => (SetLike.instMembership.mem domain a ∧ Exists fun b => (SetLike.instMembership.mem codomain b ∧ (z = a.pair b ∧ (fun x x_1 => True) a b)))) (ZFSet.mk y)) ⋯ (ZFSet.instUnion.union domain codomain).powerset.powerset) ∧ ∀ (z : ZFSet), SetLike.instMembership.1 domain z → Exists fun x => ((fun w => SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton w))))) x ∧ ∀ (y : ZFSet), SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton y)))) → y = x)) → ∀ (input firstOutput secondOutput : ZFSet), (SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput) ∧ SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput)) → firstOutput = secondOutput

Logical form (Lean):

```lean
theorem IsSingleValuedOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsSingleValued ZFSet ZFSet relation
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
theorem IsSingleValuedOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsSingleValued ZFSet ZFSet relation := by
  sorry

/--
`IsFuncIffFunctional` TODO

Predicate logic:

  (∀ domain codomain relation ∈ ZFSet), ZFSet.IsFunc domain codomain relation ↔ relation ⊆ ZFSet.prod domain codomain ∧ IsTotalOn ZFSet relation domain ∧ IsSingleValued ZFSet ZFSet relation

Predicate logic (unfolded):

  ∀ (domain codomain relation : ZFSet), (ZFSet.instPartialOrder.toLE.1 relation (Quot.map (PSet.sep fun y => (fun z => Exists fun a => (SetLike.instMembership.mem domain a ∧ Exists fun b => (SetLike.instMembership.mem codomain b ∧ (z = a.pair b ∧ (fun x x_1 => True) a b)))) (ZFSet.mk y)) ⋯ (ZFSet.instUnion.union domain codomain).powerset.powerset) ∧ ∀ (z : ZFSet), SetLike.instMembership.1 domain z → Exists fun x => ((fun w => SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton w))))) x ∧ ∀ (y : ZFSet), SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton y)))) → y = x)) ↔ (ZFSet.instPartialOrder.toLE.1 relation (Quot.lift (fun x => Quot.mk PSet.setoid.r (PSet.sep (fun y => (fun z => Exists fun a => (SetLike.instMembership.mem domain a ∧ Exists fun b => (SetLike.instMembership.mem codomain b ∧ (z = a.pair b ∧ (fun x x_1 => True) a b)))) (ZFSet.mk y)) x)) ⋯ (ZFSet.instUnion.union domain codomain).powerset.powerset) ∧ (∀ (input : ZFSet), SetLike.instMembership.1 domain input → Exists fun output => SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output) ∧ ∀ (input firstOutput secondOutput : ZFSet), SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput) → SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput) → firstOutput = secondOutput))

Logical form (Lean):

```lean
theorem IsFuncIffFunctional (domain codomain relation : ZFSet) :
    ZFSet.IsFunc domain codomain relation ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation
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
theorem IsFuncIffFunctional (domain codomain relation : ZFSet) :
    ZFSet.IsFunc domain codomain relation ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation := by
  sorry

/--
`MemberOfFunsIffFunctional` TODO

Predicate logic:

  (∀ domain codomain relation ∈ ZFSet), relation ∈ ZFSet.funs domain codomain ↔ relation ⊆ ZFSet.prod domain codomain ∧ IsTotalOn ZFSet relation domain ∧ IsSingleValued ZFSet ZFSet relation

Predicate logic (unfolded):

  ∀ (domain codomain relation : ZFSet), SetLike.instMembership.1 (Quot.lift (fun x => Quot.mk PSet.setoid.1 (PSet.mk (Subtype fun a => (fun y => domain.IsFunc codomain (ZFSet.mk y)) (x.Func a)) fun y => x.Func y.val)) ⋯ (Quotient.map PSet.powerset ZFSet.powerset._proof_1 (domain.prod codomain))) relation ↔ (ZFSet.instPartialOrder.toLE.1 relation (Quot.lift (fun x => Quot.mk PSet.setoid.r (PSet.sep (fun y => (fun z => Exists fun a => (SetLike.instMembership.mem domain a ∧ Exists fun b => (SetLike.instMembership.mem codomain b ∧ (z = a.pair b ∧ (fun x x_1 => True) a b)))) (ZFSet.mk y)) x)) ⋯ (ZFSet.instUnion.union domain codomain).powerset.powerset) ∧ (∀ (input : ZFSet), SetLike.instMembership.1 domain input → Exists fun output => SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output) ∧ ∀ (input firstOutput secondOutput : ZFSet), SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput) → SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput) → firstOutput = secondOutput))

Logical form (Lean):

```lean
theorem MemberOfFunsIffFunctional (domain codomain relation : ZFSet) :
    relation ∈ ZFSet.funs domain codomain ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation
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
theorem MemberOfFunsIffFunctional (domain codomain relation : ZFSet) :
    relation ∈ ZFSet.funs domain codomain ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation := by
  sorry

/--
`IsFunctionalSetOfIsFunc` TODO

Predicate logic:

  IsFunctionalSet ZFSet ZFSet relation

Predicate logic (unfolded):

  ∀ {domain codomain relation : ZFSet}, (ZFSet.instPartialOrder.toLE.1 relation (Quot.map (PSet.sep fun y => (fun z => Exists fun a => (SetLike.instMembership.mem domain a ∧ Exists fun b => (SetLike.instMembership.mem codomain b ∧ (z = a.pair b ∧ (fun x x_1 => True) a b)))) (ZFSet.mk y)) ⋯ (ZFSet.instUnion.union domain codomain).powerset.powerset) ∧ ∀ (z : ZFSet), SetLike.instMembership.1 domain z → Exists fun x => ((fun w => SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton w))))) x ∧ ∀ (y : ZFSet), SetLike.instMembership.1 relation (ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton y)))) → y = x)) → (∀ (member : ZFSet), SetLike.instMembership.1 relation member → Exists fun input => Exists fun output => member = LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output ∧ ∀ (input firstOutput secondOutput : ZFSet), SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput) → SetLike.instMembership.1 relation (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput) → firstOutput = secondOutput)

Logical form (Lean):

```lean
theorem IsFunctionalSetOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsFunctionalSet ZFSet ZFSet relation
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
theorem IsFunctionalSetOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsFunctionalSet ZFSet ZFSet relation := by
  sorry

/--
`RelatesMapIff` TODO

Predicate logic:

  (∀ over input output ∈ ZFSet), (ZFSet → ZFSet) → Relates (ZFSet.map f over) input output ↔ input ∈ over ∧ f input = output

Predicate logic (unfolded):

  ∀ (f : ZFSet → ZFSet) [inst : ZFSet.Definable (instOfNatNat 1).1 fun s => f (s Fin.instOfNat.1)] (over input output : ZFSet), SetLike.instMembership.1 ((let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over) (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output) ↔ (SetLike.instMembership.1 over input ∧ f input = output)

Logical form (Lean):

```lean
theorem RelatesMapIff (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over input output : ZFSet) :
    Relates (ZFSet.map f over) input output ↔
      input ∈ over ∧ f input = output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem RelatesMapIff (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over input output : ZFSet) :
    Relates (ZFSet.map f over) input output ↔
      input ∈ over ∧ f input = output := by
  sorry

/--
`MapIsFunctionalSet` TODO

Predicate logic:

  (∀ over ∈ ZFSet), (ZFSet → ZFSet) → IsFunctionalSet ZFSet ZFSet (ZFSet.map f over)

Predicate logic (unfolded):

  ∀ (f : ZFSet → ZFSet) [inst : ZFSet.Definable (instOfNatNat 1).1 fun s => f (s Fin.instOfNat.1)] (over : ZFSet), (∀ (member : ZFSet), SetLike.instMembership.1 ((let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over) member → Exists fun input => Exists fun output => member = LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output ∧ ∀ (input firstOutput secondOutput : ZFSet), SetLike.instMembership.1 ((let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over) (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput) → SetLike.instMembership.1 ((let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over) (LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput) → firstOutput = secondOutput)

Logical form (Lean):

```lean
theorem MapIsFunctionalSet (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over : ZFSet) :
    IsFunctionalSet ZFSet ZFSet (ZFSet.map f over)
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
theorem MapIsFunctionalSet (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over : ZFSet) :
    IsFunctionalSet ZFSet ZFSet (ZFSet.map f over) := by
  sorry

end LRA.Set.MathlibZFSet
