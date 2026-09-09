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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instHMod.1 left 2 = instHMod.1 right 2

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

  LRA.UniversalAlgebra.Congruence.BinaryOperationCongruence LRA.UniversalAlgebra.Congruence.SameParityForCongruenceExample LRA.UniversalAlgebra.Congruence.NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (instHMod.1 left₁ 2 = instHMod.1 left₂ 2 ∧ instHMod.1 right₁ 2 = instHMod.1 right₂ 2) → instHMod.1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd left₁ right₁) 2 = instHMod.1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd left₂ right₂) 2

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
