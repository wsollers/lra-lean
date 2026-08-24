namespace LRA.Set

/--
`TGSet` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Type

Logical form (Lean):

```lean
axiom TGSet : Type
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
axiom TGSet : Type

/--
`TGMembership` TODO

Predicate logic:

  TGSet -> TGSet -> Prop instance : Membership TGSet TGSet where mem containingSet element

Predicate logic (unfolded):

  LRA.Set.TGSet → LRA.Set.TGSet → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom TGMembership : TGSet -> TGSet -> Prop
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
axiom TGMembership : TGSet -> TGSet -> Prop

instance : Membership TGSet TGSet where
  mem containingSet element := TGMembership element containingSet

end LRA.Set
