import LRA.Identity.Interface.Logic.FirstOrder.Language
import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions

namespace LRA.Identity

universe u

/--
`EqualityDiagonal` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a = a_1

Logical form (Lean):

```lean
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right
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
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

/--
`EqualityStructure` TODO

Predicate logic:

  structure EqualityStructure where
    Carrier : Type u
    carrierNonempty : Nonempty Carrier
    equalityInterpretation : Carrier -> Carrier -> Prop
    satisfiesIdentityTheory :
      IdentityTheory (FullLeibniz Carrier) equalityInterpretation

Predicate logic (unfolded):

  structure EqualityStructure where
    Carrier : Type u
    carrierNonempty : Nonempty Carrier
    equalityInterpretation : Carrier -> Carrier -> Prop
    satisfiesIdentityTheory :
      IdentityTheory (FullLeibniz Carrier) equalityInterpretation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  satisfiesIdentityTheory :
    IdentityTheory (FullLeibniz Carrier) equalityInterpretation
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
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  satisfiesIdentityTheory :
    IdentityTheory (FullLeibniz Carrier) equalityInterpretation

end LRA.Identity
