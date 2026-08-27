import Mathlib.Algebra.Group.Defs
import LRA.AlgebraicStructures.Semigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Semigroup R] [Nonempty R] : MultiplicativeSemigroupLaws R where
  MulAssociative := mul_assoc

end LRA.AlgebraicStructures
