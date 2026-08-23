# Natural Numbers Proof Order

Tracks the proofs needed to land all four natural-number constructions as
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
| `WholeNumbers` | `Option Element` / `PredicateSet (Option Element)`, generic over any one-based `model : PeanoSystem Element SetObject` | **Proved as theorems**, by adjoining a new zero (`none`) to whatever one-based system is passed in — see Part D |

All four end up as values of the same `PeanoSystem Element SetObject` type,
just for different `Element`/`SetObject` choices. That's why
`PeanoSystem.Categoricity.UniquenessOfPeanoSystemsUpToIsomorphism` matters:
once a construction supplies full predicate induction (either directly or via
an explicit `PredicateSetComprehensionAdequacy` witness upgrading the backend
subset axiom to full predicate induction), it is the one proof that ties all
four together as "the same" natural numbers, rather than four unrelated
claims that happen to share a name.

`WholeNumbers` was originally a separate `LRA.VolumeII.WholeNumbers` system
in the embedding chain ("naturals, whole, integer, rational, ..."); reading
its actual content (`Carrier natural_data := Option Element`, plus the three
Peano properties stated for it) showed it is a *fourth construction of the
naturals themselves* — adjoining a zero to a one-based model is exactly what
`VonNeumann` and `Presburger` also do, by different techniques — not a new
rung on the ladder. It moved here rather than getting its own top-level home.

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

A fresh carrier realizing the bare Peano axioms (§8-9), plus the generic
`PresburgerModel`/`PresburgerAddition`/order-relation content, reconnected
here from the old `LRA.VolumeII.PeanoSystems.Presburger` tree (§10).

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

## 10. Reconnect to the existing Presburger content — done, decided as "stay generic"

Decided: `PresburgerModel` (order relation included), `PresburgerAddition`,
and the FO signature/model stay *generic* over `[Membership Element SetObject]`
— not collapsed onto `PresburgerElement` specifically — matching the same
call made for Landau's arithmetic in Part C. `PresburgerElement`/
`PresburgerLessThan`/`PresburgerPeanoSystem` (§8-9) are one particular,
concrete instantiation of this generic interface, not a replacement for it.

- [x] `PresburgerModel` (generic struct, order field included) and
      `PresburgerModel.toPeanoSystem` moved to `Carrier.lean`, unchanged in
      substance, from `LRA.VolumeII.PeanoSystems.Presburger.PresburgerModel`.
- [x] `PresburgerArithmetic` moved to `WellFoundedness.lean`.
- [x] `PresburgerAddition`/`PresburgerAdditionClauses` moved to
      `Operations.lean` (`PresburgerAdditionWellDefined` stays `sorry`, as
      it always was).
- [x] The FO signature (`PresburgerFunctionSymbol` etc.,
      `PresburgerSignature`) and `PresburgerModel.toFirstOrderModel` moved
      to `Instances.lean`, per §1.6.1: a construction discharges its model
      obligation once, by exhibiting the `Model`.
- [x] `LRA.VolumeII.PeanoSystems.Presburger.ModelTheory.FirstOrderSignature`
      (the *other* signature in that directory, `AdditiveOrderedSignature`)
      confirmed NOT Presburger-specific and left untouched —
      `LRA.NumberSystems.Integers.Construction.Model`'s import of it is
      unaffected.
- [ ] §1.6.1's remaining pipeline stages (WellDefinedness/Laws/Behavior),
      same shape as Part A §7.

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

## 12. §1.6.1 construction pipeline — Operations done, rest not started

Decided the same way as Part B §10: kept *generic* over `[Membership Element
SetObject]`, not collapsed onto `LandauElement` specifically —
`WholeNumbers/Construction/Model.lean` genuinely needs that genericity (it
adjoins a zero to "the active one-based carrier," not to `LandauElement` by
name), and forcing it to commit would have narrowed a working consumer for
no proof benefit (everything downstream is still `sorry` either way).

- [x] `Operations/{Addition,Multiplication,Exponentiation,Builders}.lean` +
      router, moved and renamed (`N` prefix -> `Landau` prefix) from
      `LRA.VolumeII.NaturalNumbers.Operations.*`, confirmed one-based by
      the base cases named below. `NModel` itself retired — it added no
      field over `LRA.NumberSystems.PeanoSystem.PeanoSystem`, so `model`
      throughout is a bare `PeanoSystem` value now, and every former
      `model.toPeanoSystem` call is simply `model`.
- [x] `WholeNumbers/Construction/Model.lean`, `Integers/ConstructionModels.lean`,
      and `Integers/Mendelson/Construction/Model.lean` repointed at
      `LRA.NumberSystems.PeanoSystem.PeanoSystem` (the last two only ever
      used `NModel`'s type abstractly, `Nonempty (NModel ...)`; `WholeNumbers`
      calls `LandauAddition`/`LandauMultiplication` directly, renamed in place).
- [ ] WellDefinedness/Laws/Behavior — not started. (`Laws`-shaped content
      already exists as `LandauAdditionIsAssociative` etc., still `sorry`,
      moved as-is rather than freshly split into pipeline roles.)

---

# Part D — WholeNumbers (adjoin zero to a one-based system)

Moved from `LRA.VolumeII.WholeNumbers.Construction.{Model,Builders}` in full
(§1.6.1's whole pipeline, not just the carrier), since the source content
already covered every role. Kept generic over `Element`/`SetObject`, same
call as `Landau`/`Presburger`'s generic content — nothing here requires
committing to a specific one-based system, though `LandauAddition`/
`LandauMultiplication` (Landau's own, still generically-typed) are what it
actually calls.

## 13. Carrier and basic structure (`Carrier.lean`) — written, flagged

- [x] `NaturalArithmeticForWholeNumbers`, `Carrier := Option Element`,
      `zero`, `one`, `naturalEmbedding`, `successor` — moved unchanged.
- [x] `strictOrder`/`nonstrictOrder` — moved here from the source file's own
      "Operations" section, *not* to `Operations.lean`: `strong_induction`
      (§14) needs `strictOrder` and §1.6.1's pipeline order is Carrier before
      WellFoundedness before Operations, so the order relation has to be
      carrier-level content here, ahead of where it originally sat.

## 14. Peano properties and induction (`WellFoundedness.lean`, depends on §13) — written

- [x] `basic_decomposition`, `zero_is_not_successor`, `successor_is_injective`,
      `induction_from_zero`, `strong_induction` — moved unchanged, still `sorry`.
- [x] `WholeNumbersPeanoSystem` — **new**, not moved: packages the three
      properties into a `PeanoSystem (Carrier natural_data) (PredicateSet
      (Carrier natural_data))` value, matching `VonNeumannPeanoSystem`/
      `PresburgerPeanoSystem`/`LandauPeanoSystem`'s shape. The source file
      never packaged one; added for structural consistency across all four
      constructions. `Carrier natural_data → Prop` and `PredicateSet
      (Carrier natural_data)` are definitionally the same type, so
      `induction_from_zero` fits the `induction` field with no adjustment.

## 15. Arithmetic (`Operations.lean`, depends on §13) — written

- [x] `addition`, `multiplication` — moved unchanged, calling `LandauAddition`/
      `LandauMultiplication` on `natural_data.model` (renamed in place when
      `NAddition`/`NMultiplication` were, per Part C).

## 16. Laws and Behavior (`Laws.lean`/`Behavior.lean`, depends on §15) — written

- [x] `additive_structure`, `semiring_structure`, `ordered_semiring_structure`,
      `well_ordering` (`Laws.lean`) — moved unchanged, still `sorry`.
- [x] `natural_embedding_preserves_structure` (`Behavior.lean`) — moved
      unchanged, still `sorry`: the one theorem stating the embedding
      actually computes as expected, not merely that some structure exists.

## 17. Instances (`Instances.lean`, depends on §16) — written

- [x] `zeroOn`/`oneOn`/`succOn`/`addOn`/`mulOn`/`ltOn`/`leOn` and the nine
      certificate builders (`additiveSemigroupLawsOn`, ...,
      `distributiveLawsOn`) — moved unchanged from `Builders.lean`, matching
      §1.6.1's role for typeclass-instance registration.
