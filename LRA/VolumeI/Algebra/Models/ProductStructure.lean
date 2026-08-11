import LRA.VolumeI.Algebra.Models.Homomorphism

namespace LRA.VolumeI.Algebra.Models

open LRA.VolumeI.Logic
open LRA.VolumeI.Logic.FirstOrder

universe u v w

/-!
Volume I label: universal-algebra-product
Lean module: LRA.VolumeI.Algebra.Models.ProductStructure
Verification status: checked definitions (no sorry)

Products of algebras, binary and indexed, with everything computed
coordinatewise; relations hold when they hold in every coordinate.
This is the P of Birkhoff's HSP, and — pleasantly — the one closure
operation that is *pure definition*: no proof obligations arise at
all, because the product operations are built from the factors'
operations with no side conditions.
-/

/-- The binary product of two algebras: coordinatewise operations,
relations holding in both coordinates.

Logical form:

```lean
def productModel {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) : Model.{max u v} S where
  Domain := M.Domain × N.Domain
  domainNonempty := ⟨⟨Classical.arbitrary M.Domain, Classical.arbitrary N.Domain⟩⟩
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).1),
     N.interpretFunction functionSymbol (fun i => (arguments i).2)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).1) ∧
      N.interpretRelation relationSymbol (fun i => (arguments i).2)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, N.interpretConstant constantSymbol⟩
```
-/
def productModel {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) : Model.{max u v} S where
  Domain := M.Domain × N.Domain
  domainNonempty := ⟨⟨Classical.arbitrary M.Domain, Classical.arbitrary N.Domain⟩⟩
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).1),
     N.interpretFunction functionSymbol (fun i => (arguments i).2)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).1) ∧
      N.interpretRelation relationSymbol (fun i => (arguments i).2)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, N.interpretConstant constantSymbol⟩

/-- The indexed product of a family of algebras.

Logical form:

```lean
def piModel {S : Signature} {Index : Type w}
    (family : Index → Model.{u} S) : Model.{max u w} S where
  Domain := (index : Index) → (family index).Domain
  domainNonempty := ⟨fun index => Classical.arbitrary (family index).Domain⟩
  interpretFunction := fun functionSymbol arguments index =>
    (family index).interpretFunction functionSymbol
      (fun i => arguments i index)
  interpretRelation := fun relationSymbol arguments =>
    ∀ index, (family index).interpretRelation relationSymbol
      (fun i => arguments i index)
  interpretConstant := fun constantSymbol index =>
    (family index).interpretConstant constantSymbol
```
-/
def piModel {S : Signature} {Index : Type w}
    (family : Index → Model.{u} S) : Model.{max u w} S where
  Domain := (index : Index) → (family index).Domain
  domainNonempty := ⟨fun index => Classical.arbitrary (family index).Domain⟩
  interpretFunction := fun functionSymbol arguments index =>
    (family index).interpretFunction functionSymbol
      (fun i => arguments i index)
  interpretRelation := fun relationSymbol arguments =>
    ∀ index, (family index).interpretRelation relationSymbol
      (fun i => arguments i index)
  interpretConstant := fun constantSymbol index =>
    (family index).interpretConstant constantSymbol

/-- The first projection out of a binary product is a homomorphism.

Logical form:

```lean
def productFirstProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) M where
  map := Prod.fst
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.1
```
-/
def productFirstProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) M where
  map := Prod.fst
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.1

/-- The second projection out of a binary product is a homomorphism.

Logical form:

```lean
def productSecondProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) N where
  map := Prod.snd
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.2
```
-/
def productSecondProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) N where
  map := Prod.snd
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.2

end LRA.VolumeI.Algebra.Models
