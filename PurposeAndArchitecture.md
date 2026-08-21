# LRA Purpose And Architecture

This document records the intended structure of the `lra-lean` repository: what
the top-level subjects are for, what belongs in each folder, and how new
mathematics should be placed. It is a working architecture guide for authors,
not a historical migration ledger.

The central principle is:

> Define a concept once, at its canonical level of generality, then specialize
> it by interface, theorem, instance, or interop layer. Do not restate the same
> mathematics in parallel folders.

## Purpose

`lra-lean` formalizes the Learning Real Analysis mathematical spine in Lean.
The repository is organized by durable mathematical subject, not by book
chapter or implementation convenience. Volumes describe presentation order;
subjects own declarations.

The long-term chain is:

```text
Identity / Logic / Set / Relation / Function / Operation / Order
  -> AlgebraicStructures / UniversalAlgebra / NumberSystems
  -> EuclideanSpace
  -> Analysis / Topology / LinearAlgebra
```

Every definition should answer two questions before it is added:

1. Which subject owns the concept?
2. At what layer does the theorem stop depending on unnecessary structure?

If a result is true for every relation, it belongs in `LRA.Relation`, not in
`LRA.Function` or `LRA.Order`. If it is true for every operation satisfying a
law, it belongs in `LRA.Operation`, not separately in every algebraic structure.
If it is true for every model of a generic number-system interface, it belongs
above the construction folders.

## Top-Level Subjects

The durable top-level subjects under `LRA/` are:

| Subject | Purpose |
|---|---|
| `Identity` | Equality and identity vocabulary. |
| `Logic` | Propositional, first-order, second-order, model, satisfaction, syntax, semantics, and proof-system material. |
| `Set` | Backend-agnostic set interface, set laws, set backends, set models, and set interop. `LRA.Set` itself selects no concrete set ontology. |
| `SetSystems` | Structured collections of sets: rings of sets, algebras of sets, sigma-algebras, generated set systems, and closure systems. |
| `Relation` | Relations, relation properties, canonical relations, relation operations, relation structures, and relation calculus. |
| `Function` | The working arrow presentation `Domain -> Codomain`, plus function properties and operations. The set-theoretic function presentation is opt-in under `Function/SetTheoretic`. |
| `Morphism` | Generic morphism forms and structure-preservation predicates. Subjects supply the carrier-specific preservation predicate and specialize the generic forms instead of restating them. |
| `Cardinality` | Equinumerosity, finite/infinite behavior, countability, Cantor-style comparison, and cardinal arithmetic where present. |
| `Operation` | Generic operation vocabulary and laws: arity, associativity, commutativity, identity, inverse, cancellation, closure, distributivity, divisibility, and law relationships. |
| `UniversalAlgebra` | Signatures, algebras, satisfaction, homomorphisms, embeddings, isomorphisms, subalgebras, products, quotients, congruences, kernels, and universal properties. |
| `AlgebraicStructures` | Named structures such as magma, semigroup, monoid, group, ring, field, ordered structures, lattices, and complete ordered fields. |
| `Order` | Ordered sets, order relations, bounds, suprema/infima, lattices, directedness, and order morphisms. |
| `NumberSystems` | Generic interfaces and constructions for natural, integer, rational, real, extended-real, complex, and Gaussian-integer systems. |
| `EuclideanSpace` | Concrete coordinate geometry built from the real-number layer: points, coordinates, intervals, lines, planes, surfaces, and Euclidean regions. |
| `Analysis` | Bounds, real analysis, metric spaces, sequences, integration, measure theory, normed/inner-product/Banach/Hilbert spaces, and related analytical structures. |
| `Topology` | General point-set topology and topological-space abstractions. |
| `LinearAlgebra` | Vector spaces, linear maps, and linear-algebra abstractions. |

Current transitional or auxiliary folders such as `Algebra`, `Carrier`,
`Interop`, `Meta`, `Pilot`, `Spaces`, and `Volume*` should not be treated as
new ownership models. New durable mathematics should be filed under the
canonical subjects above unless governance explicitly says otherwise.

## Subject Layout

A subject is a durable owner. Its root file is a router: it imports the subject
parts and carries a module doc-comment, but it should not hold declarations
unless the local pattern explicitly requires a tiny subject-level core.

The standard subject shape is:

```text
LRA/<Subject>.lean
LRA/<Subject>/
  Definition.lean
  <Group>.lean
  <Group>/
    <Concept>.lean
    <Concept>/
      Definition.lean
      Theorems.lean
      Characterizations.lean
      Consequences.lean
      Relationships.lean
  Examples.lean
  Failures.lean
  Interop/
```

Not every subject has every group. Add only the groups needed by the subject,
but keep the role names fixed when a group exists.

## Concept File Roles

Concept directories use a fixed set of leaf roles:

| File | Role |
|---|---|
| `Definition.lean` | Definitions, abbreviations, structures, classes, and primary predicates for this concept. |
| `Theorems.lean` | Theorems about this concept alone. These are the central results of the concept. |
| `Characterizations.lean` | Equivalent formulations, usually `iff` theorems characterizing the concept. |
| `Consequences.lean` | Corollaries that follow directly from this concept's theorems. |
| `Relationships.lean` | Results relating this concept to sibling concepts or adjacent concepts. |

Do not put a central theorem in `Consequences.lean` merely because
`Theorems.lean` is empty. A heavy `Consequences.lean` or `Relationships.lean`
beside an empty `Theorems.lean` is a filing smell.

If a role grows too large, promote it to a router plus a same-named folder:

```text
Theorems.lean
Theorems/
  Basic.lean
  ...
```

The router imports the split files and owns no declarations.

## Examples And Failures

`Examples` and `Failures` are quarantined opt-in layers.

Examples provide concrete instances, sanity checks, and illustrative models.
Failures provide counterexamples, negative results, and "this structure does not
upgrade to that one" facts. Core `Definition`, `Theorems`,
`Characterizations`, `Consequences`, `Relationships`, and routers must not
depend on examples or failures.

This keeps the theory reusable. The core subject proves what always holds; the
example and failure layers demonstrate the boundary of those theorems.

## Interop With Mathlib

Interop belongs with the subject whose vocabulary is being bridged:

```text
LRA/<Subject>/Interop/
LRA/<Subject>/Interop/Mathlib/
```

Interop files may translate between LRA records/predicates and Mathlib
structures, provide adapters, or register Mathlib carriers as satisfying LRA
interfaces. They are opt-in boundaries, not canonical definitions.

The preferred pattern is:

1. State the LRA concept in the subject's own vocabulary.
2. Prove or define a conversion to Mathlib where useful.
3. Prove or define a conversion from Mathlib where useful.
4. Keep compatibility switches and backend choices in `Interop/Switch.lean`
   when the subject needs them.

There should be no global `LRA.Interop` ownership model for new work. A Mathlib
adapter for order belongs to `Order/Interop`; one for metric spaces belongs to
`Analysis/MetricSpace/Interop`; one for sets belongs to `Set/Interop`.

For the repository-wide standard governing when a subject gets `Interface`,
`Interface/ModelTheory`, `Interface/UniversalAlgebra`, and `Realizations`, see
`ExternalInterfaces.md`. That document is the canonical decision guide for
external compatibility surfaces and logical/algebraic packaging.

## Set Backends And Predicate Sets

`LRA.Set` is backend-agnostic. It exposes set operations, membership, subset,
indexed families, cartesian products, and laws without selecting ZFC, NBG, TG,
Mathlib `Set`, or predicate sets as the only ontology.

Concrete or convenient set implementations belong in implementation or interop
layers:

| Layer | Use |
|---|---|
| `Set/Interface` | Abstract set operations and laws. |
| `Set/PredicateSet` | Predicate-as-set implementation, useful for ergonomic proofs. |
| `Set/ZFCSet`, `Set/NBGSet`, `Set/TGSet` | Concrete set-style backends. |
| `Set/ZFC`, `Set/NBG`, `Set/TG` | Axiomatic set-theory development. |
| `Set/Interop/Mathlib` | Bridges to Mathlib `Set` and related carriers. |

Use `PredicateSet` when it makes a proof easier, but do not let that convenience
replace the generic interface unless the theorem is explicitly about predicate
sets. Set-theoretic implementations can be used to prove existence and backend
facts; backend-neutral theorems should be stated through the interface.

## Relation, Function, And Morphism

Relations are the generic binary relation layer. Function and Morphism
specialize relation and operation vocabulary.

The repository deliberately has two function presentations:

| Presentation | Location | Purpose |
|---|---|---|
| Working arrow | `LRA.Function` | The form used by most mathematics: `Domain -> Codomain`. |
| Set-theoretic graph/triple | `LRA.Function.SetTheoretic` | The foundational object studied by set theory. |

The two meet through an explicit representation theorem family, not through
coercions or automatic bridge instances. Function concepts such as graph, image,
preimage, range, domain, fiber, injective, surjective, and bijective should use
the relation calculus where they are relation concepts applied to function
graphs.

`LRA.Morphism` owns generic morphism forms and the generic preservation and
reflection predicates they use. A subject supplies the preservation predicate
for its particular carrier and displayed structures, then specializes the
generic form by definition or by a subject-specific alias:

```text
Hom / Homomorphism     -> map plus a consumer-supplied preservation predicate
Mono / Epi             -> Hom plus injective / surjective arrow behavior
Iso / Automorphism     -> mutually inverse Homs with preservation both ways
PreservesRelation      -> Monotone, continuous relation-style predicates
PreservesOperation     -> Operation-preserving predicates
StructuralEmbedding    -> subject-specific embedding predicates
```

Do not restate the quantifier by hand when a generic morphism predicate already
says it. Do not restate the `map` plus `preserves` bundle shape when a generic
morphism form already packages it. The generic morphism layer must not import
universal algebra, order, topology, or any other consumer subject merely to know
what structure is being preserved; that knowledge flows from the consumer into
the morphism form as a predicate.

## Operations And Algebraic Structures

`LRA.Operation` owns generic operation vocabulary and laws. Algebraic structures
tie those operation laws together into named structures.

The intended dependency direction is:

```text
Operation laws
  -> AlgebraicStructures certificates/classes
  -> NumberSystems and other concrete carriers register instances
```

An algebraic-structure folder owns:

| Layer | Role |
|---|---|
| `Definition.lean` | Working typeclass, law bundle, or certificate for the named structure. |
| `Laws/` | Law-level components and their consequences. |
| `Interface/Signature/Definition.lean` | First-order or algebraic signature when the structure is modeled logically. |
| `Interface/ModelTheory/LStructure.lean` | The interpreted first-order structure for that signature. |
| `Interface/ModelTheory/Theory.lean` | The formal theory of the structure. |
| `Interface/ModelTheory/Model.lean` | The packaged notion tying structure and theory together as modelhood. |
| `Realizations/` | Concrete backends proved to satisfy the interface contract. |
| `Consequences.lean` | Structure-level consequences. |
| `Relationships.lean` | Links to parent/child or sibling structures. |

The same law should not be independently redefined in each named structure.
For example, associativity is operation vocabulary; semigroups certify it,
groups inherit it, and number-system constructions prove their operations
satisfy it.

## Universal Algebra And Model Theory

Model theory and universal algebra provide two related readings of structure:

| Area | Purpose |
|---|---|
| `Logic` model theory | Languages, signatures, terms, formulas, models, axioms, satisfaction, reducts, expansions, embeddings, and isomorphisms. |
| `UniversalAlgebra` | Operation-only signatures, interpreted operation bundles, algebras, homomorphisms, products, quotients, congruences, kernels, and universal properties. |

Use model theory when the subject needs formal signatures, axioms, and
satisfaction. Use universal algebra when the result is about carriers with
operations, quotienting by congruences, homomorphisms, products, and universal
properties.

The system-level pattern is:

```text
Interface/Signature/Definition.lean
Interface/ModelTheory/LStructure.lean
Interface/ModelTheory/Theory.lean
Interface/ModelTheory/Model.lean
Interface/UniversalAlgebra/Signature/Definition.lean
Realizations/
```

`Realizations/` ties native working structures or external backends to the
generic interface: the implementation is not merely a carrier with operations;
it is proved to satisfy the intended interface contract.

The broader decision of whether a subject should have only `Interface`,
`Interface + ModelTheory`, `Interface + UniversalAlgebra`, or all three is
governed by `ExternalInterfaces.md`.

## Generic Interfaces And Implementations

For systems with multiple constructions, the interface is the subject. A
construction is a realization of that interface.

Number systems follow this three-layer rule:

```text
NumberSystems/Interface/        generic interfaces
NumberSystems/<System>/         system-level theory and realization
NumberSystems/<System>/Constructions/<Construction>/
```

Examples:

```text
NumberSystems/IntegerStructure/Definition.lean
NumberSystems/Integers/Constructions/Polish/
NumberSystems/RealNumbers/Constructions/Cauchy/
NumberSystems/RealNumbers/Constructions/Dedekind/
```

A theorem belongs at the highest layer where it is true:

| If it depends only on... | It belongs in... |
|---|---|
| The generic interface | `NumberSystems/Theory` or the interface's theory layer. |
| Every construction of one system | The system folder. |
| One construction's carrier/equivalence | That construction folder. |

Implementations must prove that they satisfy the generic interface. Do not make
consumers choose a construction merely to state construction-independent
mathematics.

## Construction Pipeline

A construction directory has a fixed pipeline. The stages are ordered because
each earns the next.

| File | Role |
|---|---|
| `Carrier.lean` | The raw carrier or pre-carrier. |
| `Equivalence.lean` | The equivalence relation if the construction quotients representatives. |
| `WellFoundedness.lean` | Induction, recursion, termination, or structural well-foundedness needed by the construction. |
| `Operations.lean` | Raw operations on representatives or carriers. |
| `WellDefinedness.lean` | Proof that operations and functions respect equivalence and descend to quotients. |
| `Laws.lean` | Algebraic, order, or structural laws satisfied by the operations. |
| `Behavior.lean` | Proof that the operations compute as intended on the intended values. |
| `Instances.lean` | Registration into generic interfaces, algebraic structures, or Mathlib-compatible classes. |

Do not fold `WellDefinedness` into `Operations`. Do not fold `Behavior` into
`Laws`. A law can hold for the wrong operation; behavior proves it is the right
operation.

Operations and functions introduced by quotient, recursion, minimization, or
choice must carry the corresponding well-definedness obligation. Recursive or
inductive constructions must carry the corresponding well-foundedness
obligation. If the proof is not available, the construction has not yet earned
the interface it is supposed to realize.

## Subject, Topic, And Concept Layout

Use this hierarchy:

```text
Subject
  Group
    Topic
      Concept
        Role file
```

The exact depth may vary by subject, but the ownership rule does not:

- A subject owns durable mathematical vocabulary.
- A group clusters related concepts inside the subject.
- A topic splits a large group into readable areas.
- A concept owns one mathematical idea and its role files.
- A role file says what kind of declaration belongs there.

A declaration should have one canonical owner. If two topics need the same
definition, move it up to the shared owner and specialize it downward.

## One Definition, Multiple Specializations

The repository follows a one-definition, multiple-specializations rule.

Define the concept once at its canonical level:

```text
Relation concept       -> Function graph specialization
Operation law          -> Algebraic-structure certificate
Morphism predicate     -> Order/Topology/LinearAlgebra specialization
Set interface          -> PredicateSet/ZFC/Mathlib implementations
Number-system interface -> Cauchy/Dedekind/Polish/etc. realizations
```

Specializations may be:

- a `def` whose body is the generic concept;
- a structure extending or bundling the generic predicates plus new data;
- an instance proving a carrier satisfies a generic structure;
- an interop theorem translating to another library's vocabulary;
- a relationship theorem comparing sibling concepts.

Specializations must not be copy-pasted restatements. Restatement breaks theorem
transfer and creates multiple surfaces for the same mathematics.

## Import Discipline

Imports should follow mathematical dependency direction:

```text
Definition -> Theorems -> Characterizations -> Consequences -> Relationships
```

Lower layers must not import higher layers merely for convenience. Core theory
must not import examples, failures, or optional interop. Volume aggregators may
import subject routers for presentation, but durable declarations belong to
subjects.

Mathlib-backed files are allowed where the subject policy permits them. When a
subject has a Mathlib-free core and a Mathlib-backed convenience layer, keep the
boundary explicit in `Interop`.

## Filing Checklist

Before adding a declaration, check:

1. Is this the canonical owner, or is there a more general subject?
2. Is this a definition, theorem, characterization, consequence, or relationship?
3. Does an existing operation, relation, morphism, order, or set concept already
   say this?
4. Is this construction-specific, system-specific, or interface-generic?
5. Does the operation/function require well-definedness or well-foundedness?
6. Is this an example or failure that must stay out of core imports?
7. Is this Mathlib interop rather than canonical LRA vocabulary?
8. Is this one definition with specialization, or a duplicate definition?
