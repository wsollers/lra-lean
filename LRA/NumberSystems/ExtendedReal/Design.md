# Extended Real Design

`LRA_NumberSystems_ExtendedReal` is staged ahead of Volume II's promotion.
Nothing under this directory is Lean source yet — this file records the design
decided in review, ahead of the §7.6 row that will need it, so the decision
does not have to be re-derived when the implementation starts.

## The reals are a field; the extended reals are not

`ℝ̄ = ℝ ∪ {+∞, -∞}` is not a field, and no amount of careful definition changes
that: `∞ - ∞` and `0 · ∞` have no principled value. Every arithmetic convention
— including Mathlib's `EReal` — assigns the undefined cases by stipulation, not
by derivation from anything more basic. A field-first design would have to
either omit those cases (making `+` partial, which the type-theoretic carrier
does not reflect) or assign them silently (which teaches a false total function).

What `ℝ̄` genuinely, unconditionally is: a **complete lattice** and a
**complete linear order**. Every subset has a supremum and an infimum, without
exception, because `+∞` and `-∞` exist precisely to make that true. That fact
does not depend on any arithmetic convention and should not wait for one.

## Consequence: order-first, not field-first

`ExtendedReal`'s generic interface (`NumberSystems/Interface/ExtendedReal.lean`,
per §1.6) states the order-completeness obligations the same way `Real`'s
does, and leads with them. Arithmetic is layered on afterward as **optional
capability classes** — present, but not assumed by the order theory beneath
them — the same discipline `LRA.Set` uses for `HasUniversal`: a capability a
backend may or may not register, with the order theory correct either way.

`ExtendedReal/Algebra/` proves the lattice and complete-order instances into
`LRA.AlgebraicStructures`. It does not attempt a ring or group instance,
because there is none to prove: see the failure mode below.

## The failure mode is the point, not an embarrassment

`ExtendedReal/FailureModes.lean` proves `ℝ̄` is not a group under `+`, because
`∞ - ∞` is not well-defined. This is one entry in the failure-mode ladder every
number system carries (§1.6.7): each system fails to be the next structure up,
and the failure is a named classical fact rather than an aside routed around.
Pairing it with an `Examples.lean` instance of what *does* transfer — the
order-completeness results that hold regardless of the arithmetic convention
chosen — is what shows a reader the theory's actual reach.

## Where this sits in the three-layer design

Per §1.6, `ExtendedReal` is a peer generic interface and a peer system
directory to `Real`, not nested under it — the two share nothing but the order
embedding recorded in `NumberSystems/Theory/`. Its position in the pipeline
(§1.6.1) is otherwise the standard eight files; only `Laws.lean` and
`Algebra/` differ in content from a field-shaped system, since the law classes
it discharges are the order and lattice laws rather than ring laws.

## Status

Design only. Implementation waits for the §7.6 row, after the natural-number
base is settled and the reals themselves are promoted, per the sequencing in
§7.6 of `subject-architecture-prompt.md`.
