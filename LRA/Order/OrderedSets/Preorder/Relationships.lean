import LRA.Order.OrderedSets.Preorder.Characterizations
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Relation.Interface.Structures.Definition

namespace LRA.Order.OrderedSets.Preorder

universe u

/--
`StrictPartByNotConverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (a a_1 : Carrier), (preorder.relation a a_1 ∧ ¬ preorder.relation a_1 a)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (a a_1 : Carrier), (preorder.1 a a_1 ∧ preorder.1 a_1 a → False)

Logical form (Lean):

```lean
def StrictPartByNotConverse
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  fun left right =>
    preorder.relation left right /\ Not (preorder.relation right left)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def StrictPartByNotConverse
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  fun left right =>
    preorder.relation left right /\ Not (preorder.relation right left)

/--
`PreorderEquivalence` TODO

Predicate logic:

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (a a_1 : Carrier), (preorder.relation a a_1 ∧ preorder.relation a_1 a)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (a a_1 : Carrier), (preorder.1 a a_1 ∧ preorder.1 a_1 a)

Logical form (Lean):

```lean
def PreorderEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right =>
    preorder.relation left right /\ preorder.relation right left
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def PreorderEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right =>
    preorder.relation left right /\ preorder.relation right left

/--
`PreorderEquivalenceIsEquivalence` TODO

Predicate logic:

  LRA.Relation.EquivalenceRelation (PreorderEquivalence preorder)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier), (∀ (x : Carrier), (preorder.1 x x ∧ preorder.1 x x) ∧ (∀ (x y : Carrier), (preorder.1 x y ∧ preorder.1 y x) → (preorder.1 y x ∧ preorder.1 x y) ∧ ∀ (x y z : Carrier), (preorder.1 x y ∧ preorder.1 y x) → (preorder.1 y z ∧ preorder.1 z y) → (preorder.1 x z ∧ preorder.1 z x)))

Logical form (Lean):

```lean
theorem PreorderEquivalenceIsEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.EquivalenceRelation (PreorderEquivalence preorder)
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
theorem PreorderEquivalenceIsEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.EquivalenceRelation (PreorderEquivalence preorder) := by
  sorry
/--
`PreorderSetoid` TODO

Predicate logic:

  def PreorderSetoid
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Setoid Carrier

Predicate logic (unfolded):

  def PreorderSetoid
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Setoid Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PreorderSetoid
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Setoid Carrier
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
def PreorderSetoid
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Setoid Carrier := by
  refine { r := PreorderEquivalence preorder, iseqv := ?_ }
  sorry

/--
`PreorderQuotient` TODO

Predicate logic:

  abbrev PreorderQuotient
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Type u :=
  Quotient (PreorderSetoid preorder)

Predicate logic (unfolded):

  abbrev PreorderQuotient
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Type u :=
  Quotient (PreorderSetoid preorder) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PreorderQuotient
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Type u :=
  Quotient (PreorderSetoid preorder)
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
abbrev PreorderQuotient
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Type u :=
  Quotient (PreorderSetoid preorder)

/--
`PreorderQuotientRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (a a_1 : LRA.Order.OrderedSets.Preorder.PreorderQuotient preorder), Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ a_1) ⋯ a

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier) (a a_1 : Quot (LRA.Order.OrderedSets.Preorder.PreorderSetoid preorder).1), Quot.lift (fun a₁ => Quot.lift (preorder.1 a₁) ⋯ a_1) ⋯ a

Logical form (Lean):

```lean
def PreorderQuotientRelation
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation (PreorderQuotient preorder) :=
  fun left right =>
    Quotient.liftOn₂ left right preorder.relation (by
      intro leftRepresentative rightRepresentative
        otherLeftRepresentative otherRightRepresentative
        leftEquivalent rightEquivalent
      apply propext
      sorry)
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
def PreorderQuotientRelation
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation (PreorderQuotient preorder) :=
  fun left right =>
    Quotient.liftOn₂ left right preorder.relation (by
      intro leftRepresentative rightRepresentative
        otherLeftRepresentative otherRightRepresentative
        leftEquivalent rightEquivalent
      apply propext
      sorry)

/--
`PreorderQuotientRelationIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder (PreorderQuotientRelation preorder)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier), (∀ (x : Quot (LRA.Order.OrderedSets.Preorder.PreorderSetoid preorder).1), Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ x) ⋯ x ∧ (∀ (x y : Quot (LRA.Order.OrderedSets.Preorder.PreorderSetoid preorder).1), Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ y) ⋯ x → Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ x) ⋯ y → x = y ∧ ∀ (x y z : Quot (LRA.Order.OrderedSets.Preorder.PreorderSetoid preorder).1), Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ y) ⋯ x → Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ z) ⋯ y → Quot.lift (fun a₁ => Quotient.lift (preorder.relation a₁) ⋯ z) ⋯ x))

Logical form (Lean):

```lean
theorem PreorderQuotientRelationIsPartialOrder
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.PartialOrder (PreorderQuotientRelation preorder)
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
theorem PreorderQuotientRelationIsPartialOrder
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.PartialOrder (PreorderQuotientRelation preorder) := by
  sorry
end LRA.Order.OrderedSets.Preorder
