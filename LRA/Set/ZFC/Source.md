# Sources for the ZFC Development

The canonical `LRA.Set.ZFC` development is organized by mathematics rather than by textbook. The sources below document the principal references used for theorem order, terminology, motivation, comparison, and supplementary results.

## Primary source

### Herbert B. Enderton — *Elements of Set Theory*

Enderton is the primary organizational source for the in-house ZFC development. In particular, the project follows the textbook-style progression from primitive membership and the ZFC axioms through the standard existence and uniqueness results and the derived constructions built from them.

The former `LRA.Set.Enderton` name recorded this provenance directly in the module tree. Under the standardized architecture, that provenance is documented here while mathematical ownership lives under `LRA.Set.ZFC` and the concrete in-house single-sorted realization lives under `LRA.Set.ZFCSet`.

Use Enderton primarily for:

- development order of the axioms and their immediate consequences;
- textbook formulations of the basic ZFC constructions;
- existence and uniqueness results for canonical set constructions;
- the progression from primitive axioms to derived set-theoretic operations.

## Supplementary sources

### Paul R. Halmos — *Naive Set Theory*

Halmos is a supplementary conceptual and pedagogical reference. It is especially useful for the working language of sets, relations, functions, ordered pairs, families, and standard constructions that later mathematical subjects rely on.

Use Halmos primarily for:

- intuitive and economical formulations of elementary set constructions;
- standard working set-theoretic vocabulary;
- relations and functions as set-theoretic constructions;
- comparison between axiomatic foundations and ordinary mathematical practice.

### Patrick Suppes — *Axiomatic Set Theory*

Suppes is a supplementary axiomatic reference used to compare formulations, dependencies, and derived results within formal set theory.

Use Suppes primarily for:

- alternative axiomatic formulations and theorem organization;
- explicit dependency analysis among set-theoretic principles;
- comparison of primitive and derived notions;
- additional perspective on formal development from axioms.

## Architectural role of these sources

These references do not determine module ownership. The standardized architecture distinguishes:

```text
Set.Interface
    generic backend-agnostic set vocabulary and laws

Set.ZFC
    the axiomatic mathematical theory and its derived theorems

Set.ZFCSet
    the in-house single-sorted realization formerly developed under Enderton

Set.PredicateSet
    the in-house typed predicate-set realization

Set.Model
    the first-order language and theory of set theory

Set.Interop.Mathlib
    opt-in bridges to Mathlib `Set` and `ZFSet`
```

When the sources differ in presentation, the Lean development should preserve the canonical mathematical ownership and dependency architecture of LRA. Source-specific terminology or ordering may be recorded in documentation and theorem comments without creating duplicate mathematical concepts.
