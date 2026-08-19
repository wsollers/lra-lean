# Natural Numbers Proof Order

Tracks the proofs needed to land all three natural-number constructions as
working realizations of `LRA.NumberSystems.PeanoSystem`, in the order they
must be discharged. Every item marked `[ ]` is currently `sorry` or (for
Landau) a genuine `axiom`; nothing is filled in until it's checked off.

## Backends

Every concrete natural-number system is written *generically* against
`PeanoSystem Element SetObject [Membership Element SetObject]` — the same
interface, unparameterized by backend. What differs per construction is which
concrete `Element`/`SetObject` pair gets plugged in when the system is
actually built, and how its three law fields (`one_not_successor`,
`successor_injective`, `induction`) get discharged:

| System | `Element` / `SetObject` | How the axioms are discharged |
|---|---|---|
| `VonNeumann` | `{x : LRA.Set.ZFCSet // x ∈ Omega}` / `LRA.Set.ZFCSet` | **Proved as theorems**, from `LRA.Set.ZFC`'s axioms (Pairing, Union, Empty Set, Infinity, Separation, Foundation) |
| `Landau` | a bare postulated `LandauElement` / `PredicateSet LandauElement` | **Postulated directly as axioms**, mirroring how `LRA.Set.ZFCSet` itself is postulated (`axiom ZFCSet : Type`) |
| `Presburger` | a fresh inductive `PresburgerElement` / `PredicateSet PresburgerElement` | **Proved as theorems**, free via the inductive type's own generated recursor/injectivity/no-confusion — see §8 |

All three end up as values of the same `PeanoSystem Element SetObject` type,
just for different `Element`/`SetObject` choices. That's why
`PeanoSystem.Categoricity.UniquenessOfPeanoSystemsUpToIsomorphism` matters:
it's the one proof that ties all three together as "the same" natural
numbers, rather than three unrelated claims that happen to share a name.

---

# Part A — VonNeumann (ZFC)

## 1. ZFC prerequisites

Two proofs in `LRA.Set.ZFC` block everything below and are not specific to
natural numbers — general set-theory lemmas the von Neumann construction
happens to be the first consumer of. Both axioms already have the right
shape; these are restating them usably, the same one-line move
`PairSetExists`/`UnionOverExists` already are.

- [ ] `LRA.Set.ZFC.SeparatedSubsetExists` (`Separation/Theorems.lean`) — needed
      to carve the minimal inductive set (ω) out of an Infinity witness.
- [ ] `LRA.Set.ZFC.FoundationWitnessExists` or `NoSetIsMemberOfItself`
      (`Foundation/Theorems.lean`) — needed to rule out the 2-cycle
      `x ∈ y ∧ y ∈ x` in successor-injectivity, below.

## 2. The successor operation (`Carrier.lean`) — written

No blockers — `TheEmptySet`, `PairSet`/`TheSingleton`, and `TheUnion` are
already fully proved in `LRA.Set.ZFC`.

- [x] `VonNeumannSuccessor (x : Set) : Set := TheUnion x (TheSingleton x)`
      — a `def`, not a proof.
- [ ] `VonNeumannSuccessorIsSuccessorOf : IsSuccessorOf x (VonNeumannSuccessor x)`
      — unfolds `TheUnionMembership` + `TheSingletonIsSingletonSet`.

## 3. ω itself (`Carrier.lean`, depends on §1) — written

- [x] `TheInfinityWitness : Set := Classical.choose Infinity`.
- [ ] `TheInfinityWitnessIsInductiveSet` — `Infinity`'s statement unfolds to
      exactly `IsInductiveSet`.
- [x] `Omega : Set := TheSeparatedSubset TheInfinityWitness (fun x => ∀ B,
      IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B)` — ω as "the
      elements of the witness in every inductive subset of it." One
      Separation application; no new ZFC primitive needed for "smallest."
- [ ] `OmegaIsInductiveSet : IsInductiveSet Omega` — this *is* the induction
      principle, stated set-theoretically; §5 below repackages it against
      `PeanoSystem`'s own shape.
- [ ] `TheEmptySetInOmega : TheEmptySet ∈ Omega` — base case, pulled out of
      `OmegaIsInductiveSet` because §4 needs it directly.
- [ ] `OmegaClosedUnderSuccessor : ∀ x ∈ Omega, VonNeumannSuccessor x ∈ Omega`
      — closure case, same reason.

## 4. The actual carrier (`Carrier.lean`, depends on §3) — written

**Correction to the original plan**: the carrier is *not* `ZFCSet` itself.
`PeanoSystem`'s `induction` field quantifies over its entire `Element` type,
so `Element` has to *be* ω, not merely relate to it — `ZFCSet` contains every
set, not just the naturals, and induction over all of `ZFCSet` would be
false.

- [x] `NaturalElement : Type := {x : Set // x ∈ Omega}`.
- [x] `instance : Membership NaturalElement Set` — reads off the underlying
      set's native ZFC membership.
- [x] `NaturalZero : NaturalElement := ⟨TheEmptySet, TheEmptySetInOmega⟩`
      (`noncomputable`, since `TheEmptySet` is).
- [x] `NaturalSuccessor (element) : NaturalElement := ⟨VonNeumannSuccessor
      element.val, OmegaClosedUnderSuccessor element.val element.property⟩`
      (`noncomputable`, same reason).

## 5. The three Peano properties on `NaturalElement` (`WellFoundedness.lean`, depends on §4) — written

- [ ] `NaturalZeroIsNotSuccessor` — every von Neumann successor contains its
      predecessor, so it's never empty; doesn't need Foundation.
- [ ] `NaturalSuccessorInjective` (depends on §1's Foundation lemma) — the
      2-cycle argument.
- [ ] `NaturalInductionPrinciple` — restates §3's `OmegaIsInductiveSet`/ω-
      minimality fact in `PeanoSystem`'s own field shape.

## 6. Package as a `PeanoSystem` (`WellFoundedness.lean`, depends on §5) — written

- [x] `VonNeumannPeanoSystem : LRA.NumberSystems.PeanoSystem.PeanoSystem
      NaturalElement Set` — bundles §5's three proofs, the same shape
      `PresburgerModel.toPeanoSystem` already uses. `noncomputable`, since
      `NaturalZero`/`NaturalSuccessor` are.

## 7. §1.6.1 construction pipeline (depends on §6) — not started

`Carrier.lean`, `Equivalence.lean` (a stub — no quotient is taken; see the
file itself), and `WellFoundedness.lean` are §2–§6 above. Operations,
WellDefinedness, Laws, Behavior, and Instances are new:

- [ ] `Operations.lean` — addition and multiplication via
      `PeanoSystem.Recursion`'s existing binary-iterator machinery (same
      pattern `NAddition`/`NMultiplication` already use).
- [ ] `WellDefinedness.lean` — likely thin/trivial: no quotient is taken
      here (ZFCSet equality is native, via Extensionality), unlike a
      pairs-and-equivalence construction such as the integers.
- [ ] `Laws.lean` — associativity, commutativity, distributivity: real
      induction proofs, not restatements.
- [ ] `Behavior.lean` — e.g. the successor of ∅'s embedding is the embedding
      of "one," addition/multiplication compute as expected on small
      concrete elements.
- [ ] `Instances.lean` — registers into `PeanoSystem`/whichever system
      interface consumes this construction, plus `Add`/`Mul`/`OfNat`
      instances via the `Builders.lean`-style local-activation pattern
      `NModel.addOn` etc. already establish.

---

# Part B — Presburger (PredicateSet / type theory)

Scoped narrowly for now: a fresh carrier realizing the bare Peano axioms.
The order relation, addition, the existing generic `PresburgerModel`
struct, and the existing `LRA.VolumeII.PeanoSystems.Presburger` content
(untouched, still where it was) are a separate, later migration — not
started here.

## 8. The carrier and the three Peano properties (`Carrier.lean`) — written, flagged

- [x] `inductive PresburgerElement | zero | succ (n : PresburgerElement)`.
- [x] `PresburgerLessThan` — Presburger's primitive order relation, defined
      directly by structural recursion (not derived from addition, matching
      the `{0, S, +, <}` signature).
- [ ] `PresburgerZeroIsNotSuccessor` — **free** via
      `PresburgerElement.noConfusion`.
- [ ] `PresburgerSuccessorInjective` — **free** via
      `PresburgerElement.succ.inj`.
- [ ] `PresburgerInductionPrinciple` — **free** via `PresburgerElement.rec`,
      `subset` as the motive.

These three are not open mathematical questions the way §1/§5's are — each
is close to a one-line application of something the `inductive` keyword
already generated. Left `sorry` for now per the same discipline as
`VonNeumann`; worth revisiting whether to just fill them in, since
"discharging" them isn't really an exercise the way the ZFC-dependent ones
are.

## 9. Package as a `PeanoSystem` (`WellFoundedness.lean`, depends on §8) — written

- [x] `PresburgerPeanoSystem : LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (PredicateSet PresburgerElement)` — bundles §8's
      three proofs. Not `noncomputable`: nothing here uses `Classical.choose`.

## 10. Reconnect to the existing Presburger content — not started

- [ ] Decide whether `PresburgerModel` (the existing generic struct in
      `LRA.VolumeII.PeanoSystems.Presburger.PresburgerModel`), its order
      field, and `PresburgerAddition` move here and get instantiated
      concretely at `PresburgerElement`, or stay generic where they are with
      this carrier as one instantiation among others.
- [ ] Fix `LRA.NumberSystems.Integers.Construction.Model`'s import of
      `LRA.VolumeII.PeanoSystems.Presburger.ModelTheory` if that content
      moves too (it currently uses the *other* signature in that file,
      `AdditiveOrderedSignature`, not `PresburgerModel` — check before
      touching).
- [ ] §1.6.1's remaining pipeline stages (Operations/WellDefinedness/Laws/
      Behavior/Instances), same shape as Part A §7.

---

# Part C — Landau (postulated axioms)

## 11. The carrier and axioms (`Carrier.lean` + `WellFoundedness.lean`) — written

Not `sorry` — these are genuine `axiom`s by design (see `Carrier.lean`'s own
doc comment for why), not proof obligations to discharge later.

- [x] `axiom LandauElement : Type`.
- [x] `axiom LandauOne : LandauElement`.
- [x] `axiom LandauSuccessor : LandauElement → LandauElement`.
- [x] `axiom LandauBaseNotSuccessor`.
- [x] `axiom LandauSuccessorInjective`.
- [x] `axiom LandauInduction`.
- [x] `LandauPeanoSystem : LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement)` — built directly from the
      axioms above, no proof obligation of its own.

## 12. §1.6.1 construction pipeline (depends on §11) — not started

Same shape as Part A §7 and Part B §10 — Operations, WellDefinedness, Laws,
Behavior, Instances. Landau's own arithmetic (the existing one-based
`LRA.VolumeII.NaturalNumbers.Operations.*` content, confirmed one-based by
its `NAdditionWithOne`/`NMultiplicationWithOne`/`NExponentiationWithOne`
base cases) is likely this construction's seed material for `Operations.lean`
and `Laws.lean`, once `NModel`'s carrier is repointed at `LandauElement`
instead of staying abstract — not decided or started.
