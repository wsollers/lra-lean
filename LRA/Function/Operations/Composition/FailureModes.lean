import LRA.Function.Operations.Composition.Definition
import LRA.Function.Properties.Definition

/-!
A composite can be better behaved than its factors: injectivity of a composite
does not force the outer function to be injective, surjectivity does not force
the inner one to be surjective, and a bijective composite tolerates slack in
the middle.
-/

namespace LRA.Function

universe u v w

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}

/-- A composite is injective while its outer function is not. -/
def ComposeInjectiveOuterNotInjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Injective (Compose outer inner) ∧ ¬ Injective outer

/-- A composite is surjective while its inner function is not. -/
def ComposeSurjectiveInnerNotSurjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Surjective (Compose outer inner) ∧ ¬ Surjective inner

/-- A composite is bijective while the middle carrier is not exhausted. -/
def ComposeBijectiveWithSlackMiddle
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Bijective (Compose outer inner) ∧
    (¬ Surjective inner ∨ ¬ Injective outer)

end LRA.Function
