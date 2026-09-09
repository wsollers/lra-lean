import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.LStructure
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

/--
`SuccessorArithmeticTheory` TODO

Predicate logic:

  def SuccessorArithmeticTheory
      (signature : SuccessorArithmeticSignature) : Prop :=
    ∃ peanoSystem :
        LRA.NumberSystems.PeanoSystem.PeanoSystem signature.carrier
          (Set signature.carrier),
      signature.zero = peanoSystem.base ∧
        signature.successor = peanoSystem.successor

Predicate logic (unfolded):

  def SuccessorArithmeticTheory
      (signature : SuccessorArithmeticSignature) : Prop :=
    ∃ peanoSystem :
        LRA.NumberSystems.PeanoSystem.PeanoSystem signature.carrier
          (Set signature.carrier),
      signature.zero = peanoSystem.base ∧
        signature.successor = peanoSystem.successor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticTheory
    (signature : SuccessorArithmeticSignature) : Prop :=
  ∃ peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem signature.carrier
        (Set signature.carrier),
    signature.zero = peanoSystem.base ∧
      signature.successor = peanoSystem.successor
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
def SuccessorArithmeticTheory
    (signature : SuccessorArithmeticSignature) : Prop :=
  ∃ peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem signature.carrier
        (Set signature.carrier),
    signature.zero = peanoSystem.base ∧
      signature.successor = peanoSystem.successor

/--
`SuccessorArithmeticAxioms` TODO

Predicate logic:

  abbrev SuccessorArithmeticAxioms := SuccessorArithmeticTheory

Predicate logic (unfolded):

  abbrev SuccessorArithmeticAxioms := SuccessorArithmeticTheory (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SuccessorArithmeticAxioms := SuccessorArithmeticTheory
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
abbrev SuccessorArithmeticAxioms := SuccessorArithmeticTheory

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
