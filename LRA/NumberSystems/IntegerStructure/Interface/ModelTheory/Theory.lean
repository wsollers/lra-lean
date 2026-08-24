
import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.LStructure
import LRA.NumberSystems.IntegerStructure.Definition
import LRA.Logic.Model.SecondOrderMonadic.HenkinModel

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

open LRA.NumberSystems.IntegerStructure.Interface.Signature

/--
`IntegerInverseAxiom` TODO

Predicate logic:

  ∀ (M : LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerStructureLStructure), (∀ (element : M.Domain), M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element = element ∧ ∀ (element : M.Domain), M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element = element)

Predicate logic (unfolded):

  ∀ (M : LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerStructureLStructure), (∀ (element : M.1), M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element = element ∧ ∀ (element : M.1), M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element = element)

Logical form (Lean):

```lean
def IntegerInverseAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (∀ element : M.Domain,
    M.interpretFunction .predecessor (fun _ => M.interpretFunction .successor (fun _ => element)) =
      element) /\
  (∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => M.interpretFunction .predecessor (fun _ => element)) =
      element)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IntegerInverseAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (∀ element : M.Domain,
    M.interpretFunction .predecessor (fun _ => M.interpretFunction .successor (fun _ => element)) =
      element) /\
  (∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => M.interpretFunction .predecessor (fun _ => element)) =
      element)

/--
`IntegerBaseNeighboursAxiom` TODO

Predicate logic:

  ∀ (M : LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerStructureLStructure), (M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.one ∧ M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.negativeOne)

Predicate logic (unfolded):

  ∀ (M : LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerStructureLStructure), (M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.one ∧ M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.negativeOne)

Logical form (Lean):

```lean
def IntegerBaseNeighboursAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (M.interpretFunction .successor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .one) /\
  (M.interpretFunction .predecessor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .negativeOne)
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
def IntegerBaseNeighboursAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (M.interpretFunction .successor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .one) /\
  (M.interpretFunction .predecessor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .negativeOne)

/--
`IntegerAperiodicAxiom` TODO

Predicate logic:

  ∀ (M : LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerStructureLStructure) (iterations : Nat), instLTNat.lt 0 iterations → Ne (LRA.NumberSystems.IntegerStructure.iterate (fun element => M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) iterations (M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero)) (M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero)

Predicate logic (unfolded):

  ∀ (M : LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerStructureLStructure) (iterations : Nat), (instLTNat.1 (instOfNatNat 0).1 iterations ∧ LRA.NumberSystems.IntegerStructure.iterate (fun element => M.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) iterations (M.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) = M.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) → False

Logical form (Lean):

```lean
def IntegerAperiodicAxiom
    (M : IntegerStructureLStructure) : Prop :=
  ∀ iterations : Nat, 0 < iterations ->
    LRA.NumberSystems.IntegerStructure.iterate
      (fun element => M.interpretFunction .successor (fun _ => element))
      iterations (M.interpretConstant .zero) ≠
      M.interpretConstant .zero
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
def IntegerAperiodicAxiom
    (M : IntegerStructureLStructure) : Prop :=
  ∀ iterations : Nat, 0 < iterations ->
    LRA.NumberSystems.IntegerStructure.iterate
      (fun element => M.interpretFunction .successor (fun _ => element))
      iterations (M.interpretConstant .zero) ≠
      M.interpretConstant .zero

/--
`IntegerInductionAxiom` TODO

Predicate logic:

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature) (subset : Set M.Domain), (Set.instMembership.mem M.SecondOrderDomain subset ∧ (Set.instMembership.mem subset (M.interpretConstant LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) ∧ (∀ (element : M.Domain), Set.instMembership.mem subset element → Set.instMembership.mem subset (M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) ∧ ∀ (element : M.Domain), Set.instMembership.mem subset element → Set.instMembership.mem subset (M.interpretFunction LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element)))) → ∀ (element : M.Domain), Set.instMembership.mem subset element

Predicate logic (unfolded):

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature) (subset : M.toModel.1 → Prop), (Set.instMembership.1 M.2 subset ∧ (Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) ∧ (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) ∧ ∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element)))) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element

Logical form (Lean):

```lean
def IntegerInductionAxiom
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .zero ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    (∀ element ∈ subset,
      M.interpretFunction .predecessor (fun _ => element) ∈ subset) ->
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
def IntegerInductionAxiom
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .zero ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    (∀ element ∈ subset,
      M.interpretFunction .predecessor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset

/--
`IntegerStructureHenkinTheory` TODO

Predicate logic:

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature), (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerInverseAxiom M.toModel ∧ (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerBaseNeighboursAxiom M.toModel ∧ (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerAperiodicAxiom M.toModel ∧ LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerInductionAxiom M)))

Predicate logic (unfolded):

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature), ((∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element = element ∧ ∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element = element) ∧ ((M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.one ∧ M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.negativeOne) ∧ (∀ (iterations : Nat), instLTNat.1 (instOfNatNat 0).1 iterations → LRA.NumberSystems.IntegerStructure.iterate (fun element => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) iterations (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero → False ∧ ∀ (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset → Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element)) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element)) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element)))

Logical form (Lean):

```lean
def IntegerStructureHenkinTheory
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  IntegerInverseAxiom M.toModel /\
  IntegerBaseNeighboursAxiom M.toModel /\
  IntegerAperiodicAxiom M.toModel /\
  IntegerInductionAxiom M
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
def IntegerStructureHenkinTheory
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  IntegerInverseAxiom M.toModel /\
  IntegerBaseNeighboursAxiom M.toModel /\
  IntegerAperiodicAxiom M.toModel /\
  IntegerInductionAxiom M

/--
`IntegerStructureTheory` TODO

Predicate logic:

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature), (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerInverseAxiom M.toModel ∧ (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerBaseNeighboursAxiom M.toModel ∧ (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerAperiodicAxiom M.toModel ∧ LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerInductionAxiom M)))

Predicate logic (unfolded):

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature), ((∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element = element ∧ ∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element = element) ∧ ((M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.one ∧ M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.negativeOne) ∧ (∀ (iterations : Nat), instLTNat.1 (instOfNatNat 0).1 iterations → LRA.NumberSystems.IntegerStructure.iterate (fun element => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) iterations (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero → False ∧ ∀ (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset → Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element)) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element)) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element)))

Logical form (Lean):

```lean
abbrev IntegerStructureTheory := IntegerStructureHenkinTheory
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
abbrev IntegerStructureTheory := IntegerStructureHenkinTheory

/--
`IntegerStructureAxioms` TODO

Predicate logic:

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature), (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerInverseAxiom M.toModel ∧ (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerBaseNeighboursAxiom M.toModel ∧ (LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerAperiodicAxiom M.toModel ∧ LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.IntegerInductionAxiom M)))

Predicate logic (unfolded):

  ∀ (M : LRA.Logic.SecondOrderMonadic.HenkinModel LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFirstOrderSignature), ((∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element = element ∧ ∀ (element : M.toModel.1), M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element = element) ∧ ((M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.one ∧ M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.negativeOne) ∧ (∀ (iterations : Nat), instLTNat.1 (instOfNatNat 0).1 iterations → LRA.NumberSystems.IntegerStructure.iterate (fun element => M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element) iterations (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) = M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero → False ∧ ∀ (subset : M.toModel.1 → Prop), Set.instMembership.1 M.2 subset → Set.instMembership.1 subset (M.toModel.7 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerConstantSymbol.zero) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.successor fun x => element)) → (∀ (element : M.toModel.1), Set.instMembership.1 subset element → Set.instMembership.1 subset (M.toModel.5 LRA.NumberSystems.IntegerStructure.Interface.Signature.IntegerFunctionSymbol.predecessor fun x => element)) → ∀ (element : M.toModel.1), Set.instMembership.1 subset element)))

Logical form (Lean):

```lean
abbrev IntegerStructureAxioms := IntegerStructureHenkinTheory
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
abbrev IntegerStructureAxioms := IntegerStructureHenkinTheory

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
