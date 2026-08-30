# Landau-Style Generic Operation Proving: Design History (`[NET NEW]` as a document; content already partially reflected in `06-operations.md` §6.7.3 and `12-audit-corrections.md`)

[← Back to Index](00-index.md)

**Why this file exists.** The design conversation that produced the `Law`/`Satisfies` cert-naming discipline — and its later correction once audited against the real repo — was conducted across several turns but never assembled into its own standalone record. `06-operations.md` §6.7.3 has the final, corrected *content*; `12-audit-corrections.md` has the *correction*; neither has the *reasoning trail* connecting "Landau proves things by hand per number system" to "here is a standardized cert-naming convention." This file is that trail, preserved for reference.

---

## 1. The original question

> *"We need to Landau style operation proving. Is there a way to do this generically so it applies to all numbers appropriately? I.e. there are generic models of the Landau concept, and each future thing that needs them has a 'satisfies generic commutativity' or something like that. We could just define the defs to support it near operations/structures. Opinions?"*

**The diagnosis.** Landau's own text proves commutativity, associativity, distributivity by hand at every stage of the number tower ($\mathbb{N} \to \mathbb{Z} \to \mathbb{Q} \to \mathbb{R} \to \mathbb{C}$) — the same shape of argument, five separate times. This is exactly the kind of repetition your project's own discipline ("state once, instantiate many times," Bourbaki-style) exists to eliminate. The question was whether that repetition could be replaced by one generic theorem, cited at each stage.

**The first-pass answer.** This is genuine universal algebra, not over-engineering — and, importantly, roughly 80% of the needed machinery (`Logic.Signature`/`Logic.Model`) already existed in the project, just not routed through `Algebra`. The recommendation: don't add new *definitions* near Operations/Structures — `Commutative(*, S)`, `Associative(*, S)`, etc. were already maximally generic bare predicates. What was missing was a small family of **transport theorems**: generic statements of the form *"if a law holds on the pieces, it holds on the whole,"* proved once per construction-shape (coordinatewise product; quotient by a respecting equivalence), cited by every concrete number system built that way.

---

## 2. Sharpening: two different patterns, only one of which is the real ask

> *"So I would declare a commutative operation model for some arbitrary carrier. Prove that if the carrier's op and the carrier itself satisfies some criteria the op is commutative over the carrier. Then in Z for instance, I show Z's carrier and the op over Z satisfies the generic commutative requirements?"*

This drew out a distinction worth keeping permanently on record:

- **Pattern A (weak, not what was wanted):** `Commutative(*, S)` as a bare predicate, instantiated separately and reproved bespoke for each carrier — the same definition reused, but the *proof* is hand-rolled every time. This is what Landau does, dressed in modern notation.
- **Pattern B (the actual ask):** commutativity **derived from a sufficient structural condition** — a genuine theorem, not just notation reuse. E.g.: if $*$ on $S$ is built *coordinatewise* from an already-commutative $*'$ on $T$ (Theorem: "coordinatewise product transport"), or if $*$ descends to a quotient $S/\!\sim$ from an already-commutative $*$ on $S$ that respects $\sim$ (Theorem: "quotient transport"), then the derived operation is commutative **for free** — cited, not re-derived.

The worked example that made this concrete: $\mathbb{Z}$ built as $(\mathbb{N}_0 \times \mathbb{N}_0)/\!\sim$. Commutativity of $+_\mathbb{Z}$ follows via **two citations and one closure check** — cite product-transport to get $\mathbb{N}_0\times\mathbb{N}_0$'s pair-operation commutative, cite quotient-transport to push it through the quotient, with the *only* genuinely new work being a one-line check that $\sim$ respects $+_{\text{pair}}$.

---

## 3. The professional/canonical check

> *"Is this a canonical treatment of the topic? How do pro mathematicians approach this? What if I added generic trichotomy? Or triangle inequality or others? Am I over thinking this or does this match well to UA?"*

**Confirmed canonical.** This is, almost verbatim, the entry point to universal algebra as practiced (Burris–Sankappanavar's *A Course in Universal Algebra* is the standard reference): Signature ↔ type/vocabulary, Algebra ↔ Model, Law ↔ identity/equation, `⊨` ↔ Satisfies, Variety ↔ the class of algebras satisfying a fixed identity set.

**The professional refinement, and the actual reason it matters.** A "law" in the universal-algebra sense must be an **equation between terms** — $\forall\bar x\,(t_1(\bar x) \approx t_2(\bar x))$, built purely from operation symbols and variables, with *no* other logical connective, no $\exists$, no order relation. This restriction is not fussiness — it is exactly what makes **Birkhoff's HSP theorem** true: *a class of algebras is a variety iff it is closed under Homomorphic images, Subalgebras, and arbitrary Products.* The two transport theorems this project built (product-transport, quotient-transport) are literally the **P** and (a special case of) **H** halves of Birkhoff's theorem, independently rediscovered from the algebra side rather than the logic side.

**Direct answer on trichotomy and the triangle inequality: no, they don't belong in the same `Law` type.**
- **Trichotomy** needs $\vee$ and $\neg$ ("exactly one of $xRy$, $x=y$, $yRx$") — not expressible as a single term-equation. Worse: trichotomy is **not preserved under products** (the standard counterexample: $(\mathbb{Z},<)\times(\mathbb{Z},<)$ coordinatewise is not trichotomous even though each factor is), which is the sharpest possible proof that relaxing the equational restriction breaks the whole transport-theorem program, not just makes it messier.
- **The triangle inequality** needs a *second sort* — a real-valued distance function $d: S\times S \to \mathbb{R}$ — which the single-carrier equational framework cannot express at all, not even with a relaxed connective set.
- Both route instead to the general `Logic.Signature/Model` layer (arbitrary first-order formulas, multi-sorted signatures), never into the equational `Law` fragment.

**Verdict delivered at the time:** not over-thinking it — the equational core (`Law`/`Satisfies`) is exactly right and should be finished; trichotomy/triangle-inequality are the correct signal to *stop* extending `Law` and instead route upward to the wider model-theory layer, which is itself standard practice, not an ad hoc boundary invented for this project.

---

## 4. The naming crisis and its resolution

> *"So we will add this and rework, we will need a REWORK tag... it might be better to address it as a series of files."*

This produced two structural decisions still in force:

1. **The `[REWORK]` tag** — distinct from `[RECAP]` (restating settled content) and `[NET NEW]` (genuinely new content): a `[REWORK]` supersedes earlier content *in place* because a later decision changed its shape, rather than sitting alongside the old text as an addition.
2. **The three-file split** — `06-operations.md` (machinery: the transport theorems), `06a-satisfaction-certificates.md` (worked instances: the ℕ→ℤ→ℚ→ℝ cert tree), `06b-model-theory-boundary.md` (scope policy: the equational/relational boundary and its Birkhoff justification) — specifically so the machinery file wouldn't become "busy" as the number tower and eventual structure certs (complete ordered field, etc.) accumulated.

Then, the actual naming request:

> *"Please add but standardize cert naming so it is clear what a cert is doing otherwise its chaos."*

This produced the standing convention:

| Cert kind | Naming pattern | Example | Meaning |
|---|---|---|---|
| **Atomic cert** | `Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩` | `Cert_Z_Add_Commutative` | one law, one operator, one carrier |
| **Binary-law cert** | `Cert_⟨Carrier⟩_⟨Op1⟩⟨Op2⟩_⟨Law⟩` | `Cert_R_MulAdd_Distributive` | a law relating two operators (e.g. distributivity) |
| **Structure cert** | `StructCert_⟨Carrier⟩_⟨StructureName⟩` | `StructCert_R_Field`, `StructCert_R_CompleteOrderedField` | a named conjunction of smaller certs — **never** a restated equation |
| **Transport cert** | `Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩_via_⟨TransportTheorem⟩` | `Cert_Z_Add_Commutative_via_QuotientTransport` | obtained generically, at low cost, rather than proved by hand |

**The binding rule that makes the convention actually enforce discipline, not just organize names:** a `StructCert_*` definition must be a *bare conjunction* of `Cert_*`/`StructCert_*` citations. If a `StructCert_*` ever contains a freshly-written $\forall x,y(\dots)$ instead of a citation, that is a violation of the convention, not an acceptable shortcut. This is the mechanism that keeps `StructCert_R_CompleteOrderedField` from ballooning into a document that re-derives commutativity three layers down — it cites `StructCert_R_Field`, which cites `Cert_R_Add_Commutative`, and the top-level definition never grows regardless of how deep the tree underneath it gets.

---

## 5. The correction: reality checked the design, and the design lost (partially)

This is the part of the story that makes the whole exercise worth preserving, not just the final answer. A three-way audit against the live `lra-lean` repository (`audit-results.md`, project knowledge) found that the `Law(S) := (S×S→S)→Prop` type this whole design was building toward **did not exist in the repo, and should not be built** — the repo already had a strictly more general mechanism one level up:

- **`Equation`, `SatisfiesEquation`, `EquationalTheory`, `ModelsOfEquationalTheory`, `IsVariety`** in `LRA/UniversalAlgebra/Satisfaction/Definition.lean` — built on the pre-existing `Logic.Signature`/`Term`/`evaluateTerm` machinery, correctly generalized to *arbitrary, multi-symbol* signatures rather than hand-restricted to one binary operation, and already a real (if one-`sorry`-from-complete) formalization of Birkhoff's HSP theorem.

**What survived the correction, and what didn't:**
- **Discarded entirely:** the bespoke `Law(S)`/`Satisfies` type itself — porting it would have been redundant, less general, and duplicated real work already done.
- **Survived, repointed:** the cert-naming convention. Every cert name still means the same thing structurally, but now names a fact about `SatisfiesEquation`/`ModelsOfEquationalTheory` (or an existing bundled structure in `AlgebraicStructures/*`) instead of the discarded type.
- **Confirmed genuinely missing, small, real work:** the two transport theorems (product-side, quotient-side) — the repo has the underlying constructions (`productModel`/`piModel`, `quotientProjectionIsHomomorphism`/`Congruence`) but no proved lemma of the exact shape "if every factor satisfies equation $e$, so does the product/quotient." This is the one piece of the original design that turned out to be real, unclaimed work rather than either already-done or wrongly-scoped.

**The lesson, stated plainly, since it's the reason this correction is worth remembering rather than just fixing quietly:** a well-designed naming convention is valuable independently of whether the underlying mechanism it names turns out to be the right one — the convention survived a total replacement of its referent because it was designed around *what a cert should communicate* (carrier, operator, law, provenance), not around the specific type signature of one bespoke implementation.

---

## 6. Where the pieces live today

| Content | File |
|---|---|
| Final, corrected machinery (`SatisfiesEquation`, cert-naming table, transport-lemma gaps) | [`06-operations.md`](06-operations.md) §6.7.3 |
| Worked cert tree for ℕ, ℤ, ℚ, ℝ, using the corrected naming | [`06a-satisfaction-certificates.md`](06a-satisfaction-certificates.md) |
| The equational/relational scope boundary (trichotomy, triangle inequality routing) | [`06b-model-theory-boundary.md`](06b-model-theory-boundary.md) |
| The correction record itself (what was wrong, what got fixed) | [`12-audit-corrections.md`](12-audit-corrections.md) |
| This design history (the reasoning trail connecting all of the above) | this file |

---

[← Back to Index](00-index.md)
