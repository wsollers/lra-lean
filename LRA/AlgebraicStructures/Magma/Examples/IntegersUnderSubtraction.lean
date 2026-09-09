namespace LRA.AlgebraicStructures.Magma.Examples

/-! Integers under subtraction — direct instance on the whole ambient type, no
subset/closure step needed: subtraction is already total on all of `Int`. Wrapped in a
one-field structure (rather than `def IntegersUnderSubtraction := Int`) so `.val`
projection is always unambiguous — a plain type synonym doesn't reliably carry Int's own
instances across the boundary during elaboration. -/

/--
`IntegersUnderSubtraction` TODO

Predicate logic:

  structure IntegersUnderSubtraction where
    val : Int

Predicate logic (unfolded):

  structure IntegersUnderSubtraction where
    val : Int (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegersUnderSubtraction where
  val : Int
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
structure IntegersUnderSubtraction where
  val : Int

instance : Mul IntegersUnderSubtraction := ⟨fun a b => ⟨a.val - b.val⟩⟩
instance : Nonempty IntegersUnderSubtraction := ⟨⟨0⟩⟩

/--
`integersUnderSubtractionNotAssociative` TODO

Predicate logic:

  ¬ ∀ (a b c : LRA.AlgebraicStructures.Magma.Examples.IntegersUnderSubtraction), instHMul.hMul (instHMul.hMul a b) c = instHMul.hMul a (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (a b c : LRA.AlgebraicStructures.Magma.Examples.IntegersUnderSubtraction), { hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulIntegersUnderSubtraction.mul a b }.hMul ({ hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulIntegersUnderSubtraction.mul a b }.hMul a b) c = { hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulIntegersUnderSubtraction.mul a b }.hMul a ({ hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulIntegersUnderSubtraction.mul a b }.hMul b c)) → False

Logical form (Lean):

```lean
theorem integersUnderSubtractionNotAssociative :
    ¬ ∀ a b c : IntegersUnderSubtraction, (a * b) * c = a * (b * c)
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
theorem integersUnderSubtractionNotAssociative :
    ¬ ∀ a b c : IntegersUnderSubtraction, (a * b) * c = a * (b * c) := by
  sorry
end LRA.AlgebraicStructures.Magma.Examples
