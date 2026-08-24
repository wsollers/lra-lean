namespace LRA.Set

/--
`ZFCSet` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

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

  ZFCSet → ZFCSet → Prop instance : Membership ZFCSet ZFCSet where mem containingSet element

Predicate logic (unfolded):

  LRA.Set.ZFCSet → LRA.Set.ZFCSet → Prop (compiled unfold unavailable; showing predicate logic)

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

end LRA.Set
