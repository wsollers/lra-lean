import LRA.Function
import LRA.Set
-- Pulls the function tree's `Examples` and `FailureModes` modules into a
-- build-gated target; the production `LRA.Function` router imports only `All`.
import LRA.VolumeI.Function.AllWithExamples

/-!
Focused smoke checks for the function foundations.

The typed function abbreviation, the foundational set-theoretic function
triple and its function condition, the evaluation and extensionality results,
and the single typed-to-set representation theorem must all elaborate, and the
set backend instances required by the representation theorem must resolve for a
concrete backend.
-/

universe u v

namespace LRA.FunctionFoundationsSmoke

open LRA.Set
open LRA.Set.LRASet

/-! ### Typed functions -/

/-- Independent domain and codomain types. -/
example : LRA.Function Nat Bool := fun value => value = 0

/-- Independent domain and codomain universes. -/
example (Domain : Type u) (Codomain : Type v) (value : Codomain) :
    LRA.Function Domain Codomain :=
  fun _ => value

/-- The typed abbreviation unfolds to the arrow type. -/
example (Domain : Type u) (Codomain : Type v) :
    LRA.Function Domain Codomain = (Domain -> Codomain) := rfl

/-- Endofunctions are the single-type specialization. -/
example (Domain : Type u) : LRA.Function.Endofunction Domain := fun x => x

/-- The generic function predicates elaborate at independent universes. -/
example := @LRA.Function.Injective.Injective
example := @LRA.Function.Surjective.Surjective
example := @LRA.Function.Bijective.Bijective
example := @LRA.Function.Composition.Composition
example := @LRA.Function.Graph.Graph
example := @LRA.Function.Image.IsImageOf
example := @LRA.Function.Preimage.IsPreimageOf

/-! ### Set-theoretic functions -/

/-- The raw triple and the function condition are separate declarations. -/
example := @LRA.Function.SetTheoretic.SetTheoreticFunctionTriple
example := @LRA.Function.SetTheoretic.IsSetTheoreticFunction
example := @LRA.Function.SetTheoretic.SetTheoreticFunction

/-- Evaluation existence, evaluation uniqueness, and extensionality. -/
example := @LRA.Function.SetTheoretic.EvaluationExists
example := @LRA.Function.SetTheoretic.EvaluationUnique
example := @LRA.Function.SetTheoretic.SetTheoreticFunctionExt

/-- The set-theoretic relation triple stays distinct from the function triple. -/
example := @LRA.Function.SetTheoretic.SetTheoreticRelationTriple
example := @LRA.Function.SetTheoretic.IsSetTheoreticRelation

/-- The raw triple is constructible over a concrete backend. -/
example : LRA.Function.SetTheoretic.SetTheoreticFunctionTriple
    (LRASet Nat) (LRASet Bool) (LRASet (Nat × Bool)) where
  domain := fun _ => True
  codomain := fun _ => True
  graph := fun pair => pair.2 = (pair.1 = 0)

/-- The function condition elaborates against that concrete backend, so the
backend supplies membership, ordered pairs, and the relation vocabulary the
canonical statement needs. -/
example (triple : LRA.Function.SetTheoretic.SetTheoreticFunctionTriple
    (LRASet Nat) (LRASet Bool) (LRASet (Nat × Bool))) : Prop :=
  LRA.Function.SetTheoretic.IsSetTheoreticFunction
    (DomainElement := Nat) (CodomainElement := Bool) (Pair := Nat × Bool) triple

/-! ### The single representation theorem -/

/-- Exactly one intentional typed-to-set representation theorem. -/
example := @LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation

/-- Its set-construction instances resolve for a concrete backend, which is
what makes its explicit encoding hypotheses dischargeable in practice. -/
example : HasSeparation (Nat × Bool) (LRASet (Nat × Bool)) := inferInstance
example : HasPairing Nat Bool (Nat × Bool) := inferInstance

end LRA.FunctionFoundationsSmoke
