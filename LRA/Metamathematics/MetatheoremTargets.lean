namespace LRA.Metamathematics

universe u v

/-!
`MetatheoremTargets` states, once, generically, and independently of any
particular proof system or semantics, the SHAPE of the two theorems every
proof system in this repository is ultimately being built toward:
soundness and completeness. This file proves nothing -- its purpose is
to give these two theorems a canonical, parametric statement now, so
that whichever proof system eventually discharges them (`LRA.Logic.Proof
.System.Takeuti`, explicitly work-in-progress at time of writing, or any
future proof system added to the repository) is proving an INSTANCE of
a named theorem-shape, rather than inventing its own ad hoc soundness or
completeness statement with no fixed vocabulary connecting it to the rest
of the project.

REPO STATUS, checked directly: no file anywhere under `LRA.Logic`
currently states soundness or completeness in any form, proved or
`sorry`'d -- confirmed absent by exhaustive search. This file is
therefore not correcting an existing (mis-)statement; it is supplying
the first one, deliberately at the most general level this repository's
architecture supports (parametric over an arbitrary provability relation
and an arbitrary satisfaction relation), so that FOL, SOL, and Takeuti's
sequent calculus can each instantiate it once they are far enough along,
without this file needing to change when they do.
-/

/-- The abstract shape shared by every soundness/completeness pair this
repository will eventually state: a `Provable` relation (syntactic,
proof-system-specific -- e.g. eventually derived from
`LRA.Logic.Proof.System.Takeuti`'s `Judgement`/derivation machinery) and
a `Satisfies` relation (semantic, model-specific -- e.g.
`LRA.Logic.Semantics.Satisfaction` or its SOL counterpart), both relating
a "theory" (a set of formulas serving as hypotheses) to a single formula. -/
structure ProofSemanticsPairing (Formula : Type u) (Theory : Type v) where
  Provable : Theory → Formula → Prop
  Satisfies : Theory → Formula → Prop

/-- Soundness, stated generically: everything provable from a theory is
satisfied by every model of that theory. This is the "if the syntax says
yes, the semantics agrees" direction -- the safety property a proof
system must have before its derivations can be trusted to mean anything
semantically. -/
def IsSound {Formula : Type u} {Theory : Type v}
    (pairing : ProofSemanticsPairing Formula Theory) : Prop :=
  ∀ (Γ : Theory) (φ : Formula), pairing.Provable Γ φ → pairing.Satisfies Γ φ

/-- Completeness, stated generically: everything satisfied by every model
of a theory is provable from that theory -- the converse direction,
"if the semantics agrees, the syntax can say so." This is the strictly
harder direction historically (Gödel's completeness theorem for first-
order logic is the paradigm case), and is not expected to hold for every
system in this repository (in particular, `LRA.Logic.Language
.SecondOrderMonadic` under standard semantics should NOT be expected to
satisfy this, per the well-known first-order/second-order completeness
trade documented elsewhere in this project's own logic reference notes;
Henkin semantics exists specifically to recover it, and any completeness
claim for the second-order layer must specify which semantics it targets). -/
def IsComplete {Formula : Type u} {Theory : Type v}
    (pairing : ProofSemanticsPairing Formula Theory) : Prop :=
  ∀ (Γ : Theory) (φ : Formula), pairing.Satisfies Γ φ → pairing.Provable Γ φ

/-- A named, non-vacuous proposition standing for the eventual Takeuti
soundness instance. Kept abstract here because the concrete proof-system and
semantic carriers are not yet wired into this generic owner. -/
def TakeutiSoundnessObligation : Prop :=
  ∃ (Formula : Type u) (Theory : Type v) (pairing : ProofSemanticsPairing Formula Theory),
    IsSound pairing

/-- A named, non-vacuous proposition standing for the eventual Takeuti
completeness instance. -/
def TakeutiCompletenessObligation : Prop :=
  ∃ (Formula : Type u) (Theory : Type v) (pairing : ProofSemanticsPairing Formula Theory),
    IsComplete pairing

/-- Named forward reference, not yet dischargeable: the soundness
obligation for `LRA.Logic.Proof.System.Takeuti`'s sequent calculus (LK or
LJ) paired against `LRA.Logic.Semantics.Satisfaction`, once Takeuti's
own derivation/judgement machinery is far enough along to instantiate
`ProofSemanticsPairing`. Declared here as a statement of what is owed,
not as a claim that it currently holds or has been attempted -- Takeuti
is explicitly work-in-progress, and this theorem should remain `sorry`
until that system stabilizes enough to state the instantiation precisely. -/
theorem takeutiSoundnessObligation : TakeutiSoundnessObligation := by
  sorry
/-- Named forward reference, not yet dischargeable: the corresponding
completeness obligation. Flagged separately from soundness because,
historically and in general, completeness is the harder and more
system-specific of the two directions, and because (per the doc-comment
on `IsComplete` above) it may not even be the right target for every
semantics this repository eventually supports. -/
theorem takeutiCompletenessObligation : TakeutiCompletenessObligation := by
  sorry
end LRA.Metamathematics
