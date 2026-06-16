# Landau, *Foundations of Analysis* — Chapter 1 (Natural Numbers): Theorem Index & Volume II Reconciliation

**Purpose.** Landau's complete, explicit ℕ development is the **spine**. This file maps each
Landau rung to its `LRA/VolumeII` Lean declaration (ground truth for dependencies) and our
`lra-volume-ii` LaTeX section (our chosen exposition). A rung where Landau is filled, Lean is
`missing`, and a proof needs it is exactly the gap this table exists to catch.

**Source.** Landau, *Foundations of Analysis*, Ch. 1, book pp. 1–18 (PDF pp. 15–32). Five
axioms, Theorems 1–36, Definitions 1–6. Verified against the repo scan.

**Status legend:** `done` (proved, no sorry) · `sorry` (declared, stubbed) ·
`missing` (no declaration exists) · `n/a` (absorbed into a definition or trivial by argument order).

---

## Category legend

| Tag | Meaning | Home in our hierarchy |
|-----|---------|----------------------|
| `PEANO` | A Peano axiom — primitive | `PeanoSystem` fields |
| `STRUCT` | Purely number-oriented (successor, distinctness, well-ordering) | Peano layer |
| `LAW` | Arithmetic/equational law (assoc, comm, distrib, cancel, identity) | algebra bundles |
| `ORDER` | The `<` / `≤` relation and its theorems | future ordered tier |
| `DEF` | Definition of an operation or relation | — |

---

## §1. Axioms  (book pp. 1–2)  ·  Lean: `PeanoSystems/PeanoSystem.lean`, `BasicTheorems.lean`  ·  LaTeX §1.1

| # | Statement | Cat | Lean decl | Status |
|---|-----------|-----|-----------|--------|
| Ax 1 | `1` is a natural number | `PEANO` | `PeanoSystem.one` | done |
| Ax 2 | every `x` has exactly one successor `x′` | `PEANO` | `PeanoSystem.successor` (totality ⇒ ∃! free) | done |
| Ax 3 | `x′ ≠ 1` | `PEANO` | `PeanoSystem.one_not_successor` | done |
| Ax 4 | `x′ = y′ → x = y` | `PEANO` | `PeanoSystem.successor_injective` | done |
| Ax 5 | induction | `PEANO` | `PeanoSystem.induction` | done |
| Thm 1 | `x ≠ y → x′ ≠ y′` | `STRUCT` | `successor_preserves_inequality` | done |
| — | (duplicate of Thm 1) | `STRUCT` | `successor_inequality_reflects` | **sorry (redundant)** |
| Thm 2 | `x′ ≠ x` | `STRUCT` | `successor_not_self` | done |
| Thm 3 | `x ≠ 1 → ∃! u, x = u′` | `STRUCT` | `predecessor_exists_unique_away_from_one` | done |
| Thm 3 (supp.) | every element is `1` or a successor | `STRUCT` | `every_element_is_one_or_successor` | done |
| — | (Thm 3 existence half) | `STRUCT` | `predecessor_exists_of_not_one` | **sorry (redundant)** |
| — | (Thm 3 iff form) | `STRUCT` | `not_one_iff_has_unique_predecessor` | **sorry (redundant)** |

## §2. Addition  (book pp. 3–8)  ·  Lean: `NaturalNumbers/Addition.lean`  ·  LaTeX §1.2

| # | Statement | Cat | Lean decl | Status |
|---|-----------|-----|-----------|--------|
| **Thm 4 = Def 1** | `+` exists & unique; `x+1=x′`, `x+y′=(x+y)′` | `DEF` | `plus`, `plus_base`, `plus_step` (uniq via `iterator_function_unique`) | done |
| Thm 5 | `(x+y)+z = x+(y+z)` — associativity | `LAW` | `addition_is_associative` | done |
| Thm 6 | `x+y = y+x` — **commutativity** | `LAW` | — | **MISSING** |
| Thm 7 | `y ≠ x+y` | `STRUCT` | — (referenced as `add_ne_self`) | **MISSING** |
| Thm 8 | cancellation: `x+y=x+z → y=z` | `LAW` | — | **MISSING** |
| Thm 9 | trichotomy via `+` (seeds order) | `ORDER` | — | **MISSING** |

## §3. Ordering  (book pp. 9–13)  ·  Lean: `NaturalNumbers/Order.lean`  ·  LaTeX §1.4

| # | Statement | Cat | Lean decl | Status |
|---|-----------|-----|-----------|--------|
| Def 2 | `x > y :⇔ ∃u, x = y+u` | `DEF` | (absorbed: `lt ps y x`) | n/a |
| Def 3 | `x < y :⇔ ∃v, y = x+v` | `DEF` | `lt` | done |
| Def 4 | `x ≥ y` | `DEF` | (absorbed: `le ps y x`) | n/a |
| Def 5 | `x ≤ y` | `DEF` | `le` | done |
| Thm 10 | trichotomy `x>y / x=y / x<y` | `ORDER` | `lt_trichotomy` | sorry |
| Thm 11 | `x>y → y<x` | `ORDER` | (def-symmetric) | n/a |
| Thm 12 | `x<y → y>x` | `ORDER` | (def-symmetric) | n/a |
| Thm 13 | `x≥y → y≤x` | `ORDER` | (absorbed in `le`) | n/a |
| Thm 14 | `x≤y → y≥x` | `ORDER` | (absorbed in `le`) | n/a |
| Thm 15 | transitivity `x<y<z → x<z` | `ORDER` | `lt_trans` | sorry |
| Thm 16 | `x≤y ∧ y<z → x<z` | `ORDER` | — | **MISSING** |
| Thm 17 | `x<y ∧ y≤z → x<z` | `ORDER` | — | **MISSING** |
| Thm 18 | `x+y > x` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 19 | `x>y → x+z>y+z` (monotonicity) | `ORDER`+`LAW` | — | **MISSING** |
| Thm 20 | converse `x+z>y+z → x>y` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 21 | `x>y ∧ z>u → x+z>y+u` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 22 | `(x≥y∧z>u) ∨ (x>y∧z≥u) → x+z>y+u` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 23 | `x≥y ∧ z≥u → x+z≥y+u` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 24 | `x ≥ 1` (1 is least) | `STRUCT`/`ORDER` | — | **MISSING** |
| Thm 25 | `y>x → y ≥ x+1` (discreteness up) | `ORDER` | — | **MISSING** |
| Thm 26 | `x < y+1 → x ≤ y` (discreteness down) | `ORDER` | — | **MISSING** |
| Thm 27 | **well-ordering**: every non-empty set has a least element | `STRUCT` | `well_ordering` (+`is_minimum`) | sorry |
| — | Lean interface extras (derived, not separate Landau #s): | | `lt_irrefl` (needs Thm 7), `lt_asymm`, `lt_succ`, `le_antisymm` | sorry |

## §4. Multiplication  (book pp. 14–18)  ·  Lean: `NaturalNumbers/Multiplication.lean`  ·  LaTeX §1.3

| # | Statement | Cat | Lean decl | Status |
|---|-----------|-----|-----------|--------|
| **Thm 28 = Def 6** | `·` exists & unique; **`x·1=x`**, `x·y′=x·y+x` | `DEF` | `mul`, `mul_base`, `mul_step`, `mul_unique` | done |
| (no Landau #) | `1·x = x` — **left identity, inductive lemma** | `LAW` | `mul_one_left` | sorry |
| Thm 29 | `x·y = y·x` — commutativity | `LAW` | `mul_commutative` | sorry |
| Thm 30 | `x·(y+z) = x·y + x·z` — distributivity | `LAW` | `mul_distrib_add` | sorry |
| Thm 31 | `(x·y)·z = x·(y·z)` — associativity | `LAW` | `mul_associative` | sorry |
| Thm 32 | `x>y → x·z>y·z` (monotonicity) | `ORDER`+`LAW` | — | **MISSING** |
| Thm 33 | converse `x·z>y·z → x>y` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 34 | `x>y ∧ z>u → x·z>y·u` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 35 | `(x≥y∧z>u) ∨ (x>y∧z≥u) → x·z>y·u` | `ORDER`+`LAW` | — | **MISSING** |
| Thm 36 | `x≥y ∧ z≥u → x·z≥y·u` | `ORDER`+`LAW` | — | **MISSING** |

---

## Reconciliation findings

### Tally
- **Proved (`done`):** all 5 axioms, Thm 1, 2, 3 (§1); Thm 4, 5 (§2); Def 3, 5 (§3); Thm 28 (§4).
- **Stubbed (`sorry`), maps to Landau:** Thm 10, 15, 27 + interface extras (§3, 7 sorries);
  `mul_one_left`, Thm 29, 30, 31 (§4, 4 sorries); 3 redundant Peano stubs (§1); `is_even_complement`
  (off-spine Feferman example). = the 15 Volume II sorries, now each identified.
- **Genuinely `missing` (no declaration):** Thm 6, 7, 8, 9 (§2); Thm 16–26 (§3); Thm 32–36 (§4).
  ≈ 21 Landau rungs absent entirely.

### Finding A — the real cut-vertex is **additive commutativity (Thm 6)**, not multiplication
`plus_commutative` does **not exist anywhere in Volume II** (Addition.lean stops at associativity;
Utilities/PeanoN/StandardN don't supply it for the abstract `PeanoSystem`). But it sits *beneath*
the multiplication stubs you've been treating as the bottleneck:
- `mul_commutative` (Thm 29) inducts to `x·y+x = y·x + x` and then must reorder a sum — needs `+`
  commutativity, and a **left-successor multiplication lemma** `(a′)·b = a·b + b` that is **also not
  stubbed** (Landau hides it inside his Thm 29 proof). `mul_one_left` alone is not enough.
- So the multiplication block cannot close until §2 is completed first.

**Revised build order (bottom-up):** `plus_commutative` (Thm 6) → `add_ne_self` (Thm 7) →
`add_cancel` (Thm 8) → then a left-successor lemma `mul_step_left` (new stub needed) +
`mul_one_left` → `mul_distrib_add` → `mul_associative` → `mul_commutative`. The 4 existing mul
sorries are the *top* of this chain, not the bottom.

### Finding B — dangling dependency: `lt_irrefl` references `add_ne_self`, which doesn't exist
`Order.lean`'s `lt_irrefl` lists `add_ne_self` (= Landau Thm 7) as a dependency, but no such
declaration exists. `lt_irrefl` is therefore unprovable as-is. Thm 7 must be added to §2 first.

### Finding C — `mul_one_left` is correctly structured (your instinct confirmed)
`mul_commutative`'s stub already depends on `mul_one_left`, i.e. `1·x = x` is wired as an
**independent inductive lemma feeding commutativity**, not derived from it. That is the
non-circular structure Landau's logic requires (he never numbers `1·x=x`; it lives inside Thm 29's
proof). The scaffold is right; it just needs `plus_commutative` underneath it and a left-successor
helper beside it.

### Finding D — three redundant Peano sorries are free closes
`successor_inequality_reflects` ≡ the proved `successor_preserves_inequality`;
`predecessor_exists_of_not_one` and `not_one_iff_has_unique_predecessor` are subsumed by the proved
`predecessor_exists_unique_away_from_one` + `every_element_is_one_or_successor`. All three close by
delegating to the existing proofs — no new mathematics. (Or delete them as duplicates.)

### Finding E — the Landau citations in the Lean comments are misnumbered
The scan fixes Landau's actual layout: **§3 = Ordering (Thm 10–27), §4 = Multiplication (Thm 28–36).**
The Lean comments cite multiplication as "Landau §3, Thm 12–15" and ordering as "Landau §4–§5,
Thm 16–19" — section and theorem numbers both off (likely carried over from another source's
numbering). The **Lean decl** columns above are the corrected mapping; the `--Sources:` comment
lines in the `.lean` files should be reconciled to match.

### Finding F — the §3 ordering theory is a deliberately curated interface, not all of Landau
Lean keeps `lt`/`le` + {irrefl, trans, asymm, trichotomy, succ, le_antisymm, well_ordering}. It drops
Landau's `>`/`≥` as separate relations (gets them by argument order — the `n/a` rows) and **all** the
order-arithmetic monotonicity rungs (Thm 16–26). Whether those belong in Volume II or only arrive
with the ordered-ring tier is an exposition decision to record in the LaTeX column.

---

## Next steps
1. **Close §2 first** (`plus_commutative`, `add_ne_self`, `add_cancel`) — this unblocks both the
   multiplication stubs and the order theory. It is the true bottom of the dependency chain.
2. Add the missing helper stub `mul_step_left` ((a′)·b = a·b + b) so `mul_commutative` has all its
   premises declared.
3. Then close the 4 multiplication sorries top-down; then the 7 order sorries.
4. Free closes anytime: the 3 redundant Peano stubs (Finding D).
5. Fix the `--Sources:` Landau citations in the `.lean` files (Finding E).
6. Fill the LaTeX column by walking `lra-volume-ii`; blanks = rungs presented informally or skipped.
7. Index **Feferman** separately — it is the source for the Peano-system framing (the iterator/
   recursion machinery, `Recursion.lean`, `Utilities.lean` examples), and is metatheory-flavored;
   keep it on its own sheet, not interleaved with this ℕ ladder.

*Verified against the scan: §1 axioms + Thm 1–3, §3 order-arithmetic block Thm 20–25, §4 mult
definition Thm 28. Volume II declarations read from source 2026-06-15.*
