import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.ModelTheory.Model

namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`CanonicalEqualityStructure` TODO

Predicate logic:

  noncomputable def CanonicalEqualityStructure
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.Identity.EqualityStructure

Predicate logic (unfolded):

  noncomputable def CanonicalEqualityStructure
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.Identity.EqualityStructure

Logical form (Lean):

```lean
noncomputable def CanonicalEqualityStructure
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
noncomputable def CanonicalEqualityStructure
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.Identity.EqualityStructure := by
  sorry

/--
`CanonicalFOLModel` TODO

Predicate logic:

  noncomputable def CanonicalFOLModel
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def CanonicalFOLModel
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def CanonicalFOLModel
    (Carrier : Type u) [Nonempty Carrier] :
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
noncomputable def CanonicalFOLModel
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature := by
  sorry

/--
`CanonicalSOLFullModel` TODO

Predicate logic:

  noncomputable def CanonicalSOLFullModel
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def CanonicalSOLFullModel
      (Carrier : Type u) [Nonempty Carrier] :
      LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def CanonicalSOLFullModel
    (Carrier : Type u) [Nonempty Carrier] :
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
noncomputable def CanonicalSOLFullModel
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature := by
  sorry

end LRA.Identity.Constructions.Mathlib
