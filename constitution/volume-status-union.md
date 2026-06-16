# Volume I / II Status Union — LaTeX ⋈ Lean

**Method.** LaTeX side is harvested **from the `.tex` `\label{}` declarations directly**
(`tex-label-inventory.tsv`, 1102 labelled environments), *not* from the `chapter.yaml`
manifests — verification showed the manifests are incomplete (natural-numbers −53, rationals
−262, …) and the downstream ones carry wrong `source:` pointers. The `.tex` is the source of
truth. Lean side is read from `LRA/` source this session; cells marked **⟨dump⟩** await the
declaration+sorry dump to confirm exact decl names / status.

**Proof layout note.** Proofs are **inline** in the `notes-*.tex` files (each statement carries a
matching `prf:` label), *not* in the separate `proofs/notes/prf-*.tex` files the manifests
reference. Those manifest `proof_file:` paths are fictional; ignore them.

**Status legend:** `done` · `sorry` · `missing` (no Lean decl) · `n/a` (absorbed/trivial) · `⟨dump⟩`.

---

## Critical path & finish line  *(decision of record, 2026-06-15)*

**The spine is `ℕ → ℤ → ℚ → Dedekind-ℝ`, and the project is *done* when ℝ is created.**
"Created" is defined precisely: **a single sorry-free Lean term of type `CompleteOrderedField`**
(bare-Lean, no Mathlib), built via the **Dedekind-cut** construction, with the least-upper-bound
property *proven*. The spine terminates the moment that term typechecks. Everything past it is
post-finish-line.

**Why Dedekind on the critical path (dependency-correct, not just aesthetic):** Dedekind cuts rest on
ℚ's **order** theory (cuts are downward-closed sets; completeness is a sup property) — which the spine
builds anyway, since ℚ-as-an-ordered-field is core. Cauchy completion rests on ℚ's **metric** theory
(absolute value, ε-bounds, convergence) — which is *Volume 3* material. Putting Cauchy-ℝ on the spine
would drag Volume 3 forward; Dedekind keeps the spine self-contained.

**Cauchy-ℝ is deferred to Volume 3** as the *first worked instance of metric completion* — **content
there, not aspirational scaffolding in Volume 2.** Do **not** stub Cauchy sequences / convergence /
completeness in V2; defining them twice invites drift. They are born once, in V3 metric spaces, where
ℝ falls out as "the completion of ℚ."

**Categoricity is the bridge.** Dedekind-ℝ (spine) and Cauchy-ℝ (V3) are two constructions of the same
object; **"all complete ordered fields are isomorphic"** is the theorem that certifies they agree — the
ℝ analogue of Peano `3.5` ("any two Peano systems are isomorphic"). This is *why* ℝ gets built more than
once: each alternative construction earns its place **as a model in the categoricity theorem**, not as
duplicated spine content. Index alternative ℝ constructions as models, never as forks of the spine.

**Invariant under the V2/V3 question:** the upstream gates don't move. The **quotient/equivalence
foundation** gates leaving ℕ at all (ℤ = quotient of ℕ×ℕ; ℚ = quotient of ℤ×ℤ; both ℝ routes quotient
something), and **ℚ-order** gates Dedekind-ℝ. Whether Cauchy lands in V2-aspirational or V3 changes
nothing upstream — which is exactly why the decision could be parked without risk: the path ends at
Dedekind-ℝ by *definition*, so "Cauchy is up in the air" can never threaten the spine.

*Sources by system (attribution, not commitment): ℕ — Landau + Feferman §3; ℤ — Feferman §4.1–4.3;
ℚ — Mendelson or Tao (Feferman §6 indexed but likely not the source); ℝ — Dedekind (cuts, spine) +
Feferman §7.1–7.2 / Cauchy (V3). Feferman §3.4, §4.5, ch.5, §6.3–6.4, §7.3–7.5 are out of scope —
see `feferman-index.md`.*

---

## Scope: live front vs. downstream backlog

The **union with Lean** lives in four chapters. Everything below `whole-numbers` is **LaTeX-only,
no Lean yet** — a backlog, not a gap.

| Chapter | LaTeX labels (math) | Lean status | role |
|---|---|---|---|
| identity-equality-equivalence | 41 (10 thm, 13 prop, 2 lem, 2 cor, 11 def, 3 ax) | barely started | Layer 0 |
| peano-systems | 67 (12 thm, 7 lem, 5 cor, 13 def, 6 ax, 24 prf) | **mostly done** | Layer 0–1 (machinery) |
| natural-numbers | 101 (45 thm, 45 prf, 6 def, 5 ax) | **mostly missing** | Layer 1–3 (the arithmetic) |
| arithmetic-operations-relations | 113 (27 thm, 18 prop, 4 lem, 4 cor, 60 def) | defs only | Layer 2 (abstract algebra) |
| — downstream (whole, integers, rationals, reals, …) | ~780 | none | backlog |

The shape of the work: **peano-systems machinery is built; the natural-number arithmetic ladder is
written in LaTeX but not yet in Lean.** That is the front.

---

## natural-numbers (the active front — full detail)

45 theorems in LaTeX, all proven inline. Lean status from `VolumeII/NaturalNumbers/*`.

### Addition (`notes-addition-on-n`)
| LaTeX statement | Lean decl | Status |
|---|---|---|
| addition-well-defined-on-peano-system | `plus` (+ iterator) | done |
| addition-with-one  `x+1=x′` | `plus_base` | done |
| addition-successor-on-right  `x+y′=(x+y)′` | `plus_step` | done |
| **one-plus-n  `1+x`** | — | **missing** |
| addition-associative | `addition_is_associative` | done |
| **addition-commutative** | — | **missing** ← keystone |
| addition-left-cancellation | — | **missing** |
| addition-right-cancellation | — | **missing** |
| addition-cancellation | — | **missing** |
| no-natural-number-equals-itself-plus… `y≠x+y` | — (`add_ne_self`) | **missing** |

### Multiplication (`notes-multiplication-on-n`)
| LaTeX statement | Lean decl | Status |
|---|---|---|
| multiplication-well-defined-on-peano-system | `mul`,`mul_unique` | done |
| multiplication-with-one  `x·1=x` | `mul_base` | done |
| multiplication-successor-on-right | `mul_step` | done |
| one-times-n  `1·x=x` | `mul_one_left` | sorry |
| multiplication-distributes-over-addition | `mul_distrib_add` | sorry |
| left-distributivity-of-multiplication-over-addition | — | **missing** |
| multiplication-distributes-over-addition-both-sides | — | **missing** |
| multiplication-associative | `mul_associative` | sorry |
| multiplication-commutative | `mul_commutative` | sorry |
| multiplication-left-cancellation | — | **missing** |
| multiplication-right-cancellation | — | **missing** |
| multiplication-cancellation | — | **missing** |

### Order (`notes-order-on-n`)
| LaTeX statement | Lean decl | Status |
|---|---|---|
| strict-less-than-on-peano-system (def) | `lt` | done |
| less-than-or-equal-on-peano-system (def) | `le` | done |
| order-reflexive-on-peano-system | — (≤ refl) | **missing** |
| order-transitive-on-peano-system | `lt_trans` | sorry |
| order-antisymmetric-on-peano-system | `le_antisymm` | sorry |
| addition-preserves-order-on-right | — | **missing** |
| addition-preserves-order-on-left | — | **missing** |
| addition-preserves-order | — | **missing** |
| multiplication-preserves-and-reflects-strict-order | — | **missing** |
| strict-order-successor-characterization | `lt_succ` | sorry |
| trichotomy-on-peano-system | `lt_trichotomy` | sorry |
| natural-number-order-is-total | — | **missing** |
| (Lean extra) | `lt_irrefl`, `lt_asymm` | sorry |

### Induction / well-ordering / structure / powers
| LaTeX statement | Lean decl | Status |
|---|---|---|
| induction-from-arbitrary-base | — | **missing** |
| well-ordering-principle | `well_ordering` | sorry |
| induction-well-ordering-equivalence | — | **missing** |
| n-additive-structure | `NaturalNumberAdditiveMonoid` (via core ℕ) | done* |
| n-multiplicative-monoid | `NaturalNumberMultiplicativeMonoid` (via core ℕ) | done* |
| n-is-semiring | — | **missing** |
| exponentiation-well-defined + exponent sum/product/power laws | — | **missing** (×4) |
| powers preserve strict order (×2), `n<2ⁿ` | — | **missing** (×3) |

\* `done*` = modelled in `Arithmetic.lean` by borrowing core `Nat` lemmas, **not** by the abstract
Peano proofs — the two-track disconnect flagged in `PEANO_ARITHMETIC_PLAN.md`. Once the abstract
addition/multiplication ladder is closed, these should be re-sourced from it.

**natural-numbers tally:** done ≈ 9, sorry ≈ 8, **missing ≈ 28** (of 45 + structure/powers). The
LaTeX ℕ ladder is ~3× ahead of Lean.

---

## peano-systems (machinery — mostly built; confirm with dump)

LaTeX: 24 statements + 6 axioms + 13 defs. Lean: `VolumeII/PeanoSystems/*`.

- **Axioms (6)** → `PeanoSystem` fields — done.
- **Basic structural** — `induction-principle` → done; `every-element-is-one-or-a-successor` →
  `every_element_is_one_or_successor` done; `no-object-is-its-own-successor` → `successor_not_self`
  done; predecessor corollaries → `predecessor_exists_unique_away_from_one` done. Redundant sorries:
  `successor-inequality-reflection` (`successor_inequality_reflects`), `predecessor_exists_of_not_one`,
  `not_one_iff_has_unique_predecessor` — **free closes** (delegate to proven versions).
- **Recursion / iterator suite (14 stmts)** — the Feferman-decomposition: `iterator-relation-consistency`,
  `forced-values-are-unique`, `minimal-iterator-relation-{deterministic,complete}`,
  `uniqueness/existence-of-iterator-function`, `peano-iterator-theorem`, `iterator-{base-value,successor-step}`,
  `uniqueness-of-binary-iterator-operations`, `uniqueness-of-general-recursive-functions`,
  `general-recursion-{by-state-encoding,theorem}`, `uniqueness-of-peano-systems-up-to-isomorphism`
  → `Recursion.lean` / `Existence.lean` / `Induction.lean`. **⟨dump⟩** to confirm each is `done`.
  (Expected mostly done — this is the built foundation. `strong-induction`, `peano-minimality` also ⟨dump⟩.)

---

## arithmetic-operations-relations (abstract algebra — Layer 2)

LaTeX: **60 defs + 53 statements, 0 `prf:` labels** (proofs unlabelled/unwritten inline — flagged).
Lean: `VolumeI/Algebra/{Operations,Laws,Bundles}` (created this session) — the **definitions** side.

- **Definitions** (operations, laws-as-predicates, bundles: monoid/group/ring/field/ordered) →
  partially in `Operations.lean`/`Laws.lean`/`Bundles.lean`; the 60 LaTeX defs are far more than the
  handful in Lean. **⟨dump⟩** + a def-by-def pass needed.
- **Derived-law statements (53)** — `uniqueness-of-identity`, `uniqueness-of-inverse`,
  `general-associativity/commutativity`, `group-cancellation`, the ring sign-rules
  (`product-of-negatives`, `double-negation`, `negation-of-product`), `zero-absorption`/`no-zero-divisors`,
  the field laws (`inverse-of-product`, `power-of-power`, …), ordered-field laws, order-compatibility
  props → **almost all `missing` in Lean.** This is the generic layer the ℕ/ℤ/ℚ models will *consume*,
  so it's high-leverage but currently definitions-only.

---

## identity-equality-equivalence (Layer 0 — barely started in Lean)

LaTeX: 27 statements + 11 defs + 3 axioms. Lean: `VolumeI/Foundations/IdentityAxioms.lean` (created
this session) has **only** `Reflexivity` + `LeibnizSubstitution` + the `Eq` model.

- `equality-symmetry`, `equality-transitivity` → derivable from Leibniz; not yet stated — **missing**.
- The **quotient/equivalence suite** (`existence-of-a-quotient`, `equivalence-classes-partition-domain`,
  `induced-{map,operation,predicate,relation,unary-operation,partial-operation}-on-quotient`,
  `substitution-preserves-{functions,operations,predicates,relations}` ×7, congruence, projection) →
  partly lives in `VolumeI/Sets/Relations.lean` (equivalence relations) but the **quotient
  construction and induced-structure theorems are missing**. ⟨dump⟩ to map Sets/Relations coverage.

---

## Where to move forward (the read of this union)

1. **natural-numbers is the front, and `addition-commutative` is the keystone** — 28 missing rungs
   hang off the addition ladder. Build order is fixed in `PEANO_ARITHMETIC_PLAN.md`:
   `plus_commutative → add_ne_self → add_cancel → mul lemmas → order → powers`.
2. **peano-systems is likely already green** — confirm with the dump, then it's "done," and the
   3 redundant sorries are free closes.
3. **arithmetic-operations-relations is definitions-rich, theorems-poor** — the 53 generic derived
   laws are the reusable layer for ℤ/ℚ/ℝ; worth a dedicated pass *after* ℕ, since ℕ doesn't need
   most of them (it's a semiring, not a group/field).
4. **identity quotient theorems are a real gap** — needed before ℤ (constructed as a quotient of ℕ×ℕ)
   and ℚ (quotient of ℤ×ℤ). Currently only the axiom shim exists.
5. **Two manifest-hygiene debts** surfaced: regenerate `chapter.yaml` from `.tex` (they've desynced),
   and fix the wrong `source:` pointers in the downstream chapters. Tooling, not math — defer, but log.

**Immediate:** `plus_commutative` is rung one.

> **Dump resolved (2026-06-15):** peano-systems machinery is **done** — `Recursion.lean` (15 decls,
> 0 sorry) carries the full iterator/general-recursion suite; `Induction.lean` (2), `PeanoSystem.lean`
> (4) clean. The only peano sorries are the 3 redundant `BasicTheorems` stubs (free closes). Total
> Lean sorries across the whole repo: **31** — VolumeI 16 (PropositionalLogic 11, BooleanAlgebra 3,
> Presburger 1, PeanoSystemModel 1), VolumeII 15 (Order 7, Multiplication 4, BasicTheorems 3, Utilities 1).

---

# Volume-i (LaTeX logic + sets) ⋈ Lean VolumeI

LaTeX `volume-i` = 520 labels: **124 provable statements** (propositional-logic 56, predicate-logic
29, sets-relations-functions 39), 265 defs, 11 ax. Proofs are in **separate `prf-*.tex` files**
(honest layout, unlike volume-ii). Lean `VolumeI` (logic+sets part) = ~190 decls, **16 sorries**.

| LaTeX chapter | stmts / defs | Lean modules (decls, sorries) | gap |
|---|---|---|---|
| propositional-logic | 56 / 74 | `PropositionalLogic`(59, **11 sorry**) + `SimpleLogic`(24) + `MetaLogic`(11) + `PropositionalAxioms`(3) + `BooleanAlgebra`(11, **3 sorry**) | **small** — near statement-parity; 14 sorries to close |
| predicate-logic | 29 / 62 | `FirstOrderLogic/`{Model 19, Relations 20, Presburger 15(**1**), PeanoSystemModel 12(**1**), Comparison 8} | **small** — good coverage, 2 sorries |
| sets-relations-functions | 39 / 106 / 11ax | `Sets/`{SetDefinitions 6, Sets 1, Relations 27} | **LARGE** — see below |
| axiom-systems | 0 / 23 | `Foundations/IdentityAxioms`(3) + axiom structures | definitional; partial |
| proof-techniques | exposition | — | n/a by design |

## sets-relations-functions — the one real volume-i gap

LaTeX spans 8 subtopics: **order (9 proofs), functions (8), sets (6), cardinality (5),
equivalence (3)**, set-systems, relations, families. Lean `Sets/` has set-operation *definitions*
(`Set, emptySet, union, intersection, memberOf, axiom_set_extension`), **one** set-algebra theorem
(`Intersection_Distributes_Over_Union`), and the relation **predicates** (`RelationIs…` ×13) +
`EqualityRelation`/`SubsetRelation` theorems. What's absent:

- **Functions: nothing.** No `Functions` module at all. Missing: `comp-assoc`, `comp-id`,
  `comp-inj-surj`, `inverse-char`, `inverse-comp`, `image-ops`, `preimage-ops`, `ordered-pair-unique`.
- **Order theory: nothing.** Predicates exist (`RelationIsPartialOrder`…) but no theorems:
  `sup-char`, `sup-unique`, `sup-inf-duality`, `knaster-tarski`, `zorn`, `szpilrajn`, `hausdorff`,
  `induced-poset/preorder`, `order-duality`, `complete-preorder-extension`.
- **Cardinality: nothing.** `Q-countable`, `R-uncountable`, `cantor`, `schroder-bernstein`,
  `countable-union`.
- **Set algebra: 1 of ~10.** Missing `de-morgan`, `distributivity`, `associativity`,
  `commutativity`, `involution`, `identity-absorption`, `set-duality`, `sigma-intersection`,
  `fip-duality`, `one-sided`.
- **Quotient/equivalence theorems:** `equiv-partition`, `quotient-universal`, `rep-independence`
  missing (only the equivalence *predicate* exists). ← **prerequisite for ℤ/ℚ constructions.**

~35 of 39 statements absent. This is breadth (many independent theorems), not a deep dependency
chain — but the **functions + quotient** corner is load-bearing for the number systems.

## Read of the volume-i gap

Volume-i **logic is the most complete part of the whole project**: propositional and predicate
logic are near statement-parity, and all of VolumeI carries only 16 sorries. The gap is concentrated
entirely in **sets-relations-functions** — functions, order theory, and cardinality are essentially
unbuilt — and is *different in kind* from volume-ii: there it's a deep chain (close `plus_commutative`
and things unlock); here it's broad, independent theorems you can build in any order. Priority within
it: **functions + quotients first** (they gate ℤ/ℚ), then set-algebra, then order theory and
cardinality (which are more self-contained and can trail).
