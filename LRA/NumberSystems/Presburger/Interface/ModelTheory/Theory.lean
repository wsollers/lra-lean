import LRA.NumberSystems.Presburger.Interface.ModelTheory.LStructure
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

/--
`PresburgerTheory` TODO

Predicate logic:

  def PresburgerTheory
      (signature : PresburgerSignature) : Prop :=
    ∃ model :
        LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
          signature.carrier (Set signature.carrier),
      signature.zero = model.zero ∧
        signature.successor = model.successor ∧
        signature.addition =
          LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
            model ∧
        signature.lessThan = model.lessThan

Predicate logic (unfolded):

  def PresburgerTheory
      (signature : PresburgerSignature) : Prop :=
    ∃ model :
        LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
          signature.carrier (Set signature.carrier),
      signature.zero = model.zero ∧
        signature.successor = model.successor ∧
        signature.addition =
          LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
            model ∧
        signature.lessThan = model.lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerTheory
    (signature : PresburgerSignature) : Prop :=
  ∃ model :
      LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
        signature.carrier (Set signature.carrier),
    signature.zero = model.zero ∧
      signature.successor = model.successor ∧
      signature.addition =
        LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
          model ∧
      signature.lessThan = model.lessThan
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def PresburgerTheory
    (signature : PresburgerSignature) : Prop :=
  ∃ model :
      LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
        signature.carrier (Set signature.carrier),
    signature.zero = model.zero ∧
      signature.successor = model.successor ∧
      signature.addition =
        LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
          model ∧
      signature.lessThan = model.lessThan

/--
`PresburgerAxioms` TODO

Predicate logic:

  abbrev PresburgerAxioms := PresburgerTheory

Predicate logic (unfolded):

  abbrev PresburgerAxioms := PresburgerTheory (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PresburgerAxioms := PresburgerTheory
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PresburgerAxioms := PresburgerTheory

end LRA.NumberSystems.Presburger.Interface.ModelTheory
