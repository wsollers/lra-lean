import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

universe u

/--
`RationalRealExtension` TODO

Predicate logic:

  structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel

Predicate logic (unfolded):

  structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel
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
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel

/--
`RationalRealExtension.EmbedRational` TODO

Predicate logic:

  def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal

Predicate logic (unfolded):

  def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal
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
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal

end LRA.NumberSystems.RealNumbers
