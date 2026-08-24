import LRA.UniversalAlgebra.Homomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v w

/--
`productModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
    ⟨M.interpretConstant constantSymbol, N.interpretConstant constantSymbol⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

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

/--
`piModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
    (family index).interpretConstant constantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

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

/--
`productFirstProjection` TODO

Predicate logic:

  def productFirstProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) M where
  map := Prod.fst
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.1

Predicate logic (unfolded):

  def productFirstProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) M where
  map := Prod.fst
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def productFirstProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) M where
  map := Prod.fst
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.1
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
def productFirstProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) M where
  map := Prod.fst
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.1

/--
`productSecondProjection` TODO

Predicate logic:

  def productSecondProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) N where
  map := Prod.snd
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.2

Predicate logic (unfolded):

  def productSecondProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) N where
  map := Prod.snd
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def productSecondProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) N where
  map := Prod.snd
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.2
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
def productSecondProjection {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) :
    Homomorphism (productModel M N) N where
  map := Prod.snd
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds.2

end LRA.UniversalAlgebra
