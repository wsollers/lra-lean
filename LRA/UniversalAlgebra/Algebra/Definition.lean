import LRA.UniversalAlgebra.Signature
import LRA.Logic.Model.Model
import LRA.Logic.Syntax.Term
import LRA.Logic.Semantics.TermEvaluation

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

/--
`algebraicSignature` TODO

Predicate logic:

  def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants

Predicate logic (unfolded):

  def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def algebraicSignature
    (Functions : ArityIndexedSymbols) (Constants : Type) : Signature where
  Functions := Functions
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Constants

/--
`_root_.LRA.Logic.Signature.IsAlgebraic` TODO

Predicate logic:

  def _root_.LRA.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  S.RelationSymbol -> False

Predicate logic (unfolded):

  def _root_.LRA.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  S.RelationSymbol -> False (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def _root_.LRA.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  S.RelationSymbol -> False
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def _root_.LRA.Logic.Signature.IsAlgebraic (S : Signature) : Prop :=
  S.RelationSymbol -> False

/--
`algebraicSignatureIsAlgebraic` TODO

Predicate logic:

  (∀ Functions ∈ ArityIndexedSymbols), (algebraicSignature Functions Constants).IsAlgebraic

Predicate logic (unfolded):

  ∀ (Functions : LRA.Logic.ArityIndexedSymbols) (Constants : Type) (a : (LRA.UniversalAlgebra.algebraicSignature Functions Constants).Relations.1), False

Logical form (Lean):

```lean
theorem algebraicSignatureIsAlgebraic
    (Functions : ArityIndexedSymbols) (Constants : Type) :
    (algebraicSignature Functions Constants).IsAlgebraic
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
theorem algebraicSignatureIsAlgebraic
    (Functions : ArityIndexedSymbols) (Constants : Type) :
    (algebraicSignature Functions Constants).IsAlgebraic := by
  sorry

/--
`termAlgebra` TODO

Predicate logic:

  noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.choice inferInstance)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol

Predicate logic (unfolded):

  noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.choice inferInstance)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.choice inferInstance)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def termAlgebra
    (S : Signature) (Variable : Type) [Nonempty Variable] :
    Model.{0} S where
  Domain := Term S Variable
  domainNonempty := ⟨.var (Classical.choice inferInstance)⟩
  interpretFunction := fun functionSymbol arguments =>
    .apply functionSymbol arguments
  interpretRelation := fun _ _ => False
  interpretConstant := fun constantSymbol => .const constantSymbol

/--
`termAlgebraEvaluatesToItself` TODO

Predicate logic:

  (∀ S ∈ Signature), evaluateTerm (termAlgebra S Variable) Term.var term = term

Predicate logic (unfolded):

  ∀ (S : LRA.Logic.Signature) (Variable : Type) [inst : Nonempty Variable] (term : LRA.Logic.FirstOrder.Term S Variable), LRA.Logic.FirstOrder.evaluateTerm { Domain := LRA.Logic.FirstOrder.Term S Variable, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol arguments => LRA.Logic.FirstOrder.Term.apply functionSymbol arguments, interpretRelation := fun x x_1 => False, interpretConstant := fun constantSymbol => LRA.Logic.FirstOrder.Term.const constantSymbol } LRA.Logic.FirstOrder.Term.var term = term

Logical form (Lean):

```lean
theorem termAlgebraEvaluatesToItself
    (S : Signature) (Variable : Type) [Nonempty Variable]
    (term : Term S Variable) :
    evaluateTerm (termAlgebra S Variable) Term.var term = term
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
theorem termAlgebraEvaluatesToItself
    (S : Signature) (Variable : Type) [Nonempty Variable]
    (term : Term S Variable) :
    evaluateTerm (termAlgebra S Variable) Term.var term = term := by
  sorry

end LRA.UniversalAlgebra
