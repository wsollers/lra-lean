import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

/--
`UnaryClosedUnder.apply` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} {domainCarrier : Domain → Prop} {codomainCarrier : Codomain → Prop} {operation : LRA.Operation.HeterogeneousUnaryOperation Domain Codomain}, LRA.Operation.Laws.Closure.UnaryClosedUnder domainCarrier codomainCarrier operation → ∀ {input : Domain}, domainCarrier input → codomainCarrier (operation input)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    domainCarrier : Domain → Prop
    codomainCarrier : Codomain → Prop
    operation : HeterogeneousUnaryOperation Domain Codomain
    law : UnaryClosedUnder domainCarrier codomainCarrier operation
    input : Domain
    input_mem : domainCarrier input
  Prove
    (∀ (input : Domain), domainCarrier input → codomainCarrier (operation input)) → ∀ {input : Domain}, domainCarrier input → codomainCarrier (operation input)

Logical form (Lean):

```lean
theorem UnaryClosedUnder.apply {Domain : Type u} {Codomain : Type v}
    {domainCarrier : Domain → Prop}
    {codomainCarrier : Codomain → Prop}
    {operation : HeterogeneousUnaryOperation Domain Codomain}
    (law : UnaryClosedUnder domainCarrier codomainCarrier operation)
    {input : Domain}
    (input_mem : domainCarrier input) :
    codomainCarrier (operation input)
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
theorem UnaryClosedUnder.apply {Domain : Type u} {Codomain : Type v}
    {domainCarrier : Domain → Prop}
    {codomainCarrier : Codomain → Prop}
    {operation : HeterogeneousUnaryOperation Domain Codomain}
    (law : UnaryClosedUnder domainCarrier codomainCarrier operation)
    {input : Domain}
    (input_mem : domainCarrier input) :
    codomainCarrier (operation input) := by
  sorry
/--
`BinaryClosedUnder.apply` TODO

Predicate logic:

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} {leftCarrier : Left → Prop} {rightCarrier : Right → Prop} {resultCarrier : Codomain → Prop} {operation : LRA.Operation.HeterogeneousBinaryOperation Left Right Codomain}, LRA.Operation.Laws.Closure.BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation → ∀ {left : Left} {right : Right}, (leftCarrier left ∧ rightCarrier right) → resultCarrier (operation left right)

Predicate logic (unfolded):

  Ambient
    (Left, Right, Codomain)
  Objects
    leftCarrier : Left → Prop
    rightCarrier : Right → Prop
    resultCarrier : Codomain → Prop
    operation : HeterogeneousBinaryOperation Left Right Codomain
    law : BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation
    left : Left
    right : Right
    left_mem : leftCarrier left
    right_mem : rightCarrier right
  Prove
    (∀ (left : Left) (right : Right), leftCarrier left → rightCarrier right → resultCarrier (operation left right)) → ∀ {left : Left} {right : Right}, (leftCarrier left ∧ rightCarrier right) → resultCarrier (operation left right)

Logical form (Lean):

```lean
theorem BinaryClosedUnder.apply {Left : Type u} {Right : Type v} {Codomain : Type w}
    {leftCarrier : Left → Prop}
    {rightCarrier : Right → Prop}
    {resultCarrier : Codomain → Prop}
    {operation : HeterogeneousBinaryOperation Left Right Codomain}
    (law : BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)
    {left : Left}
    {right : Right}
    (left_mem : leftCarrier left)
    (right_mem : rightCarrier right) :
    resultCarrier (operation left right)
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
theorem BinaryClosedUnder.apply {Left : Type u} {Right : Type v} {Codomain : Type w}
    {leftCarrier : Left → Prop}
    {rightCarrier : Right → Prop}
    {resultCarrier : Codomain → Prop}
    {operation : HeterogeneousBinaryOperation Left Right Codomain}
    (law : BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)
    {left : Left}
    {right : Right}
    (left_mem : leftCarrier left)
    (right_mem : rightCarrier right) :
    resultCarrier (operation left right) := by
  sorry
/--
`BinaryEndoClosedOn.apply` TODO

Predicate logic:

  ∀ {Ambient : Type u} {carrier : Ambient → Prop} {operation : LRA.Operation.BinaryEndoOperation Ambient}, LRA.Operation.Laws.Closure.BinaryEndoClosedOn carrier operation → ∀ {left right : Ambient}, (carrier left ∧ carrier right) → carrier (operation left right)

Predicate logic (unfolded):

  Ambient
    (Ambient)
  Objects
    carrier : Ambient → Prop
    operation : BinaryEndoOperation Ambient
    law : BinaryEndoClosedOn carrier operation
    left right : Ambient
    left_mem : carrier left
    right_mem : carrier right
  Prove
    (∀ (left right : Ambient), carrier left → carrier right → carrier (operation left right)) → ∀ {left right : Ambient}, (carrier left ∧ carrier right) → carrier (operation left right)

Logical form (Lean):

```lean
theorem BinaryEndoClosedOn.apply {Ambient : Type u}
    {carrier : Ambient → Prop}
    {operation : BinaryEndoOperation Ambient}
    (law : BinaryEndoClosedOn carrier operation)
    {left right : Ambient}
    (left_mem : carrier left)
    (right_mem : carrier right) :
    carrier (operation left right)
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
theorem BinaryEndoClosedOn.apply {Ambient : Type u}
    {carrier : Ambient → Prop}
    {operation : BinaryEndoOperation Ambient}
    (law : BinaryEndoClosedOn carrier operation)
    {left right : Ambient}
    (left_mem : carrier left)
    (right_mem : carrier right) :
    carrier (operation left right) := by
  sorry
/--
`BinaryEndoOperation.closed_on_full_carrier` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Closure.BinaryEndoClosedOn (fun x => True) operation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
  Prove
    (True ∧ True) → (fun x => True) (operation left right)

Logical form (Lean):

```lean
theorem BinaryEndoOperation.closed_on_full_carrier {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    BinaryEndoClosedOn (fun _ : Carrier => True) operation
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
theorem BinaryEndoOperation.closed_on_full_carrier {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    BinaryEndoClosedOn (fun _ : Carrier => True) operation := by
  sorry
end LRA.Operation.Laws.Closure
