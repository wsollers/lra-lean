import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`SatisfiesFOLIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u) (Expressible : (Carrier → Prop) → Prop), LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (Expressible : (Carrier → Prop) → Prop), ((∀ (x : Carrier), x = x) ∧ (∀ (x y : Carrier), x = y → ∀ (P : Carrier → Prop), Expressible P → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesFOLIdentity (Carrier : Type u)
    (Expressible : (Carrier -> Prop) -> Prop) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible
      (NativeIdentity : Carrier -> Carrier -> Prop)
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
theorem SatisfiesFOLIdentity (Carrier : Type u)
    (Expressible : (Carrier -> Prop) -> Prop) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/--
`SatisfiesFOLModelIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S), LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (Variable : Type) [inst : DecidableEq Variable] (M : LRA.Logic.FirstOrder.Interpretation S), ((∀ (x : M.Domain), x = x) ∧ (∀ (x y : M.Domain), x = y → ∀ (P : M.Domain → Prop), (∃ formula, ∃ distinguished, ∃ assignment, ∀ (value : M.Domain), P value ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment distinguished value) formula) → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesFOLModelIdentity
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M
      (NativeIdentity : M.Domain -> M.Domain -> Prop)
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
theorem SatisfiesFOLModelIdentity
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M
      (NativeIdentity : M.Domain -> M.Domain -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
