import LRA.Function.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Function

universe u

/--
`IdentityFunction` TODO

Predicate logic:

  def IdentityFunction (Carrier : Type u) : Endofunction Carrier :=
  fun input => input

Predicate logic (unfolded):

  def IdentityFunction (Carrier : Type u) : Endofunction Carrier :=
  fun input => input (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IdentityFunction (Carrier : Type u) : Endofunction Carrier :=
  fun input => input
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
def IdentityFunction (Carrier : Type u) : Endofunction Carrier :=
  fun input => input

end LRA.Function
