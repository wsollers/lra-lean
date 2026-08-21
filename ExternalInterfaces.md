# External Interfaces Standard

This document defines the repository standard for subject-level interfaces,
model-theoretic packaging, universal-algebra packaging, and concrete
realizations.

The goal is simple:

- keep LRA's abstract subject surfaces stable and Mathlib-compatible,
- avoid mixing logical models with concrete implementations,
- make refactors mechanically checkable,
- and give every subject a predictable place for external compatibility work.

## Core Meanings

### `Interface`

`Interface` is the canonical LRA abstraction boundary for a subject.

It plays the role of the repository's native compatibility surface:

- the book-facing concept is stated here,
- the abstraction level is chosen here,
- and compatibility with Mathlib should be possible from here.

`Interface` is not a reimplementation of Mathlib. It is the LRA-owned surface
through which we state theorems in the mathematical language we want to use.

### `Interface/ModelTheory`

`Interface/ModelTheory` is for logical or model-theoretic packaging of the
interface.

Use it when the subject genuinely needs:

- a formal signature or language,
- interpreted structures,
- a theory or axioms over those structures,
- satisfaction or modelhood.

This is the formal contract of what the subject is in first-order logical
terms.

Its preferred internal shape is:

```text
Interface/
  ModelTheory/
    LStructure.lean
    Theory.lean
    Model.lean
```

Meaning:

- `LStructure.lean`
  The interpreted first-order structure of the subject vocabulary.
- `Theory.lean`
  The formal first-order theory of the subject.
- `Model.lean`
  The packaged notion tying structure and theory together as modelhood.

### `Interface/UniversalAlgebra`

`Interface/UniversalAlgebra` is for operation-based packaging of the interface.

Use it when the subject is fundamentally about:

- carriers with operations,
- homomorphisms,
- products,
- quotients,
- congruences,
- kernels,
- induced operations and universal properties.

This is the algebraic contract of what the subject is. It is different from
model theory: universal algebra is about the algebraic machinery of
operations, not primarily about first-order satisfaction.

Its preferred entrypoint shape is:

```text
Interface/
  UniversalAlgebra/
    Signature/
      Definition.lean
```

### `Realizations`

`Realizations` is for concrete realizations of the interface.

This is where a subject proves that a specific carrier or backend satisfies the
abstract interface.

Examples:

- Euclidean `Rn` realizing metric-space structure,
- a Mathlib-backed implementation realizing an LRA interface,
- a set-backed implementation proving abstraction boundaries are honest.

Do not use model-theoretic folders to mean "one implementation." Use
`Realizations` or a named implementation file instead.

## Decision Table

Use this table when deciding what folders a subject gets.

| Question | If yes | If no |
|---|---|---|
| Does the subject need an LRA-owned abstract surface? | Add `Interface` | Stop only if the subject is purely internal plumbing |
| Does the subject need formal signatures, structures, axioms, or satisfaction? | Add `Interface/ModelTheory` | No model-theory folder |
| Does the subject need operation-level algebraic machinery? | Add `Interface/UniversalAlgebra` | No universal-algebra folder |
| Does the subject have one or more concrete backends or realizations? | Add `Realizations` | No realization folder yet |

This yields four normal cases:

| Shape | Use |
|---|---|
| `Interface` only | Abstract subject surface with theorems, no separate logical or algebraic packaging needed |
| `Interface + ModelTheory` | Logical theories with signatures, structures, theory, modelhood |
| `Interface + UniversalAlgebra` | Operation-driven structures where algebraic machinery matters but separate logical packaging does not |
| `Interface + ModelTheory + UniversalAlgebra` | Subjects with both a useful logical reading and a useful algebraic reading |

## Standard Folder Shapes

### 1. Interface only

```text
LRA/XXX/
  Interface.lean
  Interface/
    Definition.lean
  Laws.lean
  Theorems.lean
  Examples.lean
  Interop/
```

### 2. Interface plus ModelTheory

```text
LRA/XXX/
  Interface.lean
  Realizations.lean
  Interface/
    Definition.lean
    ModelTheory/
      LStructure.lean
      Theory.lean
      Model.lean
  Realizations/
    ...
  Interop/
```

### 3. Interface plus UniversalAlgebra

```text
LRA/XXX/
  Interface.lean
  Realizations.lean
  Interface/
    Definition.lean
    UniversalAlgebra/
      Signature/
        Definition.lean
  Realizations/
    ...
  Interop/
```

### 4. Interface plus ModelTheory plus UniversalAlgebra

```text
LRA/XXX/
  Interface.lean
  Realizations.lean
  Interface/
    Definition.lean
    ModelTheory/
      LStructure.lean
      Theory.lean
      Model.lean
    UniversalAlgebra/
      Signature/
        Definition.lean
  Realizations/
    ...
  Interop/
```

## When To Use Each Shape

### Use `Interface/ModelTheory` only

Use `Interface/ModelTheory` without `Interface/UniversalAlgebra` when
relations or logical theories are central and operation-only algebra is not the
right main reading.

Examples:

- `Set`
- `Identity`
- `EuclideanSpace.Interface`

These subjects care about formal structures and theories, but they are not
primarily universal-algebraic subjects.

### Use `Interface/UniversalAlgebra` only

Use `Interface/UniversalAlgebra` without `Interface/ModelTheory` when the
subject is fundamentally about operations and algebraic machinery, and full
first-order packaging would add little.

Typical use:

- operation bundles,
- quotient-respect and induced-operation pipelines,
- algebraic constructions where homomorphisms and quotients are central.

### Use both

Use both when both readings are mathematically valuable and materially used.

Examples:

- `Ring`
- `Field`
- `BooleanAlgebra`
- many algebraic structures with both first-order and algebraic treatments

The split is:

- `Interface/ModelTheory` answers: what is the formal theory?
- `Interface/UniversalAlgebra` answers: what algebraic machinery acts on it?

### Use neither beyond `Interface`

Some subjects only need a stable abstraction boundary plus theorem files.

Examples may include:

- theorem-focused analytical topics,
- derived concepts that do not need their own formal signature,
- lightweight abstractions whose only purpose is to support book-style theorems.

In those cases, stop at `Interface` unless a real need appears.

## Example Subjects

| Subject | Recommended shape | Reason |
|---|---|---|
| `Set` | `Interface + ModelTheory` | Membership is relational and model-theoretic |
| `Identity` | `Interface + ModelTheory` | Equality structure is logical, not mainly algebraic |
| `EuclideanSpace.Interface` | `Interface + ModelTheory` | Tarski-style relations make model theory natural |
| `Ring` | `Interface + ModelTheory + UniversalAlgebra` | Both first-order and algebraic readings are useful |
| `Field` | `Interface + ModelTheory + UniversalAlgebra` | Same reason as rings |
| `MetricSpace` | `Interface` first, optionally `Interface/ModelTheory` later | Metric spaces are not primarily universal-algebraic |
| `MeasurableSpace` | `Interface`, possibly `Interface/ModelTheory` | Logical packaging may be useful; universal algebra usually is not |
| `MeasureSpace` | `Interface`, possibly `Interface/ModelTheory` | Same pattern as measurable spaces |

## Naming Rules

Use these names consistently:

- `Interface`
  The subject's LRA-native abstraction boundary.
- `Interface/ModelTheory`
  Logical/model-theoretic contract of the interface.
- `Interface/UniversalAlgebra`
  Operation-based algebraic contract of the interface.
- `Realizations`
  Concrete implementations or realizations of the interface.

Avoid these collisions:

- do not use `Interface/ModelTheory` to mean "implementation";
- do not use `Construction/ModelTheory` for files that are really concrete
  realizations;
- do not mix `Language` and `Signature` arbitrarily for the same role inside
  one local subsystem;
- do not duplicate the same concept under both `Interface/ModelTheory` and
  `Realizations` unless the distinction is explicit.

## Refactor Guidance

When cleaning up an existing subject:

1. Identify the public abstraction boundary.
   That becomes `Interface`.
2. Ask whether the subject truly needs logical signatures and satisfaction.
   If yes, add or normalize `Interface/ModelTheory`.
3. Ask whether the subject truly needs operation-level algebraic machinery.
   If yes, add or normalize `Interface/UniversalAlgebra`.
4. Move concrete backend-specific files under `Realizations` or a named
   implementation folder beneath it.
5. Keep Mathlib bridges in `Interop`, even when Mathlib also appears as one
   realization backend.

## Current Refactor Target

This standard is intended to guide global cleanup of inconsistent `Model`
usage across the repository, especially where:

- logical-model folders and implementation folders are currently mixed,
- `Construction/ModelTheory` is being used for concrete realizations,
- `Language` and `Signature` are mixed for the same local role,
- and interface/model/algebra boundaries are unclear.
