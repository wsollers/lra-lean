import LRA.Identity.Constructions.Mathlib.Satisfies.FOL
import LRA.Identity.Interface.FirstOrder

namespace LRA.Identity.Constructions.Mathlib

/--
`SatisfiesFirstOrderIdentity` packages native equality as a first-order
identity theory when the interpretation assigns equality to the distinguished
identity symbol.

Logical form (Lean):

```lean
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature)
    (hIdentityIsInterpretation : forall left right,
      NativeIdentity left right <->
        I.interpretRelation L.identitySymbol
          (LRA.Identity.Interface.FirstOrder.BinaryArguments L left right)) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := NativeIdentity
        identityIsInterpretation := hIdentityIsInterpretation }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M
```

-/
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature)
    (hIdentityIsInterpretation : forall left right,
      NativeIdentity left right <->
        I.interpretRelation L.identitySymbol
          (LRA.Identity.Interface.FirstOrder.BinaryArguments L left right)) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := NativeIdentity
        identityIsInterpretation := hIdentityIsInterpretation }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M := by
  exact {
    reflexivity := fun _ => rfl
    leibniz := by
      intro x y hxy Property _ hProperty
      exact hxy ▸ hProperty
  }

end LRA.Identity.Constructions.Mathlib
