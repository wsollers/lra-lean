# Step 5a: Foundational Dependency Review

## Goal

Before extending the set layer much further, decide how the next foundational
layers will depend on sets and on each other.

This step covers relations, functions, algebraic laws, identity elements,
order, and the foundational `Grundlagen` vocabulary. It is a design checkpoint,
not a mandate to formalize all of those layers immediately.

## Reason

Set theory is not isolated in the notes. The shape of later set definitions is
affected by:

- relations as sets of ordered pairs;
- functions as special relations;
- identity, inverse, composition, and restriction vocabulary;
- algebraic operation laws used by set algebra and number-system interfaces;
- order relations, order-preserving maps, and quotient-compatible order;
- `Grundlagen` choices about equality, definition expansion, and structural
  transport.

If these are ignored until after the set layer grows, the set API may need a
large rewrite. If they are fully implemented too early, the restart loses its
small, proof-ready character. The intended compromise is to settle interfaces
and dependency direction now, then implement only the minimal declarations that
sets genuinely need.

## Topics To Decide

Relations:

- heterogeneous relation representation;
- endorelations as the same-carrier specialization;
- identity, empty, and universal relations;
- converse, composition, domain, range, field, and restriction;
- when to model relations as predicates versus sets of ordered pairs.

Functions:

- function-as-relation vocabulary versus Lean-native functions;
- graph, domain, codomain, image, and preimage;
- injective, surjective, bijective, inverse, and section/retraction;
- partial functions and total-on-domain predicates.

Algebra:

- operation signatures;
- associativity, commutativity, distributivity, absorption, identity,
  inverse, and cancellation laws;
- whether set algebra uses generic algebraic law bundles or dedicated set
  theorem statements.

Identity:

- identity relation;
- identity function;
- identity element for an operation;
- uniqueness of identity;
- left/right identity naming and theorem shape.

Order:

- strict and non-strict order representations;
- partial, total, and well-order law bundles;
- bounds, extrema, suprema, infima, embeddings, and isomorphisms;
- compatibility of order with operations.

Grundlagen:

- equality and extensionality conventions;
- definitional expansion policy;
- structural transport and isomorphism vocabulary;
- quotient-facing representative-independence language;
- source-label mapping for foundational definitions that are shared by several
  chapters.

## Dependency Direction

The expected dependency order is:

```text
Logic
  -> Set/ZFC syntax and semantics
  -> Grundlagen vocabulary
  -> Relations
  -> Functions
  -> Algebraic law bundles
  -> Order
  -> Quotients and cardinality
  -> Number systems
```

This order is conceptual. Lean files may stay smaller than this diagram, but
they should not make later layers import earlier convenience modules in a way
that creates cycles.

## Minimal Lean Surface

During this checkpoint, only add Lean declarations that are needed to keep the
set API honest. Good candidates are:

- relation and endorelation type abbreviations;
- identity relation;
- relation composition statement shape;
- graph predicate for a Lean function;
- identity element predicate for a binary operation;
- strict/non-strict order law predicate shells.

Avoid adding quotient, cardinality, or number-system declarations in this step.

## Acceptance Criteria

- The restart plan records the revised gate before more set expansion.
- The chosen relation/function/algebra/order representations are documented.
- Any Lean declarations added for this step compile and are source-grounded or
  explicitly marked as Lean-support vocabulary.
- The set layer can proceed with a clear list of interfaces it may rely on.
