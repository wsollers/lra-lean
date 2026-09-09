import LRA.Set.Constructions.TypeSet

namespace LRA.Set.Interop.Providers.LRA.Predicate

universe u

/--
`PredicateSet` The in-house predicate-set provider backed by `Alpha -> Prop`; it intentionally has no dedicated `HasPairing`, since predicate-backed sets lack a same-carrier pairing object and therefore fall back to `Prod`.

Predicate logic:

  abbrev PredicateSet (Alpha : Type u) : Type u := LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  abbrev PredicateSet (Alpha : Type u) : Type u := LRA.Set.Constructions.TypeSet Alpha (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PredicateSet (Alpha : Type u) : Type u := LRA.Set.Constructions.TypeSet Alpha
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
abbrev PredicateSet (Alpha : Type u) : Type u := LRA.Set.Constructions.TypeSet Alpha

end LRA.Set.Interop.Providers.LRA.Predicate
