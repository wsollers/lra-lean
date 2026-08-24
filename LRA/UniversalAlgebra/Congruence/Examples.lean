import LRA.UniversalAlgebra.Congruence.Theorems

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

/--
`NaturalAddition` TODO

Predicate logic:

  def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

Predicate logic (unfolded):

  def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAddition : BinaryEndoOperation Nat :=
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
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`SameParityForCongruenceExample` TODO

Predicate logic:

  ∀ (left right : Nat), instHMod.hMod left 2 = instHMod.hMod right 2

Predicate logic (unfolded):

  ∀ (left right : Nat), instHMod.1 left (instOfNatNat 2).1 = instHMod.1 right (instOfNatNat 2).1

Logical form (Lean):

```lean
def SameParityForCongruenceExample (left right : Nat) : Prop :=
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
def SameParityForCongruenceExample (left right : Nat) : Prop :=
  left % 2 = right % 2

/--
`SameParityAdditionCongruence` TODO

Predicate logic:

  BinaryOperationCongruence SameParityForCongruenceExample NaturalAddition

Predicate logic (unfolded):

  ∀ {left₁ left₂ right₁ right₂ : Nat}, (instHMod.1 left₁ (instOfNatNat 2).1 = instHMod.1 left₂ (instOfNatNat 2).1 ∧ instHMod.1 right₁ (instOfNatNat 2).1 = instHMod.1 right₂ (instOfNatNat 2).1) → instHMod.1 (instHAdd.1 left₁ right₁) (instOfNatNat 2).1 = instHMod.1 (instHAdd.1 left₂ right₂) (instOfNatNat 2).1

Logical form (Lean):

```lean
theorem SameParityAdditionCongruence :
    BinaryOperationCongruence SameParityForCongruenceExample NaturalAddition
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
theorem SameParityAdditionCongruence :
    BinaryOperationCongruence SameParityForCongruenceExample NaturalAddition := by
  sorry

end LRA.UniversalAlgebra.Congruence
