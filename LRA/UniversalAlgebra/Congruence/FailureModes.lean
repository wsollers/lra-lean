import LRA.UniversalAlgebra.Congruence.Definition

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

/--
`FailsUnaryRelationSubstitution` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.UnaryEndoOperation Carrier), (∀ {left right : Carrier}, relation left right → operation left = operation right) → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier), (∀ {left right : Carrier}, relation left right → operation left = operation right) → False

Logical form (Lean):

```lean
def FailsUnaryRelationSubstitution {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  Not (forall {left right : Carrier},
    relation left right -> operation left = operation right)
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
def FailsUnaryRelationSubstitution {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : UnaryEndoOperation Carrier) : Prop :=
  Not (forall {left right : Carrier},
    relation left right -> operation left = operation right)

/--
`SameParity` TODO

Predicate logic:

  ∀ (left right : Nat), instHMod.hMod left 2 = instHMod.hMod right 2

Predicate logic (unfolded):

  ∀ (left right : Nat), instHMod.1 left (instOfNatNat 2).1 = instHMod.1 right (instOfNatNat 2).1

Logical form (Lean):

```lean
def SameParity (left right : Nat) : Prop :=
  left % 2 = right % 2
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
def SameParity (left right : Nat) : Prop :=
  left % 2 = right % 2

/--
`NaturalSuccessor` TODO

Predicate logic:

  def NaturalSuccessor : UnaryEndoOperation Nat :=
  fun number => number + 1

Predicate logic (unfolded):

  def NaturalSuccessor : UnaryEndoOperation Nat :=
  fun number => number + 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalSuccessor : UnaryEndoOperation Nat :=
  fun number => number + 1
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
def NaturalSuccessor : UnaryEndoOperation Nat :=
  fun number => number + 1

/--
`SameParityFailsUnarySubstitutionForSuccessor` TODO

Predicate logic:

  FailsUnaryRelationSubstitution SameParity NaturalSuccessor

Predicate logic (unfolded):

  (∀ {left right : Nat}, instHMod.1 left (instOfNatNat 2).1 = instHMod.1 right (instOfNatNat 2).1 → instHAdd.1 left (instOfNatNat 1).1 = instHAdd.1 right (instOfNatNat 1).1) → False

Logical form (Lean):

```lean
theorem SameParityFailsUnarySubstitutionForSuccessor :
    FailsUnaryRelationSubstitution SameParity NaturalSuccessor
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
theorem SameParityFailsUnarySubstitutionForSuccessor :
    FailsUnaryRelationSubstitution SameParity NaturalSuccessor := by
  sorry

end LRA.UniversalAlgebra.Congruence
