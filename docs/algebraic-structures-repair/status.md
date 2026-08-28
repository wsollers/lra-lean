# AlgebraicStructures Repair Status

- Generated: 2026-08-26
- Repo: `F:/repos/lra-lean`
- Branch: `main`
- Source: conversation — AlgebraicStructures reorg + axiom-purity audit
- Workflow: `docs/algebraic-structures-repair/README.md` — one subject at a time,
  strict tier order, two passes (reorg, audit), gated on `validate_structure.py` +
  `lake build`
- Standing decisions: `docs/algebraic-structures-repair/DECISIONS.md`

| Item | Tier | Subject | Status | Depends on | Notes |
|---|---|---|---|---|---|
| as-01 | 1 | Magma | **done** | — | Corrected: MagmaLaws = Nonempty M (not empty). Constructions/{Set,Mathlib} + real Examples (RPS, Z-sub, R\{0}-div, ZFCSet-union). New `LRA_Set` at `LRA/Set/Interop/Switch.lean`. IdentityNotRequired theorem left `sorry` (theorems are the user's to prove); other example proofs stay proved. |
| as-02 | 1 | Semigroup | **done** | — | Same Nonempty gap as Magma, fixed. Found+fixed a duplicate bridge instance in shared MathlibBridge.lean. Examples: pos-ints-under-+, even-ints-under-×, nonempty-lists-under-++. IdentityNotRequired theorem left `sorry`; other example proofs stay proved. |
| as-03 | 1 | CommutativeSemigroup | **done** | — | Added missing `CommutativeSemigroupLaws` combining class (associativity+commutativity+nonempty); `MultiplicativeCommutativeLaws` kept atomic/unchanged since it's shared downstream. Constructions/{Set,Mathlib} + 4 Examples (pos-ints-under-+, Set union/intersection semilattices, pos-even-nats-under-×, min/max on ℝ). |
| as-04 | 1 | AdditiveSemigroup | **done** | — | Same nonemptiness gap fixed. Found a real cross-tier bug (stored-field collision with `MultiplicativeSemigroupLaws` broke every combining class using both sides), fixed same-day by D7: nonemptiness is now `[Nonempty R]`, an ambient parameter, everywhere in the tree (as-01–04 revisited, 22 downstream files updated). Examples: pos-nats-under-+, even-ints-under-+, pos-even-nats-under-+. |
| as-05 | 1 | AdditiveCommutativeSemigroup | **done** | — | Same missing-combining-class gap as as-03: added `AdditiveCommutativeSemigroupLaws` (`[Nonempty R]` per D7). Examples: pos-nats-under-+ (reused), pos-even-nats-under-+ (reused), open-interval-(0,∞)-under-+ on ℝ. |
| as-06 | 1 | Archimedean | **done** | — | No Definitions/ folder needed (property, not new signature). Real Mathlib bridge proved (reindexing + strict adaptation). Examples: ℤ, ℚ (free via bridge). Non-Archimedean Failures/ example deferred — flagged for follow-up. |
| as-07 | 1 | DiscreteInteger | **done** | — | Six independent classes kept per D6 (no combining XLaws). Audit found and fixed a real bug: DiscretenessLaw's acyclicity axiom was only checked at the basepoint 0, not universally as the user's spec states — same D2 "silently wrong axiom" risk as Magma's as-01 correction. Example: ℤ (the essentially-unique model per the spec's own categoricity remarks). No Constructions/ built — no generic Mathlib typeclass matches this subject's classes 1-1. |
| as-08 | 1 | JoinSemilattice | **done** | — | D6 resolved: explicit-operation-argument style is deliberate (Lattice needs join+meet coexisting on one carrier, incompatible with [Mul R] style) — kept, not converted. Examples: Set union, ℝ max (via Mathlib SemilatticeSup bridge). Constructions/OrderTheoretic/InducedOrder.lean added: the algebraic definition induces a genuine order-theoretic join-semilattice (x≤y := x∨y=y), the equivalence-of-definitions theorem the user asked for. All proofs sorry'd per D8, including a missed one (`unionIsJoinSemilattice`) caught and fixed 2026-08-26 during the as-09 session. |
| as-09 | 1 | MeetSemilattice | **done** | — | Exact dual of as-08: explicit-operation-argument style, same D6 reasoning. Examples: Set intersection, ℝ min (via Mathlib SemilatticeInf bridge), ℕ under gcd (the user's third standard example). Constructions/OrderTheoretic/InducedOrder.lean built from the start (x≤y := x∧y=x). All proofs sorry'd from the start per D8. |
| as-10 | 2 | Monoid | **done** | Semigroup | Audit found the existing `MonoidLaws` (combining `MultiplicativeSemigroupLaws`+`MultiplicativeIdentityLaws`) already matched the user's `(M,*,e)` spec exactly — no fix needed. Built all 5 of the user's standard examples plus this process's first-ever `Failures/` folder (positive integers under addition, reusing Semigroup's own example per D3's plan). |
| as-11 | 2 | AdditiveMonoid | **done** | AdditiveSemigroup | Exact dual of as-10/Monoid, audit confirmed correct as-is. Examples: `(ℕ,+,0)` (doubles as the free-additive-monoid-on-{1} example), `NNReal`, `ENNReal`, square matrices under addition (simpler than Monoid's multiplicative version — no Fintype/DecidableEq needed). Failures/ dual built too (positive naturals, no identity). First item this whole process to build clean on the first `lake build` attempt. |
| as-12 | 2 | Lattice | **done** | JoinSemilattice, MeetSemilattice | Audited correct as-is (JoinSemilatticeLaws + MeetSemilatticeLaws + MutualAbsorptionLaw = exactly the user's 4 identities). Important finding: the algebra↔order equivalence already exists pre-built at `LRA/Order/Interop/AlgebraicLattice.lean` (both directions, more complete than either semilattice's own bridge) — did not duplicate it inside `AlgebraicStructures/Lattice`, just fixed its import path. |
| as-13 | 3 | Group | **done** | Monoid | Audit confirmed `GroupLaws` matches the user's 4 axioms exactly (no bug). Caught and fixed a real bug in my own new `ClosedSubsetGroupLaws` builder — it wrongly required `[GroupLaws A]` on the ambient, which fails for the most natural example (nonzero reals under ×, where ℝ is only a monoid). Examples: ℤ, ℝ\{0} (via the fixed builder), Sym(S), GL_n(ℝ). |
| as-14 | 3 | AdditiveGroup | **done** | AdditiveMonoid | Exact dual of Group (as-13), audited correct as-is. Applied Group's own ambient-hypothesis lesson from the start this time (closed-subset builder needs only `[AdditiveMonoidLaws A]`, not `[AdditiveGroupLaws A]`) — no build failure needed to catch it. All 4 examples free via Mathlib bridges, no wrapper structs needed (unlike Group's own item). |
| as-15 | 3 | CommutativeMonoid | **done** | CommutativeSemigroup, Monoid | Audited correct as-is. Examples: `(ℕ,+,0)` (reuses Monoid's carrier), `(ℕ,×,1)`, power set under union, Booleans under conjunction — the last a genuine find, free via Mathlib's existing `BooleanRing Bool` instance rather than built from scratch. Clean on the first `lake build` attempt. |
| as-16 | 3 | BoundedLattice | **done** | Lattice | Checked `LRA/Order/` per user request — unlike `Lattice`'s own equivalence, no order-theoretic `BoundedLattice` or algebra↔order bridge exists anywhere yet; flagged as an explicit open item rather than built (no equivalence-of-definitions section was given this time). Audited: only half of each bound's conditions is stated as an axiom, verified by hand that the other halves are provable consequences (not a gap). Examples: power set, divisor lattice of `n` (fresh construction), extended reals. |
| as-17 | 3 | DistributiveLattice | **done** | Lattice | Checked `LRA/Order/` again — unlike `BoundedLattice`, the order-theoretic definition (`LRA.Order.Lattices.DistributiveLattice`) already exists, but (like `BoundedLattice`) no algebra↔order bridge does; flagged as an open item. Audited: states both distributive identities as separate conjuncts even though the user's spec notes they're equivalent — confirmed deliberate non-minimal redundancy, not a bug. Examples: power sets, divisor lattice, chains — down-set lattices skipped for scope (needs a from-scratch poset construction). Clean on the first `lake build` attempt. |
| as-18 | 4 | Semiring | not_started | AdditiveCommutativeSemigroup, AdditiveMonoid, Monoid | owns Laws/Distributive.lean |
| as-19 | 4 | AbelianGroup | not_started | AdditiveCommutativeSemigroup, AdditiveGroup | |
| as-20 | 4 | OrderedGroup | not_started | Group | |
| as-21 | 4 | BooleanAlgebra | not_started | BoundedLattice, DistributiveLattice | |
| as-22 | 5 | CommutativeSemiring | not_started | CommutativeSemigroup, Semiring | |
| as-23 | 5 | CommutativeSemiringWithoutZero | not_started | (6 subjects, see ledger) | |
| as-24 | 5 | Ring | not_started | AbelianGroup, Semiring | |
| as-25 | 5 | OrderedSemiring | not_started | Semiring | |
| as-26 | 5 | LinearlyOrderedGroup | not_started | OrderedGroup | |
| as-27 | 6 | CommutativeRing | not_started | CommutativeSemigroup, Ring | |
| as-28 | 6 | NontrivialRing | not_started | Ring | |
| as-29 | 6 | OrderedRing | not_started | Ring | |
| as-30 | 7 | DivisionRing | not_started | NontrivialRing | |
| as-31 | 7 | IntegralDomain | not_started | CommutativeRing, NontrivialRing | |
| as-32 | 7 | LinearlyOrderedRing | not_started | OrderedRing | |
| as-33 | 8 | Field | not_started | DivisionRing, CommutativeRing | |
| as-34 | 9 | OrderedField | not_started | Field | |
| as-35 | 10 | CompleteOrderedField | not_started | OrderedField | def/abbrev not class abbrev |

**Standing design (confirmed 2026-08-26, see DECISIONS.md D7):** carrier nonemptiness
is expressed as `[Nonempty R]`, an ambient instance-implicit parameter on every
`<X>Laws` class that needs it, never as a stored field — a stored field collides by
name the moment two such classes are combined by a later `class abbrev` (this bit
`AdditiveSemigroupLaws`/`MultiplicativeSemigroupLaws` at the Semiring tier). Applied
to Magma/Semigroup/CommutativeSemigroup/AdditiveSemigroup and propagated to all 22
downstream combining classes tiers 2–10. New `<X>Laws` classes going forward should
take `[Nonempty R]` as a parameter from the start, not a field.

**Standing rule (confirmed 2026-08-26, CORRECTED same day — see DECISIONS.md D8):**
theorem proofs are the user's to write — leave every new `theorem`/`instance`-of-a-
`Prop`-class `sorry`, with NO exceptions for Mathlib bridges, `ClosedSubset*Laws`
builders, or other "structural glue" — that exemption was a mistake I introduced
myself and the user corrected twice (first narrowly, then a second time after it let
a full order-theory proof through in as-08's `InducedOrder` construction). Only
*data* (`Mul`/`Add` instances, `Set`/`structure` definitions) is still written in
full. Proofs from *before* the as-03 correction (Magma/Semigroup's closure and
non-associativity proofs, as-01/02) stay as they are — confirmed by the user, not
reverted retroactively. Everything proved in as-03 through as-06 and as-08's
Constructions/Examples *was* reverted to `sorry` on 2026-08-26 to match this rule —
see each item's ledger notes for exactly what changed.

**Next step:** Tiers 1, 2, and 3 are all fully done (as-01 through as-17). Tier 4 is now
unblocked: Semiring (as-18, needs AdditiveCommutativeSemigroup+AdditiveMonoid+Monoid, all
done), AbelianGroup (as-19, needs AdditiveCommutativeSemigroup+AdditiveGroup, both done),
OrderedGroup (as-20, needs Group, done — also depends on LRA.Order.Laws.{PartialOrder,
OperationCompatibility}, outside this tree, not in scope to change), BooleanAlgebra
(as-21, needs BoundedLattice+DistributiveLattice, both done) — all four unblocked, order
among them doesn't matter.

**Open items, order-theoretic bridges (as-16, as-17):** neither `BoundedLattice` nor
`DistributiveLattice` has an algebra↔order bridge, unlike `Lattice`'s own (found pre-built
at `LRA/Order/Interop/AlgebraicLattice.lean`). `BoundedLattice`'s order-theoretic
*definition* doesn't exist either (would need building from `LRA/Order/Bounds/`'s
`TopElement`/`BottomElement`); `DistributiveLattice`'s order-theoretic definition DOES
already exist (`LRA.Order.Lattices.DistributiveLattice`, already `sorry`'d) — only the
bridge connecting it to the algebraic side is missing. Neither was built since the user's
own messages for those two items didn't include an explicit equivalence-of-definitions
derivation the way `JoinSemilattice`/`MeetSemilattice`/`Lattice`'s did. Worth checking the
same way for `BooleanAlgebra` before assuming its own order-theoretic side is already
covered or needs building from scratch — this pattern (check `LRA/Order/` first) has paid
off three times running now. Also worth checking existing Mathlib instances before
building a from-scratch example — `CommutativeMonoid`'s Boolean-conjunction example
turned out to be free via Mathlib's pre-existing `BooleanRing Bool` instance rather than
needing new work. `DistributiveLattice`'s down-set-lattice example (one of the user's 4
standard examples) was also skipped for scope — a genuine from-scratch poset/down-set
construction, more substantial than reuse-driven examples elsewhere. Nonemptiness on any new atomic `<X>Laws` class must be
`[Nonempty R]`, never a stored field, per D7. Monoid (as-10) built this whole process's
first-ever `Failures/` folder (D3 planned the pattern from the start — "a semigroup with
no identity is exactly Monoid's failure mode" — but no prior item, including Semigroup
itself, had actually built one yet); future subjects with an obvious tier-below failure
mode should follow that same reuse pattern rather than restating content. Open items: a
non-Archimedean `Failures/` example was deferred from as-06 (see its ledger notes). Both
JoinSemilattice and MeetSemilattice have their order-theoretic bridge built
(`Constructions/OrderTheoretic/InducedOrder.lean`, sorry'd per D8). DiscreteInteger
(as-07) surfaced a real D2-class audit bug (acyclicity checked only at the basepoint
instead of universally) — fixed; see its ledger notes. As-08 also needed a follow-up
correction this session (`Examples/UnionSemilattice.lean` had one theorem the original D8
sweep missed, left fully proved) — fixed, `sorry`'d, re-verified clean. Worth a close read
of any subject's Examples/Constructions files before trusting a "done" status's D8
compliance claim at face value, since this is now a repeat miss (see DECISIONS.md D8's own
text about repeat corrections). Also worth noting for future Mathlib-bridge work: the
pre-existing, untouched (tier 4+, predates this repair process) `MathlibBridge.lean` uses
unsorried `:= ⟨⟩` for its own class-abbrev combining instances (Semiring/Ring/Field/etc.)
— do NOT treat that file as precedent when building a *new* item's own combining bridge;
Monoid's own bridge was sorry'd despite being an equally "trivial" combination, per D8's
explicit no-exceptions text.
