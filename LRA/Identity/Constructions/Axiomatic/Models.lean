import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLFull
import LRA.Identity.Interface.ModelTheory.Model

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`EqualityStructure` TODO

Predicate logic:

  noncomputable def EqualityStructure
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.Identity.EqualityStructure

Predicate logic (unfolded):

  noncomputable def EqualityStructure
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.Identity.EqualityStructure

Logical form (Lean):

```lean
noncomputable def EqualityStructure
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.Identity.EqualityStructure
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
noncomputable def EqualityStructure
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.Identity.EqualityStructure := by
  sorry

/--
`FOLModel` TODO

Predicate logic:

  noncomputable def FOLModel (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def FOLModel (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def FOLModel (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature
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
noncomputable def FOLModel (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature := by
  sorry

/--
`SOLFullModel` TODO

Predicate logic:

  noncomputable def SOLFullModel (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def SOLFullModel (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def SOLFullModel (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature
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
noncomputable def SOLFullModel (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature := by
  sorry

end LRA.Identity.Constructions.Axiomatic
