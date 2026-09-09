import Mathlib.Data.Set.Defs
import LRA.ModelTheory.Model
import LRA.ModelTheory.SecondOrderMonadic.HenkinModel

open LRA.Logic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
`FullModel` is the monadic second-order model using full semantics: second-order quantifiers range over all subsets of the first-order domain.

Predicate logic:

  structure FullModel (S : Signature) extends ModelTheory.FirstOrder.Model S

Predicate logic (unfolded):

  structure FullModel (S : Signature) extends ModelTheory.FirstOrder.Model S (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FullModel (S : Signature) extends ModelTheory.FirstOrder.Model S
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
structure FullModel (S : Signature) extends ModelTheory.FirstOrder.Model S

/--
`FullModel.toModel` Compatibility projection for first-order interpretation data.

Predicate logic:

  abbrev FullModel.toModel {S : Signature} (M : FullModel S) :=
    M.toInterpretation

Predicate logic (unfolded):

  abbrev FullModel.toModel {S : Signature} (M : FullModel S) :=
    M.toInterpretation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FullModel.toModel {S : Signature} (M : FullModel S) :=
  M.toInterpretation
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
abbrev FullModel.toModel {S : Signature} (M : FullModel S) :=
  M.toInterpretation

/--
`FullModel.toHenkinModel` Forgetful map from a full monadic second-order model to its associated Henkin model with universal admissible second-order domain.

Predicate logic:

  def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
    Domain := M.Domain
    domainNonempty := M.domainNonempty
    interpretEquality := M.interpretEquality
    equalityIsDiagonal := M.equalityIsDiagonal
    interpretFunction := M.interpretFunction
    interpretRelation := M.interpretRelation
    interpretConstant := M.interpretConstant
    SecondOrderDomain := Set.univ

Predicate logic (unfolded):

  def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
    Domain := M.Domain
    domainNonempty := M.domainNonempty
    interpretEquality := M.interpretEquality
    equalityIsDiagonal := M.equalityIsDiagonal
    interpretFunction := M.interpretFunction
    interpretRelation := M.interpretRelation
    interpretConstant := M.interpretConstant
    SecondOrderDomain := Set.univ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
  Domain := M.Domain
  domainNonempty := M.domainNonempty
  interpretEquality := M.interpretEquality
  equalityIsDiagonal := M.equalityIsDiagonal
  interpretFunction := M.interpretFunction
  interpretRelation := M.interpretRelation
  interpretConstant := M.interpretConstant
  SecondOrderDomain := Set.univ
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
def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
  Domain := M.Domain
  domainNonempty := M.domainNonempty
  interpretEquality := M.interpretEquality
  equalityIsDiagonal := M.equalityIsDiagonal
  interpretFunction := M.interpretFunction
  interpretRelation := M.interpretRelation
  interpretConstant := M.interpretConstant
  SecondOrderDomain := Set.univ

/--
`FullModel.toHenkinModel_hasFullSecondOrderSemantics` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrderMonadic.FullModel S), LRA.ModelTheory.SecondOrderMonadic.HasFullSecondOrderSemantics M.toHenkinModel

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : Signature
    M : FullModel S
  Prove
    subset ∈ M.toHenkinModel.2

Logical form (Lean):

```lean
theorem FullModel.toHenkinModel_hasFullSecondOrderSemantics
    {S : Signature} (M : FullModel S) :
    HasFullSecondOrderSemantics M.toHenkinModel
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
theorem FullModel.toHenkinModel_hasFullSecondOrderSemantics
    {S : Signature} (M : FullModel S) :
    HasFullSecondOrderSemantics M.toHenkinModel := by
  intro subset
  trivial

end LRA.ModelTheory.SecondOrderMonadic
