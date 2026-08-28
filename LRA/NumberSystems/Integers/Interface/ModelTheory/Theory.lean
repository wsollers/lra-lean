import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.LStructure
import LRA.Operation

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory (OrderedRingSignature)

/-- `IntegersTheory signature` means `signature` satisfies the
discretely-ordered-integral-domain laws expected of ℤ: `add`/`multiply` are
each associative and commutative, `zero`/`one` are two-sided identities,
`neg` is a two-sided additive inverse, `zero` absorbs `multiply`, `multiply`
distributes over `add`, `0 ≠ 1`, `multiply` has no zero divisors, `le` is a
total order compatible with `StrictOrder`, both operations respect that
order, and the order is discrete (no element strictly between `a` and
`a + 1`). This is the model-theoretic restatement of the laws bundled by
`IntegerModel`, stated directly over the raw operations and relations carried
by `signature` rather than over a typeclass instance.

Logical form:

```lean
structure IntegersTheory (signature : OrderedRingSignature) : Prop where
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
  eqZeroOfMulEqZero :
    ∀ a b, signature.multiply a b = signature.zero →
      a = signature.zero ∨ b = signature.zero
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
  noStrictBetweenAddOne :
    ∀ a, ¬ ∃ middle,
      signature.StrictOrder a middle ∧ signature.StrictOrder middle (signature.add a signature.one)
```
-/
structure IntegersTheory (signature : OrderedRingSignature) : Prop where
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
  eqZeroOfMulEqZero :
    ∀ a b, signature.multiply a b = signature.zero →
      a = signature.zero ∨ b = signature.zero
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
  noStrictBetweenAddOne :
    ∀ a, ¬ ∃ middle,
      signature.StrictOrder a middle ∧ signature.StrictOrder middle (signature.add a signature.one)

end LRA.NumberSystems.Integers.Interface.ModelTheory
