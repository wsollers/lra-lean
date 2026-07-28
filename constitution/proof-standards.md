# Proof Standards
## lra-lean — Proof Quality and Architecture Rules

---

## 1. The Proof Architecture Principle

VolumeII is built on a proof architecture. Every arithmetic
definition is 1–3 lines. Every uniqueness proof is a single
citation of `iterator_unique`. No arithmetic file reproves
existence or uniqueness from scratch.

The dependency chain:

```
N_rec (axiom)
  └── iterator_unique (Recursion.lean)
        └── plus (Addition.lean) — one N_rec call
              └── mul (Multiplication.lean) — one N_rec call
                    └── exp (Exponentiation.lean) — one N_rec call
```

---

## 2. Uniqueness Always Cites iterator_unique

Do not reprove uniqueness of any recursive function by induction.
Always cite `iterator_unique` (or its binary corollary).

The pattern:
```lean4
theorem plus_unique ... :=
  fun f g hf1 hg1 hfs hgs x y =>
    iterator_unique (hf1 x) (hg1 x) (hfs x) (hgs x) y
```

---

## 3. Algebraic Laws Use Only Base/Step Clauses

Algebraic law proofs (commutativity, associativity, etc.) must
use only the named base and step clause theorems. Do not unfold
`N_rec` inside algebraic proofs. The abstraction boundary
must be respected.

Allowed inside add_comm:
```lean4
rw [plus_base]   -- ✓
rw [plus_step]   -- ✓
```

Forbidden:
```lean4
simp [plus, N_rec]   -- ✗ breaks abstraction
unfold plus          -- ✗ breaks abstraction
```

---

## 4. When to Add a Lemma

Add a lemma to the architecture when:
- The same sub-argument appears in two or more proofs
- A proof exceeds its length budget
- A future file would need to reprove the same thing

Do NOT add a lemma:
- Just to break up a long tactic block (use `have` instead)
- For a fact used only once and trivial at the use site
- To match Mathlib naming

---

## 5. Induction Variable

For arithmetic proofs, always induct on the rightmost variable
unless there is a specific reason not to. The N_rec definition
is recursive in the rightmost (second) argument, so induction
on the rightmost variable aligns with the definition and
produces the shortest proofs.

---

## 6. Proof Stubs

For active formalization passes, a source-facing theorem may be introduced with
`sorry` when the goal is to import and typecheck the mathematical statement
before completing the proof.

A proof-pending statement is permitted only when:
- the Lean type states the intended definition or theorem accurately;
- the doc-comment includes a mathematical statement readable outside the notes;
- the doc-comment records `*Proof status:* proof pending`;
- the module remains buildable under the relevant volume root.

Format:
```lean4
/--
**[Theorem N — Name]**

Mathematical statement: ...

*Proof status:* proof pending
-/
theorem Foo ... := by
  sorry
```

Do not use proof-pending statements to hide incomplete definitions or
ill-typed theorem signatures. A statement-import pass is successful only when
Lean accepts the declarations.
