# Morphisms (`[RECAP]`; `[REWORK — CORRECTED PER AUDIT, ROUND 2]` on §8.5's capstone claim)

[← Back to Index](00-index.md)

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Correction notice, read this first.** Round 2 of the three-way audit (`aud-res.md`, project knowledge) found this file repeats the exact mistake Round 1 caught in `06-operations.md`: it presents **group-specific** vocabulary (normal subgroups, cosets, `ker(φ) = {e_S}`) as the formalization target, when the repo's real `firstIsomorphismTheorem` (`LRA/UniversalAlgebra/KernelCongruence/Definition.lean`) is stated at **full Signature/Model generality** — `Isomorphic (quotientModel (kernelCongruence φ)) N` for any surjective homomorphism of Models, not groups specifically. Two consequences, corrected below: (1) §8.5's claim that the target sentence is "fully discharged" is **false as stated** — the real theorem carries 1 `sorry`, plus ~20 supporting sorries scattered across `Congruence`/`Quotient`; (2) there is **no group-language restatement anywhere in the repo** — no `Subgroup.lean`/`NormalSubgroup.lean` under `AlgebraicStructures/Group/` — so a reader following this file's literal vocabulary would find nothing matching it directly. See §8.5's rewritten ending for the corrected status.

## 8.0 Geometric Intuition

A homomorphism is a translation dictionary that doesn't care whether you combine before or after translating: $\varphi(x*y)=\varphi(x)\star\varphi(y)$. This single equation is the entire content of "structure-preserving map," and it is the missing piece that turns "the quotient operation is well-defined" (Operations 6.7.2) into "the quotient is a group, for free, not by separate argument."

## 8.1 Homomorphism

$$\mathrm{Homomorphism}(\varphi,S,*,T,\star):\equiv\forall x,y\in S(\varphi(x*y)=\varphi(x)\star\varphi(y))$$

**Flagged, distinct from RespectsRelation** — two different sets/operations connected by a function, not one operation compared to a relation on the same set. **Theorem.** Identity-preservation is automatic for surjective monoid homomorphisms (not automatic in general — flagged). **Theorem.** Group homomorphisms automatically preserve identity AND inverses (cites the socks-and-shoes law, 6.4, at the morphism level, no extra hypothesis needed).

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Note on real repo status.** The repo's actual `Homomorphism` lives in `LRA/UniversalAlgebra/Homomorphism/Definition.lean`, defined as `structure Homomorphism {S : Signature} (M N : Model S)` — a Signature/Model-generic bundle, built entirely independently of a second, unrelated implementation, `LRA/Morphism/Properties/*` (atomic predicates: `PreservesBinaryOperation`, `PreservesRelation`, `ReflectsRelation`, etc.). The audit confirmed by direct import inspection these are genuinely independent, not layered — `UniversalAlgebra/Homomorphism` imports only `Satisfaction.Definition`, nothing from `LRA.Morphism`. This is a real, unresolved architecture question (which one is "the" homomorphism definition this document should describe), not a documentation gap — see [`12-audit-corrections.md`](12-audit-corrections.md) and [`13-audit-round-2.md`](13-audit-round-2.md) for the decision this still needs. Sorry counts: `Homomorphism/Definition.lean` 3, `Isomorphism/Definition.lean` 1, `Embedding/Definition.lean` 0.

## 8.2 Embedding, Isomorphism, Automorphism

$\mathrm{Embedding} := \mathrm{Homomorphism}\wedge\mathrm{Injective}$; $\mathrm{Isomorphism} := \mathrm{Homomorphism}\wedge\mathrm{Bijective}$. **Theorem.** Inverse of an isomorphism is an isomorphism. **Theorem.** $\cong$ is a genuine equivalence relation on structures (direct instance of [Part 3.1](03-equivalences.md)'s machinery) — reflexive via $\mathrm{id}_S$, symmetric via the inverse-isomorphism theorem, transitive via composition. $\mathrm{Aut}(S,*)$ is a subgroup of $\mathrm{Sym}(S)$ ([Part 4.4](04-maps-functions-operators.md)), carved out by Separation.

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Note on $\mathrm{Sym}(S)$ as a bundled structure.** The audit found `EndomapComposition`/`EndomapIdentity` (raw monoid-of-self-maps operations) exist and are proved associative/unital in `Operation/{Definition,Theorems}.lean`, but **nothing packages the bijective subset as a `Group`** — this specific gap is also independently confirmed by the repo's own `OMNIBUS-GAP-LIST.md` ("packaging as algebraic structures remains," path-stale but content-valid). So $\mathrm{Aut}(S,*)$ being "a subgroup of $\mathrm{Sym}(S)$" is mathematically correct but currently unformalizable as stated, since $\mathrm{Sym}(S)$ itself isn't yet a bundled `Group` in the repo.

## 8.3 Substructures

$$\mathrm{Substructure}(H,S,*):\equiv H\subseteq S\wedge\forall x,y\in H(x*y\in H)$$

**Flagged.** Closure alone does NOT imply subgroup — $(\mathbb N,+)\subset(\mathbb Z,+)$ is closed but has no inverses. **Theorem.** Image of a homomorphism is a substructure of the target (direct instance of [Part 4.6](04-maps-functions-operators.md)'s image-distributes-over-union). **Theorem.** Image of a GROUP homomorphism is a SUBGROUP — this is the exact theorem the Algebraic Structures document flagged as the one missing ingredient.

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]`** Per the note in §8.2: this section's group-flavored `Substructure`/subgroup vocabulary has no group-specific Lean counterpart yet. The repo's real substructure-adjacent content lives one level more general, inside the Signature/Model layer (see §8.4–8.5's corrections).

## 8.4 Kernel (algebraic — homomorphism-specific, distinct from [Part 3.3](03-equivalences.md)'s general kernel)

$$\ker(\varphi) := \{x\in S:\varphi(x)=e_T\} = \mathrm{fib}_\varphi(e_T)$$

**Named cross-reference.** Definitionally the [Part 4.1](04-maps-functions-operators.md) fiber, evaluated at $e_T$ — no new set machinery. **Theorem.** $\ker(\varphi)$ is a subgroup. **Theorem.** $\mathrm{Injective}(\varphi)\leftrightarrow\ker(\varphi)=\{e_S\}$ — a genuine economy unique to groups: checking one fiber (over $e_T$) suffices instead of every fiber, because $\varphi(x)=\varphi(y)\to\varphi(x*y^{-1})=e_T$ via inverse-preservation. **Theorem.** $[x]_{\sim_\varphi} = x*\ker(\varphi)$ — cosets as translates; the precise abstract shape of $[\mathbf x]_\sim=\mathbf x+\mathbb Z^2$.

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Real repo counterpart.** The repo's kernel is `kernelCongruence` in `LRA/UniversalAlgebra/KernelCongruence/Definition.lean` — a **congruence** (equivalence relation compatible with the signature's operations, at Model generality), not a group-flavored `ker(φ) = {x : φ(x) = e_T}` subset. The group-specific phrasing above is the *mathematical content* correctly stated, but the *Lean object* it should eventually cite is `kernelCongruence`, generalized, with 1 `sorry` in `KernelCongruence/KernelRelation/Definition.lean` and 12 more scattered across `Congruence/*` (`Theorems.lean` 6, `Relationships.lean` 2, `Consequences.lean` 2, `Examples.lean` 1, `FailureModes.lean` 1).

## 8.5 Quotient Structures and the First Isomorphism Theorem

**Definition.** Normal subgroup. **Flagged, resolved for the project's case.** Every subgroup of an ABELIAN group is automatically normal ($x*n*x^{-1}=n$ by commutativity) — $\mathbb Z^2\le(\mathbb R^2,+)$ needs no separate normality check.

**Theorem.** The quotient operation on $S/N$ is well-defined precisely because $\mathrm{RespectsEquivalence}(*,\sim_N,S)$ holds (Operations 6.7.2) — normality is exactly the hypothesis guaranteeing this. $\pi_N: S\to S/N$ is a surjective group homomorphism with $\ker(\pi_N)=N$.

**Theorem (First Isomorphism Theorem).** $S/\ker(\varphi) \cong \varphi[S]$, via $\overline\varphi([x]_{\sim_\varphi}):=\varphi(x)$, well-defined (Operations 6.7.2/6.7.3.b), injective (kernel-triviality, 8.4), surjective onto $\varphi[S]$ (by definition of image), homomorphism (inherited).

**`[REWORK — CORRECTED PER AUDIT, ROUND 2]` Real repo status, replacing the "fully discharged" claim below.** The repo has `firstIsomorphismTheorem` in `LRA/UniversalAlgebra/KernelCongruence/Definition.lean`, stated at full Signature/Model generality: for any surjective homomorphism $\varphi: M \to N$ of Models of a common Signature, `Isomorphic (quotientModel (kernelCongruence φ)) N`. This is **not proved** — it carries 1 `sorry`, and its supporting chain (`kernelCongruence`, `Congruence`, `Isomorphism`, `quotientModel`) carries roughly 20 more, concentrated in `Congruence/Theorems.lean` (6) and `Quotient/RepresentativeCompatibility.lean` (5). The group-specific instantiation below (ℝ²/ℤ² ≅ 𝕋²) is mathematically sound and remains the right target statement, but describing it as "fully discharged" overstates the repo's actual state — it is a correct *mathematical* claim resting on a *Lean* theorem that is real, well-scoped, but not yet finished.

**Full instantiation, the project's target sentence — corrected status: mathematically sound, not yet Lean-complete.** $\varphi:\mathbb R^2\to(\mathbb R/\mathbb Z)^2$, $\varphi(x,y):=(x\bmod1,y\bmod1)$, is a group homomorphism; $\ker(\varphi)=\mathbb Z^2$; the First Isomorphism Theorem gives $\mathbb R^2/\mathbb Z^2\cong(\mathbb R/\mathbb Z)^2=\mathbb T^2$ **as groups** — every clause traceable through eight interludes back to the ZFC axioms, and the *general* form of the theorem needed to instantiate this already exists in Lean, one `sorry` (plus ~20 supporting sorries) away from a checked proof. Closing those sorries, then instantiating at $\mathbb R^2$/$\mathbb Z^2$ specifically, is genuine remaining work, not documentation.

**Explicit remaining gap, stated plainly.** The **topological** claim (this group is compact, connected, locally Euclidean) is NOT covered by any document in this arc — it belongs to Topology, reached after the foundational reading sequence (Kossak → ... → Thurston) closes and Lee's *Topological Manifolds* is reached.

---

[← Back to Index](00-index.md)
