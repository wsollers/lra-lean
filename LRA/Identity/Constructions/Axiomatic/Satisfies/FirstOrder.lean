import LRA.Identity.Constructions.Axiomatic.Satisfies.FOL
import LRA.Identity.Interface.FirstOrder

namespace LRA.Identity.Constructions.Axiomatic

/--
`SatisfiesFirstOrderIdentity` packages the axiomatic identity relation as a
first-order identity theory when the interpretation assigns that relation to
the distinguished identity symbol.

Logical form (Lean):

```lean
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature)
    (hIdentityIsInterpretation : forall left right,
      Ax_IdentityRelation left right <->
        I.interpretRelation L.identitySymbol
          (LRA.Identity.Interface.FirstOrder.BinaryArguments L left right)) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := Ax_IdentityRelation
        identityIsInterpretation := hIdentityIsInterpretation }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M
```

-/
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature)
    (hIdentityIsInterpretation : forall left right,
      Ax_IdentityRelation left right <->
        I.interpretRelation L.identitySymbol
          (LRA.Identity.Interface.FirstOrder.BinaryArguments L left right)) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := Ax_IdentityRelation
        identityIsInterpretation := hIdentityIsInterpretation }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M := by
  exact {
    reflexivity := fun x => Ax_IdentityReflexivity x
    leibniz := Ax_FirstOrderLeibnizLaw Variable I
  }

end LRA.Identity.Constructions.Axiomatic
