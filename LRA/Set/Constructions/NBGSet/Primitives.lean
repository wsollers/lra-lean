namespace LRA.Set.Constructions

/--
`NBGSet` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom NBGSet : Type
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
axiom NBGSet : Type

/--
`NBGClass` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom NBGClass : Type
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
axiom NBGClass : Type

/--
`NBGSetMembership` TODO

Predicate logic:

  fun (left right : NBGSet) => NBGSetMembership left right

Predicate logic (unfolded):

  fun (left right : NBGSet) => NBGSetMembership left right (opaque predicate axiom; no body to unfold)

Logical form (Lean):

```lean
axiom NBGSetMembership : NBGSet → NBGSet → Prop
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
axiom NBGSetMembership : NBGSet → NBGSet → Prop

/--
`NBGClassMembership` TODO

Predicate logic:

  fun (left : NBGSet) (right : NBGClass) => NBGClassMembership left right

Predicate logic (unfolded):

  fun (left : NBGSet) (right : NBGClass) => NBGClassMembership left right (opaque predicate axiom; no body to unfold)

Logical form (Lean):

```lean
axiom NBGClassMembership : NBGSet → NBGClass → Prop
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
axiom NBGClassMembership : NBGSet → NBGClass → Prop

instance : Membership NBGSet NBGSet where
  mem containingSet element := NBGSetMembership element containingSet

instance : Membership NBGSet NBGClass where
  mem containingClass element := NBGClassMembership element containingClass

end LRA.Set.Constructions
