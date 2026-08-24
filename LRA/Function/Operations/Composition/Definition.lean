import LRA.Function.Definition
import LRA.Relation.Operations.Composition.Definition

namespace LRA.Function

universe u v w

/--
`Compose` TODO

Predicate logic:

  def Compose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle) :
    LRA.Function Domain Codomain :=
  fun input => outer (inner input)

Predicate logic (unfolded):

  def Compose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle) :
    LRA.Function Domain Codomain :=
  fun input => outer (inner input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Compose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle) :
    LRA.Function Domain Codomain :=
  fun input => outer (inner input)
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
def Compose
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle) :
    LRA.Function Domain Codomain :=
  fun input => outer (inner input)

end LRA.Function
