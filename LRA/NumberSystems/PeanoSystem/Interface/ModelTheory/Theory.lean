
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure
import LRA.ModelTheory.SecondOrderMonadic.HenkinModel

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

open LRA.NumberSystems.PeanoSystem.Interface.Signature

/--
`PeanoBaseNotSuccessorAxiom` TODO

Predicate logic:

  ∀ (M : LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoLStructure) (element : M.Domain), Ne (M.interpretFunction LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element) (M.interpretConstant LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one)

Predicate logic (unfolded):

  ∀ (M : LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoLStructure) (element : M.1), M.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element = M.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one → False

Logical form (Lean):

```lean
def PeanoBaseNotSuccessorAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => element) ≠ M.interpretConstant .base
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
def PeanoBaseNotSuccessorAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => element) ≠ M.interpretConstant .one

/--
`PeanoSuccessorInjectiveAxiom` TODO

Predicate logic:

  ∀ (M : LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoLStructure) (first second : M.Domain), M.interpretFunction LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => first = M.interpretFunction LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => second → first = second

Predicate logic (unfolded):

  ∀ (M : LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoLStructure) (first second : M.1), M.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => first = M.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => second → first = second

Logical form (Lean):

```lean
def PeanoSuccessorInjectiveAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ first second : M.Domain,
    M.interpretFunction .successor (fun _ => first) =
      M.interpretFunction .successor (fun _ => second) ->
    first = second
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
def PeanoSuccessorInjectiveAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ first second : M.Domain,
    M.interpretFunction .successor (fun _ => first) =
      M.interpretFunction .successor (fun _ => second) ->
    first = second

/--
`PeanoInductionAxiom` TODO

Predicate logic:

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature) (subset : Set M.Domain), (Set.instMembership.mem M.SecondOrderDomain subset ∧ (Set.instMembership.mem subset (M.interpretConstant LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one) ∧ ∀ (element : M.Domain), Set.instMembership.mem subset element → Set.instMembership.mem subset (M.interpretFunction LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element))) → ∀ (element : M.Domain), Set.instMembership.mem subset element

Predicate logic (unfolded):

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature) (subset : M.toModel.1 → Prop), (Set.instMembership.1 M.2 subset ∧ (Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one) ∧ ∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element))) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element

Logical form (Lean):

```lean
def PeanoInductionAxiom
    (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .base ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset
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
def PeanoInductionAxiom
    (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .one ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset

/--
`PeanoHenkinTheory` TODO

Predicate logic:

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature), (LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoBaseNotSuccessorAxiom M.toModel ∧ (LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoSuccessorInjectiveAxiom M.toModel ∧ LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoInductionAxiom M))

Predicate logic (unfolded):

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature), (∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element = M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one → False ∧ (∀ (first second : M.toModel.1), M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => first = M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => second → first = second ∧ ∀ (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset → Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element)) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element))

Logical form (Lean):

```lean
def PeanoHenkinTheory
    (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  PeanoBaseNotSuccessorAxiom M.toModel /\
  PeanoSuccessorInjectiveAxiom M.toModel /\
  PeanoInductionAxiom M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def PeanoHenkinTheory
    (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  PeanoBaseNotSuccessorAxiom M.toModel /\
  PeanoSuccessorInjectiveAxiom M.toModel /\
  PeanoInductionAxiom M

/--
`PeanoTheory` TODO

Predicate logic:

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature), (LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoBaseNotSuccessorAxiom M.toModel ∧ (LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoSuccessorInjectiveAxiom M.toModel ∧ LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoInductionAxiom M))

Predicate logic (unfolded):

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature), (∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element = M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one → False ∧ (∀ (first second : M.toModel.1), M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => first = M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => second → first = second ∧ ∀ (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset → Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element)) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element))

Logical form (Lean):

```lean
abbrev PeanoTheory := PeanoHenkinTheory
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
abbrev PeanoTheory := PeanoHenkinTheory

/--
`PeanoAxioms` TODO

Predicate logic:

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature), (LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoBaseNotSuccessorAxiom M.toModel ∧ (LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoSuccessorInjectiveAxiom M.toModel ∧ LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.PeanoInductionAxiom M))

Predicate logic (unfolded):

  ∀ (M : LRA.ModelTheory.SecondOrderMonadic.HenkinModel LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFirstOrderSignature), (∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element = M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one → False ∧ (∀ (first second : M.toModel.1), M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => first = M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => second → first = second ∧ ∀ (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset → Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoConstantSymbol.one) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.PeanoSystem.Interface.Signature.PeanoFunctionSymbol.successor fun x => element)) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element))

Logical form (Lean):

```lean
abbrev PeanoAxioms := PeanoHenkinTheory
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
abbrev PeanoAxioms := PeanoHenkinTheory

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
