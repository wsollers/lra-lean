import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Relation.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Structures.Definition
import LRA.Identity.Constructions.Leibniz.Definitions.Equality

namespace LRA.Identity

universe u

/--
`EqualitySymmetry` TODO

Predicate logic:

  (left = right) → right = left

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right : Carrier}, left = right → right = left

Logical form (Lean):

```lean
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left
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
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  symm
  exact ObjectsAreEqual


/--
`EqualityTransitivity` TODO

Predicate logic:

  (first = second ∧ second = third) → first = third

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {first second third : Carrier}, (first = second ∧ second = third) → first = third

Logical form (Lean):

```lean
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third
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
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  -- Goal: ⊢ third = first
  symm
  have secondEqualsFirst := FirstEqualsSecond.symm
  exact (LeibnizLaw SecondEqualsThird (fun x => x = first)).mp secondEqualsFirst


/--
`EqualityRelationIsReflexive` TODO

Predicate logic:

  LRA.Relation.Reflexive (EqualityRelation Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (x : Carrier), x = x

Logical form (Lean):

```lean
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.Relation.Reflexive (EqualityRelation Carrier)
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
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.Relation.Reflexive (EqualityRelation Carrier) := by
  intro x
  rfl




/--
`EqualityRelationIsSymmetric` TODO

Predicate logic:

  LRA.Relation.Symmetric (EqualityRelation Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (x y : Carrier), x = y → y = x

Logical form (Lean):

```lean
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.Relation.Symmetric (EqualityRelation Carrier)
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
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.Relation.Symmetric (EqualityRelation Carrier) := by
  intro x
  intro z
  intro hypo
  have zEqualsX := hypo.symm
  exact zEqualsX


/--
`EqualityRelationIsTransitive` TODO

Predicate logic:

  LRA.Relation.Transitive (EqualityRelation Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (x y z : Carrier), (x = y ∧ y = z) → x = z

Logical form (Lean):

```lean
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.Relation.Transitive (EqualityRelation Carrier)
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
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.Relation.Transitive (EqualityRelation Carrier) := by
  intro x
  intro y
  intro z
  intro xEqualsY
  intro yEqualsZ
  exact xEqualsY.trans yEqualsZ

/--
`EqualityRelationIsEquivalence` TODO

Predicate logic:

  LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u), (∀ (x : Carrier), x = x ∧ (∀ (x y : Carrier), x = y → y = x ∧ ∀ (x y z : Carrier), x = y → y = z → x = z))

Logical form (Lean):

```lean
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)
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
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  constructor
  · exact EqualityRelationIsReflexive Carrier
  · constructor
    · exact EqualityRelationIsSymmetric Carrier
    · exact EqualityRelationIsTransitive Carrier

/--
`EqualityIsEquivalenceRelation` TODO

Predicate logic:

  LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u), (∀ (x : Carrier), x = x ∧ (∀ (x y : Carrier), x = y → y = x ∧ ∀ (x y z : Carrier), x = y → y = z → x = z))

Logical form (Lean):

```lean
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier)
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
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  constructor
  . -- left
    intro x
    rfl
  . -- right
    constructor
    . -- right.left
      intro x
      intro y
      intro xEqualsY
      exact xEqualsY.symm
    . -- right.right
      intro x
      intro y
      intro z
      intro xEqualsY
      intro yEqualsZ
      have yEqualsX := xEqualsY.symm
      exact (LeibnizLaw yEqualsX (fun w => w = z)).mp yEqualsZ



end LRA.Identity
