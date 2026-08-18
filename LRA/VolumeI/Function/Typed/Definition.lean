namespace LRA

universe u v

/--
**[Abbreviation — Function]**

The typed notion of function: a rule assigning to every element of a domain
type exactly one element of a codomain type. The domain and the codomain are
independent types living in independent universes.

This is the convenient representation used throughout later analysis. It is not
definitionally the set-theoretic ordered triple; see
`LRA.Function.SetTheoretic.SetTheoreticFunction` for that foundational notion
and `LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation` for the single
intentional bridge between them.

Logical form:

```lean
abbrev Function (Domain : Type u) (Codomain : Type v)
```
-/
abbrev Function (Domain : Type u) (Codomain : Type v) :=
  Domain -> Codomain

namespace Function

/--
**[Abbreviation — Endofunction]**

A typed function from a type to itself.

Logical form:

```lean
abbrev Endofunction (Domain : Type u)
```
-/
abbrev Endofunction (Domain : Type u) :=
  Function Domain Domain

end Function

end LRA
