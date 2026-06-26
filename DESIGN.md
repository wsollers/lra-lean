# DESIGN.md

## lra-lean — Design Rules, Style Guide, and Proof Architecture

---

## 1. Project Goal

Build a formally verified development of the number systems
from first principles in bare Lean 4, following the mathematical
tradition of Landau, Feferman, Thurston, Mendelson, and Dedekind.

The endpoint is a verified path from the Peano axioms through

```text
N → W → Z → Q → R
```

terminating in the metric and topological machinery needed to support
stochastic analysis on compact manifolds (specifically Brownian motion
on the torus T²).

The guiding principle:

> Every definition and theorem is proved once, correctly, at the
> right level of generality, and then reused everywhere it is needed.
> Nothing is reproved. Nothing is duplicated.

---

## 2. Mathlib Policy

| Volume     | Mathlib       | Rationale                            |
| ---------- | ------------- | ------------------------------------ |
| VolumeI    | Permitted     | Exploratory                          |
| VolumeII   | **Forbidden** | Everything proved from Peano systems |
| VolumeIII+ | Permitted     | Analysis, topology, stochastic       |

VolumeII has zero package dependencies.

The `lake-manifest.json` `packages` field must remain empty for
VolumeII.

Any PR that adds a Mathlib import to a VolumeII file is rejected.

Permitted in VolumeII without import:

* Core Lean 4 kernel (`Init`)
* `Quotient`, `Setoid`
* `Classical.byContradiction`
* `Classical.em`
* Core tactics:

  * `intro`
  * `apply`
  * `exact`
  * `rw`
  * `induction`
  * `cases`
  * `constructor`
  * `refine`
  * `congr`
  * `simp`

No external lemma sets.

---

## 3. The Proof Architecture Principle

VolumeII is built on a proof architecture, not ad hoc proofs.

The architecture is:

```text
PeanoSystem.lean
  ├── Existence.lean
  ├── BasicTheorems.lean
  ├── Induction.lean
  └── Recursion.lean
         ├── Consistency of Iterator Relations
         ├── Uniqueness of Iterator Functions
         ├── Completeness of the Minimal Iterator Relation
         ├── Forced Values Are Unique
         ├── Determinism of the Minimal Iterator Relation
         └── Existence of an Iterator Function
                └── arithmetic operations
                     ├── Addition
                     ├── Multiplication
                     ├── Exponentiation
                     └── future iterator constructions
```

The recursion architecture is proved once and reused everywhere.

Every arithmetic definition should require:

1. One iterator configuration
2. Two computation clauses
3. One uniqueness citation

If a proof exceeds roughly ten lines, first ask:

1. Is there a missing architecture lemma?
2. Is the induction variable wrong?
3. Is the theorem stated at the wrong abstraction layer?

---

## 3.5 Foundational Architecture Policy

`PeanoSystem` is the foundational abstraction for VolumeII.

The repository is structured around abstract Peano systems first,
and only later introduces canonical or concrete realizations.

### Architectural Rule

All new definitions and theorems must be stated over:

```lean
(ps : PeanoSystem)
```

unless the theorem explicitly concerns a chosen canonical model.

Forbidden:

```lean
theorem foo : ∀ x : N, ...
```

Preferred:

```lean
theorem foo
    (ps : PeanoSystem) :
    ∀ x : ps.carrier, ...
```

### Existence Policy

Existence is isolated into its own module:

```lean
axiom exists_peano_system : Nonempty PeanoSystem
```

The foundational files define structure and logical consequences,
not existence.

### Canonical Models

Concrete or canonical systems may later be introduced:

```lean
noncomputable def canonical_peano_system : PeanoSystem := ...
```

but they are not the foundation of the repository.

---

## 4. File Organisation

```text
LRA/VolumeII/

  Foundations/
    Logic/
    Relations/
    Functions/

  PeanoSystems/
    PeanoSystem.lean
    Existence.lean
    BasicTheorems.lean
    Induction.lean
    Recursion.lean

  NaturalNumbers/
    Addition.lean
    Multiplication.lean
    Exponentiation.lean
    Utilities.lean
    Order.lean
    Division.lean
```

### Dependency Rules

* Import graph must remain acyclic.
* Lower layers may never import higher layers.
* Arithmetic files may not define foundational concepts.
* Recursion machinery belongs to `PeanoSystems/`, not arithmetic.

---

## 5. Namespace and Module Convention

Foundational files use:

```lean
namespace Peano
```

Arithmetic developments may optionally use:

```lean
namespace Landau
```

for historically aligned theorem developments.

The repository distinguishes:

* foundational abstractions (`Peano`)
* historical arithmetic developments (`Landau`)

---

## 6. Naming Convention

### Types and structures

Use `PascalCase`.

Examples:

```lean
PeanoSystem
IteratorData
MinimalIteratorRelation
```

### Definitions

Use `snake_case`.

Examples:

```lean
plus
mul
exp
successor
is_predecessor
```

### Theorems and lemmas

Name from the mathematical conclusion.

Good:

```lean
add_comm
add_assoc
one_not_successor
successor_injective
every_element_is_one_or_successor
```

Forbidden:

```lean
helper1
tmp_lemma
```

---

## 6.5 Variable Naming Policy

Variable names must be semantically meaningful and reflect their
mathematical role.

Avoid cryptic single-letter names unless the meaning is universally
standard and locally obvious.

### Permitted single-letter variables

Single-letter variables are permitted only for universally standard
mathematical roles:

```text
m n k x y z
```

and only when the role is immediately clear.

### Required semantic names

The following must always use descriptive names:

* induction hypotheses
* predicates
* hypotheses
* existential witnesses
* intermediate constructions
* subset membership proofs
* iterator witnesses
* relation witnesses

Preferred examples:

```lean
induction_hypothesis
predicate_holds
successor_membership
predecessor
iterator_value
minimal_relation
```

Forbidden:

```lean
h1
h2
tmp
foo
bar
_ih
```

The repository prioritizes:

* proof readability
* pedagogical clarity
* mathematical semantics
* long-term maintainability

over terse theorem-prover idioms.

---

## 6.6 Predicate-Oriented Induction Policy

The primary induction theorem must be predicate-oriented.

Preferred canonical theorem:

```lean
theorem induction_principle
    (ps : PeanoSystem)
    (predicate : ps.carrier → Prop)
    (base_case : predicate ps.one)
    (successor_step :
      ∀ element : ps.carrier,
      predicate element →
      predicate (ps.successor element)) :
    ∀ element : ps.carrier,
      predicate element
```

Subset-oriented induction theorems are permitted only as derived
theorems built from the predicate form.

---

## 6.7 Foundational Naming Convention

Semantic names are required for foundational axioms and theorems.

Preferred:

```lean
ax_one_not_successor
ax_successor_injective
ax_induction
ax_recursion
```

Forbidden:

```lean
A3
A4
A5_Induction
```

Public-facing theorem names should describe mathematical content.

---

## 7. Theorem Design Rules

Every theorem should be stated at the highest reusable level.

Avoid embedding unnecessary concrete structure.

Prefer:

```lean
(ps : PeanoSystem)
```

over concrete natural number implementations.

Do not specialize prematurely.

---

## 8. Proof Style Rules

Proofs should be:

* structurally clear
* mathematically motivated
* pedagogically readable
* architecturally reusable

Avoid tactic golf.

Avoid deeply nested anonymous tactic blocks.

Prefer named intermediate claims.

---

## 9. Induction Rules

Induction proofs should:

1. identify the predicate explicitly
2. identify the induction variable explicitly
3. separate:

   * base case
   * induction hypothesis
   * successor step
4. explain why the induction hypothesis applies

Subset induction proofs are explanatory forms of the predicate
induction principle.

---

## 10. Recursion Architecture Rules

All arithmetic operations are iterator constructions.

The canonical architecture is:

```text
iterator theorem
  → arithmetic definition
  → computation clauses
  → algebraic properties
```

All recursion in VolumeII must factor through
the recursion architecture unless explicitly justified.
No arithmetic operation should introduce independent recursion
machinery.

---

## 11. Documentation Policy

Every theorem, definition, lemma, and corollary must contain:

* display name
* plain-English description
* dependencies
* sources
* notes cross-reference

The Lean repository is standalone. Cross-references to mathematical volume
content should use current route metadata or explicit source citations, not a
retired monorepo sync.

---

## 12. Source Policy

Every major theorem should cite at least one source.

Preferred sources:

* Landau
* Feferman
* Mendelson
* Thurston
* Dedekind
* Tao (when appropriate)

Citations should identify sections or theorem numbers whenever possible.

---

## 13. Arithmetic Dependency Chain

```text
PeanoSystem
  ├── BasicTheorems
  ├── Induction
  └── Recursion
         └── Addition
               └── Multiplication
                     └── Exponentiation
```

Utilities using arbitrary iterator targets may depend only on:

* `PeanoSystem`
* `Recursion`

Subtraction is not defined on the natural numbers.

---

## 14. Commit Message Format

```text
feat(§X.Y): short description

- What was added or changed
- Which theorems are now proved
- Which sources are cited
```

Examples:

```text
feat(§1.2): add Recursion.lean with iterator theorem

feat(N): add Multiplication.lean — mul_base, mul_step, mul_comm
```

---

## 15. Not in Scope for VolumeII

The following are deferred:

* subtraction
* negative numbers
* rationals
* reals
* division as a total function
* decidability instances
* automated simplification frameworks
* Mathlib abstractions

---

## 16. Cross-Reference Protocol

Every item in the Lean repository has a corresponding item in the
markdown notes repository.

Each item carries:

| Identifier      | Example                                      |
| --------------- | -------------------------------------------- |
| Lean identifier | `iterator_unique`                            |
| Display name    | `Uniqueness of Iterator Functions` |
| Markdown anchor | `#uniqueness-of-iterator-functions`                                   |

Every Lean item must include a doc-comment cross-reference.

Example:

```lean
/--
**[Uniqueness of Iterator Functions]**

Any two iterator functions satisfying the same clauses are equal.

*Notes cross-ref:* §1.2.2 [#uniqueness-of-iterator-functions](../notes/section_1_2_main.md#uniqueness-of-iterator-functions)
-/
```

---

## 17. Doc-Comment Template

Every theorem, definition, lemma, and corollary should follow:

```lean
/--
**[{Category} — {Title}]**

{Plain-English mathematical description}

*Dependencies:* `{lean_id}`

*Sources:*
  {Author}, {Title}, {Section}

*Notes cross-ref:* §{section} [#{anchor}]({path})
-/
```

### Minimum required fields

Mandatory:

* Display name
* Description
* Dependencies
* Sources
* Notes cross-ref

Foundational axioms are exempt from dependencies.
