import LRA.Identity.Constructions.Mathlib.Satisfies.FOL
import LRA.Identity.Interface.FirstOrder

namespace LRA.Identity.Constructions.Mathlib

/--
`SatisfiesFirstOrderIdentity` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} (Variable : Type) [inst : DecidableEq Variable] (I : LRA.Logic.FirstOrder.Interpretation L.signature), have M := { interpretation := I, Identity := LRA.Identity.Constructions.Mathlib.NativeIdentity }; LRA.Identity.Interface.FirstOrder.Theory L Variable M

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} (Variable : Type) [inst : DecidableEq Variable] (I : LRA.Logic.FirstOrder.Interpretation L.signature), have M := { interpretation := I, Identity := LRA.Identity.Constructions.Mathlib.NativeIdentity }; LRA.Identity.Interface.FirstOrder.Theory L Variable M

Logical form (Lean):

```lean
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := NativeIdentity }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M
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
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := NativeIdentity }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M := by
  sorry

end LRA.Identity.Constructions.Mathlib
