import Mathlib.Data.Set.Defs
import LRA.ModelTheory.SecondOrder.HenkinModel

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

/--
`FullModel` is a general second-order model with unrestricted full semantics. The second-order domains are recovered canonically as universal classes.

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
`FullModel.toHenkinModel` TODO

Predicate logic:

  def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
    Domain := M.Domain
    domainNonempty := M.domainNonempty
    interpretEquality := M.interpretEquality
    equalityIsDiagonal := M.equalityIsDiagonal
    interpretFunction := M.interpretFunction
    interpretRelation := M.interpretRelation
    interpretConstant := M.interpretConstant
    RelationDomain := fun _ => Set.univ
    FunctionDomain := fun _ => Set.univ

Predicate logic (unfolded):

  def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
    Domain := M.Domain
    domainNonempty := M.domainNonempty
    interpretEquality := M.interpretEquality
    equalityIsDiagonal := M.equalityIsDiagonal
    interpretFunction := M.interpretFunction
    interpretRelation := M.interpretRelation
    interpretConstant := M.interpretConstant
    RelationDomain := fun _ => Set.univ
    FunctionDomain := fun _ => Set.univ (source fallback; no compiled unfold data available)

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
  RelationDomain := fun _ => Set.univ
  FunctionDomain := fun _ => Set.univ
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
  RelationDomain := fun _ => Set.univ
  FunctionDomain := fun _ => Set.univ

/--
`FullModel.toHenkinModel_hasFullSecondOrderSemantics` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.FullModel S), LRA.ModelTheory.SecondOrder.HasFullSecondOrderSemantics M.toHenkinModel

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : Signature
    M : FullModel S
  Prove
    ((∀ (arity : Nat) (relation_ : (Fin arity → M.toHenkinModel.toInterpretation.1) → Prop), relation_ ∈ M.toHenkinModel.2 arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → M.toHenkinModel.toInterpretation.1) → M.toHenkinModel.toInterpretation.1), function_ ∈ M.toHenkinModel.3 arity))

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
  constructor <;> intro arity item <;> trivial

end LRA.ModelTheory.SecondOrder
