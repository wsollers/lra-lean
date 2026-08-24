import LRA.AlgebraicStructures.AdditiveSemigroup.Laws.Definition
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.Semigroup.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Laws.Definition
import LRA.AlgebraicStructures.CommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Laws.Distributive
import LRA.Operation.Laws.Cancellation.Definition

namespace LRA.AlgebraicStructures

universe u

class AdditiveCancellativeLaws (R : Type u) [Add R] : Prop where
  AddCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b)

class MultiplicativeCancellativeLaws (R : Type u) [Mul R] : Prop where
  MulCancellative :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b)

class abbrev CommutativeSemiringWithoutZeroLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R, AdditiveCancellativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R, MultiplicativeCancellativeLaws R,
  DistributiveLaws R

section Wrappers

variable {R : Type u}

theorem AddCancellative [Add R] [AdditiveCancellativeLaws R] :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a + b) :=
  AdditiveCancellativeLaws.AddCancellative

theorem MulCancellative [Mul R] [MultiplicativeCancellativeLaws R] :
    LRA.Operation.Laws.Cancellation.TwoSidedCancellative (fun a b : R => a * b) :=
  MultiplicativeCancellativeLaws.MulCancellative

end Wrappers

end LRA.AlgebraicStructures
