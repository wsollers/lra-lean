import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.LStructure
import LRA.Operation

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory (OrderedFieldSignature)

/-- `RealNumbersTheory signature` means `signature` satisfies the
complete-ordered-field laws expected of ℝ: everything `RationalNumbersTheory`
(the densely-ordered-field laws) states, plus order-completeness — every
nonempty, bounded-above subset of `signature.carrier` has a least upper
bound. This is the model-theoretic restatement of the laws bundled by
`RealModel`, stated directly over the raw operations and relations carried
by `signature` rather than over a typeclass instance.

Logical form:

```lean
structure RealNumbersTheory (signature : OrderedFieldSignature) : Prop where
  addAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.add a b)
  addCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.add a b)
  zeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.add a b) signature.zero
  addZero :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.add a b) signature.zero
  negAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b => signature.add a b) signature.zero signature.neg
  addNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b => signature.add a b) signature.zero signature.neg
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  mulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.multiply a b)
  oneMul :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  mulOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  zeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing
      (fun a b => signature.multiply a b) signature.zero
  mulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing
      (fun a b => signature.multiply a b) signature.zero
  leftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  rightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  oneNeZero : signature.one ≠ signature.zero
  mulInvCancel :
    ∀ a, a ≠ signature.zero →
      LRA.Operation.Laws.Inverse.RightInverseOf
        (fun a b => signature.multiply a b) signature.one a (signature.inv a)
  invZero : signature.inv signature.zero = signature.zero
  leRefl : ∀ a, signature.le a a
  leAntisymm : ∀ a b, signature.le a b → signature.le b a → a = b
  leTrans : ∀ a b c, signature.le a b → signature.le b c → signature.le a c
  leTotal : ∀ a b, signature.le a b ∨ signature.le b a
  ltIffLeNotLe :
    ∀ a b, signature.StrictOrder a b ↔ signature.le a b ∧ ¬ signature.le b a
  addLeAddLeft :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add c a) (signature.add c b)
  addLeAddRight :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add a c) (signature.add b c)
  mulNonneg :
    ∀ a b, signature.le signature.zero a → signature.le signature.zero b →
      signature.le signature.zero (signature.multiply a b)
  denseOrder :
    ∀ a b, signature.StrictOrder a b →
      ∃ middle, signature.StrictOrder a middle ∧ signature.StrictOrder middle b
  orderComplete :
    ∀ subset : signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upperBound, ∀ member, subset member → signature.le member upperBound) →
      ∃ supremum,
        (∀ member, subset member → signature.le member supremum) ∧
          ∀ upperBound, (∀ member, subset member → signature.le member upperBound) →
            signature.le supremum upperBound
```
-/
structure RealNumbersTheory (signature : OrderedFieldSignature) : Prop where
  addAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.add a b)
  addCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.add a b)
  zeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.add a b) signature.zero
  addZero :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.add a b) signature.zero
  negAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b => signature.add a b) signature.zero signature.neg
  addNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b => signature.add a b) signature.zero signature.neg
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  mulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.multiply a b)
  oneMul :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  mulOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  zeroMul :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing
      (fun a b => signature.multiply a b) signature.zero
  mulZero :
    LRA.Operation.Laws.Absorbing.RightAbsorbing
      (fun a b => signature.multiply a b) signature.zero
  leftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  rightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  oneNeZero : signature.one ≠ signature.zero
  mulInvCancel :
    ∀ a, a ≠ signature.zero →
      LRA.Operation.Laws.Inverse.RightInverseOf
        (fun a b => signature.multiply a b) signature.one a (signature.inv a)
  invZero : signature.inv signature.zero = signature.zero
  leRefl : ∀ a, signature.le a a
  leAntisymm : ∀ a b, signature.le a b → signature.le b a → a = b
  leTrans : ∀ a b c, signature.le a b → signature.le b c → signature.le a c
  leTotal : ∀ a b, signature.le a b ∨ signature.le b a
  ltIffLeNotLe :
    ∀ a b, signature.StrictOrder a b ↔ signature.le a b ∧ ¬ signature.le b a
  addLeAddLeft :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add c a) (signature.add c b)
  addLeAddRight :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add a c) (signature.add b c)
  mulNonneg :
    ∀ a b, signature.le signature.zero a → signature.le signature.zero b →
      signature.le signature.zero (signature.multiply a b)
  denseOrder :
    ∀ a b, signature.StrictOrder a b →
      ∃ middle, signature.StrictOrder a middle ∧ signature.StrictOrder middle b
  orderComplete :
    ∀ subset : signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upperBound, ∀ member, subset member → signature.le member upperBound) →
      ∃ supremum,
        (∀ member, subset member → signature.le member supremum) ∧
          ∀ upperBound, (∀ member, subset member → signature.le member upperBound) →
            signature.le supremum upperBound

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
