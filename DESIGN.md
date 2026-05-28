# DESIGN.md
## lra-lean — Design Rules, Style Guide, and Proof Architecture

---

## 1. Project Goal

Build a formally verified development of the number systems
from first principles in bare Lean 4, following the mathematical
tradition of Landau, Feferman, Thurston, Mendelson, and Dedekind.

The endpoint is a verified path from the Peano axioms through
N → W → Z → Q → R, terminating in the metric and topological
machinery needed to support stochastic analysis on compact manifolds
(specifically Brownian motion on the torus T²).

**The guiding principle:** every definition and theorem is proved
once, correctly, at the right level of generality, and then cited
everywhere it is needed. Nothing is reproved. Nothing is duplicated.

---

## 2. Mathlib Policy

| Volume | Mathlib | Rationale |
|---|---|---|
| VolumeI | Permitted | Exploratory |
| VolumeII | **Forbidden** | Everything proved from Peano axioms |
| VolumeIII+ | Permitted | Analysis, topology, stochastic |

VolumeII has zero package dependencies. The `lake-manifest.json`
`packages` field must remain empty for VolumeII. Any PR that adds
a Mathlib import to a VolumeII file is rejected.

Permitted in VolumeII without import:
- Core Lean 4 kernel (`Init`)
- `Quotient`, `Setoid` (in `Init.Core`)
- `Classical.byContradiction`, `Classical.em`
- All core tactics: `intro`, `apply`, `exact`, `rw`, `induction`,
  `cases`, `constructor`, `refine`, `congr`, `simp` (no lemma sets)

---

## 3. The Proof Architecture Principle

VolumeII is built on a **proof architecture**, not ad hoc proofs.

The architecture is:

```
Peano Axioms (Axioms.lean)
  └── N_rec axioms (iterator machine)
        └── Peano Iterator Theorem (Recursion.lean)
              ├── Lemma C  — R* is an iterator relation
              ├── Lemma A  — uniqueness (proved independently, first)
              ├── Lemma B2 — completeness
              ├── Lemma B1-bridge — single-valued (minimality argument)
              ├── Lemma B1 — determinism
              └── Lemma B  — existence
                    └── All arithmetic definitions
                          (Addition, Multiplication, Exponentiation, ...)
```

**Consequence:** Every arithmetic definition is 1–3 lines.
Every uniqueness proof is a single citation of `iterator_unique`.
No arithmetic file reproves existence or uniqueness from scratch.

A new operation is added by:
1. Configuring `(W, c, g)` — one `def` line
2. Stating the base and step clauses — two `theorem` lines
3. Citing `iterator_unique` for uniqueness — one line

If a proof is longer than ~10 lines, ask whether a missing
intermediate lemma should be added to the architecture.

---

## 4. File Organisation

```
LRA/VolumeII/NaturalNumbers/
  Axioms.lean          -- Peano axioms, N, one, successor, A3, A4, A5
                       -- N_rec + N_rec_one + N_rec_succ (iterator machine)
  Recursion.lean       -- Peano Iterator Theorem (Feferman §3.4 style)
                       -- Lemmas C, A, B2, B1-bridge, B1, B
                       -- iterator_unique (general, for any W)
  Addition.lean        -- plus, add_base, add_step
                       -- Algebraic laws: assoc, comm, cancel, add_ne_self
  Multiplication.lean  -- mul, mul_base, mul_step
                       -- Algebraic laws: assoc, comm, distributivity
  Exponentiation.lean  -- exp, exp_base, exp_step
                       -- Algebraic laws: exp_add, exp_mul
  Utilities.lean       -- isOdd, isEven, isEven_isOdd_complement
                       -- Non-arithmetic W examples (Bool, List, String)
                       -- Shows W is arbitrary in the iterator theorem
  Order.lean           -- lt, le, trichotomy, well-ordering
  Division.lean        -- div, mod, division algorithm
```

Each file imports only what it needs. Import graph must be acyclic
and must respect the dependency order above. Multiplication imports
Addition. Exponentiation imports Multiplication. Order imports
Addition. Division imports Order.

---

## 5. Namespace and Module Convention

All VolumeII definitions live in `namespace Landau`.

Sub-namespaces are permitted for organisation but not required:

```lean4
namespace Landau
namespace Landau.Iterator   -- Recursion.lean internals
namespace Landau.Add        -- if needed for lemma organisation
```

Do not use dot notation on `N` (i.e. do not write `N.add_comm`).
Theorems are cited as `Landau.add_comm`.

---

## 6. Naming Convention

### Types and structures
`PascalCase`: `N`, `PeanoSystem`, `IteratorData`

### Definitions (functions and constants)
`snake_case` noun or noun phrase:

```lean4
plus        mul         exp
predecessor successor   iterator_fn
is_odd      is_even
```

### Theorems and lemmas
`snake_case` verb phrase describing exactly what the theorem says.
Name from the *conclusion*, not the proof method.

```lean4
-- Good — names the content
add_comm          -- plus x y = plus y x
add_assoc         -- plus (plus x y) z = plus x (plus y z)
add_cancel        -- plus x y = plus x z → y = z
succ_injective    -- successor x = successor y → x = y
one_not_succ      -- successor x ≠ one
iterator_unique   -- any two solutions to the iterator clauses are equal
mul_distrib_add   -- mul x (plus y z) = plus (mul x y) (mul x z)
is_odd_base       -- is_odd one = true
is_even_complement -- is_even n = !is_odd n

-- Bad — names the proof method or is too vague
induction_step    -- what does it prove?
helper1           -- no content
addition_lemma    -- which property?
```

### Lemma names in Recursion.lean
The architecture lemmas have canonical names. Do not rename them:

```lean4
lemma_C           -- R* is an iterator relation (consistency)
lemma_A           -- uniqueness of iterator functions
lemma_B2          -- R* is total (completeness)
lemma_B1_bridge   -- R* is single-valued (minimality argument)
lemma_B1          -- R* is functional (determinism)
lemma_B           -- existence of an iterator function
iterator_unique   -- the public-facing uniqueness theorem (= lemma_A generalised)
```

### Variables
Elements of N: `m n k x y z` (single letters)
Functions N → N: `f g h`
Target type: `W` (capital, matches Mendelson/Feferman notation)
Initial value: `c` (matches Mendelson)
Step rule: `g` (matches Mendelson) — note: rename locally if conflicts with
           a function variable
Predicates: `P Q`

### Axiom names
Follow the existing convention in `Axioms.lean`:
`A3`, `A4`, `A5_Induction`, `N_rec`, `N_rec_one`, `N_rec_succ`

### Display names (doc-comment names)

Every `theorem`, `lemma`, and `def` must carry a **display name**
in its doc-comment. The display name is the canonical human-readable
identifier for the item. It must match exactly the bold header used
in the corresponding markdown notes.

Format: `**[{Category} {Number} — {Descriptive Title}]**`

```lean4
-- theorem with number
/-- **[Lemma A — Uniqueness of Iterator Functions]** ... -/
theorem iterator_unique ...

-- def with number
/-- **[Definition 3 — Minimal Iterator Relation]** ... -/
def minimal_iterator_relation ...

-- algebraic law (no fixed number, content title only)
/-- **[Theorem — Addition Is Commutative]** ... -/
theorem add_comm ...

-- Landau theorem number can be included parenthetically
/-- **[Theorem — Addition Is Associative]** *(Landau Thm 5)* ... -/
theorem add_assoc ...
```

Categories: `Definition`, `Lemma`, `Theorem`, `Corollary`, `Axiom`

**Invariant:** The display name in every doc-comment must exactly
match the bold header of the corresponding item in the markdown
notes (`section_1_2_main.md` and related files). If either changes,
both must be updated together.

The Lean identifier (`iterator_unique`, `add_comm`) is stable code.
The display name is the human interface. They are independent.

---

## 7. Definition Style

Every arithmetic operation is defined by one application of `N_rec`:

```lean4
-- Template
noncomputable def op (fixed_input : N) (n : N) : ReturnType :=
  N_rec (base_value fixed_input) (step_rule fixed_input) n
```

Concrete examples:

```lean4
-- Addition: W = N, c = successor x, g = successor
noncomputable def plus (x y : N) : N :=
  N_rec (successor x) successor y

-- Multiplication: W = N, c = x, g = fun prev => plus prev x
noncomputable def mul (x y : N) : N :=
  N_rec x (fun prev => plus prev x) y

-- Exponentiation: W = N, c = x, g = fun prev => mul prev x
noncomputable def exp (x y : N) : N :=
  N_rec x (fun prev => mul prev x) y

-- isOdd: W = Bool, c = true, g = Bool.not
noncomputable def is_odd (n : N) : Bool :=
  N_rec true Bool.not n

-- isEven: W = Bool, c = false, g = Bool.not
noncomputable def is_even (n : N) : Bool :=
  N_rec false Bool.not n
```

The configuration table `(W, c, g)` must appear in a comment
above every definition:

```lean4
/--
  isOdd : N → Bool
  Iterator configuration:
    W = Bool
    c = true        (1 is odd)
    g = Bool.not    (each successor flips parity)
  Source: §1.2.1 arity examples; Feferman §3.4 with W arbitrary
-/
noncomputable def is_odd (n : N) : Bool :=
  N_rec true Bool.not n
```

---

## 8. Theorem Style

### Base and step clauses
Every operation defined by `N_rec` gets exactly two named theorems
extracted from the computation rules. These are the only theorems
that use `N_rec_one` and `N_rec_succ` directly for that operation.
All subsequent theorems use these two as their foundation.

```lean4
theorem add_base (x : N) : plus x one = successor x := by
  simp [plus, N_rec_one]

theorem add_step (x y : N) : plus x (successor y) = successor (plus x y) := by
  simp [plus, N_rec_succ]
```

### Uniqueness
Every operation gets a uniqueness theorem that is a direct
application of `iterator_unique`. It should be one line:

```lean4
theorem plus_unique : ∀ f g : N → N → N,
    (∀ x, f x one = successor x) →
    (∀ x, g x one = successor x) →
    (∀ x y, f x (successor y) = successor (f x y)) →
    (∀ x y, g x (successor y) = successor (g x y)) →
    ∀ x y, f x y = g x y :=
  fun f g hf1 hg1 hfs hgs x y => iterator_unique (hf1 x) (hg1 x) (hfs x) (hgs x) y
```

### Algebraic laws
Proved by induction on the rightmost variable, using only the
base and step clauses. Do not unfold `N_rec` in algebraic law proofs.
The base/step abstraction boundary must be respected.

---

## 9. Source Attribution

Every file has a header comment citing sources:

```lean4
-- LRA/VolumeII/NaturalNumbers/Addition.lean
--
-- Addition on the Peano natural numbers.
--
-- Sources:
--   Landau, Foundations of Analysis, §2 (Theorems 4-8)
--   Feferman, The Number Systems, §3.3 (Theorem 3.4 applied)
--   Thurston, The Number System, Chapter A (Theorem 3, uniqueness)
--   Mendelson, Number Systems, §2.3 (addition via iteration theorem)
--
-- Architecture: plus is defined by one application of N_rec.
-- Well-definedness (existence + uniqueness) is inherited from
-- the Peano Iterator Theorem in Recursion.lean.
-- No separate existence or uniqueness proof is needed here.
```

Individual theorems cite sources inline when the proof strategy
matches a specific source:

```lean4
-- Landau Theorem 6: x + y = y + x
-- Proof follows Thurston's direct induction (The Number System, p.53)
theorem add_comm (x y : N) : plus x y = plus y x := by
```

---

## 10. Proof Length Budget

Use these as guidelines. Exceeding them is a signal to extract
a lemma, not to write a longer proof.

| Item | Expected length |
|---|---|
| Base/step clause theorem | 1–2 lines |
| Uniqueness theorem | 1–3 lines |
| Simple algebraic law (assoc, comm) | 5–10 lines |
| Complex algebraic law (distributivity) | 10–20 lines |
| Iterator theorem lemma (C, A, B2) | 5–15 lines |
| B1-bridge | 20–35 lines |
| Full iterator theorem | 3–5 lines (citing lemmas) |

If a proof exceeds its budget, first ask:
1. Is there a missing lemma in `Recursion.lean`?
2. Is there a missing helper in the current file?
3. Is the induction variable correct?

---

## 11. What Requires a New Lemma

Add a lemma to the architecture when:
- The same sub-argument appears in two or more proofs
- A proof exceeds its length budget and the excess is a self-contained fact
- A future file would need to reprove the same thing

Do NOT add a lemma:
- Just to break up a long tactic block (use `have` instead)
- For a fact that is only used once and is trivial at the use site
- To match Mathlib naming (this is not Mathlib)

---

## 12. The Iterator Configuration Table

This table is the master reference. Every operation in the
repository must appear here. Update it when adding new operations.

| Operation | File | W | c | g | Depends on |
|---|---|---|---|---|---|
| `plus x y` | Addition | `N` | `successor x` | `successor` | — |
| `mul x y` | Multiplication | `N` | `x` | `fun p => plus p x` | `plus` |
| `exp x y` | Exponentiation | `N` | `x` | `fun p => mul p x` | `mul` |
| `is_odd n` | Utilities | `Bool` | `true` | `Bool.not` | — |
| `is_even n` | Utilities | `Bool` | `false` | `Bool.not` | — |

Operations to be added in subsequent sessions:
- Tetration: `W = N`, `c = x`, `g = fun p => exp x p`
- String repetition: `W = List α`, `c = s`, `g = fun p => p ++ s`
- Ternary example: TBD

---

## 13. The Arithmetic Dependency Chain

```
N_rec (axiom)
  └── plus     (Addition.lean)
        └── mul      (Multiplication.lean)
              └── exp      (Exponentiation.lean)
                    └── tetration  (future)

is_odd   (Utilities.lean) — independent of arithmetic
is_even  (Utilities.lean) — independent of arithmetic
```

Subtraction is NOT defined on N. It is defined on Z.
The development proceeds: N → W → Z → subtraction.

---

## 14. Commit Message Format

```
feat(§X.Y): short description

- What was added or changed
- Which theorems are now proved
- Which sources are cited
- If applicable: "Closes #issue"
```

Examples:
```
feat(§1.2): add Recursion.lean with iterator theorem and lemmas A, C, B2, B1, B

feat(N): add Multiplication.lean — mul_base, mul_step, mul_comm, mul_assoc, mul_distrib

feat(N): add Utilities.lean — is_odd, is_even, complement theorem, Bool iterator examples
```

---

## 15. Not in Scope for VolumeII

The following are explicitly deferred:

- Subtraction (requires Z)
- Division as a total function (truncated div is permitted in Order/Division)
- Negative numbers (requires Z)
- Fractions (requires Q)
- Real arithmetic (requires R)
- `∃!` notation (not available without Mathlib — spell out existence and uniqueness)
- Decidability instances (not needed until computation)
- `simp` lemma sets (do not tag theorems `@[simp]` without strong reason)

---

## 16. Cross-Reference Protocol

Every item in the Lean repository has a corresponding item in the
markdown notes repository (`lra-lean` ↔ `lra-volume-ii`). The
cross-reference system keeps them in sync.

### The three identifiers every item carries

| Identifier | Example | Lives in |
|---|---|---|
| **Lean identifier** | `iterator_unique` | Lean source, imports, tactics |
| **Display name** | `Lemma A — Uniqueness of Iterator Functions` | Doc-comment, markdown header |
| **Markdown anchor** | `#lemma-a` | Markdown file section anchor |

### Anchor format

Markdown anchors are derived from the display name by lowercasing,
replacing spaces and special characters with hyphens, and removing
punctuation:

```
"Lemma A — Uniqueness of Iterator Functions"  →  #lemma-a
"Definition 3 — Minimal Iterator Relation"    →  #definition-3
"Theorem — Addition Is Commutative"           →  #theorem-addition-is-commutative
"Lemma B1-bridge — Forced Values Are Unique"  →  #lemma-b1-bridge
```

### Markdown side — header format

Every named item in the markdown notes uses the anchor explicitly:

```markdown
### Lemma A — Uniqueness of Iterator Functions {#lemma-a}

### Definition 3 — Minimal Iterator Relation {#definition-3}

### Theorem — Addition Is Commutative {#theorem-addition-is-commutative}
```

### Lean side — doc-comment back-reference format

Every Lean item carries the back-reference in its doc-comment:

```lean4
/--
**[Lemma A — Uniqueness of Iterator Functions]**

Any two functions satisfying the iterator clauses with the
same initial value are equal.

*Notes cross-ref:* `§1.2.2` [#lemma-a](../notes/section_1_2_main.md#lemma-a)
-/
theorem iterator_unique ...
```

### Cross-reference table (master list)

This table is the authoritative mapping. Update it whenever a new
item is added to either repository.

| Display name | Lean identifier | Markdown anchor | Notes file |
|---|---|---|---|
| Axiom — Peano System | `N`, `one`, `successor` | `#peano-system` | `Axioms.md` |
| Axiom — Successor Not One | `A3` | `#axiom-p3` | `Axioms.md` |
| Axiom — Successor Injective | `A4` | `#axiom-p4` | `Axioms.md` |
| Axiom — Induction | `A5_Induction` | `#axiom-p5` | `Axioms.md` |
| Axiom — N_rec | `N_rec` | `#n-rec` | `Axioms.md` |
| Definition 1 — Iterator Data | `IteratorData` | `#definition-1` | `section_1_2_main.md` |
| Definition 2 — Iterator Relation | `is_iterator_relation` | `#definition-2` | `section_1_2_main.md` |
| Definition 3 — Minimal Iterator Relation | `minimal_iter_rel` | `#definition-3` | `section_1_2_main.md` |
| Lemma C — Consistency | `lemma_C` | `#lemma-c` | `section_1_2_main.md` |
| Lemma B1-bridge — Forced Values Are Unique | `lemma_B1_bridge` | `#lemma-b1-bridge` | `section_1_2_main.md` |
| Lemma B1 — Determinism | `lemma_B1` | `#lemma-b1` | `section_1_2_main.md` |
| Lemma B2 — Completeness | `lemma_B2` | `#lemma-b2` | `section_1_2_main.md` |
| Lemma A — Uniqueness of Iterator Functions | `lemma_A` | `#lemma-a` | `section_1_2_main.md` |
| Lemma B — Existence of an Iterator Function | `lemma_B` | `#lemma-b` | `section_1_2_main.md` |
| Theorem — Peano Iterator Theorem | `peano_iterator_theorem` | `#peano-iterator-theorem` | `section_1_2_main.md` |
| Definition 4 — Iterator-Generated Function | `iter` | `#definition-4` | `section_1_2_main.md` |
| Theorem — Iterator Base Clause | `iter_base` | `#theorem-iterator-base-clause` | `section_1_2_main.md` |
| Theorem — Iterator Successor Clause | `iter_step` | `#theorem-iterator-successor-clause` | `section_1_2_main.md` |
| Corollary — Uniqueness of Binary Iterator Operations | `binary_iterator_unique` | `#corollary-uniqueness-binary` | `section_1_2_main.md` |
| Definition 5 — Iteration of a Self-Map | `iterate` | `#definition-5` | `section_1_2_main.md` |
| Theorem — General Recursion Theorem | `general_recursion` | `#general-recursion-theorem` | `section_1_2_main.md` |
| Definition 8 — Addition on a Peano System | `plus` | `#definition-8` | `section_1_2_main.md` |
| Theorem — Addition Base Clause | `add_base` | `#theorem-addition-base-clause` | `section_1_2_main.md` |
| Theorem — Addition Successor Clause | `add_step` | `#theorem-addition-successor-clause` | `section_1_2_main.md` |
| Theorem — Addition Is Associative | `add_assoc` | `#theorem-addition-is-associative` | `section_1_2_main.md` |
| Theorem — Addition Is Commutative | `add_comm` | `#theorem-addition-is-commutative` | `section_1_2_main.md` |
| Theorem — Addition Cancellation | `add_cancel` | `#theorem-addition-cancellation` | `section_1_2_main.md` |
| Theorem — Uniqueness of Peano Systems | `peano_unique_iso` | `#theorem-uniqueness-peano-systems` | `section_1_2_main.md` |

*Rows for Multiplication, Exponentiation, Utilities, Order, Division
to be added when those files are created.*

---

## 17. Doc-Comment Template

Every `def`, `theorem`, `lemma`, and `corollary` must follow this
template. Omit sections that do not apply. Do not change the
field labels — tooling may parse them.

```lean4
/--
**[{Category} {Number} — {Descriptive Title}]**

{One or two sentences stating what this item is or proves,
in plain mathematical English. No Lean syntax here.}

*Iterator configuration:*
  W = {type}           -- (N_rec definitions only)
  c = {initial value}  -- omit for theorems
  g = {step rule}      -- omit for theorems

*Dependencies:* `{lean_id_1}`, `{lean_id_2}`

*Peano axioms used:* {A3 | A4 | A3 and A4 | none}
  -- include only for items in Recursion.lean

*See also:* `{lean_id}`, `{lean_id}`

*Sources:*
  {Author}, {Title}, {§Section or page}
  {Author}, {Title}, {§Section or page}

*Notes cross-ref:* §{section} [#{anchor}]({relative/path/to/file.md}#{anchor})
-/
```

### Worked examples

**A definition:**

```lean4
/--
**[Definition 8 — Addition on a Peano System]**

For each fixed left input `x`, `plus x` is the unique function
obtained by applying the Peano Iterator Theorem with initial
value `successor x` and step rule `successor`.

*Iterator configuration:*
  W = N
  c = successor x
  g = successor

*Dependencies:* `N_rec`, `N_rec_one`, `N_rec_succ`, `peano_iterator_theorem`

*Sources:*
  Landau, *Foundations of Analysis*, §2 (Axioms 6–7)
  Feferman, *The Number Systems*, §3.3 (Theorem 3.4 applied)
  Mendelson, *Number Systems*, §2.3

*Notes cross-ref:* §1.2.2 [#definition-8](../notes/section_1_2_main.md#definition-8)
-/
noncomputable def plus (x y : N) : N :=
  N_rec (successor x) successor y
```

**A theorem with no number:**

```lean4
/--
**[Theorem — Addition Is Commutative]** *(Landau Theorem 6)*

Addition on the Peano natural numbers is commutative:
`plus x y = plus y x` for all `x y : N`.

*Dependencies:* `add_base`, `add_step`, `successor_plus`, `one_plus`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 6
  Thurston, *The Number System*, Chapter A Theorem 6

*Notes cross-ref:* §1.2.3 [#theorem-addition-is-commutative](../notes/section_1_2_main.md#theorem-addition-is-commutative)
-/
theorem add_comm (x y : N) : plus x y = plus y x := by
```

**An architecture lemma:**

```lean4
/--
**[Lemma A — Uniqueness of Iterator Functions]**

Any two functions `f h : N → W` satisfying the two iterator
clauses with the same initial value `c` and step rule `g`
must be equal. This lemma is proved independently of all
construction machinery, using only the Induction Principle.

*Dependencies:* `A5_Induction`

*Peano axioms used:* none (uses only the Induction Principle)

*Sources:*
  Feferman, *The Number Systems*, §3.4 Part 2 (p. 70)
  Thurston, *The Number System*, Ch. A Theorem 3 Part 1
  Mendelson, *Number Systems*, §2.2 Step III

*Notes cross-ref:* §1.2.2 [#lemma-a](../notes/section_1_2_main.md#lemma-a)
-/
theorem lemma_A {W : Type} (c : W) (g : W → W)
    (f h : N → W)
    (hf1 : f one = c) (hh1 : h one = c)
    (hfs : ∀ n, f (successor n) = g (f n))
    (hhs : ∀ n, h (successor n) = g (h n)) :
    ∀ n, f n = h n := by
```

### Minimum required fields

The following fields are **mandatory** on every item:

- Display name (`**[...]**`)
- One-sentence description
- `*Dependencies:*`
- `*Sources:*` (at least one)
- `*Notes cross-ref:*`

Items in `Axioms.lean` are exempt from `*Dependencies:*` since
they are the foundation.

### Field presence by item type

| Field | `def` | `theorem` in Recursion.lean | other `theorem` |
|---|---|---|---|
| Display name | ✓ | ✓ | ✓ |
| Description | ✓ | ✓ | ✓ |
| Iterator configuration | ✓ | — | — |
| Dependencies | ✓ | ✓ | ✓ |
| Peano axioms used | — | ✓ | — |
| See also | optional | optional | optional |
| Sources | ✓ | ✓ | ✓ |
| Notes cross-ref | ✓ | ✓ | ✓ |
