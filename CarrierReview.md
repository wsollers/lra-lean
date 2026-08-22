# LRA Carrier Review

## Scope and review standard

This is a living mathematical review of the `LRA` tree, maintained in small dependency-aware chunks.

The review is concerned primarily with:

- mathematical correctness of definitions and theorem statements;
- whether concepts live at the right abstraction layer;
- whether important pre-measure-theory mathematics is missing;
- whether named properties are characterized by the correct hypotheses;
- whether canonical examples, counterexamples, and implication/nonimplication results are present where pedagogically useful;
- whether the resulting API is suitable both for proving and for mathematical note-taking.

### Explicit exclusions

- `sorry` is treated as neutral scaffolding and is not a defect for purposes of this review.
- The mere use of `axiom` is not treated as a defect. Axioms are reviewed only for whether they occur where a genuine classical mathematical axiom or deliberately chosen foundational principle belongs.
- The repository is assumed to build successfully at `origin/main @ HEAD`, per project owner confirmation.

### Choice policy

Choice usage outside the ZFC/choice-specific development will be documented separately.

Two different notions will be distinguished:

1. **Witness extraction**, e.g. `Classical.choose h` from a proof `h : ∃ x, P x`. This is recorded when relevant but is not automatically classified as an invocation of the mathematical Axiom of Choice.
2. **Genuine family-wise choice / AC**, e.g. simultaneous selection from a family of nonempty sets, arbitrary well-ordering, or use of a theorem equivalent to the Axiom of Choice. These uses outside the dedicated set-theory choice developments will be highlighted explicitly.

---

# Review 1 — `LRA.Carrier`

## Files reviewed

- `LRA/Carrier.lean`
- `LRA/Carrier/Finiteness.lean`
- `LRA/Carrier/Finiteness/Definition.lean`
- `LRA/Carrier/Countability.lean`
- `LRA/Carrier/Countability/Definition.lean`
- `LRA/Carrier/ProofsToDo.md`

Dependency definitions checked:

- `LRA/Function/Definition.lean`
- `LRA/Function/Properties/Definition.lean`
- `LRA/Relation/Properties/Definition.lean`

## Architectural assessment

`LRA.Carrier` owns proposition-valued size properties of a single bare carrier type, while relation/function properties remain below it and comparisons between distinct types belong to `LRA.Cardinality` above it.

This is a good abstraction boundary. `IsFinite`, `IsInfinite`, `IsCountable`, `IsCountablyInfinite`, and `IsUncountable` are basic properties of a carrier and do not inherently require the full cardinal-comparison layer.

**Verdict: PASS.**

## Definition review

### `IsFinite`

Current mathematical content:

```text
A is finite iff there exist n : Nat and f : A → Fin n such that f is bijective.
```

Equivalently,

\[
\operatorname{IsFinite}(A)
\iff
\exists n\in\mathbb N\;\exists f:A\to\operatorname{Fin}(n),\quad f\text{ is bijective}.
\]

This is a standard and mathematically correct definition of finiteness.

**Verdict: CORRECT.**

### `IsInfinite`

Defined by

\[
\operatorname{IsInfinite}(A) \iff \neg\operatorname{IsFinite}(A).
\]

This is standard classical mathematical usage and is appropriate at this level.

**Verdict: CORRECT.**

### `IsCountable`

Current mathematical content:

```text
A is countable iff there exists an injection A → Nat.
```

Thus the project uses the convention that finite sets are countable.

\[
\operatorname{IsCountable}(A)
\iff
\exists f:A\to\mathbb N,\quad f\text{ is injective}.
\]

This is a standard convention and is explicitly documented.

**Verdict: CORRECT.**

### `IsCountablyInfinite`

Defined by bijection with `Nat`:

\[
\operatorname{IsCountablyInfinite}(A)
\iff
\exists f:A\to\mathbb N,\quad f\text{ is bijective}.
\]

This correctly distinguishes countably infinite from merely countable.

**Verdict: CORRECT.**

### `IsUncountable`

Defined as

\[
\operatorname{IsUncountable}(A)
\iff
\neg\operatorname{IsCountable}(A).
\]

This is standard.

**Verdict: CORRECT.**

## Dependency sanity check

The carrier definitions depend on `LRA.Function.Injective` and `LRA.Function.Bijective`.

Those were checked against the graph-based function representation:

- `Graph f` is the relation `Graph f x y ↔ f x = y`;
- injectivity is left-uniqueness of the graph;
- surjectivity is right-totality of the graph;
- bijectivity is injectivity together with surjectivity.

The relation-level orientation is correct:

- `LeftUnique R` means one source at most for each target;
- `RightTotal R` means every target is hit by some source.

Therefore the graph-based encodings really do recover ordinary injectivity and surjectivity.

**Verdict: PASS.**

## What is missing

The generated `LRA/Carrier/ProofsToDo.md` currently reports no theorem declarations under the Carrier folder. Thus the definitions are sound, but `LRA.Carrier` is not yet a complete mathematical learning layer by itself.

Before this subject is considered complete for proof development and note-taking, the following elementary facts should exist somewhere in the Carrier/Cardinality boundary, exactly once:

### Core consequences

1. finite implies countable;
2. countably infinite implies countable;
3. countably infinite implies infinite;
4. uncountable implies infinite;
5. countable and infinite implies countably infinite;
6. invariance of finite/countable/countably-infinite under bijection.

### Canonical examples

7. `Fin n` is finite;
8. `Nat` is countably infinite;
9. optionally, a few tiny canonical carriers such as empty type, unit, and `Bool`, if examples fit the repository's pedagogical style.

These should not automatically be added to `LRA.Carrier`; some may properly belong to `LRA.Cardinality`. The next review chunk will determine ownership before recommending placement.

## Pre-measure-theory importance

For measure theory preparation, later developments should also establish the following standard countability toolkit:

- subsets of countable sets are countable;
- images of countable sets are countable;
- finite unions of countable sets are countable;
- countable unions of countable sets, with precise hypotheses and foundational assumptions made explicit;
- finite products and standard countable products such as `Nat × Nat`;
- countability of `Int` and `Rat`;
- uncountability of `Real`.

The countable-union result deserves special attention in the choice audit because its exact formulation can conceal a choice principle.

## Final verdict for this chunk

| Dimension | Verdict |
|---|---|
| Mathematical correctness | **PASS** |
| Abstraction/ownership | **PASS** |
| Dependency semantics | **PASS** |
| Ready to build on definitionally | **YES** |
| Complete as a learning/theorem layer | **NOT YET** |
| Immediate redesign required | **NO** |

The definitions are mathematically sound and appropriately located. The principal gap is not correctness but the absence of the elementary theorem layer connecting the notions and supplying canonical examples.

---

# Next review chunk

`LRA.Cardinality`, restricted first to the comparison and naming layer directly consuming `LRA.Carrier`. The purpose is to determine whether the missing Carrier facts already exist there and whether their present ownership is mathematically and architecturally appropriate.
