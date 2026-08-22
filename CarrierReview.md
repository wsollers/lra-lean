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

## Initial gap assessment, resolved by Review 2

`LRA/Carrier/ProofsToDo.md` reports no theorem declarations under the Carrier folder. That initially suggested a missing theorem layer. Review 2 showed that several of the expected bridge theorems are already present one layer up in `LRA.Cardinality`, which is a reasonable location because they connect bare-carrier properties through cardinal-comparison machinery.

Already present in `LRA.Cardinality`:

- finite implies countable;
- countably infinite implies countable;
- countably infinite implies infinite;
- finiteness invariance under equinumerosity;
- countability invariance under equinumerosity;
- downward closure of countability under domination.

Therefore these are **not repository-wide gaps**.

Remaining candidate gaps are tracked after Review 2 rather than assigned prematurely to `LRA.Carrier`.

## Final verdict for this chunk

| Dimension | Verdict |
|---|---|
| Mathematical correctness | **PASS** |
| Abstraction/ownership | **PASS** |
| Dependency semantics | **PASS** |
| Ready to build on definitionally | **YES** |
| Immediate redesign required | **NO** |

---

# Review 2 — Basic `LRA.Cardinality`

## Files reviewed

- `LRA/Cardinality/Definition.lean`
- `LRA/Cardinality/Theorems.lean`
- `LRA/Cardinality/Properties/Finiteness/Definition.lean`
- `LRA/Cardinality/Properties/Finiteness/Theorems.lean`
- `LRA/Cardinality/Properties/Countability/Definition.lean`
- `LRA/Cardinality/Properties/Countability/Theorems.lean`

This review intentionally stops at the basic comparison, finiteness, and countability layer.

## Core comparison definitions

### `Equinumerous A B`

Defined by existence of a bijection `A → B`.

\[
A \approx B \iff \exists f:A\to B,\ f\text{ bijective}.
\]

This is the standard notion of equal cardinality.

**Verdict: CORRECT.**

### `Dominates A B`

Defined by existence of an injection `A → B`.

\[
A \preceq B \iff \exists f:A\to B,\ f\text{ injective}.
\]

The project reads this as “`A` is dominated by `B`,” i.e. `|A| ≤ |B|`. The parameter order is therefore correct, though the English verb “dominates” can be read in the opposite direction unless the project convention is remembered.

**Verdict: CORRECT; naming convention should remain explicitly documented.**

### `StrictlyDominates A B`

Defined by

\[
A \prec B \iff A\preceq B \land A\not\approx B.
\]

This is a correct strict-cardinality comparison once Cantor–Schröder–Bernstein is available.

**Verdict: CORRECT.**

## Core comparison theorems

The following statements are mathematically correct and form the expected basic algebra of cardinal comparison:

- equinumerosity is reflexive;
- equinumerosity is symmetric;
- equinumerosity is transitive;
- domination is reflexive;
- domination is transitive;
- equinumerosity implies domination;
- Cantor–Schröder–Bernstein: mutual domination implies equinumerosity.

The repository correctly notes that Cantor–Schröder–Bernstein does **not** require the Axiom of Choice.

**Verdict: PASS.**

## Cantor theorem

`CantorTheorem A` states that no map

\[
f:A\to(A\to\mathrm{Prop})
\]

is surjective. Interpreting predicates `A → Prop` as subsets of `A`, this is the standard diagonal theorem that no set surjects onto its powerset.

`StrictlyDominatesPowerset A` then packages this together with the singleton injection to obtain

\[
|A| < |\mathcal P(A)|.
\]

Both statements are mathematically correct.

**Verdict: PASS.**

## Finiteness and Dedekind finiteness

The `Cardinality.IsFinite` and `Cardinality.IsInfinite` names are aliases of the canonical `Carrier` predicates rather than duplicate definitions. This is good architecture.

### `IsDedekindInfinite`

Defined by existence of an injective but non-surjective self-map:

\[
\exists f:A\to A,\quad f\text{ injective and not surjective}.
\]

This is a standard characterization of Dedekind-infinite sets.

### `IsDedekindFinite`

Defined as the negation of Dedekind-infinite.

This is standard.

### Choice comment

The source correctly distinguishes the choice-free implication

\[
\text{Dedekind-infinite} \Rightarrow \text{infinite}
\]

and its equivalent contrapositive

\[
\text{finite} \Rightarrow \text{Dedekind-finite}.
\]

The source says the converse “needs choice.” This is acceptable as a practical classical-mathematics warning: under the Axiom of Choice every infinite set is Dedekind-infinite. More precisely, the converse is not a theorem of bare ZF and the principle needed for all sets is weaker than full AC, so the comment should not be read as claiming equivalence with the full Axiom of Choice.

No correction to the theorem statements is required.

## Finiteness theorems

The reviewed statements are correct:

- `IsFiniteCongr`: finiteness is invariant under equinumerosity;
- `NotBothFiniteAndInfinite`;
- `FiniteImpliesDedekindFinite`;
- `DedekindInfiniteImpliesInfinite`;
- `DominatesOfFiniteInfinite`: every finite type injects into every infinite type.

The last statement does not require full AC: only finite selection is involved, which is available in ordinary ZF.

**Verdict: PASS.**

## Countability theorems

The following expected bridge results already exist and are correct:

- `FiniteImpliesCountable`;
- `CountablyInfiniteImpliesCountable`;
- `CountablyInfiniteImpliesInfinite`;
- `IsCountableCongr`;
- `DominatesCountableIsCountable`.

The downward-closure theorem is especially useful later: if `A` injects into a countable `B`, then `A` is countable.

**Verdict: PASS.**

## Countable union / dependent sum theorem

`CountableSigmaOfCountableIndexCountableFibers` states:

> if the index type is countable and every fiber is countable, then the dependent sum of the fibers is countable.

Mathematically, this is the type-theoretic form of “a countable union of countable sets is countable.”

The theorem is correct **with an appropriate choice principle** because the hypotheses provide

\[
\forall i,\ \exists f_i : A_i \hookrightarrow \mathbb N,
\]

while constructing a single injection of the sigma type requires choosing such an `f_i` for all fibers simultaneously.

The source explicitly marks this proof as needing the Axiom of Choice. This is exactly the sort of non-ZFC-local choice dependency that should be visible in the project.

**Verdict: CORRECT; choice dependency appropriately documented.**

## Choice audit — entry 1

| Location | Result | Classification | Comment |
|---|---|---|---|
| `LRA/Cardinality/Properties/Countability/Theorems.lean` | `CountableSigmaOfCountableIndexCountableFibers` | **Genuine family-wise choice** | Simultaneously chooses a counting injection/enumeration for each countable fiber. This is not merely extraction of one already-given existential witness. |

This is outside the ZFC-specific tree and should remain documented as a choice-sensitive theorem.

## Remaining basic gaps worth adding before measure theory

The following are not present in the reviewed basic layer and are mathematically useful before measure theory:

1. **Uncountable implies infinite.**
   This is an immediate consequence of finite implies countable, but worth recording for fluent use and for notes.

2. **Countable and infinite implies countably infinite.**
   Under the current definition of countable as injection into `Nat`, an infinite countable type should be shown equinumerous with `Nat`. This is the standard theorem that every infinite subset of `Nat` is countably infinite.

3. **`Nat` is countably infinite.**
   Canonical base example.

4. **`Fin n` is finite.**
   Canonical base example.

5. **Finite implies Dedekind-finite and Dedekind-infinite implies infinite are present;** a note or theorem should make clear that the reverse implication for arbitrary carriers is choice-sensitive rather than silently assumed later.

6. **Strict-cardinality relation laws.**
   For a mature comparison API it would be useful to have, if not already elsewhere:
   - irreflexivity of `StrictlyDominates`;
   - transitivity of `StrictlyDominates`;
   - incompatibility of `StrictlyDominates A B` with `Dominates B A`, via Cantor–Schröder–Bernstein.

These are elementary, not research-level additions, and they make later cardinal arguments easier to read.

## Pre-measure-theory toolkit still to locate or add later

The following remain important targets as the audit proceeds; they may already live in set/number-system modules and therefore are not yet declared missing:

- subsets of countable sets are countable;
- images of countable sets are countable;
- finite unions of countable sets are countable;
- countable unions of countable sets, with choice dependence explicit — the sigma theorem supplies the abstract core;
- `Nat × Nat` countable;
- finite products of countable sets countable;
- `Int` countable;
- `Rat` countable;
- `Real` uncountable.

## Final verdict for Review 2

| Dimension | Verdict |
|---|---|
| Mathematical correctness | **PASS** |
| Cardinal comparison definitions | **PASS** |
| Cantor/CSB statements | **PASS** |
| Carrier/Cardinality ownership | **PASS** |
| Choice dependency transparency | **PASS, with one explicit external choice-sensitive theorem** |
| Pre-measure-theory completeness | **GOOD BASE, SOME ELEMENTARY BRIDGES/EXAMPLES STILL NEEDED OR TO BE LOCATED** |
| Immediate redesign required | **NO** |

---

# Next review chunk

Continue within `LRA.Cardinality`, but only far enough to locate the standard examples and countability consequences (`Nat`, products, `Int`, `Rat`, `Real`) before deciding whether they are genuinely absent. Do not yet broaden into topology or measure-theory-facing material.
