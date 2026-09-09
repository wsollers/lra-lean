
import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Constructions.Mathlib.ZFSet.Pairing
import LRA.Set.Interface.Definitions.RelationSets

namespace LRA.Set.MathlibZFSet

open LRA.Set

/--
`RelatesIffPairMember` TODO

Predicate logic:

  ∀ (relation input output : ZFSet), LRA.Set.Relates relation input output ↔ SetLike.input.pair output ∈ relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    relation input output : ZFSet
  Prove
    LRA.Set.Relates relation input output ↔ SetLike.input.pair output ∈ relation

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

  ∀ {domain codomain relation : ZFSet}, ZFSet.instPartialOrder.le relation (domain.prod codomain) → LRA.Set.IsPairwise ZFSet ZFSet relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    domain codomain relation : ZFSet
    inside : relation ⊆ ZFSet.prod domain codomain
  Prove
    ZFSet.instPartialOrder.toPreorder.1.le relation (Quot.lift (fun x => Quot.mk PSet.setoid.1 (PSet.mk (Subtype fun a => (fun y => (fun z => Exists fun a => (SetLike.a ∈ domain ∧ (Exists fun b => (SetLike.b ∈ codomain ∧ (z = a.pair b ∧ (fun x x_1 => True) a b))))) (ZFSet.mk y)) (x.Func a)) fun y => x.Func y.val)) ⋯ (Quotient.map PSet.powerset ZFSet.powerset._proof_1 (ZFdomain ∪ codomain).powerset)) → ∀ (member : ZFSet), SetLike.member ∈ relation → Exists fun input => Exists fun output => member = LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output

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

  ∀ {domain codomain relation : ZFSet}, domain.IsFunc codomain relation → LRA.Set.IsSingleValued ZFSet ZFSet relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    domain codomain relation : ZFSet
    isFunc : ZFSet.IsFunc domain codomain relation
  Prove
    ((ZFSet.instPartialOrder.toPreorder.1.le relation (Quot.lift (fun x => Quot.mk PSet.setoid.r (PSet.sep (fun y => (fun z => Exists fun a => (SetLike.a ∈ domain ∧ (Exists fun b => (SetLike.b ∈ codomain ∧ (z = a.pair b ∧ (fun x x_1 => True) a b))))) (ZFSet.mk y)) x)) ⋯ (ZFdomain ∪ codomain).powerset.powerset)) ∧ (∀ (z : ZFSet), SetLike.z ∈ domain → Exists fun x => ((fun w => SetLike.ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton w))) ∈ relation) x ∧ (∀ (y : ZFSet), SetLike.ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton y))) ∈ relation → y = x)))) → ∀ (input firstOutput secondOutput : ZFSet), (SetLike.LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput ∈ relation ∧ SetLike.LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput ∈ relation) → firstOutput = secondOutput

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

  ∀ (domain codomain relation : ZFSet), domain.IsFunc codomain relation ↔ (ZFSet.instPartialOrder.le relation (domain.prod codomain) ∧ (LRA.Set.IsTotalOn ZFSet relation domain ∧ LRA.Set.IsSingleValued ZFSet ZFSet relation))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    domain codomain relation : ZFSet
  Prove
    domain.IsFunc codomain relation ↔ (ZFSet.instPartialOrder.le relation (domain.prod codomain) ∧ (LRA.Set.IsTotalOn ZFSet relation domain ∧ LRA.Set.IsSingleValued ZFSet ZFSet relation))

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

  ∀ (domain codomain relation : ZFSet), SetLike.relation ∈ domain.funs codomain ↔ (ZFSet.instPartialOrder.le relation (domain.prod codomain) ∧ (LRA.Set.IsTotalOn ZFSet relation domain ∧ LRA.Set.IsSingleValued ZFSet ZFSet relation))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    domain codomain relation : ZFSet
  Prove
    SetLike.relation ∈ domain.funs codomain ↔ (ZFSet.instPartialOrder.le relation (domain.prod codomain) ∧ (LRA.Set.IsTotalOn ZFSet relation domain ∧ LRA.Set.IsSingleValued ZFSet ZFSet relation))

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

  ∀ {domain codomain relation : ZFSet}, domain.IsFunc codomain relation → LRA.Set.IsFunctionalSet ZFSet ZFSet relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    domain codomain relation : ZFSet
    isFunc : ZFSet.IsFunc domain codomain relation
  Prove
    ((ZFSet.instPartialOrder.toPreorder.1.le relation (Quot.lift (fun x => Quot.mk PSet.setoid.r (PSet.sep (fun y => (fun z => Exists fun a => (SetLike.a ∈ domain ∧ (Exists fun b => (SetLike.b ∈ codomain ∧ (z = a.pair b ∧ (fun x x_1 => True) a b))))) (ZFSet.mk y)) x)) ⋯ (ZFdomain ∪ codomain).powerset.powerset)) ∧ (∀ (z : ZFSet), SetLike.z ∈ domain → Exists fun x => ((fun w => SetLike.ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton w))) ∈ relation) x ∧ (∀ (y : ZFSet), SetLike.ZFSet.instInsert.1 (ZFSet.instSingleton.1 z) (ZFSet.instSingleton.1 (ZFSet.instInsert.insert z (ZFSet.instSingleton.singleton y))) ∈ relation → y = x)))) → ((∀ (member : ZFSet), SetLike.member ∈ relation → Exists fun input => Exists fun output => member = LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output) ∧ (∀ (input firstOutput secondOutput : ZFSet), SetLike.LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput ∈ relation → SetLike.LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput ∈ relation → firstOutput = secondOutput))

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

  ∀ (f : ZFSet → ZFSet) [inst : ZFSet.Definable₁ f] (over input output : ZFSet), LRA.Set.Relates (ZFSet.map f over) input output ↔ (SetLike.input ∈ over ∧ f input = output)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    f : ZFSet → ZFSet
    over input output : ZFSet
  Prove
    LRA.Set.Relates (ZFSet.map f over) input output ↔ (SetLike.input ∈ over ∧ f input = output)

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

  ∀ (f : ZFSet → ZFSet) [inst : ZFSet.Definable₁ f] (over : ZFSet), LRA.Set.IsFunctionalSet ZFSet ZFSet (ZFSet.map f over)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    f : ZFSet → ZFSet
    over : ZFSet
  Prove
    ((∀ (member : ZFSet), SetLike.member ∈ (let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over → Exists fun input => Exists fun output => member = LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input output) ∧ (∀ (input firstOutput secondOutput : ZFSet), SetLike.LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input firstOutput ∈ (let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over → SetLike.LRA.Set.MathlibZFSet.instHasPairingZFSet.1 input secondOutput ∈ (let r := ZFSet.Definable₁.out fun y => y.pair (f y); Quotient.map (PSet.image r) ⋯) over → firstOutput = secondOutput))

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
