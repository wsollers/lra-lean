import LRA.AlgebraicStructures.Group.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Group.Examples

/-- `(ℤ, +)` — wrapped in a one-field structure since `Int` already has its
own native `Mul` (ordinary multiplication); here `*` has to mean addition on
a distinct type, same reason as `Monoid.Examples.NaturalNumbersUnderAddition`.
The identity is `0`, and every element's inverse is its negation. An abelian
group, per the user's own note (`ℤ` is the standard first example of one). -/
structure IntegersUnderAddition where
  val : Int

instance : Mul IntegersUnderAddition := ⟨fun a b => ⟨a.val + b.val⟩⟩
instance : Inv IntegersUnderAddition := ⟨fun a => ⟨-a.val⟩⟩
instance : OfNat IntegersUnderAddition 1 := ⟨⟨0⟩⟩
instance : Nonempty IntegersUnderAddition := ⟨⟨0⟩⟩

instance :
    LRA.AlgebraicStructures.GroupLaws IntegersUnderAddition where
  MulAssociative := by
    intro a b c
    sorry
  OneMul := by
    intro a
    sorry
  MulOne := by
    intro a
    sorry
  InvMulCancel := by
    intro a
    sorry
  MulInvCancel := by
    intro a
    sorry
end LRA.AlgebraicStructures.Group.Examples
