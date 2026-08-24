import LRA.Logic.Syntax.Term

namespace LRA.Logic.SecondOrderMonadic

/--
`SOFormula` TODO

Predicate logic:

  inductive SOFormula (S : Signature) (Variable SetVariable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> FirstOrder.Term S Variable) ->
      SOFormula S Variable SetVariable
  | equal : FirstOrder.Term S Variable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | neg : SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | impl :
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable
  | forallQ : Variable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | setMember : SetVariable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | forallSet : SetVariable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable

Predicate logic (unfolded):

  inductive SOFormula (S : Signature) (Variable SetVariable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> FirstOrder.Term S Variable) ->
      SOFormula S Variable SetVariable
  | equal : FirstOrder.Term S Variable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | neg : SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | impl :
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable
  | forallQ : Variable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | setMember : SetVariable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | forallSet : SetVariable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SOFormula (S : Signature) (Variable SetVariable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> FirstOrder.Term S Variable) ->
      SOFormula S Variable SetVariable
  | equal : FirstOrder.Term S Variable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | neg : SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | impl :
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable
  | forallQ : Variable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | setMember : SetVariable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | forallSet : SetVariable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
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
inductive SOFormula (S : Signature) (Variable SetVariable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> FirstOrder.Term S Variable) ->
      SOFormula S Variable SetVariable
  | equal : FirstOrder.Term S Variable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | neg : SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | impl :
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable
  | forallQ : Variable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | setMember : SetVariable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | forallSet : SetVariable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable

/--
`SOFormula.and` TODO

Predicate logic:

  def SOFormula.and {S : Signature} {Variable SetVariable : Type}
    (φ ψ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.impl φ (SOFormula.neg ψ))

Predicate logic (unfolded):

  def SOFormula.and {S : Signature} {Variable SetVariable : Type}
    (φ ψ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.impl φ (SOFormula.neg ψ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SOFormula.and {S : Signature} {Variable SetVariable : Type}
    (φ ψ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.impl φ (SOFormula.neg ψ))
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
def SOFormula.and {S : Signature} {Variable SetVariable : Type}
    (φ ψ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.impl φ (SOFormula.neg ψ))

/--
`SOFormula.existsQ` TODO

Predicate logic:

  def SOFormula.existsQ {S : Signature} {Variable SetVariable : Type}
    (v : Variable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallQ v (SOFormula.neg φ))

Predicate logic (unfolded):

  def SOFormula.existsQ {S : Signature} {Variable SetVariable : Type}
    (v : Variable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallQ v (SOFormula.neg φ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SOFormula.existsQ {S : Signature} {Variable SetVariable : Type}
    (v : Variable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallQ v (SOFormula.neg φ))
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
def SOFormula.existsQ {S : Signature} {Variable SetVariable : Type}
    (v : Variable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallQ v (SOFormula.neg φ))

/--
`SOFormula.existsSet` TODO

Predicate logic:

  def SOFormula.existsSet {S : Signature} {Variable SetVariable : Type}
    (X : SetVariable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallSet X (SOFormula.neg φ))

Predicate logic (unfolded):

  def SOFormula.existsSet {S : Signature} {Variable SetVariable : Type}
    (X : SetVariable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallSet X (SOFormula.neg φ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SOFormula.existsSet {S : Signature} {Variable SetVariable : Type}
    (X : SetVariable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallSet X (SOFormula.neg φ))
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
def SOFormula.existsSet {S : Signature} {Variable SetVariable : Type}
    (X : SetVariable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallSet X (SOFormula.neg φ))

end LRA.Logic.SecondOrderMonadic
