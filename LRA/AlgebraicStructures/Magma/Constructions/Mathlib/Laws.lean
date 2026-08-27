import LRA.AlgebraicStructures.Magma.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Mathlib doesn't name "magma" as a class at all — it starts formalizing algebra at
`Semigroup`. So the bridge is as low as the floor gets: any nonempty type with a `Mul`
instance already satisfies `MagmaLaws`, which (now that nonemptiness is a parameter,
not a field) is the entire content of being a magma. -/
instance {M : Type u} [Mul M] [Nonempty M] : MagmaLaws M := ⟨⟩

end LRA.AlgebraicStructures
