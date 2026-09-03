# Repository Architecture

## Purpose

`lra-lean` formalizes the Learning Real Analysis mathematical spine in Lean.
Durable ownership is by mathematical subject, not by temporary migration plan,
book-chapter convenience, or one-off implementation scaffolding.

The governing rule is:

> Define a concept once at its canonical level of generality, then specialize
> it by theorem, interface, realization, or interop layer.

## Durable Subject Owners

The durable top-level subjects under `LRA/` are:

- `Metamathematics`
- `Identity`
- `Logic`
- `ModelTheory`
- `ProofTheory`
- `Set`
- `SetSystems`
- `Relation`
- `Function`
- `Morphism`
- `Cardinality`
- `Operation`
- `UniversalAlgebra`
- `AlgebraicStructures`
- `Order`
- `NumberSystems`
- `EuclideanSpace`
- `Analysis`
- `Topology`
- `LinearAlgebra`

Transitional or auxiliary folders such as `Algebra`, `Carrier`, `Interop`,
`Pilot`, `Spaces`, and `Volume*` are not canonical ownership models for new
durable mathematics.

## Logic, Model Theory, And Proof Theory

`Logic`, `ModelTheory`, and `ProofTheory` are separate top-level subjects.

- `Logic` owns logical languages, syntax, truth valuations, and their general
  semantics: propositional, first-order, second-order, many-sorted, and related
  foundations. It is a sealed subject that can be consumed wholesale.
- `ModelTheory` owns set-level and structure-level mathematical objects built
  from those foundations, such as L-structures, classes of models, and theories.
- `ProofTheory` owns proof systems, derivations, and metaproof-theoretic
  constructions that consume logical syntax and semantics.

Dependencies flow from `Logic` into `ModelTheory` and `ProofTheory`. `Logic`
must not import either higher-level subject. `ModelTheory` and `ProofTheory`
remain independent unless a direct dependency is mathematically necessary.

## Placement Principle

Before adding a declaration, answer:

1. Which subject canonically owns the concept?
2. What is the highest layer where the result is true?
3. Is this core theory, a realization, an example, a failure mode, or interop?

If a theorem is true at a more general layer, move it up instead of restating
it in parallel folders.

## Standard Subject Shape

A subject root is a router plus a subject directory:

```text
LRA/<Subject>.lean
LRA/<Subject>/
```

The subject directory may contain only the groups it needs, but when a role
exists it should use the standard names:

- `Definition`
- `Theorems`
- `Characterizations`
- `Consequences`
- `Relationships`
- `Examples`
- `Failures`
- `Interop`
- `Interface`
- `Realizations`

Core theory must not depend on `Examples`, `Failures`, or optional interop.

## Concept Roles

Use these role files consistently:

- `Definition.lean`: definitions, structures, classes, primary predicates.
- `Theorems.lean`: central theorems about the concept itself.
- `Characterizations.lean`: equivalent formulations.
- `Consequences.lean`: direct corollaries.
- `Relationships.lean`: theorems relating sibling or adjacent concepts.

If `Consequences` or `Relationships` carries the main theory while
`Theorems.lean` is empty, that is a filing smell.

## Examples And Failures

`Examples` and `Failures` are quarantined opt-in layers.

- `Examples` contains concrete instances and demonstrations.
- `Failures` contains counterexamples, non-upgrade results, and negative cases.

Core theory must not import either.

## Interface, ModelTheory, UniversalAlgebra, Realizations

Use these meanings consistently:

- `Interface`: the LRA-owned abstract subject surface.
- `Interface/ModelTheory`: formal logical packaging of that interface.
- `Interface/UniversalAlgebra`: operation-based algebraic packaging.
- `Realizations`: concrete carriers or backends proved to satisfy the
  interface.

Do not use `Model` or `Construction/ModelTheory` to mean "one implementation."
Concrete implementations belong in `Realizations`.

### Decision Table

- Add `Interface` when the subject exposes a reusable abstract surface.
- Add `Interface/ModelTheory` when the subject genuinely needs signature,
  theory, satisfaction, or modelhood machinery.
- Add `Interface/UniversalAlgebra` when operation-level machinery,
  homomorphisms, quotients, or congruences are first-class.
- Add `Realizations` when the subject has concrete backends.

## Interop

Interop belongs with the subject whose vocabulary is being bridged:

```text
LRA/<Subject>/Interop/
LRA/<Subject>/Interop/Mathlib/
```

There is no global top-level `Interop` ownership model for new durable work.

## NumberSystems Layering

Number systems follow a three-layer rule:

```text
NumberSystems/Interface/
NumberSystems/<System>/
NumberSystems/<System>/Constructions/<Construction>/
```

A theorem belongs at the highest layer where it is true:

- interface-generic results go in the interface layer;
- system-wide results go in the system folder;
- construction-specific results go in that construction.

## Construction Pipeline

Construction folders should use the following pipeline when those roles are
needed:

```text
Carrier
Equivalence
WellFoundedness
Operations
WellDefinedness
Laws
Behavior
Instances
```

Do not hide well-definedness inside `Operations` or behavioral correctness
inside `Laws`.

## Import Discipline

Imports must follow mathematical dependency direction.

- Lower layers do not import higher layers for convenience.
- Subject roots are routers, not dumping grounds for declarations.
- Core theory does not import examples, failures, or optional interop.
- Repository-level aggregators should import standard aggregate surfaces, not
  bypass them by reaching directly into arbitrary subject internals.

## Filing Checklist

Before creating a new file or declaration, check:

1. Is the owner subject correct?
2. Is the layer too concrete?
3. Is a generic relation, operation, morphism, order, or set concept already
   available?
4. Is this realization-specific rather than interface-generic?
5. Does the construction need explicit well-foundedness or well-definedness?
6. Is this really an example, failure mode, or interop artifact?
