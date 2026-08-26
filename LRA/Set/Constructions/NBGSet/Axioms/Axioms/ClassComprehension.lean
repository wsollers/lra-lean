import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`ClassComprehension` TODO

Predicate logic:

  exists C : NBGClass, forall x : NBGSet, x ∈ C <-> property x end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (property : LRA.Set.Constructions.NBGSet → Prop), Exists fun C => ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 C x ↔ property x

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

end LRA.Set.Constructions.NBGSet.Axioms
