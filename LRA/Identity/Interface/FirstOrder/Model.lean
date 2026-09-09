import LRA.Identity.Interface.FirstOrder.LStructure
import LRA.Logic.Semantics.Interpretation

namespace LRA.Identity.Interface.FirstOrder

/--
`Model` interprets a first-order identity language and records that its exposed
identity relation is exactly the interpretation of the language's
distinguished binary identity symbol.

Logical form (Lean):

```lean
structure Model (L : LStructure) where
  interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
  Identity : interpretation.Domain -> interpretation.Domain -> Prop
  identityIsInterpretation : forall left right,
    Identity left right <->
      interpretation.interpretRelation L.identitySymbol
        (BinaryArguments L left right)
```

-/
structure Model (L : LStructure) where
  interpretation : LRA.Logic.FirstOrder.Interpretation L.signature
  Identity : interpretation.Domain -> interpretation.Domain -> Prop
  identityIsInterpretation : forall left right,
    Identity left right <->
      interpretation.interpretRelation L.identitySymbol
        (BinaryArguments L left right)

end LRA.Identity.Interface.FirstOrder
