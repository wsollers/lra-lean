import LRA.VolumeI.Algebra.Models.Embedding

namespace LRA.VolumeI.Algebra.Models

open LRA.VolumeI.Logic
open LRA.VolumeI.Logic.FirstOrder

universe u

/-!
Volume I label: universal-algebra-substructure
Lean module: LRA.VolumeI.Algebra.Models.Substructure
Verification status: checked definitions (induced model is fully
constructed, no sorry)

A subuniverse: a predicate on an algebra's domain closed under every
operation and containing every constant — the same closure shape the
Set chapter's `Set/Algebra/Closure.lean` uses for collections of
sets, now at the level of arbitrary algebras. A nonempty subuniverse
*induces* an algebra on the subtype, with the operations restricted;
this is the S of Birkhoff's HSP.
-/

/-- A subuniverse of an algebra: closed under operations, containing
the constants.

Logical form:

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

/-- The whole domain is a subuniverse.

Logical form:

```lean
def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial
```
-/
def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial

/-- The algebra induced on a nonempty subuniverse: the subtype domain
with the restricted operations — closure supplies exactly the data
needed for the restriction to be total.

Logical form:

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

/-- The inclusion of an induced subalgebra is an embedding.

Logical form:

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

end LRA.VolumeI.Algebra.Models
