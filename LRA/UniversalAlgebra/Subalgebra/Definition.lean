import LRA.UniversalAlgebra.Embedding.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

/--
`Subuniverse` TODO

Predicate logic:

  structure Subuniverse {S : Signature} (M : Model.{u} S) where
  carrier : M.Domain → Prop
  closedUnderFunctions :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, carrier (arguments i)) →
        carrier (M.interpretFunction functionSymbol arguments)
  containsConstants :
    ∀ constantSymbol : S.ConstantSymbol,
      carrier (M.interpretConstant constantSymbol)

Predicate logic (unfolded):

  structure Subuniverse {S : Signature} (M : Model.{u} S) where
  carrier : M.Domain → Prop
  closedUnderFunctions :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, carrier (arguments i)) →
        carrier (M.interpretFunction functionSymbol arguments)
  containsConstants :
    ∀ constantSymbol : S.ConstantSymbol,
      carrier (M.interpretConstant constantSymbol) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Subuniverse {S : Signature} (M : Model.{u} S) where
  carrier : M.Domain → Prop
  closedUnderFunctions :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, carrier (arguments i)) →
        carrier (M.interpretFunction functionSymbol arguments)
  containsConstants :
    ∀ constantSymbol : S.ConstantSymbol,
      carrier (M.interpretConstant constantSymbol)
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
structure Subuniverse {S : Signature} (M : Model.{u} S) where
  carrier : M.Domain → Prop
  closedUnderFunctions :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, carrier (arguments i)) →
        carrier (M.interpretFunction functionSymbol arguments)
  containsConstants :
    ∀ constantSymbol : S.ConstantSymbol,
      carrier (M.interpretConstant constantSymbol)

/--
`Subuniverse.top` TODO

Predicate logic:

  def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial

Predicate logic (unfolded):

  def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial
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
def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial

/--
`Subuniverse.inducedModel` TODO

Predicate logic:

  def Subuniverse.inducedModel {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Model.{u} S where
  Domain := {element // U.carrier element}
  domainNonempty := nonempty
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).val),
     U.closedUnderFunctions functionSymbol _ (fun i => (arguments i).property)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).val)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, U.containsConstants constantSymbol⟩

Predicate logic (unfolded):

  def Subuniverse.inducedModel {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Model.{u} S where
  Domain := {element // U.carrier element}
  domainNonempty := nonempty
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).val),
     U.closedUnderFunctions functionSymbol _ (fun i => (arguments i).property)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).val)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, U.containsConstants constantSymbol⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Subuniverse.inducedModel {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Model.{u} S where
  Domain := {element // U.carrier element}
  domainNonempty := nonempty
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).val),
     U.closedUnderFunctions functionSymbol _ (fun i => (arguments i).property)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).val)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, U.containsConstants constantSymbol⟩
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
def Subuniverse.inducedModel {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Model.{u} S where
  Domain := {element // U.carrier element}
  domainNonempty := nonempty
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).val),
     U.closedUnderFunctions functionSymbol _ (fun i => (arguments i).property)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).val)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, U.containsConstants constantSymbol⟩

/--
`Subuniverse.inclusion` TODO

Predicate logic:

  def Subuniverse.inclusion {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Embedding (U.inducedModel nonempty) M where
  map := Subtype.val
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds
  injective := fun _ _ equality => Subtype.ext equality
  reflectsRelation := fun _ _ holds => holds

Predicate logic (unfolded):

  def Subuniverse.inclusion {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Embedding (U.inducedModel nonempty) M where
  map := Subtype.val
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds
  injective := fun _ _ equality => Subtype.ext equality
  reflectsRelation := fun _ _ holds => holds (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Subuniverse.inclusion {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Embedding (U.inducedModel nonempty) M where
  map := Subtype.val
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds
  injective := fun _ _ equality => Subtype.ext equality
  reflectsRelation := fun _ _ holds => holds
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
def Subuniverse.inclusion {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Embedding (U.inducedModel nonempty) M where
  map := Subtype.val
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds
  injective := fun _ _ equality => Subtype.ext equality
  reflectsRelation := fun _ _ holds => holds

end LRA.UniversalAlgebra
