import LRA.UniversalAlgebra.Satisfaction.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/--
`Homomorphism` TODO

Predicate logic:

  structure Homomorphism {S : Signature}
    (M : LRA.ModelTheory.FirstOrder.Model.{u} S) (N : LRA.ModelTheory.FirstOrder.Model.{v} S) where
  map : M.Domain → N.Domain
  preservesFunction :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      map (M.interpretFunction functionSymbol arguments) =
        N.interpretFunction functionSymbol (fun i => map (arguments i))
  preservesConstant :
    ∀ constantSymbol : S.ConstantSymbol,
      map (M.interpretConstant constantSymbol) =
        N.interpretConstant constantSymbol
  preservesRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      M.interpretRelation relationSymbol arguments →
        N.interpretRelation relationSymbol (fun i => map (arguments i))

Predicate logic (unfolded):

  structure Homomorphism {S : Signature}
    (M : LRA.ModelTheory.FirstOrder.Model.{u} S) (N : LRA.ModelTheory.FirstOrder.Model.{v} S) where
  map : M.Domain → N.Domain
  preservesFunction :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      map (M.interpretFunction functionSymbol arguments) =
        N.interpretFunction functionSymbol (fun i => map (arguments i))
  preservesConstant :
    ∀ constantSymbol : S.ConstantSymbol,
      map (M.interpretConstant constantSymbol) =
        N.interpretConstant constantSymbol
  preservesRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      M.interpretRelation relationSymbol arguments →
        N.interpretRelation relationSymbol (fun i => map (arguments i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Homomorphism {S : Signature}
    (M : LRA.ModelTheory.FirstOrder.Model.{u} S) (N : LRA.ModelTheory.FirstOrder.Model.{v} S) where
  map : M.Domain → N.Domain
  preservesFunction :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      map (M.interpretFunction functionSymbol arguments) =
        N.interpretFunction functionSymbol (fun i => map (arguments i))
  preservesConstant :
    ∀ constantSymbol : S.ConstantSymbol,
      map (M.interpretConstant constantSymbol) =
        N.interpretConstant constantSymbol
  preservesRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      M.interpretRelation relationSymbol arguments →
        N.interpretRelation relationSymbol (fun i => map (arguments i))
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
structure Homomorphism {S : Signature}
    (M : LRA.ModelTheory.FirstOrder.Model.{u} S) (N : LRA.ModelTheory.FirstOrder.Model.{v} S) where
  map : M.Domain → N.Domain
  preservesFunction :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      map (M.interpretFunction functionSymbol arguments) =
        N.interpretFunction functionSymbol (fun i => map (arguments i))
  preservesConstant :
    ∀ constantSymbol : S.ConstantSymbol,
      map (M.interpretConstant constantSymbol) =
        N.interpretConstant constantSymbol
  preservesRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      M.interpretRelation relationSymbol arguments →
        N.interpretRelation relationSymbol (fun i => map (arguments i))

/--
`Homomorphism.id` TODO

Predicate logic:

  def Homomorphism.id {S : Signature} (M : LRA.ModelTheory.FirstOrder.Model.{u} S) :
    Homomorphism M M where
  map := fun element => element
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds

Predicate logic (unfolded):

  def Homomorphism.id {S : Signature} (M : LRA.ModelTheory.FirstOrder.Model.{u} S) :
    Homomorphism M M where
  map := fun element => element
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Homomorphism.id {S : Signature} (M : LRA.ModelTheory.FirstOrder.Model.{u} S) :
    Homomorphism M M where
  map := fun element => element
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds
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
def Homomorphism.id {S : Signature} (M : LRA.ModelTheory.FirstOrder.Model.{u} S) :
    Homomorphism M M where
  map := fun element => element
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds

/--
`Homomorphism.comp` TODO

Predicate logic:

  def Homomorphism.comp {S : Signature}
    {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S} {P : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (second : Homomorphism N P) (first : Homomorphism M N) :
    Homomorphism M P where
  map := fun element => second.map (first.map element)
  preservesFunction := fun functionSymbol arguments => by
    rw [first.preservesFunction, second.preservesFunction]
  preservesConstant := fun constantSymbol => by
    rw [first.preservesConstant, second.preservesConstant]
  preservesRelation := fun relationSymbol arguments holds =>
    second.preservesRelation relationSymbol _
      (first.preservesRelation relationSymbol arguments holds)

Predicate logic (unfolded):

  def Homomorphism.comp {S : Signature}
    {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S} {P : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (second : Homomorphism N P) (first : Homomorphism M N) :
    Homomorphism M P where
  map := fun element => second.map (first.map element)
  preservesFunction := fun functionSymbol arguments => by
    rw [first.preservesFunction, second.preservesFunction]
  preservesConstant := fun constantSymbol => by
    rw [first.preservesConstant, second.preservesConstant]
  preservesRelation := fun relationSymbol arguments holds =>
    second.preservesRelation relationSymbol _
      (first.preservesRelation relationSymbol arguments holds) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Homomorphism.comp {S : Signature}
    {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S} {P : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (second : Homomorphism N P) (first : Homomorphism M N) :
    Homomorphism M P where
  map := fun element => second.map (first.map element)
  preservesFunction := fun functionSymbol arguments => by
    rw [first.preservesFunction, second.preservesFunction]
  preservesConstant := fun constantSymbol => by
    rw [first.preservesConstant, second.preservesConstant]
  preservesRelation := fun relationSymbol arguments holds =>
    second.preservesRelation relationSymbol _
      (first.preservesRelation relationSymbol arguments holds)
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
def Homomorphism.comp {S : Signature}
    {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S} {P : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (second : Homomorphism N P) (first : Homomorphism M N) :
    Homomorphism M P where
  map := fun element => second.map (first.map element)
  preservesFunction := fun functionSymbol arguments => by
    rw [first.preservesFunction, second.preservesFunction]
  preservesConstant := fun constantSymbol => by
    rw [first.preservesConstant, second.preservesConstant]
  preservesRelation := fun relationSymbol arguments holds =>
    second.preservesRelation relationSymbol _
      (first.preservesRelation relationSymbol arguments holds)

/--
`Homomorphism.commutesWithTermEvaluation` TODO

Predicate logic:

  (Variable → M.Domain) → homomorphism.map (evaluateTerm M assignment term) = evaluateTerm N (fun v => homomorphism.map (assignment v)) term

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {M : LRA.ModelTheory.FirstOrder.Model S} {N : LRA.ModelTheory.FirstOrder.Model S} (homomorphism : LRA.UniversalAlgebra.Homomorphism M N) (assignment : Variable → M.1) (term : LRA.Logic.FirstOrder.Term S Variable), homomorphism.1 (LRA.Logic.FirstOrder.evaluateTerm M assignment term) = LRA.Logic.FirstOrder.evaluateTerm N (fun v => homomorphism.1 (assignment v)) term

Logical form (Lean):

```lean
theorem Homomorphism.commutesWithTermEvaluation {S : Signature}
    {Variable : Type} {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (homomorphism : Homomorphism M N)
    (assignment : Variable → M.Domain) (term : Term S Variable) :
    homomorphism.map (evaluateTerm M assignment term) =
      evaluateTerm N (fun v => homomorphism.map (assignment v)) term
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
theorem Homomorphism.commutesWithTermEvaluation {S : Signature}
    {Variable : Type} {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (homomorphism : Homomorphism M N)
    (assignment : Variable → M.Domain) (term : Term S Variable) :
    homomorphism.map (evaluateTerm M assignment term) =
      evaluateTerm N (fun v => homomorphism.map (assignment v)) term := by
  sorry
/--
`termExtension` TODO

Predicate logic:

  noncomputable def termExtension {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : LRA.ModelTheory.FirstOrder.Model.{0} S) (hAlgebraic : S.IsAlgebraic)
    (assignment : Variable → M.Domain) :
    Homomorphism (termAlgebra S Variable) M where
  map := evaluateTerm M assignment
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun relationSymbol => False.elim (hAlgebraic relationSymbol)

Predicate logic (unfolded):

  noncomputable def termExtension {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : LRA.ModelTheory.FirstOrder.Model.{0} S) (hAlgebraic : S.IsAlgebraic)
    (assignment : Variable → M.Domain) :
    Homomorphism (termAlgebra S Variable) M where
  map := evaluateTerm M assignment
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun relationSymbol => False.elim (hAlgebraic relationSymbol) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def termExtension {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : LRA.ModelTheory.FirstOrder.Model.{0} S) (hAlgebraic : S.IsAlgebraic)
    (assignment : Variable → M.Domain) :
    Homomorphism (termAlgebra S Variable) M where
  map := evaluateTerm M assignment
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun relationSymbol => False.elim (hAlgebraic relationSymbol)
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
noncomputable def termExtension {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : LRA.ModelTheory.FirstOrder.Model.{0} S) (hAlgebraic : S.IsAlgebraic)
    (assignment : Variable → M.Domain) :
    Homomorphism (termAlgebra S Variable) M where
  map := evaluateTerm M assignment
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun relationSymbol => False.elim (hAlgebraic relationSymbol)

/--
`termExtensionUnique` TODO

Predicate logic:

  (Variable → M.Domain ∧ ∀ v : Variable, homomorphism.map (.var v) = assignment v) → ∀ term : Term S Variable, homomorphism.map term = evaluateTerm M assignment term

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : Nonempty Variable] (M : LRA.ModelTheory.FirstOrder.Model S) (assignment : Variable → M.1) (homomorphism : LRA.UniversalAlgebra.Homomorphism { Domain := LRA.Logic.FirstOrder.Term S Variable, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol arguments => LRA.Logic.FirstOrder.Term.apply functionSymbol arguments, interpretRelation := fun x x_1 => False, interpretConstant := fun constantSymbol => LRA.Logic.FirstOrder.Term.const constantSymbol } M), (∀ (v : Variable), homomorphism.1 (LRA.Logic.FirstOrder.Term.var v) = assignment v) → ∀ (term : LRA.Logic.FirstOrder.Term S Variable), homomorphism.1 term = LRA.Logic.FirstOrder.evaluateTerm M assignment term

Logical form (Lean):

```lean
theorem termExtensionUnique {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : LRA.ModelTheory.FirstOrder.Model.{0} S)
    (assignment : Variable → M.Domain)
    (homomorphism : Homomorphism (termAlgebra S Variable) M)
    (agreesOnVariables :
      ∀ v : Variable, homomorphism.map (.var v) = assignment v) :
    ∀ term : Term S Variable,
      homomorphism.map term = evaluateTerm M assignment term
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
theorem termExtensionUnique {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : LRA.ModelTheory.FirstOrder.Model.{0} S)
    (assignment : Variable → M.Domain)
    (homomorphism : Homomorphism (termAlgebra S Variable) M)
    (agreesOnVariables :
      ∀ v : Variable, homomorphism.map (.var v) = assignment v) :
    ∀ term : Term S Variable,
      homomorphism.map term = evaluateTerm M assignment term := by
  sorry
/--
`equationTransportsAlongSurjection` TODO

Predicate logic:

  (∀ target : N.Domain, ∃ source, homomorphism.map source = target) → SatisfiesEquation N equation

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {M : LRA.ModelTheory.FirstOrder.Model S} {N : LRA.ModelTheory.FirstOrder.Model S} (homomorphism : LRA.UniversalAlgebra.Homomorphism M N), (∀ (target : N.1), Exists fun source => homomorphism.1 source = target) → ∀ (equation : LRA.UniversalAlgebra.Equation S Variable), (∀ (assignment : Variable → M.1), LRA.Logic.FirstOrder.evaluateTerm M assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm M assignment equation.2) → ∀ (assignment : Variable → N.1), LRA.Logic.FirstOrder.evaluateTerm N assignment equation.1 = LRA.Logic.FirstOrder.evaluateTerm N assignment equation.2

Logical form (Lean):

```lean
theorem equationTransportsAlongSurjection {S : Signature}
    {Variable : Type} {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective : ∀ target : N.Domain, ∃ source, homomorphism.map source = target)
    (equation : Equation S Variable)
    (sourceSatisfies : SatisfiesEquation M equation) :
    SatisfiesEquation N equation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem equationTransportsAlongSurjection {S : Signature}
    {Variable : Type} {M : LRA.ModelTheory.FirstOrder.Model.{u} S} {N : LRA.ModelTheory.FirstOrder.Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective : ∀ target : N.Domain, ∃ source, homomorphism.map source = target)
    (equation : Equation S Variable)
    (sourceSatisfies : SatisfiesEquation M equation) :
    SatisfiesEquation N equation := by
  sorry
end LRA.UniversalAlgebra
