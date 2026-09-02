import LRA.Operation.Laws.Closure.Theorems

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u

/--
`BinaryEndoClosedOn.iff_binary_closed_under` TODO

Predicate logic:

  BinaryEndoClosedOn carrier operation ↔ BinaryClosedUnder carrier carrier carrier operation

Predicate logic (unfolded):

  ∀ {Ambient : Type u} {carrier : Ambient → Prop} {operation : Ambient → Ambient → Ambient}, ∀ (left right : Ambient), carrier left → carrier right → carrier (operation left right) ↔ ∀ (left right : Ambient), carrier left → carrier right → carrier (operation left right)

Logical form (Lean):

```lean
theorem BinaryEndoClosedOn.iff_binary_closed_under {Ambient : Type u}
    {carrier : Ambient → Prop}
    {operation : BinaryEndoOperation Ambient} :
    BinaryEndoClosedOn carrier operation ↔
      BinaryClosedUnder carrier carrier carrier operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem BinaryEndoClosedOn.iff_binary_closed_under {Ambient : Type u}
    {carrier : Ambient → Prop}
    {operation : BinaryEndoOperation Ambient} :
    BinaryEndoClosedOn carrier operation ↔
      BinaryClosedUnder carrier carrier carrier operation := by
  sorry
end LRA.Operation.Laws.Closure
