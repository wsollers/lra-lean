import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/--
`ClassComprehension` TODO

Predicate logic:

  exists C : NBGClass, forall x : NBGSet, x ∈ C <-> property x end LRA.Set.NBG

Predicate logic (unfolded):

  ∀ (property : LRA.Set.NBGSet → Prop), Exists fun C => ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 C x ↔ property x

Logical form (Lean):

```lean
axiom ClassComprehension (property : NBGSet -> Prop) :
  exists C : NBGClass, forall x : NBGSet, x ∈ C <-> property x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
axiom ClassComprehension (property : NBGSet -> Prop) :
  exists C : NBGClass, forall x : NBGSet, x ∈ C <-> property x

end LRA.Set.NBG
