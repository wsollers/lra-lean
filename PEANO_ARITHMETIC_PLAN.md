# Peano Arithmetic vs. ℕ Arithmetic — Layering & Port Plan

**Status:** planning. Companion to `constitution/landau-chapter1-index.md` (theorem-level
reconciliation). This doc locks the *layer architecture* and the *port order*; the index holds
the per-theorem detail. Once this is agreed, execution = closing sorries in dependency order.

**Workflow invariant:** statements and proofs are authored **from the LaTeX** (`lra-volume-ii`),
then ported to Lean. The LaTeX is truth for *what* and *how-stated*. The dependency DAG is truth
for *build order*. These are different and both binding.

---

## The problem this fixes

Two drifts between the LaTeX (which already has the right structure) and the Lean:

1. **Mixed layers in one file.** `NaturalNumbers/Addition.lean` holds both the *well-definedness*
   clauses (`plus`, `plus_base`, `plus_step` — pure recursion plumbing) **and** an *algebraic law*
   (`addition_is_associative`). Those are two different conceptual layers your LaTeX keeps in two
   different chapters.
2. **Two disconnected arithmetic tracks.** The abstract Peano induction proofs
   (`Addition.lean`, `Multiplication.lean`, on `ps : PeanoSystem`) and the algebra-bundle ℕ model
   (`Arithmetic.lean`, which borrows core `Nat.add_comm`, `Nat.mul_comm`, …) prove the *same laws
   twice by different means and never connect*. The LaTeX has one story: prove the laws once,
   abstractly; ℕ is a model that inherits them.

---

## The architecture (mirrors the existing LaTeX chapters)

| Layer | Content | LaTeX chapter | Target Lean module | Proved against |
|---|---|---|---|---|
| **0 · Machinery** | `PeanoSystem` (5 axioms); recursion theorem (`iter`, `iter_base`, `iter_step`, `iterator_function_unique`); structural Thm 1–3 | `peano-systems/{defining-peano-systems, recursion-on-peano-systems}` | `PeanoSystems/{PeanoSystem, Recursion, BasicTheorems}` | — |
| **1 · Peano arithmetic** *(well-defined operations)* | `+`, `·` defined by recursion; base/step clauses; uniqueness | `peano-systems/recursion-on-peano-systems` | operation defs + `*_base`/`*_step`/`*_unique` | abstract `PeanoSystem` |
| **2 · Arithmetic laws** *(the ℕ algebra)* | associativity, commutativity, distributivity, cancellation, identities (incl. `1·x`) | `arithmetic-operations-relations/{algebraic-laws, identity-elements, derived-laws}` | `NaturalNumbers/ArithmeticLaws` *(new)* | abstract `PeanoSystem`, **expressed via the VolumeI `Algebra/Laws` predicates** |
| **3 · Order** | `lt`/`le`, trichotomy, transitivity, monotonicity, discreteness, well-ordering | `arithmetic-operations-relations/{order-relations, order-compatibility}` | `NaturalNumbers/Order` | abstract `PeanoSystem` |
| **4 · Models & bundles** | `StandardN` is a `PeanoSystem` ⇒ inherits Layers 1–3 ⇒ is a `CommutativeMonoid`/semiring | `natural-numbers`, `formalizing-number-systems` | `NaturalNumbers/StandardN` + `VolumeI/Algebra/Bundles` models | concrete ℕ |

The boundary you named — "**+* well-defined and basic properties** (Peano) vs. **full arithmetic,
commutative/associative** (ℕ)" — is the **Layer 1 / Layer 2** line. Agreed and adopted.

---

## Decisions to lock (my recommendations; yours to ratify)

1. **Prove the laws once, abstractly on `PeanoSystem`. ℕ inherits.**
   Layer 2 lives on `ps : PeanoSystem`, not on concrete ℕ. `StandardN` then gets every law for
   free as a model. This is the "do it properly once" principle already stated for this project.

2. **Unify the two tracks via the VolumeI law predicates.**
   Layer 2 proves `IsCommutative (plus ps)`, `IsAssociative (mul ps)`, etc. — the *predicates*
   from `VolumeI/Algebra/Laws.lean`. Then the bundle ℕ model in `Arithmetic.lean` is fed by
   **`StandardN`'s inherited proofs**, not by core `Nat.add_comm`. The core-`Nat` borrow becomes
   either deleted or an explicitly-documented convenience witness — not the canonical source.
   *(This is the concrete fix for the "two disconnected tracks" problem.)*
   **[RESOLVED]** The proof-work carrier is a **fresh inductive `N`** (and later `W,Z,Q,R`
   likewise), *not* core `Nat`. So "inherit from the abstract proofs" is the canonical path and the
   core-`Nat` borrow is a scaffold to retire. With *every* number system a fresh inductive, proving
   the laws once against an interface is load-bearing, not a nicety — you will not re-prove
   associativity five times. This "prove once" happens at **two** levels: `PeanoSystem` (N's
   intrinsic arithmetic) and the algebra **bundles** (the ring/field laws shared by `Z,Q,R`, none
   of which are Peano systems).

3. **Naming caution — do not call Layer 1 "Peano Arithmetic" in the Lean.**
   "Peano Arithmetic / PA" has a precise standard meaning: the *first-order theory* whose theorems
   **include** commutativity, associativity, distributivity. Your Layer 1 is narrower (just
   well-definedness). Calling it "Peano arithmetic" will collide head-on when you reach
   Feferman/metatheory, where PA is a formal object you reason *about*. Suggest: name Layer 1 by
   what it is — *recursive operations* / *well-definedness* — and reserve "Peano Arithmetic (PA)"
   for the metatheory layer. (Conceptually you can still think "Peano-level vs ℕ-level"; just keep
   the **identifier** unambiguous.)

4. **Build order follows the DAG, not the LaTeX's presentation order.**
   You author from the LaTeX, but you *port* bottom-up. The keystone is additive commutativity
   (Landau Thm 6), which three downstream stubs silently wait on. See the queue below.

---

## Re-alignment (minimal file moves — only where a layer boundary is crossed)

- `Addition.lean` → split: keep `plus`/`plus_base`/`plus_step` (Layer 1); move/route the laws
  (`addition_is_associative` + the missing comm/cancel) to `ArithmeticLaws` (Layer 2).
- `Multiplication.lean` → same: `mul`/`mul_base`/`mul_step`/`mul_unique` stay (Layer 1); the four
  law stubs + `mul_one_left` + the new `mul_step_left` go to `ArithmeticLaws` (Layer 2).
- `Order.lean` → stays Layer 3; no split, but it consumes Layer 2.
- `Arithmetic.lean` (bundle models) → rewire to source laws from `StandardN`/Layer 2 (Decision 2).

Keep moves minimal. The goal is one clean Layer-1/Layer-2 seam, not a reorganization for its own
sake.

---

## Port queue (dependency-ordered) — keyed to the reconciliation index

Each item: *port the statement from its LaTeX proof file → prove in Lean → tick the index row.*

1. **`plus_commutative`** (Landau Thm 6) — **MISSING** — the keystone; unblocks order + mult.
2. **`add_ne_self`** (Thm 7) — **MISSING** — unblocks `lt_irrefl` (currently a dangling dep).
3. **`add_cancel`** (Thm 8) — **MISSING**.
4. **`mul_step_left`** `((a′)·b = a·b + b)` — **new helper stub needed** — and **`mul_one_left`**.
5. **`mul_distrib_add`**, **`mul_associative`**, **`mul_commutative`** — close the existing stubs.
6. **Order stubs** — `lt_irrefl`, `lt_trans`, `lt_asymm`, `lt_trichotomy`, `lt_succ`,
   `le_antisymm`, `well_ordering`.
7. **Free closes** — the 3 redundant Peano stubs (`successor_inequality_reflects`,
   `predecessor_exists_of_not_one`, `not_one_iff_has_unique_predecessor`): delegate to existing
   proofs or delete.

Deferred (open question): Landau order/mult **monotonicity** rungs (Thm 16–26, 32–36) — see below.

---

## Open questions for you

1. **Scope of Volume II order.** Do the order-arithmetic monotonicity theorems (Landau 16–26,
   32–36) belong in Volume II's ℕ chapter, or do they first appear with the ordered-ring tier?
   Your `arithmetic-operations-relations/order-compatibility` chapter suggests they live in the
   *generic* layer — which would mean: prove them once for ordered structures, not per-ℕ.
2. ~~`StandardN.carrier` = core `Nat`, or fresh inductive?~~ **RESOLVED: fresh inductive `N`**
   (and `W,Z,Q,R` later). Canonical path = inherit from abstract proofs; retire the core-`Nat`
   borrow. `PeanoN` is the inductive proof carrier; any core-`Nat` `StandardN` survives only as a
   bridge/comparison model with isos — confirm its role when convenient.
3. **Volume cross-numbering.** The abstract algebra interface is Lean **VolumeI** (`Algebra/`),
   but the LaTeX `arithmetic-operations-relations` is **volume-ii**. Layer 2 proves against the
   VolumeI predicates regardless — but confirm this cross-volume import is the intended seam.
4. **Naming ratification** (Decision 3).

---

## Formalization deltas (document every deviation from the source)

You are free to reorder proofs and add helper lemmas the source never had — the Lean dependency
order need not match Landau's or Feferman's presentation order. But **every deviation from a
source's structure gets a recorded rationale**, or the dependency graph becomes illegible (a reader
can't tell why your graph has nodes the book doesn't). Use one consistent shape, a **Delta note**:

> **Source form** — what the book does (e.g. Feferman: one monolithic Peano-iterator theorem).
> **Our form** — what we did (split into `iter`, `iter_base`, `iter_step`, `iterator_function_unique`).
> **Why** — the engineering reason (reuse the iterator for `+`, `·`, parity, `string_rep`, … without
>   re-deriving recursion each time).
> **Dependency effect** — the new nodes/edges this introduces in the DAG.

The Feferman-iterator decomposition is the archetype and should be the first Delta note written.
Delta notes are not optional commentary — they are what makes Phase C (below) honest, because a
theorem that depends on *your* `iter_step` rather than the book's monolith only traces cleanly if
the split is documented.

## Phases & the traceability goal

Three phases, in this order (yours, sharpened):

**A — Square.** Get LaTeX and Lean to *statement parity*: every theorem in one exists in the other,
or the gap is a recorded decision. This is the audit; it fills the **LaTeX** and **Lean** columns of
the reconciliation index.

**B — Close.** Close the sorries in the relevant subgraph. *This is a prerequisite for B/C, not a
separate nicety:* a sorried proof has **fake dependency edges** — `#print axioms thm` shows
`sorryAx`, not the Peano axioms — so any topological sort or traceability claim over a sorried node
is a lie. Pre-closure, the harvester still earns its keep: its "blocked by `sorryAx`" list is
exactly your set of not-yet-traceable theorems.

**C — Sort & trace.** Run the dependency-DAG harvester (`getUsedConstantsAsSet`, transitive closure,
topological sort, sorry-taint flag — the ~40-line metaprogram). One pass yields **both** artifacts
you want: the topological build/exposition order, **and** the traceability audit. Then backport the
corrected dependency lists into the LaTeX.

**The traceability goal — "every theorem traces to an axiom" — is enforced *and* verified:**
- *Enforced by parametricity.* A theorem of signature `(ps : PeanoSystem) → …` literally cannot
  reach past `ps`'s axiom fields except through other proven lemmas — the type-checker guarantees the
  chain bottoms out at the axioms. Traceability is structural, not aspirational, for anything stated
  this way.
- *Verified by the DAG / `#print axioms`.* The harvester confirms each node's transitive closure
  bottoms out only at axiom-fields + Lean primitives, with no `sorryAx`. Your suspicion that the
  current LaTeX dependency lists aren't airtight is almost certainly right — partly because some
  proofs are sorried (so their listed deps are stubs), partly because the lists were hand-maintained
  and drift. The harvester replaces hand-maintenance with the compiled truth.

## Next action
Walk `peano-systems/proofs/recursion-on-peano-systems` and
`arithmetic-operations-relations/proofs/{algebraic-laws, identity-elements}` to fill the **LaTeX**
column of the reconciliation index — i.e., inventory which of your *already-proved-in-LaTeX*
theorems are not yet in Lean (the "move my proofs in" backlog). Then close item 1 (`plus_commutative`)
and start ripping bottom-up.
