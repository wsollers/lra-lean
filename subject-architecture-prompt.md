# LRA Subject Architecture, Naming Conventions, and Coding Standards

Work in the `lra-lean` repository, on the `standardization` line. Treat this as
an implementation task, not an advisory review. Read the repository governance
entrypoint and run the canonical route resolver before editing.

This document supersedes `namespace-refactor-prompt.md` and the architecture
description in any generated `namespace-review.md`. Where a doc-comment inside
the repository contradicts this document, the doc-comment is stale and must be
corrected as part of the work.

**Do not preserve obsolete names with compatibility aliases, re-exports, or
forwarding abbreviations.** The previous migration was given this instruction and
left roughly 100 aliases anyway; §7.0 audits and removes them, and §7.0.1 states
the standing rule. Do not commit or push unless the user separately authorizes
that action. **Do not complete proofs.
Leave every proof as `sorry`. Proofs belong to the author.**

---

## 1. The subject architecture

### 1.1 Subjects are the unit of ownership

A **subject** is a durable mathematical domain that owns declarations. Subjects
live directly under `LRA`. Curricular volumes are *presentation order*, not
ownership, and appear only as file aggregators.

The subject list:

```text
LRA.Identity          identity and equality
LRA.Logic             propositional, first-order, second-order, proof systems
LRA.Set               set backends, the set interface, ZFC development
LRA.SetSystems        rings, algebras, and σ-algebras of sets
LRA.Relation          relations
LRA.Function          functions
LRA.Morphism          structure-preserving functions
LRA.Cardinality       equinumerosity, finiteness, countability, Cantor
LRA.Operation         operations and their laws
LRA.UniversalAlgebra  signatures, algebras, congruences, quotients
LRA.AlgebraicStructures   the named structures: group, ring, field, lattice, …
LRA.Order             order theory, bounds, lattices, order morphisms
LRA.NumberSystems     ℕ, ℤ, ℚ, ℝ, ℂ, Gaussian integers, Peano systems
LRA.EuclideanSpace    coordinates, points, lines, planes, intervals: ℝ → ℝ² → ℝ³
LRA.Analysis          Bounds, MetricSpaces, MeasureTheory, FunctionalAnalysis
LRA.Topology          general topology
LRA.LinearAlgebra     vector spaces and linear maps
LRA.Internal          explicitly non-API orienting and scratch material
```

Create a subject only when it owns durable declarations. Do not create empty
roots.

### 1.2 Two presentations, deliberately kept apart

A function has two presentations in this repository, and conflating them is the
central design error to avoid.

**The foundational presentation — a set-theoretic triple.** A relation is a
triple of a left domain, a right domain, and a graph. A function is that same
shape with the function condition imposed. This is the object the repository
*studies*: the layer where you prove what a function is.

```text
SetTheoreticRelationTriple   →   raw domain / codomain / graph data
IsSetTheoreticRelation       →   the graph-typing condition
SetTheoreticRelation         →   triple bundled with that evidence

SetTheoreticFunctionTriple   →   the same raw data
IsSetTheoreticFunction       →   graph typing ∧ totality ∧ uniqueness
SetTheoreticFunction         →   triple bundled with that evidence
```

**The working presentation — the arrow.** To everything else in the repository, a
function *is* `Domain → Codomain`.

```lean
abbrev LRA.Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain
```

This is the convenient representation used by analysis and by every later
subject. It is **not** definitionally a set-theoretic triple, is computable, and
composes with Lean core and Mathlib without conversion.

The two presentations meet at **exactly one** theorem,
`LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation` (§1.5). There are no
coercions, no instances, and no second bridge.

### 1.2.1 Where the generalization chain lives

The chain is real, but it lives at both ends rather than in one column:

| Layer | Chain | Status |
|---|---|---|
| foundational | `SetTheoreticRelation` → `SetTheoreticFunction` | definitional: the function condition *is* graph typing plus totality plus uniqueness |
| working | arrow → `LRA.Morphism` | definitional: a morphism is an arrow plus preservation predicates |

So "a function is a total, single-valued relation" is a **theorem of the
foundational layer**, not a definitional identity of the arrow. That is the
intended design. Set theory says what a function *is*; the arrow is how a
function is *used*.

Binding consequences:

- Do **not** introduce a typed structure bundling an arrow with totality and
  single-valuedness proofs. It is neither presentation, it forces
  `noncomputable` evaluation through `Classical.choose`, and it requires a
  conversion at every Mathlib boundary. See §7.5.
- `LRA.Morphism` takes an **arrow**. It must not redefine function application,
  composition, or injectivity.
- `LRA.Relation` owns the generic relation calculus. Where a function concept is
  genuinely the relation concept applied to a function graph, define it through
  `Graph` rather than restating the quantifier.
- "Map" is a **synonym** for function, not a refinement of it. There is no
  `LRA.Map` subject and there must never be one.

### 1.3 `LRA.Morphism` is a top-level subject

Morphism primitives are owned centrally; bundled morphism notions stay with the
structure they preserve.

`LRA.Morphism` owns the primitives:

```text
LRA.Morphism.PreservesRelation
LRA.Morphism.ReflectsRelation
LRA.Morphism.RelationEmbedding
LRA.Morphism.PreservesNullaryOperation
LRA.Morphism.PreservesUnaryOperation
LRA.Morphism.PreservesBinaryOperation
LRA.Morphism.OperationEmbedding
LRA.Morphism.StructuralEmbedding
```

Each structural subject defines its own bundled morphism **in terms of those
primitives**:

| Bundled notion | Owner |
|---|---|
| `Homomorphism`, `Isomorphism`, `Embedding`, `Congruence` | `LRA.UniversalAlgebra` |
| `Monotone`, `Antitone`, `OrderEmbedding`, `OrderIsomorphism` | `LRA.Order.Morphisms` |
| `ModelEmbedding`, `ModelIsomorphism` | `LRA.Logic.FirstOrder` |
| `Continuous` | `LRA.Topology` |
| `Isometry` | `LRA.Analysis.MetricSpaces` |
| `LinearMap` | `LRA.LinearAlgebra` |

### 1.3.1 How a subject specializes a morphism

`LRA.Morphism` owns two layers:

- **`LRA/Morphism/Properties/`** — the Prop-valued preservation predicates above.
  These are the primitives. Everything else is defined from them.
- **There is no generic bundled `Morphism` structure.** "Structure" is polymorphic
  — a relation, an operation, or a family of both — so a single bundle would have
  to be parameterized by a signature, and a signature-parameterized morphism *is*
  the universal-algebra notion, which §1.3 says must not own the primitives.
  Bundling therefore happens per subject.

Theorem transfer does not need a shared bundle and never did. It happens at the
predicate level: a subject derives "a composite of my morphisms is my morphism"
from `PreservesRelation (outer ∘ inner)`, not from a parent structure.

One question decides how a subject specializes:

> **Does the specialization add data, or only add constraints?**

| Situation | Required form |
|---|---|
| adds only constraints | a `def`/`abbrev` **in terms of** the generic predicate |
| preserves several pieces of structure | a conjunction of generic predicates |
| adds data (an inverse, a second operation, a unit) | a `structure` bundling the arrow with the relevant generic predicates |

Correct — constraints only, so definitional:

```lean
def Monotone
    (source : LRA.Relation.Endorelation Alpha)
    (target : LRA.Relation.Endorelation Beta)
    (function : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation function source target
```

Correct — several pieces of structure, still definitional:

```lean
def IsRingHomomorphism (function : R → S) : Prop :=
  LRA.Morphism.PreservesBinaryOperation function addR addS ∧
  LRA.Morphism.PreservesBinaryOperation function mulR mulS ∧
  LRA.Morphism.PreservesNullaryOperation function oneR oneS
```

Correct — adds an inverse, so a structure of its own, whose fields are stated
through the generic predicates:

```lean
structure OrderIsomorphism (source : Endorelation Alpha) (target : Endorelation Beta) where
  forward : LRA.Function Alpha Beta
  inverse : LRA.Function Beta Alpha
  forwardPreserves : LRA.Morphism.PreservesRelation forward source target
  inversePreserves : LRA.Morphism.PreservesRelation inverse target source
  leftInverse : …
  rightInverse : …
```

**Forbidden — restatement.** Writing the quantifier out by hand instead of
calling the generic predicate:

```lean
-- must not appear in any subject
def Monotone source target function : Prop :=
  ∀ left right, source left right → target (function left) (function right)
```

Specialization is by definition or by `extends`, never by copy. A parallel
structure that merely resembles a morphism severs theorem transfer and is the
exact failure the Relation → Function → Morphism chain exists to prevent.

### 1.3.2 Generic theory that must not be restated

Proved once in `LRA.Morphism`, at the level of the preservation predicates, and
derived by every subject rather than restated:

- the identity function preserves every relation and every operation;
- a composite of preserving functions preserves, and composition is associative;
- an injective preserving function is an embedding;
- a bijective preserving function whose inverse preserves is an isomorphism.

No subject may restate any of these. If `UniversalAlgebra`, `Order`, `Topology`,
and `LinearAlgebra` each prove "a composite of homomorphisms is a homomorphism",
the central subject has failed its purpose.

**Two results that are not generic.** "The image of a morphism is a substructure"
and "the kernel of a morphism induces a congruence" do not typecheck without a
notion of *structure* to be a sub-thing of, and a notion of *congruence*. Both are
`LRA.UniversalAlgebra`'s, and both results belong there. That is consistent with
§1.3: `UniversalAlgebra` must not own the morphism **primitives**, but it does own
theorems that require its own structure notion, stated through those primitives.

**Why not `LRA.UniversalAlgebra.Morphisms`.** Universal algebra studies carriers
with *operations only*; its signatures have no relation symbols. Three of the
eight primitives are relational, so filing them under `LRA.UniversalAlgebra`
asserts something false. It would also force `LRA.Order` to import
`LRA.UniversalAlgebra` to say "monotone" and `LRA.Topology` to import it to say
"continuous" — false dependencies that are the engineering symptom of the
mathematical error.

### 1.5 The set-theoretic layer and its single bridge

`main` already carries this layer, complete and building under `lake build`. Port
it rather than rewriting it. The source is:

```text
LRA/VolumeI/Function/SetTheoretic/Definition.lean      the two triples and their conditions
LRA/VolumeI/Function/SetTheoretic/Theorems.lean        evaluation existence/uniqueness, extensionality
LRA/VolumeI/Function/SetTheoretic/Relationships.lean   single-valuedness, the representation theorem
```

Read them with `git show origin/main:<path>`. They land at
`LRA/Function/SetTheoretic/` under the subject layout of §2.1, split into the
file roles of §2.3. Their namespace is already `LRA.Function.SetTheoretic`, so
only the module paths change.

`LRA.Function.SetTheoretic` owns, against the established LRA set backend:

| Declaration | Role |
|---|---|
| `SetTheoreticRelationTriple` | raw left-domain / right-domain / graph data |
| `IsSetTheoreticRelation` | every graph member is a pair with coordinates in the displayed domains |
| `SetTheoreticRelation` | the triple bundled with that evidence |
| `SetTheoreticFunctionTriple` | raw domain / codomain / graph data |
| `IsSetTheoreticFunction` | graph typing ∧ every domain element has a value ∧ that value is unique |
| `SetTheoreticFunction` | the triple bundled with that evidence, in field `isFunction` |
| `EvaluationExists`, `EvaluationUnique` | the evaluation theorems |
| `SetTheoreticFunctionExt` | extensionality for the triple convention |
| `SingleValuedOfIsSetTheoreticFunction`, `BundledSingleValued` | graph single-valuedness |

Raw triple data stays separate from the proposition that the triple is a
function. Use the repository's canonical membership, ordered pair, product, and
separation. Do not invent a second set backend; if the backend lacks a
construction the canonical statement needs, record the exact missing capability
and add only the smallest correct interface.

**The single bridge.** Exactly one theorem family relates the two presentations:

```text
LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation
```

It takes a typed arrow plus explicit encodings of the domain and codomain into
the backend, and makes every set-existence, ordered-pair, and encoding
hypothesis explicit: pairing and separation operations and their laws,
membership instances, encoding injectivity and coverage, an ambient pair set,
and graph-pair existence. It concludes that the resulting graph triple is a
set-theoretic function and that its evaluation agrees with the arrow.

Binding: no coercions, no instances, no automatic conversion, and no second
bridge. It must never claim that an arbitrary Lean type is a backend set.

### 1.4 A required correction to the current dependency direction

`LRA/VolumeI/Map/Morphisms/PreservesRelation/Definition.lean` currently reads:

```lean
def PreservesRelation (map : Source -> Target)
    (sourceRelation : Endorelation Source)
    (targetRelation : Endorelation Target) : Prop :=
  LRA.Order.Monotone sourceRelation targetRelation map
```

The general notion is defined as the order-specific one. Invert this:
`LRA.Morphism.PreservesRelation` becomes the primitive, defined directly over
`LRA.Relation`, and `LRA.Order.Morphisms.Monotone` becomes its specialization.
"Monotone" is order vocabulary and is earned only when the relation is an order.

---

### 1.6 `LRA.NumberSystems` is interface-first, in three layers

A number system is not one object. There are several naturals, several
integers, several reals, and the mathematics of interest is largely
*independent of which one you picked*. So the subject is organized the way
`LRA.Set` is organized: an interface is the subject, and a construction is a
realization of it. Number systems need one more layer than sets do, because two
naturals-shaped objects can differ in more than backend — a zero-based and a
one-based recursion are different **signatures**, not two encodings of one
notion — so the subject has a generic layer, a per-system layer, and a
per-construction layer, in that order.

```
LRA/NumberSystems.lean                 router; generic interfaces only, no system selected
LRA/NumberSystems/
  Interface/                           the generic interfaces, one file each
    NaturalZeroBased.lean
    NaturalOneBased.lean
    Integer.lean
    Rational.lean
    Real.lean
    ExtendedReal.lean                  order-first; see §1.6.6
    Interop/
      Mathlib/                         Mathlib's carriers register as models, once
  Theory/                              uniqueness-up-to-isomorphism per interface;
                                        the embedding chain; the N1-N0 shift
  Notation.lean                        scoped names for designated default models

  PeanoSystem.lean                     router; generic axioms, no number system selected
  PeanoSystem/                         see §1.6.10 — shared by both natural-number bases
    Interface/                        no Realization.lean — Peano is itself generic-layer
      Signature/
        Definition.lean                 one constant, one unary operation; IsAlgebraic
      ModelTheory/
        Model.lean
        Axioms.lean                     the induction schema, second-order (Henkin)
        Satisfaction.lean
    Induction/
    Recursion/
    Categoricity.lean                  any two models are isomorphic — feeds Theory/

  NaturalNumbersZeroBased.lean         router for this system; no construction selected
  NaturalNumbersZeroBased/
    Interface/                        this system's obligations; see §1.6.2
      Signature/
        Definition.lean                 operations and constants only; IsAlgebraic
      ModelTheory/
        Model.lean                      the Model witnessing this system's Interface
        Axioms.lean                     the full signature: order relation + induction
        Satisfaction.lean                proof the Model satisfies the Axioms
      Realization.lean                 "our models satisfy the generic interface"
    Constructions/
      VonNeumann/                      the §1.6.1 pipeline, one directory per construction
      ...
    Algebra/                           instances into LRA.AlgebraicStructures; see §1.6.5
    Examples.lean
    FailureModes.lean
  NaturalNumbersOneBased/  Integer/  Rational/  Real/  ExtendedReal/  ...
```

**Layer 1 — the generic interface** (`NumberSystems/Interface/`) states what it
means to be *a* real number, independent of any construction: the carrier, the
operations as capability classes, the law classes the operations must satisfy,
the order and its compatibility, and completeness where the system has it.
`LRA.Set` selects no set ontology and exposes capability classes a backend may
register (`HasComplement`, `HasUniversal`); copy that discipline here.

**Layer 2 — the system** (`NaturalNumbersZeroBased/`, `Real/`, …) owns the
proof that its constructions realize the generic interface, the algebra
instances, and the system-wide examples and failure modes. It selects no
construction.

**Layer 3 — the construction** (`Real/Constructions/Cauchy/`, …) runs the
§1.6.1 pipeline once per construction and registers into layer 2's interface.

Two consequences follow from stacking the layers this way, on top of the two
already stated for `LRA.Set`.

**Zero-based and one-based naturals are two interfaces, not one interface with
two backends.** N₁ has no zero and its recursion starts at one; N₀'s recursion
starts at zero. Neither is a model of the other's interface without an explicit
shift. Both are first-class: Landau's *Grundlagen* begins at 1, so
`NaturalNumbersOneBased` is the curricular object this series is faithful to,
while `NaturalNumbersZeroBased` is the one substitutable for Mathlib's `Nat`.
The shift isomorphism between their model categories is a theorem, stated once
in `NumberSystems/Theory/`, not a conversion function scattered per consumer.

**A theorem belongs at the layer where it stops depending on more than that
layer needs.** Anything provable from the generic interface belongs in
`NumberSystems/Theory/`. Anything true of every construction of the reals but
not of every ordered field belongs in `Real/`. Anything true only of the Cauchy
construction belongs in `Real/Constructions/Cauchy/`. A theorem stated at a
layer below where it actually lives is not wrong, it is filed one role too deep
— the same defect §7.5 names for concept directories, one level up.

### 1.6.1 Every construction follows the same pipeline, in the same order

Constructions differ in their carrier and their equivalence, not in the work
required to earn the name. The files below are that work, and they appear in this
order because each depends on the last. Do not reorder them and do not skip one
by folding it into a neighbour — a construction that proves well-definedness
inside its operations file has not made the obligation visible.

| File | Contents |
|---|---|
| `Carrier.lean` | the pre-carrier and the equivalence relation on it |
| `Equivalence.lean` | that the relation is an equivalence; the quotient type |
| `WellFoundedness.lean` | the induction and recursion principles the carrier supports |
| `Operations.lean` | the operations, defined on representatives |
| `WellDefinedness.lean` | each operation respects the equivalence and lifts to the quotient |
| `Laws.lean` | the interface's law classes, discharged |
| `Behavior.lean` | the operations compute as expected on the intended values |
| `Instances.lean` | registration into the system's `Interface/` (layer 2) |
| `Examples.lean`, `FailureModes.lean` | quarantined leaves, as everywhere |

`Behavior.lean` is the file that is easy to omit and worth insisting on. `Laws`
proves the operation is associative; `Behavior` proves it is the operation you
meant — that the successor of the class of zero is the class of one, that
addition on the integers restricts to addition on the naturals along the
embedding. A construction can satisfy every law and still be the wrong function.

**Work through equivalence classes throughout.** The quotient is the number
system; the representatives are scaffolding. State the operations on
representatives, prove they descend, and state everything downstream on the
quotient. A theorem stated on representatives that never descends is a theorem
about pairs, not about integers.

### 1.6.2 A system's model obligation is one proof, using `LRA.AlgebraicStructures`'s standardized shape

"Realizes the generic interface" (layer 2's job, §1.6) is not two separate
proofs — an algebra proof and an L-structure proof. `LRA.UniversalAlgebra`
already states why: *"an algebraic signature is a `Signature` with no
relation symbols, an algebra is a `Model` of it"* (`UniversalAlgebra/Algebra/Definition.lean`).
There is one proof object, a `LRA.Logic.FirstOrder.Model` over the system's
signature, and "algebraic" names a special case of it, not a second machine.

A number system's full signature needs more than the algebraic part supplies:
the order is a relation symbol, and full induction is a second-order schema
(`LRA.Logic.Model.SecondOrderMonadic` — Henkin models — is the existing
machinery for exactly this). So the signature splits in two, and both halves
are proved from the same model:

- the **algebraic sub-signature** — function and constant symbols only, the
  operations and distinguished elements — feeds `Algebra/`'s
  `LRA.AlgebraicStructures` instances (§1.6.5);
- the **full signature** — the algebraic part plus the order relation — carries
  the axioms, including induction, and is what "is a model of the generic
  interface" actually means.

Use the `Interface/` shape §1.7 standardizes for `LRA.AlgebraicStructures`,
rather than inventing a second one here. An earlier draft of this section
claimed every `AlgebraicStructures` concept already carried this shape; a
census found only 14 of 30 had a `ModelTheory/` group at all, and the
`AlgebraicSignature/` folders that do exist are a plain operation record, not
the `Signature`-with-no-relations `UniversalAlgebra` means by that name — two
things sharing a name, not one shape to copy. §1.7 fixes that first; a
system's `Interface/` (layer 2) is a consumer of the fixed shape, not a second
draft of the broken one:

```
NaturalNumbersZeroBased/Interface/
  Signature/
    Definition.lean        -- function + constant symbols only; IsAlgebraic
  ModelTheory/
    Model.lean               -- the Model witnessing this system's Interface
    Axioms.lean               -- the full signature's laws: order relation + induction
    Satisfaction.lean          -- proof the Model satisfies the Axioms
  Realization.lean          -- ties the two into "realizes NumberSystems.Interface.X"
```

A layer-3 construction discharges this once, in its `Instances.lean`
(§1.6.1), by exhibiting the `Model`. `Algebra/`'s instances are then read off
that same model's algebraic sub-signature, not reproved independently — one
model, two readings. `Realization.lean` is the one file this shape carries that
§1.7's own use of it inside `AlgebraicStructures` mostly does not: a system
realizes something outside itself; `AlgebraicStructures`'s own concepts
usually do not, per §1.7.3.

### 1.6.3 Mathlib substitutability is proved once per interface, not once per construction

Every generic interface carries `Interface/Interop/Mathlib/`, and its
obligation is stronger than the adapters elsewhere in the repository: our reals
must be *substitutable* for Mathlib's `ℝ`, not merely convertible. Prove it at
the interface, not at each construction, using two facts instead of a hand-built
round trip:

1. **Mathlib's carrier is a model.** `Interop/Mathlib/Instances.lean` registers
   `ℕ`, `ℤ`, `ℚ`, `ℝ`, `EReal`, … as models of the matching generic interface.
2. **Any two models of the interface are uniquely isomorphic.** The universal
   property in `NumberSystems/Theory/` — already the shape of the existing
   `IntegerUniversalProperty`/`RealUniversalProperty` obligations, which state
   that a selected model is initial among models of the same signature.

Substitutability for any construction then **follows by composition**: a
construction proves it is a model of the system's interface (layer 2), the
system's interface proves it realizes the generic interface (layer 1), and the
uniqueness theorem supplies the isomorphism to Mathlib's model. No construction
writes its own `toMathlib`/`fromMathlib` pair. This is the same economy `LRA.Set`
gets from stating theory once against `Interface/` rather than once per backend,
applied to interop specifically: five constructions of the reals need the
uniqueness theorem proved once, not five round trips.

Register a per-construction `Interop/Mathlib/` **only** when a construction
carries structure the generic interface does not see — Cauchy reals map to
Mathlib's Cauchy-sequence completion specifically, and that correspondence is
extra information, not a substitute for the composed proof. Default to none.

Mathlib import is permitted in `Interface/Interop/Mathlib/` at every layer and
nowhere else in `Interface/`, `Theory/`, or `Constructions/`, per §6.

### 1.6.4 Examples are written once and instantiated per construction

An example that names a construction teaches that the construction matters. Most
of the time it does not. Write the example against the interface inside a
`section` with `variable` binders for the carrier and its instances, then
instantiate it at each construction in a following section.

That is what makes "the same arithmetic, over Peano naturals and over Presburger
naturals" expressible as one body of text with two instantiations, and it is
where a reader sees that the theory did not depend on the choice. Where a result
*does* depend on the construction — Presburger and multiplication again — the
example instantiates at one construction and says which, and the corresponding
`FailureModes.lean` shows the other failing.

Examples and failure modes may import Mathlib, as everywhere.

### 1.6.5 The algebra folder discharges instances; it does not restate structure

`Real/Algebra/` proves that the reals form a `LRA.AlgebraicStructures.CompleteOrderedField`
— an `instance`, not a re-derivation. "The reals are a group" is not owed a
second proof: it is what a `CompleteOrderedField` *is*, by the tower's own
inheritance (`Field → CommutativeRing → Ring → Group → …`), and restating it
would duplicate `LRA.AlgebraicStructures`'s work rather than use it. Each
system discharges the strongest structure it has and gets everything above for
free:

| System | Strongest instance discharged |
|---|---|
| N₀, N₁ | `CommutativeSemiring`, plus well-ordering |
| Z | `IntegralDomain`, `LinearlyOrderedRing` |
| Q | `LinearlyOrderedField` |
| R | `CompleteOrderedField` |
| C | algebraically closed field — no compatible order, see §1.6.6 |

If a proof in `Algebra/` does not bottom out in an `instance` of an
`LRA.AlgebraicStructures` class, it restates a structure and belongs upstream in
that subject instead. This is the same dependency direction §1.4 already
requires: `NumberSystems` depends on `AlgebraicStructures`, never the reverse.

### 1.6.6 The extended reals are order-first, not field-first

`ℝ̄` is not a field: `∞ - ∞` has no principled value, and every arithmetic
convention — Mathlib's `EReal` included — assigns the undefined cases by
stipulation rather than derivation. What `ℝ̄` genuinely is: a complete lattice
and a complete linear order, with arithmetic layered on afterward as
capability classes carrying their conventions as explicit hypotheses or
explicit junk values, never silently.

So `ExtendedReal`'s generic interface leads with the order-completeness
obligations `Real`'s does, and its arithmetic capability classes are optional
the way `LRA.Set`'s `HasUniversal` is optional — present, but not assumed by the
order theory beneath them. Its `Algebra/` folder proves the lattice and
order instances; it does not attempt a ring instance, because there is none.

`FailureModes.lean` proving `ℝ̄` is not a group under `+` is one of the more
instructive negative results this row produces, not an embarrassment to route
around — see §1.6.7.

### 1.6.7 The failure-mode ladder

Each system fails to be the next structure up, and each failure is a named
classical theorem, not an aside:

| System | Fails to be | Because |
|---|---|---|
| N₀, N₁ | a group under `+` | no additive inverses: `1 + x = 0` has no solution |
| Z | a field | no multiplicative inverses: `2 * x = 1` has no solution |
| Q | complete | `{q : q^2 < 2}` is bounded above with no supremum |
| R | countable | Cantor's diagonal argument |
| ExtendedReal | a group under `+` | `∞ - ∞` is not well-defined |
| C | linearly ordered | `i^2 = -1` is compatible with neither `i > 0` nor `i < 0` |

Each is quarantined per §6 and free to use Mathlib and `section`s under the
existing rules. Pair each with the example that shows what *does* transfer
across constructions at that system, per §1.6.4 — the example is the theory's
reach, the failure mode is its boundary.

### 1.6.8 Notation: instances first, names second

**Operators need no custom notation.** `+ * ^ ≤` and numeral literals come from
Lean core's `Add`, `Mul`, `Pow`, `LE`, `OfNat` — no Mathlib dependency, so the
quarantine is unaffected. Each construction registers these instances in its
`Constructions/*/Instances.lean` once the operations are proved well-defined;
after that, `(2 : ThatCarrier) + 2` works with no further notation work. This is
most of what "register `LRA_R` and make `+ * ^` work" is asking for, and it
falls out of §1.6.1 rather than requiring a notation layer.

**A name like `LRA_R` names a designated default model**, not the interface —
`R` is an interface with several models, and a bare name has to pick one. State
the choice as a `def` (`def LRA_R := Real.Constructions.Cauchy.model`, or
whichever is chosen) with a doc-comment citing the uniqueness theorem of §1.6.3
as the justification that the choice is legitimate rather than arbitrary: any
other model would do, provably. Declare these in `NumberSystems/Notation.lean`,
scoped (`scoped notation` or a `namespace ... open scoped`), so they never
collide with Mathlib's `ℝ` inside the `Interop` and `Examples` files that have
both open. Whether the spelling is ASCII (`LRA_R`) or Unicode (`ℝᴸ`) is free
under §3.3; pick one convention and hold it across every system.

### 1.6.9 The interface replaces the switch

`LRA/VolumeII/Switches/` selects an active Mathlib-backed carrier globally, and
downstream arithmetic imports the switch to inherit that choice. That is the
wrong shape for a repository with several constructions per system: it makes
the choice once, for everyone, at import time, and it cannot express a theorem
that holds over every natural-number construction.

The interface makes the choice per section instead of per repository, so the
switch is retired by this row and its consumers move to interface binders. Note
that three Volume II arithmetic modules were routed *through* the switch while
restoring the Mathlib quarantine; that was correct against the design in force
at the time and is transitional. This row supersedes it.

### 1.6.10 Peano systems are a generic axiomatic characterization, not a sixth number system

The Peano axioms — one distinguished element, one unary successor operation,
closed under an induction schema — do not belong to any one construction of
the naturals. Both bases (§1.6) are models of a shifted or unshifted form of
the same axioms, so the axioms are prior to the choice of base and belong at
the generic layer, beside the interfaces they characterize:

```
LRA/NumberSystems/PeanoSystem.lean          -- router
LRA/NumberSystems/PeanoSystem/
  Interface/                                -- no Realization.lean; Peano is generic-layer
    Signature/
      Definition.lean                        -- one constant, one unary operation; IsAlgebraic
    ModelTheory/
      Model.lean
      Axioms.lean                            -- the induction schema, second-order
                                                 via LRA.Logic.Model.SecondOrderMonadic
      Satisfaction.lean
  Induction/
  Recursion/
  Categoricity.lean                          -- any two models are isomorphic
```

No `Examples.lean` or `FailureModes.lean` here: Peano's induction and
recursion have no worked instance or negative result of their own to show —
those appear once a concrete system (N₀, N₁) exercises them, in that system's
own quarantined leaves, not duplicated at the generic layer that states the
axioms.

`Induction/` and `Recursion/` are folders rather than files from the start,
per §2.3's folder-by-default rule — each carries the schema itself, the
recursion theorem, and whatever lemmas support them, and that volume is not
yet known precisely enough to bet on a single file.

`PeanoSystem/Categoricity.lean` is where the uniqueness-up-to-isomorphism
theorem of §1.6.3 is actually **proved**, for the natural-number case
specifically. Other systems get theirs from `LRA.AlgebraicStructures`'s own
universal-property machinery instead — `CompleteOrderedField`'s initiality for
the reals, an integral domain's for the integers. `NumberSystems/Theory/` cites
both; it proves neither from scratch.

`NaturalNumbersZeroBased/Interface/Realization.lean` (and `OneBased`'s) then
reads as: *our construction is a model of `PeanoSystem`'s axioms, shifted or
unshifted as the base requires* — not a restatement of Peano's axioms once per
base. This is also why zero-based and one-based naturals are two models of one
axiomatic characterization rather than two characterizations: `PeanoSystem`
is shared; only the shift differs, and the shift isomorphism itself lives in
`NumberSystems/Theory/` per §1.6.

### 1.7 `LRA.AlgebraicStructures` gets the same `Interface/` shape, standardized

§1.6.2 leans on `LRA.AlgebraicStructures` already carrying a consistent
signature-and-model-theory convention. It does not: a census of the 30 concept
directories found `AlgebraicSignature/` in all 30, but `ModelTheory/` in only
14, and the file sets inside the ones that do have it differ concept to
concept (`Group`'s five files are not `CompleteOrderedField`'s four). Worse,
`AlgebraicSignature/ConceptSignature.lean` is a plain operation record —
`structure GroupConceptSignature extends MonoidConceptSignature where inverse : ...` —
not the `Signature`-with-no-relation-symbols `LRA.UniversalAlgebra` means by
"algebraic signature." Two unrelated formalizations share a folder name. This
row fixes the shape once, before any subject — `NumberSystems` included —
builds against it.

### 1.7.1 `Interface/` is the concept's definitional home, not only a realizer's

`Interface/` does not mean "what this realizes" — most `AlgebraicStructures`
concepts realize nothing outside themselves; they are what other subjects'
`Realization.lean` files point *at*. It means "the folder holding what defines
this concept's vocabulary and model theory," and that job exists whether or
not there is an outer interface to satisfy. Every concept gets the same two
required parts and one optional third:

```
Group/
  Definition.lean            -- the working type: structure Group (X) extends Monoid ...
  Interface/
    Signature/
      Definition.lean          -- the LRA.Logic.Signature; IsAlgebraic
    ModelTheory/
      Model.lean                -- builds the LRA.Logic.FirstOrder.Model
      Axioms.lean                 -- the laws, as sentences over the signature
      Satisfaction.lean            -- proof the Model satisfies the Axioms
    Realization.lean           -- present only where this concept realizes something
                                   outside itself; most AlgebraicStructures concepts omit it
  Theorems/  Characterizations.lean  Consequences/  Relationships/
  Examples/
```

`Definition.lean` and `Interface/Signature/Definition.lean` are two
presentations of the same concept, kept apart the way §1.2 keeps the arrow and
the set-theoretic triple apart: the first is the working type code proves
things about; the second is the signature the model theory reasons *about*.
Reusing the leaf name `Definition.lean` at both paths is intentional, not a
collision — each directory owns its own instance of the role vocabulary, the
same way it already does everywhere else in §2.3.

### 1.7.2 `ModelTheory/` is exactly three files

`Model.lean`, `Axioms.lean`, `Satisfaction.lean` — no concept carries more,
none carries fewer once it has this group at all. What `Group/ModelTheory/`
currently calls `NativeEquivalence.lean`, `Consequences.lean`,
`FirstOrderReduct.lean`, and `FirstOrderLimitations.lean` (`CompleteOrderedField`'s
name for the same idea) are all comparisons *between* concepts or *between* a
concept's model theory and native Lean structures — exactly what §2.3 already
names `Relationships.lean` for. They move to the concept's own top-level
`Relationships/`, not to a fourth `ModelTheory/` file. Do not grow this group
past three; a concept that seems to need a fourth file has found a
relationship, a theorem, or a consequence, and has a role for it already.

### 1.7.3 `Realization.lean` is optional, and rare here on purpose

Not every model realizes an outer interface. `LRA.AlgebraicStructures`'s
concepts mostly do not — `Group` is foundational, not a realization of
something else — so most of them will never have a `Realization.lean`, and
that absence is correct, not a gap to fill. Where a `Realization.lean` does
belong here (a concept restated in terms of a more general one already in the
tower, if that ever earns its own proof rather than following from `extends`)
it carries the same job it carries in `LRA.NumberSystems`: name the interface
being realized, name the proof, nothing more.

### 1.7.4 No `FailureModes.lean` in `AlgebraicStructures` concepts

A group does not fail to be a group — it is definitionally one or it is not,
and "this candidate tried to satisfy `Field` and fell short" is a fact about
the candidate, not about `Field`. §1.6.7's failure-mode ladder already places
that content where it belongs: at the site of the candidate (`NumberSystems`),
not the site of the structure it fails to be. Delete the top-level
`FailureModes.lean` these concepts currently carry; it is not merely excluded
from the new `Interface/` folder, it has no home in the concept at all.

The one case this could be mistaken for — "not every group is abelian" — is
not a failure mode either. `AbelianGroup` is `Group` plus one law; the
interesting content is a concrete non-abelian group, and that is exactly what
`Examples.lean` is for: a witness distinguishing two structures in the tower,
not a candidate that tried and failed.

`Examples.lean` stays, unchanged, at the concept's top level.

### 1.7.5 Delete `All.lean` and `AllWithExamples.lean`; rebuild the aggregators

§2.3 already forbids these inside a concept directory — aggregation is the
group router's job. `AlgebraicStructures` predates that rule reaching it.
Delete both from every concept and rebuild each concept's router
(`LRA/AlgebraicStructures/<Concept>.lean`) clean: it imports the core roles
(`Definition`, `Interface`, `Theorems`, `Characterizations`, `Consequences`,
`Relationships`) and nothing from `Examples/` or the deleted `FailureModes`,
per the ordinary quarantine rule in §6.

This interacts with §7.4's still-open item: the ~320 quarantined-leaf modules
need a Lake target of their own, since `LRATests` cannot root them. Deleting
`AllWithExamples.lean` here removes the path that was standing in for that
target. Resolve §7.4's item before or alongside this row, not after — a
concept's `Examples/` should not go unbuilt in the gap.

### 1.7.6 The set-theoretic tuple, and where "becomes" lives — bonus, not required

`LRA.Function` states two presentations, the arrow and the set-theoretic
triple, meeting at one bridge theorem (§1.2). `AlgebraicStructures` concepts
can take the same treatment: `Definition/SetTheoretic.lean`, stating the
concept as an actual tuple over `LRA.Set.PredicateSet` — `Group` as
`(X, ·, e, ⁻¹)` with `X : PredicateSet Carrier`, not merely a typeclass.

This is also the natural home for showing the tower's "becomes" relation as
content rather than as `extends` plumbing: "a monoid's tuple, plus an
inverse relation, becomes a group's tuple" is a genuine theorem about
set-theoretic structures, in a way `extends` cannot state — `extends` is how
Lean inherits fields, not a proof that the addition is exactly what turns
one structure into the next. Prototype this on `Monoid → Group` — the
smallest possible step — before deciding whether it generalizes up the rest
of the tower. Bonus points, as scoped; it does not block §1.7.1–§1.7.5.

## 2. File and module structure

### 2.1 The canonical shape

```text
LRA/<Subject>.lean                                    subject router
LRA/<Subject>/Definition.lean                         the subject's core notion
LRA/<Subject>/<Group>.lean                            group router
LRA/<Subject>/<Group>/<Concept>/Definition.lean       one concept
LRA/<Subject>/<Group>/<Concept>/Theorems.lean         its theorems
LRA/VolumeN.lean                                      curricular aggregator only
```

A subject router imports its group routers and nothing else. A group router
imports its concept files and nothing else. Routers carry a `/-! … -/` module
comment explaining the group's role and carry **no declarations**.

### 2.2 Group vocabulary

Use these group names wherever they apply, so subjects read alike:

| Group | Contents |
|---|---|
| `Definition` | the subject's own core notion (a file, not a directory) |
| `Canonical` | distinguished instances: identity, empty, universal, diversity |
| `Properties` | predicates on the subject's objects |
| `Structures` | named bundles: equivalence, partial function, lattice |
| `Operations` | constructions producing new objects of the subject |
| `Calculus` | domain, range, image, preimage, fiber, restriction, evaluation |
| `Laws` | algebraic law classes and their certificates |
| `Interop` | adapters to Mathlib or to Lean core (see §2.6) |
| `Morphisms` | the subject's bundled structure-preserving maps |
| `Constructions` | realizations of an interface, one directory each (see §1.6.1) |
| `Interface` | the obligations a realization must discharge |
| `Theory` | theorems stated against an `Interface`, inherited by every realization |

`Constructions`, `Interface`, and `Theory` travel together and belong to any
subject with more than one realization of the same notion. `LRA.Set` uses them
in two layers: `Interface/` is the interface, `SetClass/` is the theory, and
`PredicateSet/`, `ZFC/`, `ZFCSet/` are the constructions. `LRA.NumberSystems`
needs a third layer, because two same-shaped objects can differ in signature
rather than only in backend — see §1.6 — so it repeats the group at both the
generic level and the per-system level: `NumberSystems/Interface/` alongside
`Real/Interface/`, `NumberSystems/Theory/` alongside a system's own theorems. A
subject with a single realization needs none of them.

Subject-specific groups are allowed when the mathematics demands one — `Order/Bounds`,
`Set/Interface`, `Identity/Axioms`, `Function/SetTheoretic`. Do not invent a
group where a listed one fits.

### 2.3 File roles

A concept directory uses these leaf filenames. Only `Definition.lean` is
mandatory; add the others when the concept has that kind of content. Do not
invent new role names.

| File | Contents |
|---|---|
| `Definition.lean` | definitions, abbreviations, structures, classes |
| `Theorems.lean` | theorems about this concept alone |
| `Characterizations.lean` | equivalent formulations (`iff` statements) |
| `Consequences.lean` | corollaries following directly from the theorems |
| `Relationships.lean` | theorems relating this concept to a *sibling* concept |
| `Examples.lean` | worked instances at concrete carriers |
| `FailureModes.lean` | counterexamples and negative results |
| `Instances.lean` | typeclass instances for a backend |

A directory under a `Constructions` group uses a different, equally fixed set of
roles, listed in §1.6.1: `Carrier`, `Equivalence`, `WellFoundedness`,
`Operations`, `WellDefinedness`, `Laws`, `Behavior`, `Instances`. Those are the
stages of earning the name, they appear in that order, and they are not
interchangeable with the roles above. A construction directory carries the
construction roles; a concept directory carries the concept roles; neither mixes.

`Examples.lean` and `FailureModes.lean` are **quarantined leaves**: no core
`Definition.lean`, `Theorems.lean`, `Characterizations.lean`,
`Consequences.lean`, `Relationships.lean`, or router may import them. See §6.
They are the one pair common to both role sets.

**A role file may be present and empty.** The layout above is the canonical
shape of a concept, and a concept that will acquire theorems is allowed to carry
`Theorems.lean` before it has any. An empty role file holds a single import of
the concept's current chain tail, so the module is well-formed and the group
router can import it by name, plus its one-line doc header. That import is
scaffold, not a re-export, and §7.0.1's ban on forwarding files does not reach
it: the file is named for the role it will hold, it is imported by the router
rather than standing in for a moved name, and nothing is aliased through it.

Never delete a role file for being empty, and never route around it. An empty
`Theorems.lean` next to a heavy `Consequences.lean` is a signal that the
concept's theorems were filed one role too deep — the fix is to move the
declarations up into the empty file, not to remove the file. See §7.5.

**Any role file may be promoted to a role folder**, once its content
outgrows one file. This is not a special case: it is the same router-plus-
directory duality §2.1 already uses for a subject (`LRA/<Subject>.lean` +
`LRA/<Subject>/`) and for a group (`LRA/<Subject>/<Group>.lean` +
`LRA/<Subject>/<Group>/`), applied one level deeper. `Theorems.lean` becomes
`Theorems.lean` (a router, holding no declarations, only imports and the
usual doc-comment) plus `Theorems/` (a directory of topic-named files, split
however the content actually divides). The role's identity comes from the
router's position, not from the leaf name inside the folder, so nothing
downstream that imports `Theorems.lean` has to change when this happens.

Prefer the folder from the start whenever the eventual content size is
genuinely unknown, rather than waiting for a file to become unwieldy and
promoting it under pressure. The direction that costs nothing is collapsing a
thin folder back to one file — concatenate and delete, a mechanical edit with
no proof content at stake. The direction that costs something is promoting a
fat file to a folder after the fact, which means re-deriving where each
declaration goes. Default to the folder; only default to the bare file when a
role is reliably thin across the whole subject (a single `iff` statement in
`Characterizations.lean`, most `Definition.lean`s outside the structures that
are themselves the subject). This is also why the rule is stated as a default
rather than a per-file judgment: a default is what a script can apply, a
judgment call is not.

Do not create `All.lean` or `AllWithExamples.lean` inside a concept directory.
Aggregation is the group router's job.

### 2.4 Interoperability lives with its subject

There is no top-level `LRA.Interop`. Each subject owns its own adapters under an
`Interop` group, following the shape already established by `LRA/Set/Interop`:

```text
LRA/<Subject>/Interop.lean
LRA/<Subject>/Interop/Mathlib.lean
LRA/<Subject>/Interop/Mathlib/<Backend>.lean
LRA/<Subject>/Interop/Mathlib/<Backend>/Instances.lean
LRA/<Subject>/Interop/Mathlib/<Backend>/Laws.lean
LRA/<Subject>/Interop/Lean.lean            adapters to Lean core
```

Namespaces follow the paths: `LRA.Set.Interop.Mathlib.PredicateSet`,
`LRA.Order.Interop.Mathlib`, `LRA.Identity.Interop.Lean`.

Siting adapters with their subject keeps the direction of dependency honest —
the adapter imports both the LRA notion and the Mathlib one, and nothing that
is not doing interoperability ever imports it. A central `LRA.Interop` would
force unrelated subjects to share an import surface.

Migrate `LRA/VolumeVII/WithMathlib/` and any `MathlibAdapters.lean` or
`MathlibBridge.lean` leaf into the owning subject's `Interop` group.

### 2.5 Notation

Notation that belongs to one subject is declared in that subject, in a
`Notation.lean` file inside the group that owns the symbols.

A symbol used across two or more subjects is declared once in a root
`LRA/Notation.lean`, which every subject may import and which imports nothing
but Lean core. Create that file only when a genuinely cross-subject symbol
exists; do not create it empty.

Scope notation with `scoped notation` unless the symbol is unambiguous
repository-wide. Never introduce a symbol that shadows a Lean core or Mathlib
notation that the same file also uses.

### 2.6 Volume aggregators

`LRA/VolumeN.lean` imports subject routers or leaf modules to reproduce
curricular order. It owns nothing. `LRA/VolumeN/` directories must not survive
as homes for durable declarations; migrate their contents into subjects and
delete the directory once empty.

### 2.7 Import discipline

- A subject router may import leaf modules of another subject.
- A leaf module must never import a volume aggregate.
- A leaf module must never import a router of its own subject.
- Imports must respect the chain: `Relation` must not import `Function`;
  `Function` must not import `Morphism`.
- Every module is reachable from at least one Lake target. A module compiled by
  no target is not "written", it is unverified.

---

## 3. Naming conventions

### 3.1 Declarations

| Kind | Convention | Example |
|---|---|---|
| Type, structure, class, abbreviation | `PascalCase` | `SetTheoreticFunctionTriple` |
| Proposition-valued definition | `PascalCase` | `Injective`, `IsSetTheoreticFunction` |
| Theorem | `PascalCase`, a readable claim | `EvaluationUnique`, `SupremumIsUpperBound` |
| Term-level value or constructor function | `camelCase` | `pureEqualityLanguage` |
| Structure field | `camelCase` | `graph`, `singleValued` |
| Typeclass instance | anonymous unless a name aids search | |

A `PascalCase` type paired with a `camelCase` value of that type is the intended
Lean convention and is the only permitted case-insensitive name collision. Two
declarations of the *same* kind must never differ only by case; if the pair is
generic-versus-instantiated, prefix the instantiation (`ActiveGaussianInteger`,
`ActiveGaussianArithmeticRingModel`).

Never encode the volume in a declaration name. Never abbreviate a subject name.

### 3.2 Binders

Use descriptive `PascalCase` binders for types and `camelCase` for values.
**Do not use Greek letters for type binders in new or migrated code.**

```lean
-- required
theorem ComposeApply {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle)
    (input : Domain) : …

-- not acceptable in new code
theorem ComposeApply {α β γ : Type u} (g : … ) (f : … ) (x : α) : …
```

Standard binder names: `Domain`, `Codomain`, `Middle`, `Carrier`, `Element`,
`Source`, `Target`, `Index`, `SetObject`, `Pair`. When a type has no role beyond
being a carrier, use `Alpha`, `Beta`, `Gamma` — spelled out, not `α`.

The repository is currently split (14 files using `(α : Type u)`, 17 using
`(Domain : Type u)`). Converge on the descriptive form.

### 3.3 Notation

Use Unicode for logic and set notation. The repository is currently split; this
settles it.

| Use | Not |
|---|---|
| `∀` | `forall` |
| `∃` | `exists` |
| `→` | `->` |
| `∧` | `/\` |
| `∨` | `\/` |
| `¬` | `Not` (as a prefix in statements) |
| `↔` | `<->` |
| `∈`, `⊆`, `∪`, `∩` | ASCII spellings |

Current split to converge: `forall` 41 files vs `∀` 72; `->` 50 vs `→` 55;
`∧` is already universal.

### 3.4 Universes

Declare `universe` variables at the top of the namespace. Give a function's
domain and codomain **independent** universe levels wherever the mathematics
permits. Never collapse to a single universe for convenience.

```lean
universe u v

abbrev TypedFunction (Domain : Type u) (Codomain : Type v) := Domain → Codomain
```

---

## 4. Doc-comments

**Doc-comments are not required.** Do not write them as part of this migration,
and do not let a missing one block a move.

The architecture is still settling, and prose written against a declaration that
is about to move subjects is prose written twice. Comments will be added
mechanically once the subject layout is fixed, from the declaration name, kind,
and signature.

Rules while that is true:

- Never delete an existing doc-comment when moving a declaration. Carry it
  across unchanged.
- The `**[Kind — Name]**` display-name marker is **not** the standard. Six of
  311 promoted files use it; do not add it to new work. Whether it returns is a
  later decision for blueprint generation.
- Do not write a `Logical form:` block that restates the signature verbatim. It
  duplicates the declaration and drifts; several in the repository are already
  stale and one is corrupted past reading. Delete such a block when you touch
  the declaration for another reason.
- Module-level `/-! … -/` comments **are** required on every router, and state
  what the group owns and what it deliberately does not. These are the comments
  that carry architectural intent and cannot be generated.

`scripts/lint_doccomments.sh` has been changed to match: it reports coverage and
exits 0. `LRA_DOCLINT_STRICT=1` restores the failing behavior for the eventual
mechanical pass. Note that the linter previously aborted at the first file with a
finding because of `set -e`, so its historical counts were wrong — the true
figure is 990 declarations across 100 files, not 8.

## 5. Proof policy

Every theorem is stated and left `sorry`. Do not prove anything.

```lean
theorem ComposeValue … : … := by
  sorry
```

State the theorem with the hypotheses the mathematics actually requires — not
the hypotheses that would make a proof easy, and not fewer than the statement
needs to be true. A `sorry` under a false statement is worse than no statement.

Use `section` for shared `variable`, hypothesis, notation, and `set_option`
blocks. A `section` does **not** hide names: use `private` or an explicitly
internal namespace when a name must stay out of the public API.

### 5.1 Tracking file: `ProofOrder.md`

Every subject with theorem content owns exactly one tracking file,
`LRA/<Subject>/ProofOrder.md` (a subject that spans multiple systems, e.g.
`NumberSystems`, owns one per system: `LRA/NumberSystems/<System>/ProofOrder.md`).
There is no second, differently-named tracking file: do not introduce a
sibling `ProofsToDo.md`, `TheoremIndex.md`, or similar — extend
`ProofOrder.md` itself.

`ProofOrder.md` serves both purposes a construction-heavy subject needs:

- **Narrative order** — why one construction or stage precedes another
  (a Cauchy-before-Cantor rationale, a staged §1.6.1 pipeline's reasoning),
  in prose, as already practiced in `RealNumbers/ProofOrder.md`,
  `Integers/ProofOrder.md`, etc.
- **A per-theorem completion ledger** — every theorem/lemma the subject
  owns, listed in dependency order (topologically, where a real dependency
  graph is available; by file order otherwise), each entry giving:
  - the theorem's name;
  - its statement in raw predicate-calculus notation (∀/∃/¬/∧/∨/→/↔/=,
    `f(x)` application) — not Lean syntax;
  - a status line, `**Status: COMPLETE**` or `**Status: PENDING**`,
    determined from Lean's own axiom-dependency check (`#print axioms`,
    or its programmatic equivalent) rather than inferred from doc
    comments, which can drift out of sync with the actual proof state.

A subject with no theorems yet (a pure placeholder router, e.g.
`LRA.EuclideanSpace` before its first concept lands) has no `ProofOrder.md`
until it has content to track — this mirrors §1.1's "create a subject only
when it owns durable declarations."

---

## 6. Mathlib quarantine

Volume I and Volume II core mathematics is bare Lean. Mathlib is confined to:

- `Examples.lean` and `FailureModes.lean` leaves
- `MathlibAdapters.lean` and `MathlibBridge.lean`
- an `Interop/` group
- the deliberately Mathlib-backed set backends

`scripts/check-mathlib-imports.py` is the authority. `make check` must invoke it
rather than any inline grep. When a directory is renamed, update the allow list
in the same change — a stale allow-list path silently disables the gate.

No core `Definition.lean`, `Theorems.lean`, or router may import a quarantined
leaf. Quarantined leaves must still be compiled: import them from a test-library
module so they stay under a build gate without entering the production
aggregates.

Keep Mathlib adapters explicit and local. Do not install competing global
instances where a local `letI` or an explicit conversion theorem is the policy.

---

## 7. The migration work

### 7.0 First: audit the previous migration and delete its shims

**Do this before touching anything else, and report the result before
continuing.** An earlier migration was instructed not to leave compatibility
aliases and left a large layer of them anyway. Until it is removed, every
subsequent measurement of "one canonical owner" is wrong, because each aliased
name has two.

Verify each of the following on the current branch and record counts before and
after:

**A. The `LRA.Set.Enderton` alias surface.** `LRA/Set/ZFC/Compatibility.lean`
declares `namespace LRA.Set.Enderton` as a "temporary compatibility surface for
the pre-standardization Enderton namespace", and 24 files carry that namespace
with roughly 84 `abbrev` aliases pointing at `LRA.Set.ZFC.*`. Delete the whole
surface, including the per-theorem "Compatibility aliases for the historical
Enderton … names" sections in `LRA/Set/ZFC/**/Theorems.lean`. Repoint every
consumer at the canonical `LRA.Set.ZFC` name.

**B. The old `LRA/VolumeI/Map/` alias tree.** Of its 28 `Definition.lean` files,
18 are pure aliases of the form

```lean
/-- Historical typed-map spelling of canonical function injectivity. -/
abbrev Injective (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.Injective (LRA.Function.OfTypedFunction map)
```

Delete them. Delete `LRA/VolumeI/Map.lean`, which describes itself as a
"compatibility/curricular aggregate for historical `Map` paths". The only
content of that tree that survives is the morphism material, which moves to
`LRA.Morphism` per §7.1.

**C. `Historical` markers inside the canonical subjects.** `LRA/Function/SetTheoretic/`
carries "Historical terminology", "Historical accessor", "Historical theorem
names", and "Historical extensionality theorem name"; `LRA/Set/ZFC/Public.lean`
carries one more. These are aliases living *inside* the new canonical subject,
which is worse than a shim in a legacy directory because nothing marks them as
temporary from the outside. Delete each and repoint its consumers.

**D. "Compatibility aggregate" routers.** `LRA/Function/Calculus/Definition.lean`
and `LRA/Function/Calculus/Theorems.lean` exist only to re-export. A group
router aggregates; a file named `Definition.lean` that defines nothing is a
shim. Fold them into the group router or delete them.

**E. Confirm the migration's substantive claims.** For each subject already
promoted, check that the promotion actually happened rather than being mirrored:
no declaration exists at both the old and the new path; the old path is deleted
rather than re-exporting; and the subject's router reaches every one of its
concept files.

Report, before doing any further work: the count of aliases found, the count
deleted, and any alias you propose to keep with the mathematical reason. An
alias kept for convenience is not a reason.

### 7.0.1 Standing rule: never generate a compatibility layer

This applies to this migration and to every future one.

- **Do not create an alias, re-export, or forwarding `abbrev` for a name you
  moved or renamed.** Move the declaration and update every consumer in the same
  change. This repository is small enough that a rename is a mechanical
  find-and-replace, and it is one commit either way.
- **Do not keep a directory alive to preserve its import path.** Delete it and
  fix the imports.
- **Do not add a file whose only content is re-exporting another file**, unless
  it is a router as defined in §2.1, which aggregates a group and is named for
  the group rather than for a file role.
- **Do not mark anything "historical", "legacy", "deprecated", "temporary", or
  "awaiting migration" in place of finishing the move.** Those words are a
  request for someone else to finish your work, and the evidence above is what
  happens when nobody does.
- If a move genuinely cannot be completed in one change, **stop and report the
  blocker** rather than landing a shim. A blocked move that is reported is
  recoverable; a shim that is landed becomes permanent.

The only permitted synonym is a **mathematically intentional** one — a second
name that mathematics itself uses for the same object, such as
`LRA.Order.TotalOrder` for `LRA.Order.LinearOrder`. Each must be justified in
the review by the mathematics, not by migration history.

### 7.0.2 Replace the relational-function design with the arrow plus the triple

`standardization` currently models a function as a typed structure bundling an
arrow with totality and single-valuedness proofs:

```lean
structure RelationalFunction (Domain : Type u) (Codomain : Type v) where
  graph : FunctionRelation Domain Codomain
  total : Total graph
  singleValued : SingleValued graph
```

This is neither presentation of §1.2. It is a third thing, and it costs:

- `Value` is `noncomputable`, defined by `Classical.choose (function.total input)`,
  so nothing evaluates and every application rewrite goes through a
  choice-extracted witness rather than definitional unfolding;
- every boundary with Lean core or Mathlib needs a conversion;
- `OfTypedFunction`, the conversion everything depends on, currently has both
  `total` and `singleValued` left as `sorry`.

The set-theoretic triple already models what this structure was reaching for,
and does it at the foundational layer where the theorems belong.

Required:

1. Make `LRA.Function` the arrow abbreviation, per §1.2.
2. Port the `LRA.Function.SetTheoretic` family from `main` (§1.5) — both triples,
   both conditions, both bundles, the evaluation theorems, extensionality, and
   the single representation theorem.
3. Delete `RelationalFunction`, `TypedFunction`, `OfTypedFunction`, `Graph` as a
   `RelationalFunction` constructor, `Value`, and every declaration whose type
   mentions `RelationalFunction`.
4. Restate the `LRA/Function/Properties/` predicates over the arrow. Where a
   predicate is genuinely the relation notion applied to a function graph, define
   it through `Graph` rather than restating the quantifier.
5. Update every consumer. Do not leave a conversion shim — §7.0.1 applies.

Report which `LRA/Function/` declarations survived, which were replaced by the
ported set-theoretic family, and which were deleted outright.

### 7.0.3 Judge a deletion by declaration, never by file or directory

A directory is not an alias because its `Definition.lean` is. Classify every
**declaration** you propose to delete, not the file or the folder containing it.

This is not hypothetical. §7.0 B classified twelve concept directories as
pure-alias by reading only their `Definition.lean`. For eight of them that
judgment was wrong about the rest of the directory: those twelve held **43
declarations outside `Definition.lean`**, of which **31 had no canonical
counterpart** and were deleted outright. The worst case, `Composition`, had a
one-line alias definition and fourteen real theorems behind it — associativity,
the identity laws, the property-composition and composite-implies-factor
theorems, and the inverse-composition family.

The alias test was correct for the definition and wrong for the directory.

So before deleting anything as redundant:

- enumerate the declarations, not the files;
- for each, name the surviving canonical owner **by fully qualified name**;
- a declaration with no named survivor is a **loss**, not a redundancy, and
  either gets restated in its canonical location or gets reported as a
  deliberate removal with a reason;
- `Relationships.lean`, `Consequences.lean`, and `FailureModes.lean` carry real
  content and are the files most likely to be swept along by a judgment made
  about `Definition.lean`.

A **role file inside a canonical concept directory** is out of scope for this
audit when it holds zero declarations. The rule above asks whether each
declaration has a surviving owner; a file with no declarations answers that
vacuously, which would make every empty role file deletable on a technicality.
It is not. Empty role files are canonical scaffold under §2.3.

That exemption is about scaffold, not about emptiness. It does **not** reach a
module that holds zero declarations because its contents were moved out, or
because it never held any and exists only to preserve an import path. In
particular, a zero-declaration module under `LRA/VolumeN/` is a shim: §7.0.1
requires it to be deleted and its importers repointed, and being empty is the
reason it goes, not a reason it stays. The test is location and intent —
scaffold sits in a canonical concept directory awaiting content, a shim sits on
a retiring path awaiting nobody.

A concept directory whose definition is an alias is exactly the case where the
theorems are *not* aliases: they were stated once, against the alias, and never
restated anywhere else.

**Sweep the alias surface separately, because it is not made of declarations.**
Enumerating declarations cannot find a shim that declares nothing. The §7.0
audit ran this rule and still left `LRA.Set.LRASet` in place — eight `Laws/`
files each ending in an `export` block re-exporting some fifty names out of
`LRA.Set.PredicateSet`, plus `abbrev LRASet := PredicateSet`, under doc-comments
naming it "compatibility vocabulary for the pre-standardization `LRASet` name".
Every declaration in those files had a canonical owner, so the audit passed
them; the alias surface sat beside the declarations rather than among them.

So run a second sweep for the constructs themselves, tree-wide:

- `export` in any form. A re-export is a shim unless the second namespace is a
  mathematically intentional synonym under §7.0.1, justified in the review by
  the mathematics.
- `abbrev` whose body is a single other name, and `notation`/`alias` doing the
  same.
- `open ... renaming`.
- Doc-comments containing *compatibility*, *pre-standardization*, *legacy*,
  *deprecated*, *historical*, or *awaiting migration*. Grep this literally, then
  discard the mathematical uses by hand — "order compatibility" and "operation
  compatibility" are real notions and dominate the raw hits.

Report the surviving surface by construct and by name, the same as declarations.

**Judging a single-name `abbrev` takes three buckets, not two.** The sweep finds
roughly forty distinct ones, and "is it mathematical?" does not separate them.
Ask instead what the second name does for a reader:

- **Synonym** — both names are standard for the same object, and which is apt
  depends on what is being said. `LRA.Order.TotalOrder` for `LinearOrder`;
  `LRA.Identity.EqualityRelation` for `LRA.Relation.IdentityRelation`, since
  relation theory names the diagonal for being the identity of composition and
  model theory names it for interpreting `=`. Keep, with the justification
  recorded on the declaration.
- **Notational abbreviation** — the equation is itself a statement worth seeing.
  `NullaryOperation Codomain := Codomain` says a nullary operation into a type
  is an element of that type. Keep.
- **False distinction** — the second name asserts a difference the definition
  does not make. `CommutativeRingConceptSignature := RingConceptSignature`
  invites the reader to expect two signatures where there is one. Delete and
  repoint, exactly as for a compatibility alias.

The third bucket is why this is not a formality. A compatibility alias merely
clutters; a false distinction teaches something untrue.


### 7.1 Gather into subjects

For each item below, move the declarations to the named owner, update every
consumer, delete the vacated module, and remove the old directory once empty.

| Move | From | To |
|---|---|---|
| morphism primitives (74 files) | `LRA/VolumeI/Map/Morphisms/` | `LRA/Morphism/` |
| function concepts (19 dirs × 7 files) | `LRA/VolumeI/Map/*/` | already superseded by `LRA/Function/` — delete |
| graph vocabulary | `LRA/VolumeI/Map/Graph/` | `LRA/Relation/Calculus/` and `LRA/Function/Definition.lean` |
| the triple layer only | `LRA/VolumeI/Map/SetTheoretic/` | `LRA/Function/SetTheoretic/` (§1.5 scope, nothing wider) |
| the set-backed image/preimage/fiber/inverse calculus | `LRA/VolumeI/Map/{Image,Preimage,Fiber,Inverse}/` | **audit against `LRA.Set.Interface.RelationSets` first — see §7.1.1** |
| remaining Volume I subjects | `LRA/VolumeI/{Logic,Set,Order,Operations,Relations,Identity,UniversalAlgebra,AlgebraicStructures}/` | the matching `LRA/<Subject>/` |
| Volume II number systems | `LRA/VolumeII/` | `LRA/NumberSystems/` |
| Volume III analysis | `LRA/VolumeIII/` | `LRA/Analysis/` |
| Volume IV spaces | `LRA/VolumeIV/` | `LRA/Analysis/*`, `LRA/Topology/`, `LRA/LinearAlgebra/` |
| Volume VI | `LRA/VolumeVI/` | `LRA/LinearAlgebra/`, `LRA.Internal.AbstractAlgebra` |
| Volume VII | `LRA/VolumeVII/` | the owning subject's `Interop/Mathlib/` group, `LRA.Internal` |

`LRA/VolumeI/Map/` must not exist when this is done. Delete
`LRA/VolumeI/Map.lean` rather than keeping it as a compatibility aggregate.

**Sequence the rows bottom-up in the dependency order of what is being moved.**
Before starting a row, compute which of the remaining rows it imports. Promote a
row only once everything it depends on is already promoted. Otherwise the
promoted subject lands importing an `LRA.VolumeN.*` path, which is a fresh
Volume dependency created *by* the migration and has to be unwound later.

For the three Volume I rows that remain, the arrows form a total order:

```
UniversalAlgebra     ->  Logic                (5 files)
AlgebraicStructures  ->  Logic                (6 files)
AlgebraicStructures  ->  UniversalAlgebra    (10 files)
```

so the order is **Logic, then UniversalAlgebra, then AlgebraicStructures**.
Do not sequence by how many import lines a row will repoint; repointing is the
same work in any order, while a wrong order manufactures dependencies.

**A subject router with no subject behind it is a shim.** §7.0.1 permits a
router because it aggregates a group; a file such as `LRA/Logic.lean`, whose
entire content is `import LRA.VolumeI.Logic`, aggregates nothing canonical and
is a forwarder wearing a router's name. Census a row by asking whether the
canonical *declarations* exist, not whether the canonical path resolves — an
absent `LRA/Logic/` directory beside a present `LRA/Logic.lean` is one row, not
two findings.

### 7.1.1 The set-backed function calculus is an audit, not a move

`LRA/VolumeI/Map/{Image,Preimage,Fiber,Inverse}/` holds roughly 100 theorems about
`HasSeparation`-built images, preimages, fibers, and inverses. Do **not** move them
wholesale, and do **not** create a new group to hold them.

`LRA/Set/Interface/RelationSets.lean` already owns that vocabulary at the relation
level, separation-built:

```text
DomainOf  RangeOf  ImageOf  PreimageOf  FiberOf  InverseOf
RestrictionOf  IsExtensionOf  GraphSetOf  IdentityOn  CompositionOf
IsSingleValued  IsFunctionalSet  IsTotalOn
```

So this is a duplicate-ownership question, not a placement question, and §1.2.1
already decides it: where a function concept is the relation concept applied to a
function graph, define it **through `Graph`** rather than restating it.

Sort every one of those declarations into exactly one bucket and report the
counts. Do not assume the proportions; the name overlap is suggestive, not proof.

| Bucket | Action |
|---|---|
| a restatement of an existing `RelationSets` or `RelationLaws` fact | delete; the relation-level fact already covers it |
| relation-general — the statement never mentions functionality | **relocate to `LRA/Set/Interface/RelationLaws.lean`, restated over a general relation**, not over `Graph f`. See §7.1.2 |
| genuinely functional — the statement needs single-valuedness or totality | state in `LRA/Function/Calculus/` **through `Graph`** |
| genuinely new mathematics with no relation-level analogue | keep, in `LRA/Function/Calculus/`, with a note saying why it has no analogue |

#### 7.1.2 Sort bucket 2 by generality before placing it

Most of the function-level algebra is relation-level mathematics wearing a
function costume. Image-of-union, preimage-of-complement, monotonicity, and the
image–preimage adjunction hold for **arbitrary relations**; functionality appears
nowhere in their statements. Only the injectivity-conditioned laws and the
kernel-quotient material genuinely need it.

So for each theorem ask the deciding question:

> Does the statement mention single-valuedness or totality, explicitly or through
> a hypothesis that implies it?

If not, it belongs at the relation level, stated over a general relation.
Restating it over `Graph f` produces a theorem that becomes a recognizable
restatement the moment the relation-level law is added — the duplication this
migration removes, deferred by one phase.

**This is relocation, not new surface.** `LRA/Set/Interface/RelationLaws.lean`
already owns `MemberOfImageOf`, `MemberOfPreimageOf`, and `MemberOfFiberOf` —
membership characterizations of precisely these constructions. A relation-general
image law is that file's next theorem, not an expansion of another subject's
API. Adding it there does not trigger the §7.1.1 stop condition and is not §7.2
work.

Leave every relocated statement `sorry`. Report the split: how many of bucket 2
were relation-general and how many genuinely functional.

If the audit shows `LRA.Set.Interface.RelationSets` and `LRA.Relation.Calculus`
themselves overlap, record it and stop — that is a separate duplicate-ownership
question between two promoted subjects, and it is not resolved by this phase.

Placement of the remainder follows §7.1 directly: `Graph` splits between
`LRA/Relation/Calculus/` and `LRA/Function/Definition.lean`; `PartialMap` becomes
a `LRA/Function/Structures/` concept, which §2.2 already names; `HasDomain` and
`HasCodomain` go to `LRA/Function/Calculus/Classes/`.

### 7.2 Resolve duplicate ownership

Before any bulk rename, produce an ownership table in which every declaration has
exactly one canonical owner and every recorded merge points at a surviving
declaration. Review every repeated authored short name. Merge only where the
mathematics is the same; keep distinct where the data differs, and record why.

Known families needing an explicit decision:

- `Sequence` in `Analysis.Sequences` versus the two real-number construction
  sequences — different index and carrier, keep distinct.
- `ConvergesTo` in Banach, Hilbert, and Sequences — different ambient space,
  keep distinct.
- `ModelIsomorphism` generic versus per-number-system — different data, keep
  distinct.
- The nine real-analysis bound predicates — exactly one owner each under
  `LRA.Analysis.Bounds`; `LRA.Order.Bounds` stays relation-generic.

### 7.3 Correct stale documentation

- `LRA/Relation.lean` says "Function and Map specialize this layer". Change to
  "Function and Morphism".
- `LRA.Order.Monotone` restates the preservation quantifier instead of calling
  `LRA.Morphism.PreservesRelation`. Make it definitional per §1.3.1.
- Any doc-comment naming `LRA.Map` as a durable subject is stale.
- Regenerate `namespace-inventory.tsv` and `namespace-review.md` from the
  generator. Do not hand-patch generated evidence; fix the generator's ownership
  rules and regenerate.

### 7.4 Close the build-coverage gap

**Done.** Recorded here because the shape of the problem was not what the
estimate said, and the general lesson outlives this row.

The estimate was roughly 320 unbuilt `Examples` and `FailureModes` modules.
Measured on the promoted tree: 1609 modules, 1483 reachable from a Lake target,
**126 unreachable** — 108 `Examples`, 1 `FailureModes`, and 17 core. The earlier
figure of 412 came from the pre-promotion tree and did not survive the promotion
commits, which had already added the missing subjects to the lakefile by hand.

**The fix is a glob, not a longer root list.** Coverage was carried by an
enumerated `roots` list, which is precisely how `LRA.Morphism` existed for a
whole phase without ever compiling: a subject is covered only if someone
remembers to add it. `lean_lib LRAAll` now globs every module under `LRA/`, so
coverage follows from a module existing rather than from anyone remembering it.

The glob is also what makes quarantine and coverage compatible. `Examples`,
`FailureModes`, `Interop`, and per-subject toolkits are unreachable from `LRA`
*on purpose* — §6 forbids a core router from importing them. Quarantine governs
imports, not targets, so a separate target is the only way to say both things at
once. `lean_lib LRATests` cannot serve: it sets `srcDir := "test"`, so its roots
resolve under `test/`, not under `LRA/`.

Building everything for the first time failed on thirteen targets from one file.
`LRA/VolumeIV/Topology.lean` imported twelve modules under a directory that has
never existed, while the real material sits in `LRA/VolumeIV/TopologicalSpaces/`.
It declared nothing and was imported by nothing. Deleted, along with
`LRA/Set/Algebra.lean`, which described itself as a legacy compatibility route.

Unverified Lean source is not an asset.

**Do this before the Volume II–VII rows, not after them.** Gating one group —
`LRA.Set.Interop`, reachable from no target — surfaced three latent defects the
first time it compiled: two malformed imports of the form
`import LRA.VolumeI.Set.LRA.Set.ZFC.Instances`, produced when an earlier phase's
substitution intended for declaration text also matched import lines; an import
of `LRA.Set.LRASet.Laws.Laws`, a path that has never existed; and a module
importing the six adapters whose contents it is, with two theorems ordered
before results they cite. All three were introduced *by* the migration, all
three survived four phases, and none failed a build, because nothing compiled
them.

That is the argument for sequencing. Every remaining row repoints imports, an
unbuilt module accepts a wrong repoint silently, and the defect is then
attributed to whichever phase finally builds it. Closing the gap first converts
each later row's mistakes into build failures in the commit that causes them.
Wire the modules in before migrating through them.

### 7.4.1 Never remove a declaration with a regular expression

Three declarations have been silently dropped in this migration by a
regex-driven bulk edit, most recently `BooleanOrAndMutualAbsorption`, whose
removal pattern carried an optional leading doc-comment whose non-greedy match
reached back to an earlier comment and took three neighbouring declarations with
it. In every case the diff looked plausible and the build stayed green, because
deleting a theorem nothing imports breaks nothing.

So:

- **Do not delete or relocate a declaration by pattern substitution over file
  text.** Select it by its declaration boundary — from its own doc-comment or
  keyword through to the start of the next top-level declaration or end of file
  — and act on that range.
- A removal that cannot be expressed as a whole number of declaration ranges is
  a signal the edit is wrong, not a reason to widen the pattern.
- **Compare the declaration-name set before and after every commit**, not once
  per row. Collect fully qualified names from both trees and diff the sets; any
  name present before and absent after must appear in the ledger with a reason.
  The per-row ledger is the audit; this is the tripwire, and it is what turns a
  silent drop into a stopped commit.
- Compare **fully qualified** names. Short names collide across namespaces and
  will mask a loss as a survivor.
- **A declaration-boundary scan must ignore the interior of comments.** Two
  further recurrences happened during the alias sweep. The first reached back
  through an optional leading-banner group and swallowed canonical declarations
  out of `Operations.lean`. The second matched `EqualityRelation` inside its own
  doc-comment, which quotes the declaration in a fenced `lean` block — so the
  pattern found the copy in the prose and cut there. Treat `/-! … -/`,
  `/-- … -/`, and `--` runs as opaque when locating boundaries; a doc-comment
  containing Lean source is normal here, not an edge case.

A count is not a substitute. Two of the drops were found only because the check
was per name; a total would have shown one short and read as rounding. When a
pattern has failed twice on the same file, stop patterning it and write the file
by hand — that is the cheaper move, not the defeat.

### 7.4.2 A check that names a path stops checking when the path moves

`scripts/check-mathlib-imports.py` scanned `LRA/VolumeI` and `LRA/VolumeII`.
When the promotion emptied Volume I, the check did not fail — it passed, having
scanned a tree that was no longer there, and the entire foundational subject
layer went unguarded for four phases. Its aggregate half, aimed at
`VolumeI/{Map,Relations,Order}`, went quiet the same way. Repointing both at the
subjects surfaced twelve Mathlib imports needing allow-list translation, three
Volume II modules violating the contract their own switch module states, and
fifty-three core `All.lean` aggregates importing their concept's `FailureModes`.

This is the same failure as an unbuilt module, one level up: the tool reports
success because it has nothing to look at. So:

- **Root every check in the architecture, not in a path that migration will
  move.** Derive the roots from the subject list, the way the source does.
- **A check that scanned nothing must fail.** Passing vacuously is worse than
  failing loudly, because it is indistinguishable from passing legitimately. The
  guard is three lines and belongs in every checker.
- When a check *should* find nothing because the thing it looks for is being
  removed, say so in its output. Silence must be legible.
- After any row that moves directories, **re-run every checker and confirm each
  reports a non-zero scan count** before believing its verdict.

### 7.5 Refile declarations that sit in the wrong role

A declaration in the wrong role file is a content error, not a layout error. The
directory is already canonical; what is wrong is which file inside it holds the
result. The tell is an empty or thin `Theorems.lean` beside a heavy
`Consequences.lean` or `Relationships.lean` — the concept's central results were
filed downstream of themselves.

Refile by §2.3's definitions of the roles:

- `Theorems.lean` takes results **about the concept alone** — its structural
  laws, stated in the concept's own vocabulary.
- `Consequences.lean` takes what follows from those, and only that. A result
  that nothing in `Theorems.lean` implies does not belong here.
- `Relationships.lean` takes results whose statement **names a sibling concept**.
  The sibling is the test, not the difficulty of the proof.
- `Characterizations.lean` takes `iff` statements characterizing **this**
  concept. An `iff` characterizing a *different* concept, merely stated through
  this one, belongs to that other concept's directory.

Rules for the move:

1. A refile changes which file holds a declaration. It **must not** change the
   declaration's fully qualified name, statement, or proof. If a name has to
   change, that is a separate change with its own review.
2. Fix the concept's import chain in the same commit. Roles import in the order
   `Definition → Theorems → Characterizations → Consequences → Relationships`;
   moving a declaration up the chain may require the file it left to import the
   file it landed in.
3. Ledger the move per name under §C.1, the same as any other relocation. A
   refile is cheap to verify and just as easy to lose.
4. Report, do not act on, any declaration that belongs in a **different concept
   directory**. Crossing directories is a §7.2 ownership question, not a refile.

Known instance, carried over from §7.0.3's audit: `LRA.Relation.Operations.Composition`
holds its four central results in `Consequences.lean` behind an empty
`Theorems.lean` and an empty `Relationships.lean`. It is the worked example for
this section, not a special case.

---

### 7.6 Standardize `LRA.AlgebraicStructures` before anything depends on it

Run this before §7.7. `NumberSystems`' `Realization.lean` files cite this
subject's `Interface/` shape directly; building them against a convention
that is still 14-of-30 inconsistent means redoing them once this row lands
anyway. Fix it once, upstream, first.

1. **Audit before touching anything.** For each of the 30 concepts, record
   whether `ModelTheory/` exists, what files it holds, and whether
   `AlgebraicSignature/` is the operation-record sense or (rare, worth
   flagging specially if found) already the `Logic.Signature` sense. Report
   the census before any file moves — this row has already been wrong once
   from trusting a directory listing instead of file contents; do not repeat
   that here.
2. **Land the shape on one concept end to end** — `Group` is the worked
   example throughout §1.7, has the most existing material to draw on, and
   sits mid-tower with both a subgroup (`Monoid`) and supertypes
   (`AbelianGroup`) to test the tower-inheritance rule against.
3. **Then the rest of the tower**, in dependency order (the same principle
   §7.1 already states for subjects): `Magma → Semigroup → Monoid → Group`
   before `Ring`, `Ring` before `Field`, and so on. A concept's
   `Interface/ModelTheory/Model.lean` may need its parent's `Model.lean`
   composed in, so promoting a concept before its parent produces the same
   manufactured-dependency problem §7.1 already warns against.
4. Per concept: build `Interface/{Signature,ModelTheory}/` per §1.7.1–§1.7.2,
   fold `NativeEquivalence`/`FirstOrderReduct`/`FirstOrderLimitations`/extra
   `Consequences` into `Relationships/`, delete `FailureModes.lean` and
   `All*.lean`, rebuild the router. Run the declaration-set tripwire
   (§7.4.1) on every commit — a rename-and-refile pass across 30 concepts is
   exactly the shape that has silently dropped declarations before.
5. `Interface/Signature/Definition.lean` and `Interface/ModelTheory/` are new
   folders for the 16 concepts that never had a `ModelTheory/` at all; decide
   per concept whether the meta-level treatment is worth building now or
   deferred as a reported gap — a concept nothing yet consumes model-
   theoretically does not have to get one in this pass, but say so rather
   than silently skipping it.
6. §1.7.6's set-theoretic tuple is out of scope for this row. Prototype it
   separately, on `Monoid → Group`, after the shape above has landed — doing
   both at once conflates a structural cleanup with a new presentation.

---

### 7.7 Volume II becomes `LRA.NumberSystems`

This row is not a path move. Volume II is organized by number system with the
construction inlined; §1.6 organizes it in three layers — generic interface,
system, construction. Sequence it accordingly.

1. **Determine which base the existing naturals construction uses before
   anything else.** `NaturalNumbers/` and `PeanoSystems/` do not state it in
   their signature files; read the successor and induction principles far
   enough to tell whether zero is a value of the carrier or not. This decides
   whether the existing material becomes `NaturalNumbersZeroBased/` or
   `NaturalNumbersOneBased/`, and whether the other base is built fresh, before
   any file moves — do not guess and repoint later.
2. **Build the generic interfaces first, from what the constructions already
   prove.** Do not design them in the abstract. Read the existing `Construction`
   directories, collect the obligations they actually discharge, and let each
   interface be the union — capability classes for what a construction may or
   may not offer, law classes for what it must.
   `LRA/VolumeII/NumberSystems/UniversalProperties.lean` states the uniqueness
   obligation §1.6.3 needs already, as `IntegerUniversalProperty` and its
   siblings; `CanonicalEmbeddings.lean` is the embedding chain for `Theory/`.
   Start both there rather than restating them. `NumberSystems/Models.lean` and
   `NaturalNumbers/Construction/NModel.lean` already build the
   `NFunctionSymbol`/`NRelationSymbol` signature-and-model data §1.6.2 asks
   for; restate that content over `LRA.Logic.Signature` and
   `LRA.Logic.FirstOrder.Model` directly rather than the bespoke inductive
   types, and file it under the system's `Interface/{Signature,ModelTheory}/`
   per §1.7's now-standardized shape, rather than a central `Models.lean`.
3. **Promote one system end to end before starting the second** — whichever
   base was determined in step 1 — so the pipeline in §1.6.1 and the
   generic/system/construction split in §1.6 are exercised once completely
   before being replicated across the rest.
4. **Then the remaining systems**, bottom-up in the embedding order: the other
   natural-number base, whole, integer, rational, real, extended real, complex.
   Gaussian integers follow. `PeanoSystems` promotes to `NumberSystems/PeanoSystem/`
   per §1.6.10 — a generic-layer citizen in its own right, not folded into either
   natural-number base's `Interface/` and not promoted as a peer number system.
   Its `Categoricity.lean` is what `NumberSystems/Theory/` cites for the
   naturals' uniqueness theorem, so sequence it before or alongside whichever
   natural-number base is promoted first in step 3, not after.
5. **Retire the switch last**, once every consumer can bind a carrier through
   the interface instead. Deleting it earlier strands the arithmetic modules.

Existing material that already matches the target shape, and should be reused
rather than rewritten:

- `Integers/{Mendelson,Pfefer,Polish,Tao}/` are already one directory per
  construction and become `Integer/Constructions/` entries close to unchanged.
- `RealNumbers/{Cantor,Cauchy,Dedekind,Computable,Dyadic}` are **single files**,
  not directories — `Cauchy.lean` alone is some 600 lines carrying the whole
  pipeline. Each expands into a `Real/Constructions/*/` directory, and that
  expansion is the §7.5 refile problem at scale: the stages exist inside one
  file and have to be separated into the eight roles without altering a
  statement or a proof. Budget this row accordingly; it is the largest single
  piece of Volume II.
- `NumberSystems/{ComparisonMatrix,Models,CanonicalEmbeddings,UniversalProperties}.lean`
  are backend-neutral and Mathlib-free — 52 declarations across the four — and
  become `NumberSystems/Theory/`.
- `Arithmetic/` is written against whichever carrier the switch selected. It is
  the natural first consumer to rewrite against interface binders, and the test
  of whether the interface is adequate.

Three cautions specific to this row.

**Well-definedness is proved but not filed.** The obligation is discharged —
`NAdditionWellDefined` and its siblings exist — but inside the operations files
that define the operation, in `NaturalNumbers/Operations/` and
`PeanoSystems/{Presburger,Recursion}/`. So this is a §7.5 refile in most cases,
not missing mathematics. Separate the two situations explicitly per
construction: a proof that exists and moves, versus a stage with no proof
anywhere. Report the second rather than promoting the construction quietly; a
construction missing a pipeline stage has not earned the name.

**Do not let `Behavior.lean` be absorbed into `Laws.lean`.** They answer
different questions and the second does not imply the first — every law can
hold of the wrong function. This is the stage most likely to be dropped as
redundant, and it is the one that catches a construction that is internally
consistent and externally wrong.

**Do not hand-write a round trip per construction.** §1.6.3 proves
substitutability once per generic interface via the uniqueness theorem; a
construction's job is to prove it is a model of its system's interface and stop
there. A per-construction `Interop/Mathlib/` appearing during this row is a
sign the composed proof was skipped, not a sign of thoroughness — check for one
before accepting it.

---

## 8. Acceptance gates

The effort succeeds only when **all** of these hold.

### A. Architecture

- No durable public declaration is owned by an `LRA.VolumeI`–`LRA.VolumeVII`
  namespace, and no `LRA/VolumeN/` directory holds durable source.
- `LRA.Map` does not exist as a namespace, directory, or module.
- `LRA.Morphism` exists as a top-level subject owning the eight primitives.
- `LRA.Order.Morphisms.Monotone` is defined in terms of
  `LRA.Morphism.PreservesRelation`, not the reverse.
- `LRA.Function` is the arrow abbreviation `Domain → Codomain`, accepting
  independent universe levels, and a compile-time example demonstrates a
  function between two different types.
- No typed structure bundles an arrow with totality and single-valuedness
  proofs; `RelationalFunction`, `OfTypedFunction`, and `Value` do not exist.
- No evaluation of a function is `noncomputable` or routed through
  `Classical.choose`.
- The set-theoretic relation triple, the function triple, their conditions,
  their bundles, evaluation existence and uniqueness, and extensionality are all
  present against the canonical set backend.
- Exactly one representation theorem family relates the arrow to its
  set-theoretic graph, with every encoding and set-construction hypothesis
  explicit, and there are no coercions or automatic bridge instances.
- `LRA.Function` does not redefine any `LRA.Relation` calculus concept.
- No subject restates a morphism law that `LRA.Morphism` already owns, and every
  specialization is definitional or by `extends`.
- No top-level `LRA.Interop`; every adapter sits in its subject's `Interop` group.
- Every public declaration has exactly one canonical owner.
- No `_root_` declarations.
- **Zero compatibility aliases, re-exports, or forwarding abbreviations.**
  Specifically: `LRA.Set.Enderton` does not exist; no declaration is reachable at
  both an old and a new path; no file exists whose only content is re-exporting
  another; and no declaration or module comment contains "historical", "legacy",
  "deprecated", "temporary", or "awaiting migration".
- The only synonyms are mathematically intentional ones, each justified in the
  review by the mathematics rather than by migration history.
  `LRA.Order.TotalOrder` for `LRA.Order.LinearOrder` is the one currently
  approved.

### B. Structure and naming

- Every subject has a working router; every group has a working router; routers
  hold no declarations.
- Only the file roles in §2.3 appear as leaf filenames, and a `Constructions`
  directory uses the construction roles of §1.6.1 rather than the concept roles.
- Every promoted role folder is named identically to the role file it replaced,
  and a router of that name (holding no declarations) sits beside it — the same
  duality §2.1 uses for subjects and groups, applied one level deeper.
- `LRA/NumberSystems.lean` and every per-system router (`LRA/NaturalNumbersZeroBased.lean`,
  …) select no construction: each imports its interface and its backend-neutral
  theory only.
- `NumberSystems/Interface/NaturalZeroBased.lean` and `NaturalOneBased.lean`
  are separate generic interfaces with separate signatures, not one interface
  with two backends, and their system-layer realizations
  (`NaturalNumbersZeroBased/`, `NaturalNumbersOneBased/`) are separate
  directories. The shift isomorphism between the two is stated once in
  `NumberSystems/Theory/`.
- Every construction directory carries all eight §1.6.1 pipeline files, and
  none folds `WellDefinedness` into `Operations` or `Behavior` into `Laws`.
- Substitutability for Mathlib is proved once per generic interface in
  `Interface/Interop/Mathlib/`, via the uniqueness-up-to-isomorphism theorem of
  §1.6.3, not once per construction. A per-construction `Interop/Mathlib/`
  exists only where that construction has structure the generic interface does
  not see, and says so.
- Every `Algebra/` proof bottoms out in an `instance` of an
  `LRA.AlgebraicStructures` class; none restates a structure already owned
  there.
- `ExtendedReal`'s interface leads with order-completeness and carries
  arithmetic as optional capability classes; it registers no ring instance.
- Each system's `FailureModes.lean` proves the named theorem in the §1.6.7
  ladder — what structure it fails to be, and why.
- No system proves a separate algebra obligation and a separate model
  obligation for the same construction; each is one `Model` per §1.6.2, read
  two ways, not two proofs.
- Every `LRA.AlgebraicStructures` concept uses the `Interface/{Signature,
  ModelTheory}/` shape of §1.7, uniformly — not 14 of 30 carrying `ModelTheory/`
  and the rest not, and not two unrelated things both called
  `AlgebraicSignature`.
- No `LRA.AlgebraicStructures` concept carries `FailureModes.lean`, `All.lean`,
  or `AllWithExamples.lean`.
- `ModelTheory/` never exceeds three files (`Model.lean`, `Axioms.lean`,
  `Satisfaction.lean`); reducts, native-equivalence content, and cross-concept
  comparisons live in `Relationships/` instead.
- `NumberSystems/PeanoSystem/` exists as its own generic-layer citizen and is
  imported by neither `NaturalNumbersZeroBased/Interface/` nor
  `NaturalNumbersOneBased/Interface/` as a private dependency — both cite it,
  neither owns it.
- Every module under `LRA/` is built by some Lake target, and coverage is
  expressed as a glob rather than an enumerated root list.
- Every checker reports a non-zero scan count, and fails rather than passes when
  its roots resolve to nothing.
- No role file inside a canonical concept directory was deleted for holding zero
  declarations. Scaffold survives every audit; a zero-declaration module on a
  retiring `LRA/VolumeN/` path is a shim and still goes.
- No subject or group router forwards into an `LRA.VolumeN.*` namespace.
- No canonical subject imports an `LRA.VolumeN.*` path, except an `Interop/`
  leaf whose target row is not yet promoted.
- No concept directory carries an empty `Theorems.lean` beside a
  `Consequences.lean` or `Relationships.lean` holding results the concept's own
  theorems do not imply. Where §7.5 found that shape, the refile landed and is
  ledgered per name under C.1.
- No Greek type binders in migrated code.
- No `forall`, `exists`, `->`, `/\`, `\/`, or `<->` in migrated code.
- Every router carries a module-level `/-! … -/` comment stating what the group
  owns; declaration doc-comments are not required and are not a gate.
- No `Logical form:` block restates a signature verbatim.
- No case-insensitive collisions except intentional type/value pairs, each
  documented in the review.

### C. Previous-migration cleanup

- The §7.0 audit was run and its before/after counts reported.
- Every alias found was deleted or explicitly justified mathematically.
- `LRA/VolumeI/Map/` and `LRA/VolumeI/Map.lean` no longer exist.
- `LRA/Set/ZFC/Compatibility.lean` no longer exists.
- Grepping the tree for `Historical`, `Compatibility alias`, `deprecated`,
  `pre-standardization`, and `awaiting migration` returns zero hits in `*.lean`.
- The alias-surface sweep of §7.0.3 was run. No `export`, single-name `abbrev`,
  `alias`, or `open ... renaming` survives except ones justified in the review by
  the mathematics. In particular `LRA.Set.LRASet` does not exist as a namespace,
  an `abbrev`, or an export target.

### C.1 Reconcile per name, never by total

Every phase that moves declarations must reconcile **name by name**, not by
count. Totals hide compensating errors: a phase that drops four `def`s and one
theorem while gaining an unrelated theorem elsewhere produces a total that
matches exactly, and nothing in the count reveals it.

For each declaration in scope, record which of these happened, and check the
list against the source rather than against a tally:

```text
deleted   — with the surviving owner named
relocated — with old and new fully qualified names
restated  — with the form it now takes
kept      — unchanged
```

Two counting traps seen in practice, both of which produced correct-looking
totals over wrong sets:

- **A count of `theorem` declarations misses `def`s.** A bucket of 72 was
  reported as 64 because eight of its members were definitions, not theorems.
- **A `sorry`-line diff is not a declaration ledger.** It counts lines removed
  and re-added inside modified files, so a wholesale directory deletion followed
  by relocation nets a number that matches nothing. Use a per-file ledger of
  where each `sorry` went.

A phase whose reconciliation is a subtraction rather than a list has not been
verified.

### D. Verification

- `lake build` succeeds.
- `lake build` of every volume library and the test library succeeds.
- `scripts/check-mathlib-imports.py`, `scripts/check-volume-vii-wiring.py`, and
  `scripts/check-proof-readiness.py` all pass.
- `make lint` passes (informational; `LRA_DOCLINT_STRICT=1` is not required to
  pass during this migration).
- Every module is reachable from a Lake target.
- Focused smoke modules exist for `LRA.Relation`, `LRA.Function`,
  `LRA.Morphism`, `LRA.Order`, and the analysis subjects, and one module imports
  all subject routers together.
- Searching for every removed prefix returns zero hits outside historical
  artifacts that clearly describe the old state.
- `git diff --check` is clean.
- Regenerating the inventory twice produces byte-identical output; the review
  records its SHA-256.
- Every theorem body is `sorry` and no proof was completed.

---

## 9. Required handoff

Report:

1. the §7.0 audit: aliases found, aliases deleted, and any kept with its
   mathematical justification;
2. the final subject architecture and the group layout of each subject;
3. every declaration moved, merged, internalized, deleted, or deliberately kept,
   with the reason;
4. the `Relation → Function → Morphism` specialization points, naming each
   concept that `Function` and `Morphism` inherit rather than restate;
5. naming and notation conversions applied, with counts;
6. router module comments added, and confirmation that no declaration
   doc-comment was deleted while relocating a declaration;
7. subjects, groups, and routers added or removed;
8. modules brought under a build gate, and any deleted instead;
9. inventory counts and checksum;
10. every verification command and its result;
11. any remaining blocker or deliberately deferred decision.

Do not describe the effort as complete unless every acceptance gate passes.
