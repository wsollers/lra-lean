# Claude Code — kickoff prompt

Paste this as your FIRST message to Claude Code, in the repo root.

---

You are working in the `lra-lean` repository. Before doing anything, read these
in full:

- `LRA/VolumeIII/CONTRACTS.md`  (the task brief — read this first)
- `DESIGN.md` and `constitution/*.md`  (the project rules)
- `CLAUDE.md`  (governance)

Context you won't have: this Volume III contract scaffold was designed in a
prior session. Each number system (ℕ, ℤ, ℚ, ℝ) has its final algebraic shape
declared as named `sorry` obligations. Implementation means turning those
`sorry`s into real proofs. The rules in CONTRACTS.md are binding — especially:

1. **The scoreboard is `#print axioms`.** Never tell me an obligation is done
   unless `lake build` is clean AND `#print axioms <name>` omits `sorryAx`.
2. **Don't rename the obligations.** Their PascalCase names are citations by
   design; idiomatic Lean names would shadow Mathlib and break the scheme.
3. **Volume II stays Mathlib-free.** All work here is Volume III.

**Your first task — baseline only, fix nothing yet:**

1. Make sure `LRAVolumeIII` is wired in `lakefile.lean` (add the `require
   mathlib` and the `lean_lib LRAVolumeIII` if missing), and that
   `LRA/VolumeIII.lean` imports `LRA.VolumeIII.Contracts` and
   `LRA.VolumeIII.Bounds`.
2. Run `lake build LRAVolumeIII`.
3. Report back: what compiles, and what ERRORS (as opposed to expected `sorry`
   warnings). The `sorry`s are intentional — I want to see the honest baseline
   before we change anything. The likely real errors are Mathlib field-name
   mismatches in the stub instances and a couple of lemma names in the tests
   (`inv_mul_cancel₀`, `exists_between`); list them, don't fix them yet.

Stop after the report. We'll pick the first obligation to prove together —
expect to start with ℕ, whose laws reduce to the Volume II Peano work.
