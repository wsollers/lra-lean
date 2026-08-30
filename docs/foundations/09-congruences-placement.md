# Placement Discussion: Congruences (`[NET NEW]` — this is a decision record, not new mathematics)

[← Back to Index](00-index.md)

**Question considered.** Should a standalone "Congruences" document be inserted directly after Equivalences (Part 3)?

**Resolution: no — "congruence" is not a fourth topic, it is a name distributed across three already-placed documents, each exactly when its prerequisite becomes available.** The project's own manifest (v2→v4 correction log) had already disambiguated three senses:

1. **Logical congruence** — `Identity.LeibnizSubstitution` / `Identity.EqualityCongruence`, $a=b\to\phi(a)\leftrightarrow\phi(b)$. Lives in Identity, *before* Relations even starts. Already placed, not revisited here.
2. **Algebraic congruence** — `Operations.Compatibility.RespectsEquivalence` (Part 6.7.1–6.7.2 above), a specialization of `RespectsRelation`. Structurally *needs* an operation to exist — cannot be stated with Equivalences' vocabulary (Set + Relations) alone. Correctly built in Operations.
3. **Congruence induced by a homomorphism** — `Algebra.Models.KernelCongruence` (Part 8.4 above). Needs Homomorphism to exist first — same dependency reason Kernel itself was moved out of `Relations.Equivalence` into `Algebra.Models` in the project's own resolved history.

**Why bundling them right after Equivalences would violate the project's own discipline.** A standalone Congruences document at that point in the sequence would either (a) duplicate `RespectsEquivalence` and `KernelCongruence` before their prerequisites (Operations, Morphisms) exist, forcing forward-references to chapters not yet built, or (b) sit empty until those chapters catch up — defeating the purpose of placing it there at all. This directly contradicts "state once, instantiate many times."

**What genuinely IS available at the Equivalences stage, and is NOT yet written down.** A short forward-reference paragraph in Part 3 (Equivalences), previewing all three congruence senses and pointing to exactly where each is built — the same pattern Part 3.3 already uses for the algebraic/homomorphism kernel boundary flag. This is a documentation addition, not a new mathematical document, and is recorded here as an open, low-cost task rather than executed inline.

---

---

[← Back to Index](00-index.md)
