import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.LStructure
import LRA.Operation

namespace LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory (OrderedSemiringSignature)

/-- `WholeNumbersTheory signature` means `signature` satisfies the
ordered-commutative-semiring laws expected of 𝕎: `add` and `multiply` are
each associative, `add` is commutative, `zero`/`one` are two-sided identities
for `add`/`multiply`, `zero` absorbs `multiply`, `multiply` distributes over
`add` on both sides, `le` is a total order, and both operations respect that
order. This is the model-theoretic restatement of `OrderedSemiringLaws`,
stated directly over the raw operations and relation carried by `signature`
rather than over a typeclass instance.

Logical form:

```lean
structure WholeNumbersTheory (signature : OrderedSemiringSignature) : Prop where
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
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
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
  leRefl : ∀ a, signature.le a a
  leAntisymm : ∀ a b, signature.le a b → signature.le b a → a = b
  leTrans : ∀ a b c, signature.le a b → signature.le b c → signature.le a c
  leTotal : ∀ a b, signature.le a b ∨ signature.le b a
  addLeAddLeft :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add c a) (signature.add c b)
  addLeAddRight :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add a c) (signature.add b c)
  mulNonneg :
    ∀ a b, signature.le signature.zero a → signature.le signature.zero b →
      signature.le signature.zero (signature.multiply a b)
```
-/
structure WholeNumbersTheory (signature : OrderedSemiringSignature) : Prop where
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
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
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
  leRefl : ∀ a, signature.le a a
  leAntisymm : ∀ a b, signature.le a b → signature.le b a → a = b
  leTrans : ∀ a b c, signature.le a b → signature.le b c → signature.le a c
  leTotal : ∀ a b, signature.le a b ∨ signature.le b a
  addLeAddLeft :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add c a) (signature.add c b)
  addLeAddRight :
    ∀ a b, signature.le a b → ∀ c, signature.le (signature.add a c) (signature.add b c)
  mulNonneg :
    ∀ a b, signature.le signature.zero a → signature.le signature.zero b →
      signature.le signature.zero (signature.multiply a b)

end LRA.NumberSystems.WholeNumbers.Interface.ModelTheory
