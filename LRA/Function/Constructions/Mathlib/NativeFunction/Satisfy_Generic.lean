import LRA.Function.Satisfy_Generic

namespace LRA.Function.Constructions.Mathlib.NativeFunction

universe u v

instance {Domain : Type u} {Codomain : Type v} :
    LRA.Function.GenericSemantics
      (LRA.Function Domain Codomain) Domain Codomain where
  toFunctionRelation := LRA.Function.Graph

/--
`satisfiesGeneric` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), LRA.Function.genericTheory function

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    ((∀ (x : Domain), Exists fun y => LRA.Function.Constructions.Mathlib.NativeFunction.instGenericSemantics.1 function x y) ∧ (∀ (x : Domain) (y₁ y₂ : Codomain), LRA.Function.Constructions.Mathlib.NativeFunction.instGenericSemantics.1 function x y₁ → LRA.Function.Constructions.Mathlib.NativeFunction.instGenericSemantics.1 function x y₂ → y₁ = y₂))

Logical form (Lean):

```lean
theorem satisfiesGeneric
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Function.genericTheory function
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
theorem satisfiesGeneric
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Function.genericTheory function := by
  sorry
end LRA.Function.Constructions.Mathlib.NativeFunction
