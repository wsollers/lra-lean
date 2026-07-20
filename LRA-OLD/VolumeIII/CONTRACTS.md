# CONTRACTS.md — Volume III Number-System Contracts

> Task brief for Claude Code. Read this and `DESIGN.md` before touching any
> file under `LRA/VolumeIII/Contracts/`. This document carries design context
> that does not live anywhere else in the repo.

---

## 1. What this is

A test-driven formalization of `ℕ → ℤ → ℚ → ℝ`. Each number system's **final
algebraic shape** is declared up front as a set of named **obligations** —
theorems stated, all proved with `sorry`. Implementation = turning `sorry`s
into proofs. The build status *is* the progress bar.

Files:

```
LRA/VolumeIII/
  Bounds.lean                 carrier-agnostic IsUpperBound/IsSupremum/… + Bounds.Algebra
  Reals/LraReal.lean          ℝ carrier: Dedekind-cut structure + the (real) order
  Contracts/Natural.lean      ℕ contract  (one-based)
  Contracts/Integer.lean      ℤ contract
  Contracts/Rational.lean     ℚ contract
  Contracts/Real.lean         ℝ contract  (the template the others copy)
  Contracts.lean              imports all four
```

---

## 2. The scoreboard — the ONE rule that overrides everything

**Source of truth for "is this done": the axiom footprint.** A declaration is
GREEN iff `#print axioms <name>` does **not** list `sorryAx`. RED otherwise.

- **Never report an obligation as proved/green/`checked` unless a clean
  `lake build` accepts it AND `#print axioms` omits `sorryAx`.** Lean's kernel
  is the scorekeeper, not your judgment and not a comment.
- A proof that compiles but still depends on a downstream `sorry` is RED. Check
  the footprint, not just the build.
- Do not "fix" a red by weakening a statement or adding an axiom. If an
  obligation is wrong, flag it — don't make it vacuously green.

---

## 3. Naming — these are CITATIONS, do not idiomatize

The names are deliberately English-like, not idiomatic-Lean, because they are
cited in proofs (`by Completeness.ArchimedeanProperty`, `LraReal.AdditionIsCommutative`).

- **Obligations / facts:** PascalCase, named for what they assert.
  `AdditionIsCommutative`, `HasNoZeroDivisors`, `RealsAreComplete`.
- **Predicates (properties):** PascalCase with `Is…`. `IsSupremum`, `IsBounded`,
  `IsArchimedean`. (Matches Volume I's `IsAssociative`.)
- **Do NOT rename obligations** to conclusion-style (`add_comm`, etc.) — that
  both breaks the citation scheme and shadows Mathlib's own `add_comm`, which
  causes real `rw`/`simp` confusion. If you need the idiomatic name, it appears
  ONLY as an instance field (see §4).

---

## 4. The wiring technique (how obligations become instances)

The exact Mathlib field names are forced, but only on the **left** of `:=`
inside an instance. Your obligation names go on the **right**, where they are
free. Reuse already-proved structure with `{ inferInstance with … }`:

```lean
instance : PartialOrder LraReal :=
  { (inferInstance : Preorder LraReal) with    -- reuse the GREEN Preorder
    le_antisymm := OrderIsAntisymmetric }       -- Mathlib slot ← your theorem
```

Assemble each capstone layer by layer (`LinearOrder`, `AddCommGroup`, `Field`,
`ConditionallyCompleteLinearOrderedField`) the same way, one `{ inferInstance
with … }` per layer, as the obligations it needs go green. The capstone for ℝ
unlocks Mathlib's `inducedOrderRingIso` → `LraReal ≃+*o ℝ` for free.

**The field NAMES on the left are Mathlib-version-specific.** When a layer
won't typecheck, the fix is almost always a renamed field (`add_left_neg` vs
`neg_add_cancel`, `nsmul`/`zsmul` data fields, the ordered-algebra refactor
`[LinearOrderedField]` → `[Field]+[LinearOrder]+[IsStrictOrderedRing]`). Confirm
against the installed Mathlib, don't guess.

---

## 5. The distinguishing-obligation ladder (implement in this order)

Each system adds structure and one signature obligation. Build bottom-up; later
carriers are constructed FROM earlier ones.

| System | gains | distinguishing obligation | capstone target |
|---|---|---|---|
| ℕ `LraNat` | — | `IsWellOrdered` | ordered cancellative (no clean single class; partner `ℕ`/`PNat`) |
| ℤ `LraInt` | 0, neg | `HasNoZeroDivisors` | `LinearOrderedCommRing` |
| ℚ `LraRat` | inverses | `IsDenselyOrdered` | `LinearOrderedField` + `Archimedean` + `DenselyOrdered` |
| ℝ `LraReal` | — | `RealsAreComplete` | `ConditionallyCompleteLinearOrderedField` |

---

## 6. Construction notes (the carriers are stubs)

- **ℕ** `LraNat` — inductive `one | succ`. The type is real; arithmetic stubbed.
  Its laws ultimately reduce to the Volume II Peano work (`PN`, `iterator_unique`).
- **ℤ** `LraInt` — currently a `pos/neg` pair stub. The genuine integer is the
  **Grothendieck quotient** of `LraNat × LraNat` by `(a,b) ~ (c,d) ↔ a+d = c+b`.
  Build the `Setoid` + `Quotient` so equality respects `~`. The pair-structure
  obligations then lift to the quotient.
- **ℚ** `LraRat` — currently a `num/den` stub. Genuine rationals = **quotient**
  of `LraInt × {d ≠ 0}` by `(a,b) ~ (c,d) ↔ a*d = c*b`.
- **ℝ** `LraReal` — lower **Dedekind cuts** of ℚ. Cuts are canonical (no
  quotient). Order (cut inclusion) is ALREADY proved — keep it green.

PLACEHOLDER rationals: `LraReal` currently cuts over Mathlib `ℚ`; once `LraRat`
is real, swap the cut's base type to `LraRat`.

---

## 7. Constitution rules that bind this work

(Full text in `DESIGN.md` / `constitution/`. Highlights that apply here:)

- **Volume II is Mathlib-FORBIDDEN, zero dependencies, no `sorry`.** These
  contract files are **Volume III**, where Mathlib and `sorry` are permitted.
  Do NOT add a Mathlib import to any `LRA/VolumeII/**` file. The genuine
  Mathlib-free constructions are Volume II foundations work; these Volume III
  contracts are the interface/bridge.
- **One-based ℕ:** the distinguished element is `one`, never `zero`. No
  additive-identity obligation, no subtraction, no negation on ℕ — that absence
  is intentional.
- **Doc-comments:** every `theorem`/`def` keeps a `**[Display Name]**`
  doc-comment (the lint checks this). The obligations already have them.
- **Strict dependency order, acyclic imports**, lower layers never import higher.

---

## 8. The workflow loop

1. `lake build LRAVolumeIII` — establish the baseline. **Fix nothing first.**
   Report what compiles vs. errors. The `sorry`s are intentional; only genuine
   errors (bad field names, typos in my blind-written stubs) get fixed now.
2. Pick the lowest obligation in the ladder (start ℕ).
3. Prove it. Keep proofs legible (DESIGN §8: named intermediate claims, no
   tactic golf). Cite a source where the constitution asks.
4. `#print axioms <obligation>` → confirm `sorryAx` is gone. Only then is it green.
5. When all obligations a layer needs are green, assemble that instance layer
   (`{ inferInstance with … }`); confirm field names against Mathlib.
6. Commit per DESIGN §14 (`feat(§X.Y): …`). Repeat.

---

## 9. Do / Don't

**Do:** build before claiming anything; check `#print axioms`; keep the citation
names; narrow `import Mathlib` to specific modules once a file is stable; reuse
green structure via `{ inferInstance with … }`.

**Don't:** mark green without a clean build; rename obligations to idiomatic Lean;
add Mathlib to Volume II; introduce a zero into one-based ℕ; weaken a statement
to make it pass; assemble a whole capstone instance as a single `:= sorry`
(that contaminates every downstream theorem — keep `sorry` at the named
obligations so the scoreboard stays granular).
