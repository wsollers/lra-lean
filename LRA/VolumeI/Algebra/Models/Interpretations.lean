import LRA.VolumeI.Algebra.Signatures
import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Logic.Syntax.Term
import LRA.VolumeI.Logic.Semantics.TermEvaluation

namespace LRA.VolumeI.Algebra.Models

open LRA.VolumeI.Logic
open LRA.VolumeI.Logic.FirstOrder

universe u

/-!
Volume I label: universal-algebra-interpretations
Lean module: LRA.VolumeI.Algebra.Models.Interpretations
Verification status: checked definitions

Universal algebra begins here as a *reading* of the Logic chapter: an
algebraic signature is a `Signature` with no relation symbols, an
algebra is a `Model` of it, and — the central observation — the term
syntax `Term S Variable` is itself an algebra: the **term algebra**,
with `Term.apply` as the operations. `evaluateTerm` then IS the
canonical map out of it; the free-algebra universal property (stated in
`Homomorphism.lean`) is bookkeeping around that fact, not new
machinery.
-/

/-- Build an algebraic signature: function and constant symbols only,
no relation symbols.

Logical form:

```lean
def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants
```
-/
def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants

/-- A signature is algebraic when it has no relation symbols.

Logical form:

```lean
def _root_.LRA.VolumeI.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  IsEmpty S.RelationSymbol
```
-/
def _root_.LRA.VolumeI.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  IsEmpty S.RelationSymbol

/--
`algebraicSignatureIsAlgebraic` states algebraic signature is algebraic.

Logical form:

```lean
theorem algebraicSignatureIsAlgebraic
    (Functions : ArityIndexedSymbols) (Constants : Type) :
    (algebraicSignature Functions Constants).IsAlgebraic
```
-/
theorem algebraicSignatureIsAlgebraic
    (Functions : ArityIndexedSymbols) (Constants : Type) :
    (algebraicSignature Functions Constants).IsAlgebraic :=
  ⟨fun relationSymbol => relationSymbol.elim⟩

/-- The term algebra over a signature: terms are the elements, and
each function symbol acts by formal application. Relation symbols are
interpreted as never holding (for an algebraic signature there are
none).

Logical form:

```lean
noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.arbitrary Variable)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol
```
-/
noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.arbitrary Variable)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol

/-- In the term algebra, evaluating a term under the variable
assignment `Term.var` gives the term back: the term algebra evaluates
its own syntax to itself.

Logical form:

```lean
theorem termAlgebraEvaluatesToItself
    (S : Signature) (Variable : Type) [Nonempty Variable]
    (term : Term S Variable) :
    evaluateTerm (termAlgebra S Variable) Term.var term = term
```
-/
theorem termAlgebraEvaluatesToItself
    (S : Signature) (Variable : Type) [Nonempty Variable]
    (term : Term S Variable) :
    evaluateTerm (termAlgebra S Variable) Term.var term = term := by
  induction term with
  | var v => rfl
  | const c => rfl
  | apply f args ih =>
      show Term.apply f _ = Term.apply f args
      congr 1
      funext i
      exact ih i

end LRA.VolumeI.Algebra.Models
