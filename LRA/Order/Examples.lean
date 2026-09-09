import LRA.Order
import LRA.Set.Constructions.Mathlib.PredicateSet

universe u v w x

namespace LRA.Order

/--
`NaturalAdditionForOrderCompatibility` TODO

Predicate logic:

  def NaturalAdditionForOrderCompatibility :
      LRA.Operation.BinaryEndoOperation Nat :=
    fun left right => left + right

Predicate logic (unfolded):

  def NaturalAdditionForOrderCompatibility :
      LRA.Operation.BinaryEndoOperation Nat :=
    fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAdditionForOrderCompatibility :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left + right
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
def NaturalAdditionForOrderCompatibility :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`NaturalAdditionRightTranslationPreservesLessEqual` TODO

Predicate logic:

  LRA.Order.RightTranslationPreservesRelation (fun left right => instLENat.le left right) LRA.Order.NaturalAdditionForOrderCompatibility

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instLENat.le left right → (fun left right => instLENat.le left right) ({ hAdd := fun a b => instAddNat.add a b }.hAdd left fixed) ({ hAdd := fun a b => instAddNat.add a b }.hAdd right fixed)

Logical form (Lean):

```lean
theorem NaturalAdditionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalAdditionForOrderCompatibility
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
theorem NaturalAdditionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalAdditionForOrderCompatibility := by
  sorry
/--
`NaturalSubtractionForOrderCompatibilityExample` TODO

Predicate logic:

  def NaturalSubtractionForOrderCompatibilityExample :
      LRA.Operation.BinaryEndoOperation Nat :=
    fun left right => left - right

Predicate logic (unfolded):

  def NaturalSubtractionForOrderCompatibilityExample :
      LRA.Operation.BinaryEndoOperation Nat :=
    fun left right => left - right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalSubtractionForOrderCompatibilityExample :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right
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
def NaturalSubtractionForOrderCompatibilityExample :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

/--
`NaturalSubtractionRightTranslationPreservesLessEqual` TODO

Predicate logic:

  LRA.Order.RightTranslationPreservesRelation (fun left right => instLENat.le left right) LRA.Order.NaturalSubtractionForOrderCompatibilityExample

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instLENat.le left right → (fun left right => instLENat.le left right) ({ hSub := fun a b => instSubNat.sub a b }.hSub left fixed) ({ hSub := fun a b => instSubNat.sub a b }.hSub right fixed)

Logical form (Lean):

```lean
theorem NaturalSubtractionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityExample
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
theorem NaturalSubtractionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityExample := by
  sorry
end LRA.Order

namespace LRA.Order.OrderedSets.PartialOrder

/--
`NaturalNumberLessEqualIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder fun left right => instLENat.le left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), (fun left right => instLENat.le left right) x x) ∧ ((∀ (x y : Nat), instLENat.le x y → instLENat.le y x → x = y) ∧ (∀ (x y z : Nat), instLENat.le x y → instLENat.le y z → (fun left right => instLENat.le left right) x z)))

Logical form (Lean):

```lean
theorem NaturalNumberLessEqualIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right)
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
theorem NaturalNumberLessEqualIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right) := by
  sorry
/--
`NaturalNumberNonStrictPartialOrder` TODO

Predicate logic:

  def NaturalNumberNonStrictPartialOrder :
      NonStrictPartialOrder Nat where
    relation := fun left right => left <= right
    relationIsPartialOrder := NaturalNumberLessEqualIsPartialOrder

Predicate logic (unfolded):

  def NaturalNumberNonStrictPartialOrder :
      NonStrictPartialOrder Nat where
    relation := fun left right => left <= right
    relationIsPartialOrder := NaturalNumberLessEqualIsPartialOrder (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumberNonStrictPartialOrder :
    NonStrictPartialOrder Nat where
  relation := fun left right => left <= right
  relationIsPartialOrder := NaturalNumberLessEqualIsPartialOrder
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
def NaturalNumberNonStrictPartialOrder :
    NonStrictPartialOrder Nat where
  relation := fun left right => left <= right
  relationIsPartialOrder := NaturalNumberLessEqualIsPartialOrder

example :
    LRA.Order.PartialOrder
      NaturalNumberNonStrictPartialOrder.relation := by
  exact NaturalNumberNonStrictPartialOrder.relationIsPartialOrder

/--
`BooleanEqualityIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder fun left right => left = right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Bool), (fun left right => left = right)x x) ∧ ((∀ (x y : Bool), x = y → y = x → x = y) ∧ (∀ (x y z : Bool), x = y → y = z → (fun left right => left = right)x z)))

Logical form (Lean):

```lean
theorem BooleanEqualityIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Bool => left = right)
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
theorem BooleanEqualityIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Bool => left = right) := by
  sorry
/--
`BooleanEqualityNonStrictPartialOrder` TODO

Predicate logic:

  def BooleanEqualityNonStrictPartialOrder :
      NonStrictPartialOrder Bool where
    relation := fun left right => left = right
    relationIsPartialOrder := BooleanEqualityIsPartialOrder

Predicate logic (unfolded):

  def BooleanEqualityNonStrictPartialOrder :
      NonStrictPartialOrder Bool where
    relation := fun left right => left = right
    relationIsPartialOrder := BooleanEqualityIsPartialOrder (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanEqualityNonStrictPartialOrder :
    NonStrictPartialOrder Bool where
  relation := fun left right => left = right
  relationIsPartialOrder := BooleanEqualityIsPartialOrder
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
def BooleanEqualityNonStrictPartialOrder :
    NonStrictPartialOrder Bool where
  relation := fun left right => left = right
  relationIsPartialOrder := BooleanEqualityIsPartialOrder

example :
    LRA.Order.PartialOrder
      BooleanEqualityNonStrictPartialOrder.relation := by
  exact BooleanEqualityNonStrictPartialOrder.relationIsPartialOrder

/--
`DivisibilityIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder fun left right => Nat.instDvd.dvd left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), (fun left right => Nat.instDvd.1 left right) x x) ∧ ((∀ (x y : Nat), Nat.instDvd.1 x y → Nat.instDvd.1 y x → x = y) ∧ (∀ (x y z : Nat), Nat.instDvd.1 x y → Nat.instDvd.1 y z → (fun left right => Nat.instDvd.1 left right) x z)))

Logical form (Lean):

```lean
theorem DivisibilityIsPartialOrder :
    LRA.Order.PartialOrder
      (fun left right : Nat => left ∣ right)
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
theorem DivisibilityIsPartialOrder :
    LRA.Order.PartialOrder
      (fun left right : Nat => left ∣ right) := by
  sorry
/--
`PredicateSetInclusionIsPartialOrder` TODO

Predicate logic:

  ∀ (Alpha : Type u), LRA.Order.PartialOrder fun left right => Set.instLE.le left right

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    ((∀ (x : Alpha → Prop), (fun left right => { le := fun s₁ s₂ => ∀ ⦃a : Alpha⦄, a ∈ s₁ → a ∈ s₂}.le left right) x x) ∧ ((∀ (x y : Alpha → Prop), { le := fun s₁ s₂ => ∀ ⦃a : Alpha⦄, a ∈ s₁ → a ∈ s₂}.le x y → { le := fun s₁ s₂ => ∀ ⦃a : Alpha⦄, a ∈ s₁ → a ∈ s₂}.le y x → x = y) ∧ (∀ (x y z : Alpha → Prop), { le := fun s₁ s₂ => ∀ ⦃a : Alpha⦄, a ∈ s₁ → a ∈ s₂}.le x y → { le := fun s₁ s₂ => ∀ ⦃a : Alpha⦄, a ∈ s₁ → a ∈ s₂}.le y z → (fun left right => { le := fun s₁ s₂ => ∀ ⦃a : Alpha⦄, a ∈ s₁ → a ∈ s₂}.le left right) x z)))

Logical form (Lean):

```lean
theorem PredicateSetInclusionIsPartialOrder (Alpha : Type u) :
    LRA.Order.PartialOrder
      (fun left right : Set Alpha => left ⊆ right)
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
theorem PredicateSetInclusionIsPartialOrder (Alpha : Type u) :
    LRA.Order.PartialOrder
      (fun left right : Set Alpha => left ⊆ right) := by
  sorry
end LRA.Order.OrderedSets.PartialOrder

namespace LRA.Order.OrderedSets.Poset

/--
`NaturalNumberOrderIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder fun left right => instLENat.le left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), (fun left right => instLENat.le left right) x x) ∧ ((∀ (x y : Nat), instLENat.le x y → instLENat.le y x → x = y) ∧ (∀ (x y z : Nat), instLENat.le x y → instLENat.le y z → (fun left right => instLENat.le left right) x z)))

Logical form (Lean):

```lean
theorem NaturalNumberOrderIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right)
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
theorem NaturalNumberOrderIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right) := by
  sorry
/--
`NaturalNumberPoset` TODO

Predicate logic:

  def NaturalNumberPoset : LRA.Order.Poset where
    Carrier := Nat
    NonStrictOrder := fun left right => left <= right
    NonStrictOrderIsPartialOrder := NaturalNumberOrderIsPartialOrder

Predicate logic (unfolded):

  def NaturalNumberPoset : LRA.Order.Poset where
    Carrier := Nat
    NonStrictOrder := fun left right => left <= right
    NonStrictOrderIsPartialOrder := NaturalNumberOrderIsPartialOrder (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumberPoset : LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := NaturalNumberOrderIsPartialOrder
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
def NaturalNumberPoset : LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := NaturalNumberOrderIsPartialOrder

example :
    LRA.Order.PartialOrder NaturalNumberPoset.NonStrictOrder := by
  exact NaturalNumberPoset.NonStrictOrderIsPartialOrder

end LRA.Order.OrderedSets.Poset

namespace LRA.Order.OrderedSets.Preorder

/--
`BooleanUniversalRelationIsPreorder` TODO

Predicate logic:

  LRA.Order.Preorder fun x x_1 => True

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Bool), (fun x x_1 => True) x x) ∧ (∀ (x y z : Bool), True → True → (fun x x_1 => True) x z))

Logical form (Lean):

```lean
theorem BooleanUniversalRelationIsPreorder :
    LRA.Order.Preorder (fun _ _ : Bool => True)
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
theorem BooleanUniversalRelationIsPreorder :
    LRA.Order.Preorder (fun _ _ : Bool => True) := by
  sorry
/--
`BooleanUniversalPreorder` TODO

Predicate logic:

  def BooleanUniversalPreorder : PreorderRelation Bool where
    relation := fun _ _ => True
    isPreorder := BooleanUniversalRelationIsPreorder

Predicate logic (unfolded):

  def BooleanUniversalPreorder : PreorderRelation Bool where
    relation := fun _ _ => True
    isPreorder := BooleanUniversalRelationIsPreorder (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanUniversalPreorder : PreorderRelation Bool where
  relation := fun _ _ => True
  isPreorder := BooleanUniversalRelationIsPreorder
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
def BooleanUniversalPreorder : PreorderRelation Bool where
  relation := fun _ _ => True
  isPreorder := BooleanUniversalRelationIsPreorder

example : LRA.Order.Preorder BooleanUniversalPreorder.relation := by
  exact BooleanUniversalPreorder.isPreorder

end LRA.Order.OrderedSets.Preorder

namespace LRA.Order.OrderedSets.StrictOrder

/--
`NaturalNumberLessThanIsStrictOrder` TODO

Predicate logic:

  LRA.Order.StrictOrder fun left right => instLTNat.lt left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), instLTNat.lt x x → False) ∧ (∀ (x y z : Nat), instLTNat.lt x y → instLTNat.lt y z → (fun left right => instLTNat.lt left right) x z))

Logical form (Lean):

```lean
theorem NaturalNumberLessThanIsStrictOrder :
    LRA.Order.StrictOrder (fun left right : Nat => left < right)
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
theorem NaturalNumberLessThanIsStrictOrder :
    LRA.Order.StrictOrder (fun left right : Nat => left < right) := by
  sorry
/--
`NaturalNumberStrictOrder` TODO

Predicate logic:

  def NaturalNumberStrictOrder :
      StrictOrderRelation Nat where
    relation := fun left right => left < right
    relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder

Predicate logic (unfolded):

  def NaturalNumberStrictOrder :
      StrictOrderRelation Nat where
    relation := fun left right => left < right
    relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumberStrictOrder :
    StrictOrderRelation Nat where
  relation := fun left right => left < right
  relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder
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
def NaturalNumberStrictOrder :
    StrictOrderRelation Nat where
  relation := fun left right => left < right
  relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder

example :
    LRA.Order.StrictOrder NaturalNumberStrictOrder.relation := by
  exact NaturalNumberStrictOrder.relationIsStrictOrder

end LRA.Order.OrderedSets.StrictOrder
