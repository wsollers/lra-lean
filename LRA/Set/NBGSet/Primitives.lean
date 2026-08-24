namespace LRA.Set

/--
`NBGSet` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

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

  NBGSet -> NBGSet -> Prop

Predicate logic (unfolded):

  LRA.Set.NBGSet → LRA.Set.NBGSet → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom NBGSetMembership : NBGSet -> NBGSet -> Prop
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
axiom NBGSetMembership : NBGSet -> NBGSet -> Prop

/--
`NBGClassMembership` TODO

Predicate logic:

  NBGSet -> NBGClass -> Prop

Predicate logic (unfolded):

  LRA.Set.NBGSet → LRA.Set.NBGClass → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom NBGClassMembership : NBGSet -> NBGClass -> Prop
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
axiom NBGClassMembership : NBGSet -> NBGClass -> Prop

/--
`NBGClassOfSet` TODO

Predicate logic:

  NBGSet -> NBGClass instance : Membership NBGSet NBGSet where mem containingSet element

Predicate logic (unfolded):

  LRA.Set.NBGSet → LRA.Set.NBGClass

Logical form (Lean):

```lean
axiom NBGClassOfSet : NBGSet -> NBGClass
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
axiom NBGClassOfSet : NBGSet -> NBGClass

instance : Membership NBGSet NBGSet where
  mem containingSet element := NBGSetMembership element containingSet

instance : Membership NBGSet NBGClass where
  mem containingClass element := NBGClassMembership element containingClass

end LRA.Set
