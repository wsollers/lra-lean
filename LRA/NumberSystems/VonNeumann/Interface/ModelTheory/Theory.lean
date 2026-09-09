import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.LStructure
import LRA.NumberSystems.VonNeumann.Definition

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

/--
`VonNeumannTheory` TODO

Predicate logic:

  def VonNeumannTheory
      (signature : VonNeumannSignature) : Prop :=
    ∃ (SetObject : Type) (_ : Membership signature.carrier SetObject),
      ∃ construction :
          LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
            signature.carrier SetObject,
        signature.zero = construction.zero ∧
          signature.one = construction.one ∧
          signature.successor = construction.successor ∧
          signature.addition = construction.addition ∧
          signature.multiplication = construction.multiplication ∧
          signature.lessThan = construction.lessThan

Predicate logic (unfolded):

  def VonNeumannTheory
      (signature : VonNeumannSignature) : Prop :=
    ∃ (SetObject : Type) (_ : Membership signature.carrier SetObject),
      ∃ construction :
          LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
            signature.carrier SetObject,
        signature.zero = construction.zero ∧
          signature.one = construction.one ∧
          signature.successor = construction.successor ∧
          signature.addition = construction.addition ∧
          signature.multiplication = construction.multiplication ∧
          signature.lessThan = construction.lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannTheory
    (signature : VonNeumannSignature) : Prop :=
  ∃ (SetObject : Type) (_ : Membership signature.carrier SetObject),
    ∃ construction :
        LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
          signature.carrier SetObject,
      signature.zero = construction.zero ∧
        signature.one = construction.one ∧
        signature.successor = construction.successor ∧
        signature.addition = construction.addition ∧
        signature.multiplication = construction.multiplication ∧
        signature.lessThan = construction.lessThan
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
def VonNeumannTheory
    (signature : VonNeumannSignature) : Prop :=
  ∃ (SetObject : Type) (_ : Membership signature.carrier SetObject),
    ∃ construction :
        LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
          signature.carrier SetObject,
      signature.zero = construction.zero ∧
        signature.one = construction.one ∧
        signature.successor = construction.successor ∧
        signature.addition = construction.addition ∧
        signature.multiplication = construction.multiplication ∧
        signature.lessThan = construction.lessThan

/--
`VonNeumannAxioms` TODO

Predicate logic:

  abbrev VonNeumannAxioms := VonNeumannTheory

Predicate logic (unfolded):

  abbrev VonNeumannAxioms := VonNeumannTheory (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev VonNeumannAxioms := VonNeumannTheory
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
abbrev VonNeumannAxioms := VonNeumannTheory

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
