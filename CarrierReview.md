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

The project reads this as “`A` is dominated by `B`,” i.e. `|A| ≤ |B|`. The parameter order is correct, though the English verb “dominates” can be read in the opposite direction unless the convention is remembered.

**Verdict: CORRECT; keep the convention explicitly documented.**

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

`CantorTheorem A` states that no map `A → (A → Prop)` is surjective. Interpreting predicates `A → Prop` as subsets of `A`, this is the standard diagonal theorem that no set surjects onto its powerset.

`StrictlyDominatesPowerset A` then packages this together with the singleton injection to obtain `|A| < |P(A)|`.

**Verdict: PASS.**

## Finiteness and Dedekind finiteness

The `Cardinality.IsFinite` and `Cardinality.IsInfinite` names are aliases of the canonical `Carrier` predicates rather than duplicate definitions. This is good architecture.

`IsDedekindInfinite` is defined by existence of an injective but non-surjective self-map. `IsDedekindFinite` is its negation. Both are standard.

The source correctly distinguishes the choice-free implications

\[
\text{finite} \Rightarrow \text{Dedekind-finite}
\]

and

\[
\text{Dedekind-infinite} \Rightarrow \text{infinite}.
\]

The source says the reverse direction “needs choice.” This is fine as a practical warning: it is not provable in bare ZF, while AC suffices. More precisely, the general converse is weaker than full AC, so the comment should not be interpreted as an equivalence with the full Axiom of Choice.

## Finiteness theorems

The reviewed statements are correct:

- `IsFiniteCongr`;
- `NotBothFiniteAndInfinite`;
- `FiniteImpliesDedekindFinite`;
- `DedekindInfiniteImpliesInfinite`;
- `DominatesOfFiniteInfinite`.

The last theorem does not require full AC; finite choice suffices and is provable in ordinary ZF.

**Verdict: PASS.**

## Countability theorems

Already present and correct:

- `FiniteImpliesCountable`;
- `CountablyInfiniteImpliesCountable`;
- `CountablyInfiniteImpliesInfinite`;
- `IsCountableCongr`;
- `DominatesCountableIsCountable`.

The downward-closure theorem is especially useful later: if `A` injects into a countable `B`, then `A` is countable.

**Verdict: PASS.**

## Countable union / dependent sum theorem

`CountableSigmaOfCountableIndexCountableFibers` states that if the index type is countable and every fiber is countable, then the dependent sum of the fibers is countable.

This is the type-theoretic core of “a countable union of countable sets is countable.” The statement is correct with an appropriate choice principle because the hypotheses supply a counting map only existentially for each fiber, while the conclusion requires making all those choices simultaneously.

The source explicitly marks the theorem as choice-sensitive.

**Verdict: CORRECT; choice dependency appropriately documented.**

## Choice audit — entry 1

| Location | Result | Classification | Comment |
|---|---|---|---|
| `LRA/Cardinality/Properties/Countability/Theorems.lean` | `CountableSigmaOfCountableIndexCountableFibers` | **Genuine family-wise choice** | Simultaneously chooses a counting injection/enumeration for each countable fiber. |

## Remaining basic gaps worth adding before measure theory

1. **Uncountable implies infinite.** Immediate from finite implies countable, but useful explicitly.
2. **Countable and infinite implies countably infinite.** Standard theorem for an infinite type injecting into `Nat`.
3. **`Nat` is countably infinite.** Canonical example.
4. **`Fin n` is finite.** Canonical example.
5. **Strict-cardinality relation laws** such as irreflexivity and transitivity, if not already elsewhere.

## Final verdict for Review 2

| Dimension | Verdict |
|---|---|
| Mathematical correctness | **PASS** |
| Cardinal comparison definitions | **PASS** |
| Cantor/CSB statements | **PASS** |
| Carrier/Cardinality ownership | **PASS** |
| Choice dependency transparency | **PASS, with one explicit external choice-sensitive theorem** |
| Immediate redesign required | **NO** |

---

# Review 3 — Integration with number systems and real-line cardinality

## Files reviewed

- `LRA/VolumeII/NumberSystems/CharacteristicCardinality.lean`
- `LRA/Analysis/StructureOfRealLine/Cardinality.lean`

This pass does not review the full number-system or real-line developments. It only checks whether the canonical countability vocabulary is consistently reused.

## Duplicate countability vocabulary in Volume II

`LRA.VolumeII.NumberSystems.CharacteristicCardinality` currently defines its own:

```lean
Countable α := ∃ enumerate : Nat → α, ∀ value : α, ∃ index, enumerate index = value
Uncountable α := ¬ Countable α
```

This is an existence-of-surjective-enumeration definition.

The canonical `LRA.Carrier.IsCountable` instead means existence of an injection `α → Nat`.

For ordinary nonempty number-system carriers these notions are equivalent in classical mathematics, so `RationalsAreCountable` and `RealsAreUncountable` are not mathematically suspect merely because they use the older vocabulary. However, the predicates are not literally identical for arbitrary types: the empty type injects into `Nat` and is therefore countable under the canonical definition, but there is no surjection `Nat → Empty`.

The canonical Cardinality source itself already identifies this Volume II pair as superseded.

### Recommendation

Replace or bridge the local `Countable`/`Uncountable` definitions so that the number-system theorems are stated using the canonical vocabulary:

- `LRA.Carrier.IsCountable` / `LRA.Cardinality.IsCountable`;
- `LRA.Carrier.IsUncountable` / `LRA.Cardinality.IsUncountable`.

If an actual enumeration `Nat → α` is pedagogically useful, expose it as a separate theorem/construction rather than as a second definition of countability.

**Severity: MAJOR ARCHITECTURAL CLEANUP, not a mathematical error in the present nonempty number-system context.**

## Rationals and reals

The number-system layer already contains theorem statements asserting that selected rational models are countable and selected real models are uncountable, but against the older local vocabulary.

Therefore:

- “rationals are countable” is **not missing conceptually**;
- “reals are uncountable” is **not missing conceptually**;
- both should be migrated to the canonical Carrier/Cardinality predicates.

No corresponding `IntegersAreCountable` theorem was located in the current search pass. This remains a candidate addition, subject to a later full number-system review.

## Closed unit interval

`LRA.Analysis.StructureOfRealLine.Cardinality.ClosedUnitIntervalUncountable` states directly that no sequence `Nat → Real` enumerates all points of `[0,1]`.

This is mathematically correct, but it is another inline countability formulation rather than a theorem stated against the canonical `IsUncountable` vocabulary.

### Recommendation

When the set/subtype interface is mature enough, add or restate a canonical theorem expressing that the closed unit interval, regarded as a subtype/carrier, is uncountable. The explicit “no enumeration” statement can remain as a useful equivalent characterization or proof-facing corollary.

**Severity: MINOR/MODERATE API CONSOLIDATION.**

## Updated pre-measure-theory status

Already present in some form:

- rational countability;
- real uncountability;
- uncountability of `[0,1]`;
- abstract countable-sigma/countable-union core.

Still to locate or add:

- integer countability;
- `Nat × Nat` countability;
- finite products of countable carriers;
- subsets and images of countable sets in the canonical Set/Carrier vocabulary;
- finite and countable unions of countable sets at the set level;
- the canonical bridge between “countable and infinite” and “countably infinite.”

## Final verdict for Review 3

| Dimension | Verdict |
|---|---|
| Mathematical claims inspected | **PASS** |
| Canonical vocabulary reuse | **NEEDS CLEANUP** |
| Duplicate semantics | **YES — Volume II local countability predicate** |
| Pre-measure-theory conceptual coverage | **BETTER THAN INITIAL SEARCH SUGGESTED** |
| Immediate foundational redesign | **NO** |

---

# Next review chunk

Move from cardinality into the low-level **relation property vocabulary** (`Reflexive`, `Symmetric`, `Antisymmetric`, `Asymmetric`, `Transitive`, connexity/trichotomy, Euclidean properties, density), then inspect the first relation-law theorems. This is the next dependency-critical layer for order, equivalence relations, topology, and later analysis.
