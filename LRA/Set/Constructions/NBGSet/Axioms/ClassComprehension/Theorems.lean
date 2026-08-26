import LRA.Set.Constructions.NBGSet.Axioms.Axioms.ClassComprehension
import LRA.Set.Constructions.NBGSet.Axioms.Definitions

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`ClassComprehensionExists` TODO

Predicate logic:

  exists C : Class, IsClassComprehension property C

Predicate logic (unfolded):

  ∀ (property : LRA.Set.Constructions.NBGSet.Axioms.Set → Prop), Exists fun C => ∀ (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSetNBGClass.1 C x ↔ property x

Logical form (Lean):

```lean
theorem ClassComprehensionExists (property : Set -> Prop) :
    exists C : Class, IsClassComprehension property C
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem ClassComprehensionExists (property : Set -> Prop) :
    exists C : Class, IsClassComprehension property C := by
  sorry

/--
`TheClassComprehension` TODO

Predicate logic:

  noncomputable def TheClassComprehension (property : Set -> Prop) : Class :=
  Classical.choose (ClassComprehensionExists property)

Predicate logic (unfolded):

  noncomputable def TheClassComprehension (property : Set -> Prop) : Class :=
  Classical.choose (ClassComprehensionExists property) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheClassComprehension (property : Set -> Prop) : Class :=
  Classical.choose (ClassComprehensionExists property)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def TheClassComprehension (property : Set -> Prop) : Class :=
  Classical.choose (ClassComprehensionExists property)

/--
`TheClassComprehensionIsClassComprehension` TODO

Predicate logic:

  IsClassComprehension property (TheClassComprehension property)

Predicate logic (unfolded):

  ∀ (property : LRA.Set.Constructions.NBGSet.Axioms.Set → Prop) (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSetNBGClass.1 (Classical.indefiniteDescription (LRA.Set.Constructions.NBGSet.Axioms.IsClassComprehension property) ⋯).1 x ↔ property x

Logical form (Lean):

```lean
theorem TheClassComprehensionIsClassComprehension (property : Set -> Prop) :
    IsClassComprehension property (TheClassComprehension property)
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
theorem TheClassComprehensionIsClassComprehension (property : Set -> Prop) :
    IsClassComprehension property (TheClassComprehension property) := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
