namespace LRA.Identity

universe u

/--
`EqualityReflexivity` TODO

Predicate logic:

  (∀ element ∈ Carrier), element = element end LRA.Identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (element : Carrier), element = element

Logical form (Lean):

```lean
axiom EqualityReflexivity {Carrier : Type u} (element : Carrier) :
    element = element
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
axiom EqualityReflexivity {Carrier : Type u} (element : Carrier) :
    element = element

end LRA.Identity
