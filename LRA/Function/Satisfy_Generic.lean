import LRA.Function.Definition

namespace LRA.Function

universe u v w

/--
`GenericSemantics` Backends satisfy the generic function interface by presenting a graph relation that is total and single-valued on the exported domain and codomain types.

Predicate logic:

  class GenericSemantics
      (FunctionObject : Type w)
      (Domain : outParam (Type u))
      (Codomain : outParam (Type v)) where
    toFunctionRelation : FunctionObject → FunctionRelation Domain Codomain

Predicate logic (unfolded):

  class GenericSemantics
      (FunctionObject : Type w)
      (Domain : outParam (Type u))
      (Codomain : outParam (Type v)) where
    toFunctionRelation : FunctionObject → FunctionRelation Domain Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class GenericSemantics
    (FunctionObject : Type w)
    (Domain : outParam (Type u))
    (Codomain : outParam (Type v)) where
  toFunctionRelation : FunctionObject → FunctionRelation Domain Codomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
class GenericSemantics
    (FunctionObject : Type w)
    (Domain : outParam (Type u))
    (Codomain : outParam (Type v)) where
  toFunctionRelation : FunctionObject → FunctionRelation Domain Codomain

/--
`interpret` TODO

Predicate logic:

  ∀ {FunctionObject : Type w} {Domain : Type u} {Codomain : Type v} [inst : LRA.Function.GenericSemantics FunctionObject Domain Codomain] (function : FunctionObject) (a : Domain) (a_1 : Codomain), inst.1 function a a_1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 function a a_1

Logical form (Lean):

```lean
def interpret
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject) : FunctionRelation Domain Codomain :=
  GenericSemantics.toFunctionRelation function
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
def interpret
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject) : FunctionRelation Domain Codomain :=
  GenericSemantics.toFunctionRelation function

/--
`genericTheory` TODO

Predicate logic:

  ∀ {FunctionObject : Type w} {Domain : Type u} {Codomain : Type v} [inst : LRA.Function.GenericSemantics FunctionObject Domain Codomain] (function : FunctionObject), (LRA.Function.Total (LRA.Function.interpret function) ∧ LRA.Function.SingleValued (LRA.Function.interpret function))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Domain), Exists fun y => inst.1 function x y) ∧ (∀ (x : Domain) (y₁ y₂ : Codomain), inst.1 function x y₁ → inst.1 function x y₂ → y₁ = y₂))

Logical form (Lean):

```lean
def genericTheory
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject) : Prop :=
  IsFunctionRelation (interpret function)
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
def genericTheory
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject) : Prop :=
  IsFunctionRelation (interpret function)

/--
`toFunction` TODO

Predicate logic:

  noncomputable def toFunction
      {FunctionObject : Type w}
      {Domain : Type u} {Codomain : Type v}
      [GenericSemantics FunctionObject Domain Codomain]
      (function : FunctionObject)
      (satisfiesGeneric : genericTheory function) :
      LRA.Function Domain Codomain :=
    fun input => Classical.choose (satisfiesGeneric.1 input)

Predicate logic (unfolded):

  noncomputable def toFunction
      {FunctionObject : Type w}
      {Domain : Type u} {Codomain : Type v}
      [GenericSemantics FunctionObject Domain Codomain]
      (function : FunctionObject)
      (satisfiesGeneric : genericTheory function) :
      LRA.Function Domain Codomain :=
    fun input => Classical.choose (satisfiesGeneric.1 input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def toFunction
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject)
    (satisfiesGeneric : genericTheory function) :
    LRA.Function Domain Codomain :=
  fun input => Classical.choose (satisfiesGeneric.1 input)
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
noncomputable def toFunction
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject)
    (satisfiesGeneric : genericTheory function) :
    LRA.Function Domain Codomain :=
  fun input => Classical.choose (satisfiesGeneric.1 input)

/--
`toFunction_graph` TODO

Predicate logic:

  ∀ {FunctionObject : Type w} {Domain : Type u} {Codomain : Type v} [inst : LRA.Function.GenericSemantics FunctionObject Domain Codomain] (function : FunctionObject) (satisfiesGeneric : LRA.Function.genericTheory function) (input : Domain), LRA.Function.interpret function input (LRA.Function.toFunction function satisfiesGeneric input)

Predicate logic (unfolded):

  Ambient
    (FunctionObject, Domain, Codomain)
  Objects
    function : FunctionObject
    satisfiesGeneric : genericTheory function
    input : Domain
  Prove
    inst.1 function input (Classical.indefiniteDescription (LRA.Function.interpret function input) ⋯).1

Logical form (Lean):

```lean
theorem toFunction_graph
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject)
    (satisfiesGeneric : genericTheory function)
    (input : Domain) :
    interpret function input (toFunction function satisfiesGeneric input)
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
theorem toFunction_graph
    {FunctionObject : Type w}
    {Domain : Type u} {Codomain : Type v}
    [GenericSemantics FunctionObject Domain Codomain]
    (function : FunctionObject)
    (satisfiesGeneric : genericTheory function)
    (input : Domain) :
    interpret function input (toFunction function satisfiesGeneric input) := by
  sorry
end LRA.Function
