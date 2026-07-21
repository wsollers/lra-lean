# Logic Interface Redesign Review

This note records a proposed correction to the Volume I logic architecture
before continuing the first-order logic pass. It is intended for review and
feedback, not as an accepted implementation plan.

## Context

The foundation restart currently has a small object-logic layer in
`LRA/VolumeI/Logic/Core.lean`.

The current file separates two ideas:

- `Logic`, an abstract interface with formula, theory, structure,
  satisfaction, and modeling fields;
- `LogicalLanguage`, `LogicalFormula`, `LogicalStructure`, and
  `LogicalTheory`, a concrete helper layer for simple connective-based object
  logics.

The propositional logic pass uses both layers:

- propositional syntax is implemented as a `LogicalLanguage`;
- propositional formulas are `LogicalFormula language`;
- propositional structures evaluate atoms and connectives to `Bool`;
- `propositionalLogic : Logic` exposes that implementation through the generic
  `Logic` interface.

That was enough for the propositional first pass, but it exposed a design
problem when planning first-order logic.

## Current Architecture

The current generic interface is:

```lean
structure Logic where
  Formula : Type
  Theory : Type
  Structure : Type
  satisfies : Structure -> Formula -> Prop
  models : Structure -> Theory -> Prop
```

Optional mixins attach behavior to a concrete `Logic`:

```lean
class Logic.HasTruthValue (Λ : Logic) where
  TruthValue : Type
  evaluate : Λ.Structure -> Λ.Formula -> TruthValue

class Logic.HasNegation (Λ : Logic) where
  neg : Λ.Formula -> Λ.Formula

class Logic.HasQuantifiers (Λ : Logic) where
  Variable : Type
  forallQ : Variable -> Λ.Formula -> Λ.Formula
  existsQ : Variable -> Λ.Formula -> Λ.Formula
```

The current concrete formula helper is:

```lean
structure LogicalLanguage where
  Atoms : Type
  UnaryConnectives : Type := Empty
  BinaryConnectives : Type := Empty

inductive LogicalFormula (L : LogicalLanguage) where
  | atom : L.Atoms -> LogicalFormula L
  | unary : L.UnaryConnectives -> LogicalFormula L -> LogicalFormula L
  | binary :
      L.BinaryConnectives ->
      LogicalFormula L ->
      LogicalFormula L ->
      LogicalFormula L
```

The current notation namespace is also tied to this helper layer:

```lean
namespace Logic.Notation

class HasLogicalNot (L : LogicalLanguage) where
  notConnective : L.UnaryConnectives

def logicalNot {L : LogicalLanguage} [HasLogicalNot L]
    (formula : LogicalFormula L) : LogicalFormula L :=
  LogicalFormula.unary (HasLogicalNot.notConnective (L := L)) formula

prefix:max "¬ₗ" => logicalNot
```

So existing notation constructs `LogicalFormula L`, not an arbitrary
`Λ.Formula` for an arbitrary `Logic`.

## Problem

The current `LogicalFormula` helper is too narrow to be the shared formula
spine for first-order logic, modal logic, proof-theoretic presentations, or
other object logics.

First-order logic needs at least:

- variables;
- constants;
- function symbols with arities;
- relation symbols with arities;
- terms;
- atomic relation applications;
- equality between terms;
- connectives;
- quantifier binders;
- structures with domains and symbol interpretations;
- assignments from variables into domains;
- term evaluation and formula satisfaction.

If first-order logic is implemented with a completely separate formula type,
then the generic `Logic` interface remains a thin outer wrapper, while
`LogicalFormula`, `Logic.Notation`, and generic formula-formation facts remain
mostly propositional. That is not the intended design.

If first-order logic is forced into the current `LogicalFormula` unchanged,
then relation applications, equality, and quantifiers have to be hidden inside
atoms or encoded as fake unary connectives. That loses the structure we want
Lean to track.

The desired correction is to make the shared language and formula layer
genuinely generic enough for multiple logics, then attach semantics and proof
behavior through `Logic` and its mixins.

## Design Goal

`Logic` should be an interface to an underlying implementation of logic.

`Formula` should be a generic expression tree, or formula syntax object, for a
language. It should be able to represent propositional, first-order,
second-order, modal, proof-theoretic, or other object logics by varying the
language data and attached capabilities.

The same formula object may later be viewed in different ways:

- as a formula with semantic satisfaction;
- as a theorem or derivable formula;
- as a proof-theoretic object;
- as a syllogistic or rule-based object;
- as an expression tree for notation and parsing;
- as a target for structural induction and closure rules.

The notation namespace should be global under `LRA.VolumeI.Logic.Notation` and
should construct generic formulas through language capabilities, not
propositional-only formulas.

## Proposed Direction

Replace the current propositional-shaped `LogicalLanguage` and
`LogicalFormula` with an extensible, arity-aware language and formula spine.

One possible direction:

```lean
structure LogicalLanguage where
  PropositionSymbol : Type := Empty

  Variable : Type := Empty
  ConstantSymbol : Type := Empty

  FunctionSymbol : Type := Empty
  functionArity : FunctionSymbol -> Nat := Empty.elim

  RelationSymbol : Type := Empty
  relationArity : RelationSymbol -> Nat := Empty.elim

  Connective : Type := Empty
  connectiveArity : Connective -> Nat := Empty.elim

  Binder : Type := Empty
```

Then terms can be generic:

```lean
inductive LogicalTerm (L : LogicalLanguage) where
  | var : L.Variable -> LogicalTerm L
  | const : L.ConstantSymbol -> LogicalTerm L
  | app :
      (f : L.FunctionSymbol) ->
      (Fin (L.functionArity f) -> LogicalTerm L) ->
      LogicalTerm L
```

And formulas can be generic:

```lean
inductive LogicalFormula (L : LogicalLanguage) where
  | proposition :
      L.PropositionSymbol ->
      LogicalFormula L
  | relation :
      (R : L.RelationSymbol) ->
      (Fin (L.relationArity R) -> LogicalTerm L) ->
      LogicalFormula L
  | equal :
      LogicalTerm L ->
      LogicalTerm L ->
      LogicalFormula L
  | connective :
      (c : L.Connective) ->
      (Fin (L.connectiveArity c) -> LogicalFormula L) ->
      LogicalFormula L
  | binder :
      L.Binder ->
      L.Variable ->
      LogicalFormula L ->
      LogicalFormula L
```

This makes unary and binary connectives special cases of the arity-indexed
connective constructor. For example, negation has arity `1`; conjunction,
disjunction, implication, and biconditional have arity `2`.

## Function And Relation Symbols

There are two equivalent ways to represent symbols with arity.

The current Lean-friendly style is:

```lean
FunctionSymbol : Type
functionArity : FunctionSymbol -> Nat

RelationSymbol : Type
relationArity : RelationSymbol -> Nat
```

The more bundled style is:

```lean
structure LogicalFunction where
  arity : Nat

structure LogicalRelation where
  arity : Nat
```

The arity-map style is probably simpler in Lean examples and pattern matching:
the symbol type remains an ordinary inductive type, and the arity is a function
defined by cases. Conceptually, however, both styles mean that each logical
function or relation symbol carries an arity.

Recommended initial choice: keep symbol types plus arity maps inside
`LogicalLanguage`, unless later examples show that bundled symbols reduce
friction.

## Propositional Logic As An Instance

Propositional logic becomes a language with:

- proposition symbols populated;
- connectives populated;
- variables empty;
- constants empty;
- functions empty;
- relations empty;
- binders empty.

Its formulas use the same `LogicalFormula L` tree:

```lean
abbrev PropositionalLogic.Formula :=
  LogicalFormula propositionalLanguage
```

Its `Logic` implementation supplies:

- Boolean-valued semantic evaluation;
- satisfaction as evaluation to `true`;
- models as satisfaction of every formula in a theory;
- connective instances for notation and generic callbacks.

## First-Order Logic As An Instance

First-order logic becomes a language with:

- variables populated;
- constants optionally populated;
- function symbols populated;
- relation symbols populated;
- relation and function arities populated;
- equality available through `LogicalFormula.equal`;
- connectives populated;
- quantifier binders populated;
- proposition symbols usually empty.

Its terms are `LogicalTerm L`.
Its formulas are `LogicalFormula L`.

The first-order `Logic` implementation supplies:

- structures with a domain;
- function interpretation;
- relation interpretation;
- assignments from variables into the domain;
- term evaluation;
- formula satisfaction.

Because first-order satisfaction depends on an assignment, the `Structure` slot
of the generic `Logic` may need either:

- a pointed structure bundling a model with an assignment; or
- a richer `Logic` interface that allows satisfaction contexts.

This is an open design point.

## Notation

Notation should live under:

```lean
namespace LRA.VolumeI.Logic.Notation
```

It should not be tied to propositional-only `UnaryConnectives` and
`BinaryConnectives`.

Instead, notation should use language capability classes:

```lean
class HasLogicalNot (L : LogicalLanguage) where
  notSymbol : L.Connective
  arity_not : L.connectiveArity notSymbol = 1

class HasLogicalAnd (L : LogicalLanguage) where
  andSymbol : L.Connective
  arity_and : L.connectiveArity andSymbol = 2
```

Then notation constructs generic formulas:

```lean
¬ₗ p
p ∧ₗ q
p ∨ₗ q
p →ₗ q
p ↔ₗ q
∀ₗ x, p
∃ₗ x, p
```

The exact Lean notation for binders should be decided carefully after testing
parser behavior.

## Logic Interface Adjustments

The current `Logic` interface may need to become universe-polymorphic, because
first-order structures carry arbitrary domain types and therefore often live in
a higher universe than propositional Boolean structures.

Possible adjustment:

```lean
universe u v w

structure Logic where
  Formula : Type u
  Theory : Type v
  Structure : Type w
  satisfies : Structure -> Formula -> Prop
  models : Structure -> Theory -> Prop
```

Alternatively, if `Logic` owns the language, a more dependent shape may be
better:

```lean
structure Logic where
  Language : Type
  Formula : Language -> Type
  Theory : Language -> Type
  Structure : Language -> Type
  satisfies : {L : Language} -> Structure L -> Formula L -> Prop
  models : {L : Language} -> Structure L -> Theory L -> Prop
```

The first version is smaller and easier to retrofit.
The second version makes the relationship between a logic and its languages
more explicit.

## Open Questions

- Should `Logic` own `Language`, or should concrete logic values be created for
  a fixed language?
- Should first-order satisfaction use pointed structures, or should the generic
  interface support a separate satisfaction context?
- Should equality be a primitive formula constructor for all languages, or a
  language capability only enabled for first-order-like logics?
- Should binders be unary over a variable and body formula, or should binder
  arity be generalized for modal and proof-theoretic systems?
- Should proposition symbols and relation symbols both exist in the generic
  language, or should proposition symbols be represented as nullary relations?
- Should constants be separate from nullary functions, or represented as
  function symbols of arity `0`?
- Should function and relation symbols be bundled with arity, or represented by
  symbol types plus arity maps?
- How much notation should be added before first-order semantics is stable?

## Recommended Next Step

Pause first-order implementation until the generic language and formula shape
is reviewed.

After review, revise `LRA/VolumeI/Logic/Core.lean` first, then update
propositional logic as a compatibility test. Only then start the first-order
logic child modules.

The acceptance test for the redesign should be:

- propositional logic still implements `Logic`;
- propositional notation still works through generic notation;
- first-order logic can use the same `LogicalFormula` spine;
- first-order formulas can include relation applications, equality, connectives,
  and quantifiers without encoding them as fake propositional atoms;
- `lake -R build LRAVolumeI` passes.
