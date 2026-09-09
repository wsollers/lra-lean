namespace LRA.Set.Constructions

/--
`ZFCSet` TODO

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
axiom ZFCSet : Type
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
axiom ZFCSet : Type

/--
`ZFCMembership` TODO

Predicate logic:

  fun (left right : ZFCSet) => ZFCMembership left right

Predicate logic (unfolded):

  fun (left right : ZFCSet) => ZFCMembership left right (opaque predicate axiom; no body to unfold)

Logical form (Lean):

```lean
axiom ZFCMembership : ZFCSet → ZFCSet → Prop
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
axiom ZFCMembership : ZFCSet → ZFCSet → Prop

instance : Membership ZFCSet ZFCSet where
  mem containingSet element := ZFCMembership element containingSet

end LRA.Set.Constructions
