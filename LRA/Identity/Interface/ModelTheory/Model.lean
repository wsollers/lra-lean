import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.ModelTheory.Model
import LRA.ModelTheory.SecondOrder.FullModel

namespace LRA.Identity

open LRA.Logic

universe u

/--
`EqualityStructure.ToFOLModel` TODO

Predicate logic:

  noncomputable def EqualityStructure.ToFOLModel
      (S : EqualityStructure.{u}) :
      LRA.ModelTheory.FirstOrder.Model pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def EqualityStructure.ToFOLModel
      (S : EqualityStructure.{u}) :
      LRA.ModelTheory.FirstOrder.Model pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def EqualityStructure.ToFOLModel
    (S : EqualityStructure.{u}) :
    LRA.ModelTheory.FirstOrder.Model pureEqualitySignature
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
noncomputable def EqualityStructure.ToFOLModel
    (S : EqualityStructure.{u}) :
    LRA.ModelTheory.FirstOrder.Model pureEqualitySignature := by
  sorry

/--
`EqualityStructure.ToSOLFullModel` TODO

Predicate logic:

  noncomputable def EqualityStructure.ToSOLFullModel
      (S : EqualityStructure.{u}) :
      LRA.ModelTheory.SecondOrder.FullModel pureEqualitySignature

Predicate logic (unfolded):

  noncomputable def EqualityStructure.ToSOLFullModel
      (S : EqualityStructure.{u}) :
      LRA.ModelTheory.SecondOrder.FullModel pureEqualitySignature

Logical form (Lean):

```lean
noncomputable def EqualityStructure.ToSOLFullModel
    (S : EqualityStructure.{u}) :
    LRA.ModelTheory.SecondOrder.FullModel pureEqualitySignature
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
noncomputable def EqualityStructure.ToSOLFullModel
    (S : EqualityStructure.{u}) :
    LRA.ModelTheory.SecondOrder.FullModel pureEqualitySignature := by
  sorry

/--
`EqualityStructure.OfReflexiveLeibnizRelation` TODO

Predicate logic:

  noncomputable def EqualityStructure.OfReflexiveLeibnizRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
      (reflexive : forall x, R x x)
      (leibniz : forall x y, R x y -> forall P : Carrier -> Prop, P x -> P y) :
      EqualityStructure.{u}

Predicate logic (unfolded):

  noncomputable def EqualityStructure.OfReflexiveLeibnizRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
      (reflexive : forall x, R x x)
      (leibniz : forall x y, R x y -> forall P : Carrier -> Prop, P x -> P y) :
      EqualityStructure.{u}

Logical form (Lean):

```lean
noncomputable def EqualityStructure.OfReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
    (reflexive : forall x, R x x)
    (leibniz : forall x y, R x y -> forall P : Carrier -> Prop, P x -> P y) :
    EqualityStructure.{u}
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
noncomputable def EqualityStructure.OfReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
    (reflexive : forall x, R x x)
    (leibniz : forall x y, R x y -> forall P : Carrier -> Prop, P x -> P y) :
    EqualityStructure.{u} := by
  sorry

/--
`EqualityStructure.OfIsIdentityRelation` TODO

Predicate logic:

  noncomputable def EqualityStructure.OfIsIdentityRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
      (h : IsIdentityRelation R) : EqualityStructure.{u}

Predicate logic (unfolded):

  noncomputable def EqualityStructure.OfIsIdentityRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
      (h : IsIdentityRelation R) : EqualityStructure.{u}

Logical form (Lean):

```lean
noncomputable def EqualityStructure.OfIsIdentityRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
    (h : IsIdentityRelation R) : EqualityStructure.{u}
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
noncomputable def EqualityStructure.OfIsIdentityRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier -> Carrier -> Prop}
    (h : IsIdentityRelation R) : EqualityStructure.{u} := by
  sorry

end LRA.Identity
