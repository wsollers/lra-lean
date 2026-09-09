import LRA.Identity.Constructions.Axiomatic.Satisfies.FOL
import LRA.Identity.Interface.FirstOrder

namespace LRA.Identity.Constructions.Axiomatic

/--
`SatisfiesFirstOrderIdentity` TODO

Predicate logic:

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} (Variable : Type) [inst : DecidableEq Variable] (I : LRA.Logic.FirstOrder.Interpretation L.signature), have M := { interpretation := I, Identity := LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation }; LRA.Identity.Interface.FirstOrder.Theory L Variable M

Predicate logic (unfolded):

  ∀ {L : LRA.Identity.Interface.FirstOrder.LStructure} (Variable : Type) [inst : DecidableEq Variable] (I : LRA.Logic.FirstOrder.Interpretation L.signature), have M := { interpretation := I, Identity := LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation }; LRA.Identity.Interface.FirstOrder.Theory L Variable M

Logical form (Lean):

```lean
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := Ax_IdentityRelation }
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
        Identity := Ax_IdentityRelation }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M := by
  sorry

end LRA.Identity.Constructions.Axiomatic
