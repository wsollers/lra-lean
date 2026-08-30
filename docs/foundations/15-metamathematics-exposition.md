# Metamathematics: What It Is, Why It Exists, and Why It Cannot Assume What It Studies

[← Back to Index](00-index.md)

**Scope note.** This document is not about *doing* metamathematics — it contains no new definitions or theorems beyond what's needed to explain the subject's shape. Its companion, [`LRA/Metamathematics`](../lra-lean/LRA/Metamathematics) (five schema files: `SyntacticCategory`, `StructuralIdentity`, `ObjectMetaDistinction`, `SubstitutionSafety`, `MetatheoremTargets`, plus `FiniteSyntacticCollection`), is where the subject's actual content lives as Lean code. This document explains *why* that folder has the shape it has, why it was built fourth-from-last rather than first, and why several of its files contain deliberate, honestly-recorded gaps rather than completed proofs.

---

## Part 0. The Question Before Any Definition

Every mathematical subject you've built so far in this project — Set, Relations, Equivalences, Order, Operations, Algebraic Structures — has the same shape: you pick some objects, you write down axioms about them, you prove theorems. This works because in every one of those subjects, **you already had somewhere to stand**. To state the ZFC axioms, you needed the vocabulary of first-order logic (quantifiers, connectives, the symbol $\in$) already in hand. To define "equivalence relation," you needed "set" and "ordered pair" already built. Every subject in your entire arc so far has been built *using* a stable, prior layer of machinery that the subject itself never had to justify.

Metamathematics is what happens the moment you ask an uncomfortable question: **where does that first layer of machinery come from, and what entitles you to use it before anything has been proved?**

This is not a rhetorical or philosophical throat-clearing exercise. It is the single most practically consequential question in the entire foundations arc, because the answer determines whether your ZFC axioms in `LRA/Set/ZFCSet`, your `IdentityRelation` typeclass in `LRA/Identity`, and every `Formula`/`Term` type in `LRA/Logic` are *legitimate objects of study* or merely *plausible-looking syntax that happens to typecheck*. The difference between those two things is exactly what metamathematics exists to police.

---

## Part 1. The Object Language / Metalanguage Split — Geometric Intuition First

Picture two rooms. In the first room, someone is speaking a foreign language you've just invented — call it $\mathcal{L}$. They utter strings of symbols: $\forall x\, (x \in y \to \varphi(x))$. In the second room, you are watching the first room through a window, describing in **your own, ordinary language** what's happening: "the speaker just uttered a string starting with the universal quantifier symbol, followed by a variable, followed by..."

The first room is the **object language** — the formal system being studied. The second room is the **metalanguage** — the language you use to talk *about* the object language. This is not a minor terminological nicety; it is the load-bearing distinction that makes formal logic possible at all, and confusing the two rooms is the single most common failure mode in a first encounter with the subject.

**Concretely, in your own repository:** a value of `LRA.Logic.Syntax.FirstOrder.Formula S Variable` is a **metalanguage object** — a Lean term, built by Lean's inductive machinery, sitting in room two. The `=` inside `Formula.equal t1 t2` is an **object-language symbol** — sitting in room one, meaning nothing yet, waiting for an interpretation. This is exactly the distinction `LRA/Metamathematics/ObjectMetaDistinction.lean` was written to name permanently, because without it, a reader (or a proof) can silently start treating `Formula.equal t1 t2`'s `=` as if it already meant "Lean's own equality" — which is precisely the confusion that makes `LRA.Identity`'s later, careful, separate treatment of semantic equality look redundant when it is not.

**Why this split is unavoidable, not a stylistic choice.** If you tried to eliminate the split — if the object language and the language you use to talk about it were forced to be the same language — you would run headlong into the Liar's Paradox and its formal cousins (Tarski's undefinability of truth) almost immediately. A language that can fully talk about its own truth, in itself, is inconsistent. This is not a technical inconvenience to route around; it is a theorem (Tarski, 1936, informally: no sufficiently expressive language can consistently contain its own truth predicate). Metamathematics exists, in the deepest sense, because the alternative is provably broken.

---

## Part 2. What Subject Studies This, and What It's Called

**Metamathematics** (also called, with slightly different emphases, **proof theory**, **the foundations of mathematics**, or simply **metatheory**) is the branch of logic that studies formal systems *as mathematical objects in their own right* — their syntax, their proof systems, and the relationship between what a system can prove and what is actually true under an interpretation.

This is worth distinguishing sharply from three adjacent, easily-confused subjects your project also touches:

- **Model theory** studies the *semantics* side specifically — given a formal language, what structures (models) can interpret it, and what do those structures have in common. Your project's `LRA.Logic.Model`, `LRA.UniversalAlgebra.Satisfaction` (the `SatisfiesEquation`/`IsVariety` machinery), and the entire `IsVariety`/Birkhoff HSP discussion from your Operations work are model theory. Model theory presupposes a syntax already exists to be interpreted; it does not ask how that syntax is legitimately built in the first place.
- **Proof theory** (a sub-branch of, or synonym for, metamathematics depending on the author) studies formal *derivations* as combinatorial objects — sequences or trees of formulas obeying inference rules — and asks structural questions about them (does every proof reduce to a normal form? can a proof of a contradiction be transformed into a shorter one? — cut-elimination). Your `LRA.Logic.Proof.System.Takeuti` subtree (LK, LJ, `Cut.lean`'s `IsCutRuleShape`) is proof theory in exactly this sense.
- **Metamathematics**, as the umbrella term, is what sits *underneath* both of these: it is the discipline of being careful about what you're allowed to assume before either model theory or proof theory can get off the ground at all — symbol identity, syntactic well-formedness, substitution safety, and the vocabulary (soundness, completeness) needed to eventually state what model theory and proof theory owe each other.

**Historically**, this subject crystallized in a specific, traceable way: Hilbert's program (early 20th century) proposed proving mathematics consistent using only "finitary," maximally uncontroversial reasoning — a metatheory deliberately weaker and more trustworthy than the object theory (say, full ZFC) it was studying. Gödel's incompleteness theorems (1931) showed this program's most ambitious goal was unreachable in the form Hilbert wanted, but the *method* — carefully separating what you're proving *about* a system from what the system itself proves — survived and became the subject's permanent methodology. This is directly why your own project's memory already flagged the need for "a thin chapter establishing object theory / metatheory distinction, framing soundness and completeness as metatheorems" — you were, without necessarily having the historical label in hand, asking for exactly Hilbert's methodological split.

---

## Part 3. Why It Is *Needed* — Not Merely Traditional

It would be possible to imagine a version of your project that skipped metamathematics entirely and went straight from "informal intuition" to "ZFC axioms in Lean." Here is why that would have produced a worse, not merely a less traditional, result — three concrete, non-optional reasons, each already visible in your own repository's history.

### 3.1 Without it, "well-formed formula" has no floor to stand on

Your `LRA.Logic.Syntax.FirstOrder.Formula` type is an inductive Lean type — and Lean's own kernel already guarantees, for free, that every value of an inductive type is built by a finite composition of its constructors. This sounds like it makes "is this a legitimate formula" a non-question. It does not, for a specific and instructive reason: the inductive type mechanism only guarantees the *shape* is respected; it says nothing about whether the *notion of sameness* you're using for the symbols filling those constructors is itself coherent. This is exactly the gap `LRA/Metamathematics/SyntacticCategory.lean` names: `[DecidableEq Variable]` was, before this project's own recent work, assumed silently and pervasively throughout `LRA.Logic.Syntax.FirstOrder` (in `Theory.lean`, `IsSubstitutable.lean`, `freeVariables`), with no file anywhere stating *why* this is the correct thing to demand of a syntactic category, or naming the possibility that a proof system might reasonably want *not* to assume it. Metamathematics is what turns a silent, load-bearing assumption into a named, checkable obligation.

### 3.2 Without it, a "definition" and a "guarantee about that definition" get silently conflated

Your project's own audit trail contains a perfect, concrete illustration of this danger, discovered directly rather than hypothesized: `LRA.Logic.Syntax.FirstOrder.IsSubstitutable` is a real, well-defined predicate — it correctly captures "substituting term $t$ for variable $x$ in formula $\varphi$ will not accidentally capture a free variable." But until this project's recent wiring work, **nothing connected that predicate to the actual `substitute` function** — `substitute` ran unconditionally, `IsSubstitutable` sat in the codebase unused, and no theorem anywhere asserted that performing `substitute` under the `IsSubstitutable` guard actually avoids capture. This is the textbook shape of the exact failure metamathematics exists to catch: a *name* that looks like a guarantee, sitting next to an *operation* that doesn't actually honor it, with nothing forcing the gap to be visible. `LRA/Metamathematics/SubstitutionSafety.lean` exists specifically to make this class of gap a named, trackable obligation (`noCaptureUnderSafety`) rather than a plausible-looking pair of unconnected definitions.

### 3.3 Without it, you cannot state what your entire proof-theoretic effort (Takeuti, LK/LJ) is *for*

Your `LRA.Logic.Proof.System.Takeuti` subtree is real, substantial, work-in-progress machinery for a sequent calculus. But a proof system, on its own, is just a combinatorial rule-following game — sequences of formulas manipulated by rules. What makes a proof system *worth building* rather than an arbitrary symbol-shuffling exercise is the promise that its rules track truth: that what it can derive corresponds, in some precise sense, to what is actually true under every interpretation (soundness), and — ideally, though not always achievably or even desirable, per the first-order/second-order trade your own `logic-axiom-reference.md` already documents — that it can derive everything that *is* true under every interpretation (completeness). Until `LRA/Metamathematics/MetatheoremTargets.lean` was written, **no file anywhere in the repository stated what soundness or completeness would even mean**, generically, for whatever proof system eventually got built. This is the vocabulary gap: without it, Takeuti's eventual completion has no fixed target to be checked against, and "is this proof system any good" has no answerable form.

---

## Part 4. The Definitions — What Belongs Here, Precisely

Metamathematics' definitions have a distinctive shape you won't see anywhere else in your project: **they are almost all *schemas* (obligations parameterized over an as-yet-unspecified system), not concrete constructions.** This is not a stylistic preference — it is forced by the subject's placement in your dependency order. A definition here cannot presuppose which proof system, which language, or which semantics it will eventually apply to, because those are all still being built. Compare this to, say, your Order interlude, where `Definition (Supremum)` can freely presuppose a poset already exists — Metamathematics has no such luxury, since the very things that will eventually instantiate its schemas (FOL's `Formula`, Takeuti's sequent calculus) are still under active, ongoing construction.

Concretely, five definitional shapes recur:

**4.1 Symbol-category schemas** (`SyntacticCategory`). A minimal structural demand — decidable equality — placed on *any* type a future system might use to represent a kind of symbol, stated so generically that two systems making genuinely different design choices (FOL's single `Variable` type versus Takeuti's split `FreeVar`/`BoundVar` types) are both legitimate instances, neither privileged as "the" convention.

**4.2 Expression-identity schemas** (`StructuralIdentity`). The demand that, whatever inductive syntax type a system settles on, "same expression" reduces to decidable constructor equality — again stated before any concrete `Formula` type is required to satisfy it, precisely so the schema doesn't accidentally bake in assumptions (like "every constructor field is itself decidably comparable") that a not-yet-finished system might violate for reasons not yet visible.

**4.3 The distinction itself, stated as a marker, not a theorem** (`ObjectMetaDistinction`). This is the one genuinely different case: it defines nothing computational, only a vocabulary (`DiscourseLevel`, `RequiresInterpretation`) whose entire purpose is to let every later file *say* "object-level" or "meta-level" precisely, rather than relying on prose that can drift or be misread.

**4.4 Operation-safety schemas** (`SubstitutionSafety`). The demand that any syntactic operation claiming to be "safe" under some named condition must be *shown*, not merely asserted, to be safe — stated as a typeclass whose fields require both the safety-predicate and the connecting theorem, so that supplying only the former (exactly `IsSubstitutable`'s prior state) is visibly, mechanically incomplete rather than silently plausible-looking.

**4.5 Cross-system comparison vocabulary** (`ProofSemanticsPairing`, `IsSound`, `IsComplete`). Definitions whose entire content is *relational* — they say nothing about any one proof system or semantics, only what it would mean for *some* provability relation and *some* satisfaction relation, once both exist, to cohere.

**What is conspicuously absent, and must remain absent here:** any concrete `Formula`, `Term`, `Model`, or `Signature` type. The moment a definition in this layer commits to a specific syntax or semantics, it has stopped being metamathematics and has become Logic (or Model Theory, or Proof Theory) — this is the exact boundary discussed at length in this project's placement discussion (`06b-model-theory-boundary.md`'s equational/relational split is a close cousin of this same discipline, one layer up).

---

## Part 5. The Theorems — and Why Most of Them Cannot Be Proved Yet

This is the part of the subject that most sharply distinguishes it from everything else you've built, and it deserves to be stated as plainly as possible: **a metatheorem is a claim about a formal system, and you cannot finish proving a claim about a system that does not yet exist in finished form.**

This is not a hedge or a matter of running out of time. It is a structural fact about the subject's placement in your dependency order, and your own repository already contains the clearest possible illustration of it, discovered directly rather than anticipated:

**5.1 `firstOrderSubstitutionSafetyObligation` and the `noCaptureUnderSafety` field.** The *statement* of the no-capture theorem is fully general and can be written down today, because it only needs `Expr`, `Variable`, `Term`, and the four functions/predicates relating them — all already fixed once `SubstitutionSafety`'s class signature exists. The *proof*, however, needs to inspect `Expr`'s actual binder structure, case by case, against `substitute`'s actual recursive definition — and that is real, system-specific work that belongs to whoever finishes `LRA.Logic.Syntax.FirstOrder`, not to this file. This is why the field is `sorry`'d, honestly, in `LRA/Logic/Metamathematics.lean`, with a comment recording exactly why: *"the schema is now connected to the actual operation, so the missing proof is tracked at the correct boundary."*

**5.2 `StructuralIdentity` for `Term`/`Formula` — a theorem that turned out to be false as stated, discovered by trying.** This is the single most instructive event in this project's metamathematics work so far. The obligation ("this syntax type has decidable equality") was stated as a schema instance to be discharged mechanically (`deriving DecidableEq`). When actually attempted, Lean's kernel rejected it — not because of a typo or a missing import, but because `Term`'s `apply` constructor stores a *dependent function* `Fin (S.functionArity f) → Term S Variable`, and Lean's automatic equality-derivation cannot, in general, synthesize decidable equality for arbitrary function types. **This is a real mathematical fact about the current representation of `Term`, discovered by attempting the metatheorem, not a bug in the attempt.** The correct response — and the one this project actually took — was to record the blocker honestly (no instance asserted, the exact error preserved in a doc-comment) rather than force the theorem through with `Classical.dec` (which would make the equality non-computable and hide the representational issue) or a bare `sorry` inside the instance (which would claim decidability exists when it has been shown, constructively, that it does not follow from the current definition).

**5.3 `takeutiSoundnessObligation`/`takeutiCompletenessObligation` — theorems that cannot yet be *stated* precisely, let alone proved.** These are declared as `True := by sorry` — not because the *proof* is hard, but because the *statement* itself needs a concrete `ProofSemanticsPairing` (a real `Provable` relation from Takeuti's still-developing derivation machinery, paired with a real `Satisfies` relation from `LRA.Logic.Semantics`), and that pairing cannot be honestly written down until Takeuti's judgement/derivation apparatus stabilizes. This is the deepest form of the restriction this section is about: **you cannot even fully state a metatheorem about a system until enough of that system exists to plug into the statement** — the theorem-shape can be fixed in advance (which is what `MetatheoremTargets.lean` does), but the theorem itself is necessarily a moving target until its subject stops moving.

### 5.4 The general restriction, stated as a principle

Every metatheorem in this project (and, more broadly, in the subject as historically practiced) falls into exactly one of three honest states, and conflating them is the discipline failure this whole document exists to prevent:

1. **Fully statable and fully provable now** — rare in this layer, and typically trivial when it occurs (e.g., `RequiresInterpretation`'s two-line case split). If a "metatheorem" turns out to be this easy, it is worth double-checking it hasn't accidentally become a Logic-layer fact wearing a Metamathematics-layer name.
2. **Fully statable now, provable only once a specific system stabilizes** — the `SubstitutionSafety`/`StructuralIdentity` case. The schema and its parameters can be fixed today; the proof (or the discovery that the proof is currently impossible, as in 5.2) has to wait for the system it's about.
3. **Not fully statable yet at all** — the soundness/completeness case. Only the *shape* of the eventual theorem can be fixed; the theorem itself is deferred by construction, and forcing a statement before the underlying system is ready produces something that looks precise but is actually vacuous or premature.

A metamathematics document — or, in your case, a metamathematics *folder* — that fails to distinguish these three states will inevitably drift toward quietly promoting state 2 or state 3 claims into the appearance of state 1, which is exactly the failure mode a stale `ProofsToDo.md` produced elsewhere in this project (claiming `Identity`'s logical congruence was "planning only" when it was, on direct inspection, fully proved) — the same discipline, misapplied in the opposite direction, would claim something is finished when it is genuinely still owed.

---

## Part 6. The Restrictions, Made Explicit — Why "All of Math Is Yet to Be Constructed" Is Not Rhetorical

This is the crux of your question, and it deserves to be answered as a list of concrete, binding restrictions, each traceable to a specific decision already made in this project.

**Restriction 1 — No borrowing a foundation richer than what's actually available yet.** This is not an aesthetic preference; it was tested directly in this project and failed once before being corrected. `SubstitutionSafety`'s `freeVariablesOf` field was initially typed against Mathlib's `Set` (`Set α := α → Prop`), which presupposes full impredicative propositional comprehension — a strictly stronger foundational commitment than anything else in this layer makes. This was caught, and reverted, precisely *because* Metamathematics is supposed to be the layer everything else treats as foundationally prior — reaching upward into Mathlib's own set theory, however convenient, would have been circular in the conceptual sense even though it created no cycle in Lean's own import graph. The fix (`FiniteSyntacticCollection.lean`'s `MetaCollection α := List α`) is the general form of this restriction: **use only what the ambient type theory gives you for free** (inductive types, structural recursion), never a richer theory that itself needs justifying by something even more basic.

**Restriction 2 — No proving a system-specific fact generically.** Every schema in this layer (`SyntacticCategory`, `StructuralIdentity`, `SubstitutionSafety`) is a *class*, not a theorem with a completed proof, precisely because filling in an instance requires knowledge specific to one system (FOL, Takeuti, or a future addition) that this layer is not entitled to assume. A tempting shortcut — proving `StructuralIdentity` "in general" by some universal argument — is not merely hard, it is *impossible in principle*, because whether a given inductive type has decidable equality depends on the actual shape of its constructors (as 5.2 demonstrated concretely), which varies system to system and cannot be settled in advance of the system existing.

**Restriction 3 — No faking a result with a weaker substitute.** This is the restriction most explicitly enforced by this project's own working discipline, stated directly in your prior instructions and honored in the actual commit history: when `deriving DecidableEq` failed for `Term`, the correct move was neither `Classical.dec` (which manufactures a *non-constructive* decidability witness, technically discharging the typeclass obligation while hiding that the underlying representation doesn't actually support effective comparison) nor a bare `sorry` (which would claim the fact holds without any witness at all). Both would have made `StructuralIdentity Term` "hold" in Lean's type-checker while being **substantively false** about what the current representation can actually support. The restriction is: a schema obligation that cannot honestly be discharged must be recorded as unsatisfied, not discharged dishonestly.

**Restriction 4 — No stating a theorem whose subject doesn't exist yet.** This is the restriction behind `takeutiSoundnessObligation`'s `True := by sorry` placeholder shape — not merely an unproved theorem, but a theorem whose real statement is *withheld* until `ProofSemanticsPairing` can be honestly instantiated. The alternative — writing a plausible-looking but premature soundness statement against Takeuti's current, unfinished derivation machinery — would risk the theorem needing to change shape (not just gain a proof) once Takeuti stabilizes, which would mean the "theorem" was never actually about the real system in the first place.

**Restriction 5 — No metatheory more powerful than the object theory it studies, without saying so.** This is the classical Hilbert-program-descended restriction, and it's worth stating even though your project hasn't yet reached the point where it bites directly: if you ever want to prove `LRA.Set`'s ZFC axioms *consistent* (as opposed to merely satisfied by some model, which is weaker), the metatheory you use to conduct that consistency proof cannot itself covertly assume everything ZFC assumes, on pain of the proof being circular (assuming what it sets out to establish) rather than genuinely reassuring. This is precisely why Gödel's second incompleteness theorem is a permanent boundary on this kind of project, not a historical curiosity: **a sufficiently strong system cannot prove its own consistency**, so any consistency argument for `LRA.Set`'s ZFC axioms will necessarily need to step outside `LRA.Set` itself, into a metatheory whose own trustworthiness has to be argued some other way — and that argument, too, is metamathematics, applied recursively, with no final resting point that isn't ultimately a matter of informal, unformalized confidence (Lean's own kernel, trusted because it is small enough to be checked by a human, is exactly this bottom rung).

---

## Part 7. Summary Map

```
Question: where does the FIRST layer of machinery come from?
   |
   v
Object language (room 1: the formal system) vs.
Metalanguage (room 2: what you use to talk ABOUT room 1)
   -- forced apart by Tarski's undefinability of truth, not by taste
   |
   v
METAMATHEMATICS = the discipline of being careful about room 2's own
   commitments, BEFORE model theory (semantics/room-1-interpretation)
   or proof theory (room-1-derivations-as-objects) can proceed
   |
   +--> Historically: Hilbert's program (prove consistency using a
   |     WEAKER, more trustworthy metatheory) -> Goedel's incompleteness
   |     (the most ambitious version is unreachable) -> the METHOD
   |     (separate what-you-prove-ABOUT from what-the-system-proves)
   |     survives permanently
   |
   v
DEFINITIONS HERE ARE SCHEMAS, not concrete constructions:
   SyntacticCategory (decidable symbol identity, system-agnostic)
   StructuralIdentity (decidable expression identity, system-agnostic)
   ObjectMetaDistinction (the room-1/room-2 vocabulary itself)
   SubstitutionSafety (safety-predicate + connecting theorem, PAIRED)
   ProofSemanticsPairing / IsSound / IsComplete (relational, no fixed system)
   |
   v
THEOREMS HERE FALL INTO THREE HONEST STATES:
   1. Fully statable AND provable now (rare, usually trivial)
   2. Statable now, provable only once a system stabilizes
        -> SubstitutionSafety's noCaptureUnderSafety: sorry'd, tracked
        -> StructuralIdentity for Term: ATTEMPTED, GENUINELY FAILED
           (Fin n -> Term dependent-function constructor), recorded
           honestly, NOT faked with Classical.dec or a bare sorry
   3. Not fully STATABLE yet (soundness/completeness for Takeuti):
        theorem-SHAPE fixed now, theorem itself necessarily deferred
   |
   v
FIVE BINDING RESTRICTIONS (all already tested, not hypothetical):
   1. No borrowing a richer foundation than warranted
        (Mathlib Set -> MetaCollection, caught and reverted)
   2. No proving a system-specific fact generically (impossible in
      principle, not just hard -- decidability depends on actual shape)
   3. No faking a result with Classical.dec or a bare sorry
        (the Term DecidableEq incident, handled correctly)
   4. No stating a theorem whose subject doesn't exist yet
        (Takeuti soundness/completeness, correctly withheld)
   5. No metatheory more powerful than its object theory, unacknowledged
        (Goedel's second theorem: a system cannot prove its own
         consistency; the buck stops at Lean's small, human-checked
         kernel, not at any formalized layer)
```

**The single sentence this document exists to defend:** metamathematics is not a preface you write once and then forget — it is a standing discipline for **refusing to claim more than the current state of construction actually entitles you to claim**, and every file in `LRA/Metamathematics` is, at bottom, a record of exactly where that entitlement currently ends.

---

[← Back to Index](00-index.md)
