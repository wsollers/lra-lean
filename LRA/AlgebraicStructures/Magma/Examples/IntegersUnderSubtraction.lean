namespace LRA.AlgebraicStructures.Magma.Examples

/-! Integers under subtraction — direct instance on the whole ambient type, no
subset/closure step needed: subtraction is already total on all of `Int`. Wrapped in a
one-field structure (rather than `def IntegersUnderSubtraction := Int`) so `.val`
projection is always unambiguous — a plain type synonym doesn't reliably carry Int's own
instances across the boundary during elaboration. -/

structure IntegersUnderSubtraction where
  val : Int

instance : Mul IntegersUnderSubtraction := ⟨fun a b => ⟨a.val - b.val⟩⟩
instance : Nonempty IntegersUnderSubtraction := ⟨⟨0⟩⟩

theorem integersUnderSubtractionNotAssociative :
    ¬ ∀ a b c : IntegersUnderSubtraction, (a * b) * c = a * (b * c) := by
  intro h
  have key : ((1 : Int) - 1) - 1 = (1 : Int) - (1 - 1) :=
    congrArg IntegersUnderSubtraction.val (h ⟨1⟩ ⟨1⟩ ⟨1⟩)
  omega

end LRA.AlgebraicStructures.Magma.Examples
