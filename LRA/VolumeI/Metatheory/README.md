# Metatheory — the quarantine zone for soundness & completeness

**Status: intentionally empty of Lean.** This README *is* the work for now. Build the
contents when you actually want the metatheorems — not before. The *semantic* half of the
bridge (the algebra bundles) is already built elsewhere in the repo; this folder is reserved
for the *syntactic* half and the theorems that join the two.

---

## Why this folder exists at all

Everywhere else in this repo we do **universal algebra**: an axiom is a *field* of a
structure, fused into the carrier, and the only objects are carriers-with-their-laws and
their models. There is no free-floating syntactic theory, no satisfaction relation `⊨`, no
gap between syntax and semantics. That is deliberate, and it is the right default — we want
to *use* logic to do mathematics, not prove theorems *about* the logic.

This folder is the **one exception**. Soundness and completeness are theorems *about* a
logic, and you cannot even state them without re-opening the gap that universal algebra
deliberately closes:

```
        SYNTAX                      ⊨                     SEMANTICS
   Formula, Provable      ── satisfaction ──>      a BooleanAlgebra (model)
   (marks on paper)        interpret/⊨               (a real carrier + ops)
   ── built HERE ──                                ── already built elsewhere ──
```

- **Soundness** = "everything `Provable` is true in every model" (left ⟹ right).
- **Completeness** = "everything true in every model is `Provable`" (right ⟹ left).

Both compare the two sides, so both need the two sides to *exist separately*. That is why,
here and **only** here, we build the syntactic side as a deep embedding and wire it to the
semantic side we already have. Everything in this folder is quarantined: the `Formula` and
`Provable` types appear nowhere else in the repo. The rest of the codebase keeps using the
algebra bundles directly and never imports this folder.

---

## The three pieces

### 1. Semantic side — ALREADY BUILT (do not rebuild)

The model is a `BooleanAlgebra` bundle (same universal-algebra pattern as `CommutativeRing`
in `Algebra/Bundles.lean`; closely related to the existing `BooleanRing` in
`BooleanAlgebra/`). The first concrete model is `𝟚`, the two-element Boolean algebra. These
already exist — soundness/completeness consume them through the *interface*, never as
concrete models.

### 2. Syntactic side — TO BUILD (here)

The deep embedding. Formulas are data; provability is an inductive whose constructors are
the axiom schemas plus modus ponens. This is the `PropositionalAxiomTheory` you described.

```lean
inductive Formula where
  | atom        : Nat → Formula
  | implication : Formula → Formula → Formula
  | negation    : Formula → Formula

-- The axiom schemas as CONSTRUCTORS (each axiom is its own logical thing),
-- plus the one inference rule. This is the syntactic ⊢.
inductive Provable : Formula → Prop where
  | weakening      (φ ψ)   : Provable (φ.implication (ψ.implication φ))
  | distribution   (φ ψ χ) : Provable
      ((φ.implication (ψ.implication χ)).implication
        ((φ.implication ψ).implication (φ.implication χ)))
  | contraposition (φ ψ)   : Provable
      (((φ.negation).implication (ψ.negation)).implication (ψ.implication φ))
  | modusPonens {φ ψ} : Provable (φ.implication ψ) → Provable φ → Provable ψ
```

Note: this stays in the universal-algebra spirit you chose — the axioms are *values/
constructors*, "a type that is the axiom," not a `Theory`-as-a-set-of-sentences with all the
litter that drags in. We never carry a free-floating theory object.

### 3. The bridge — TO BUILD (here)

First the evaluation map (syntax → a model's carrier), parametric over **any** model of the
interface, then the two theorems.

```lean
-- The real work lives here, not in `soundness`. Atoms via the valuation,
-- connectives via the algebra's own operations.
def interpret (B : BooleanAlgebra) (valuation : Nat → B.Carrier) : Formula → B.Carrier
  | .atom n          => valuation n
  | .implication φ ψ => B.implication (interpret B valuation φ) (interpret B valuation ψ)
  | .negation φ      => B.negation (interpret B valuation φ)

-- SOUNDNESS — parametric over the INTERFACE, never a concrete model.
theorem soundness
    (B : BooleanAlgebra) (valuation : Nat → B.Carrier)
    (φ : Formula) (h : Provable φ) :
    interpret B valuation φ = B.Top := by
  induction h <;> -- one case per axiom constructor + modus ponens,
  sorry            -- each discharged by the corresponding LAW FIELD of B.

-- COMPLETENESS — the hard converse (Lindenbaum / maximal consistent sets).
theorem completeness
    (φ : Formula)
    (h : ∀ (B : BooleanAlgebra) (valuation : Nat → B.Carrier),
            interpret B valuation φ = B.Top) :
    Provable φ := by
  sorry
```

---

## The rules that keep this clean (do not violate)

1. **Parametric over the interface, never a concrete model.** `soundness` takes
   `B : BooleanAlgebra` as an argument and mentions no specific algebra — not `𝟚`, not a
   power-set algebra. Prove it once for the *arbitrary* `B` and it holds for every model you
   ever build, forever. You never re-prove soundness per model.

2. **Quarantine.** `Formula` and `Provable` are imported by this folder and nothing else.
   Soundness is the membrane: it hands back a statement purely about `B`, with `Provable`
   discharged, so the proof-theory machinery cannot leak into the rest of the repo.

3. **The interface is the boundary.** The day you write this, the only thing that crosses
   from the algebra side is the bundle type (`BooleanAlgebra`) and its law fields. If you
   find yourself reaching for a concrete model inside a metatheorem, stop — you've broken the
   parametricity that makes the proof universal.

---

## Honest notes for future you

- **`interpret` is the real work, not `soundness`.** Once the evaluation map is defined,
  soundness is a short induction (one case per constructor, each closed by a law field of
  `B`). Budget your effort on `interpret` and the model interface, not the induction.

- **Completeness will pull in `Classical.choice`** (maximal consistent sets via Zorn). That
  is fine and expected — it is the one place classical reasoning legitimately enters. After
  you prove it, `#print axioms completeness` will honestly report `Classical.choice`. That is
  the system working as designed: the metatheorem that needs classical logic *declares* it,
  while the constructive algebra below stays clean. Do not try to make completeness
  constructive.

- **This is a seminal proof.** Soundness/completeness for propositional logic is a genuine
  result worth doing carefully and worth a blueprint node of its own. It is not a quick
  afternoon. Treat it as its own gated pass (its own branch, its own commits), the way the
  algebra layer was built.

- **What going universal-algebra everywhere else cost you, and what this buys back.** By
  fusing axioms into bundles (the default), you gave up the ability to *state* metatheorems —
  there was no separate syntactic provability to compare against semantic truth. This folder
  is exactly where you buy that back, in isolation, without contaminating the working
  mathematics. Build it only when a metatheorem is the goal.

---

## Sequence / when to build

- **Not now.** The current passes are the *semantic* half (the algebra bundles), which is
  the right half to have first — it is the thing soundness quantifies over.
- **Prerequisite:** a `BooleanAlgebra` bundle with `implication`, `negation`, `Top`, and the
  Boolean law fields (extend / adapt the existing `BooleanRing` work).
- **Then, in order:** `Formula` → `Provable` → `interpret` → `soundness` (short) →
  `completeness` (long). Each green-gated, each committed.
- **First model to validate against:** `𝟚`, the two-element Boolean algebra — the smallest
  thing that discharges the interface and makes `interpret` concrete.

---

## Naming

- Syntactic side: `PropositionalAxiomTheory` (the `Formula` + `Provable` embedding).
- Keep the established names elsewhere (`BooleanRing`, the `BooleanAlgebra` bundle).
- When the first-order version comes, it gets its own parallel sub-area here
  (`FirstOrderAxiomTheory` + its `interpret`/soundness over first-order structures) — same
  three-piece shape, same quarantine, same parametric-over-the-interface rule.
