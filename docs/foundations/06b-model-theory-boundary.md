# The Equational/Relational Boundary: Universal Algebra vs. General Model Theory (`[NET NEW]`; `[REWORK — CORRECTED PER AUDIT]` on the repo-status claims)

[← Back to Index](00-index.md)

**`[REWORK — CORRECTED PER AUDIT]` Correction notice.** The audit against the live `lra-lean` repo (`audit-results.md`, project knowledge) confirms this file's *content* — the equational/relational boundary and its Birkhoff justification — is substantively correct and does not need to change. What changes is the **maturity claim**: this file originally described Birkhoff's HSP theorem as a boundary this project should draw for itself. The repo already has a real, concrete, Signature-level formalization of the equational side of that boundary — `IsVariety`/`ModelsOfEquationalTheory` in `LRA/UniversalAlgebra/Satisfaction/Definition.lean`, with the nontrivial ("←") direction one `sorry` away from complete — at *full arbitrary-signature generality*, which strictly subsumes this file's binary-operation-only framing. Treat this file as the **prose "why"** for a boundary the repo has already substantially built the "what" for; do not treat it as a spec still to be implemented from scratch.

**Purpose (unchanged).** [`06-operations.md`](06-operations.md) §6.7.3 (as corrected) discusses the repo's equational satisfaction machinery, which is scoped to equational properties by construction. This file states that restriction precisely, explains *why* professional universal algebra draws the line there (Birkhoff's HSP theorem), and gives the explicit routing rule for everything that falls on the other side of the line — trichotomy, order-compatibility, the triangle inequality, and eventually many-sorted metric-space axioms.

## 0. Geometric Intuition

Two different games are being played in this project, and they look similar enough at a glance to blur together if you're not careful. Game one: "does this operation satisfy this equation, for every input?" — a purely algebraic question, answerable by symbol manipulation alone, with no notion of "size," "order," or "distance" required. Game two: "does this structure satisfy this broader logical statement?" — which might involve $\exists$, $\vee$, comparisons, or facts about a completely different sort of object (like a real-valued distance function sitting on top of a set of points). Universal algebra is the theory of game one. General model theory is the theory of both games, but only game one gets Birkhoff's remarkable structural theorem for free.


## 1. The Precise Restriction (`[RECAP]` of the definition already given in `06-operations.md`)

$$\mathrm{Law}(S) := (S\times S\to S)\to\mathrm{Prop}, \qquad \ell\in\mathrm{Law}(S) \text{ must be equational}$$

**Equational, precisely:** expressible as $\forall\bar x\,(t_1(\bar x)\approx t_2(\bar x))$ where $t_1,t_2$ are **terms** — built from variables and the operation symbol(s) alone, via composition, with no other symbol permitted. No $\exists$. No $\vee,\wedge,\neg$ connecting multiple equations (a *list* of laws, per §6.7.3's law-list mechanism, handles conjunction at the meta level — but a single law itself is one equation, universally quantified, nothing more). No relation symbol other than $=$. No quantifier alternation.

**In scope, checked against the template:** $\mathrm{Commutative}$ ($x*y\approx y*x$), $\mathrm{Associative}$ ($(x*y)*z\approx x*(y*z)$), $\mathrm{Idempotent}$ ($x*x\approx x$), $\mathrm{HasTwoSidedIdentity}$ relative to a witness constant $e$ ($e*x\approx x \wedge x*e\approx x$ — technically two equations, but both fit the template and are packaged together by convention), $\mathrm{HasTwoSidedInverses}$ relative to $e$ (needs a unary inversion symbol added to the signature — still purely equational once that symbol is admitted).

**Out of scope, and why each one fails the template:**

| Property | Why it fails | Where it actually belongs |
|---|---|---|
| Trichotomy | Needs $\vee$ and $\neg$ ("exactly one of $xRy, x=y, yRx$") — not a single equation | `Relations` — already correctly placed there |
| Order-compatibility (`RespectsOrder`) | Needs a relation symbol ($\le$) distinct from $=$ | `Operations` §6.7.1 already handles this as a *theorem instantiating `RespectsRelation`*, not as a `SatisfiesEquation` fact — a deliberate, already-existing separation |
| Triangle inequality | Needs a function $d:S\times S\to\mathbb R$ — a **different sort** (real numbers) than $S$ itself; not even expressible with one carrier | Metric space axioms, a genuinely different, many-sorted signature — see §3 below |
| Archimedean property | Needs $\exists n\in\mathbb N$ — existential over a different carrier ($\mathbb N$) entirely | `Algebra.Structures` §4 (`07-algebraic-structures.md`), stated as a first-order sentence, not a `SatisfiesEquation` fact |
| Order-completeness | Needs $\exists$ (a supremum exists) and a relation ($\le$) simultaneously — genuinely second-order in the classical statement (quantifies over *subsets*) | `Order` (`05-order.md`), and eventually the Henkin second-order layer per the project's own `logic-axiom-reference.md` |

## 2. Why the Line Is Drawn Exactly Here: Birkhoff's HSP Theorem

This is the professional justification, not an arbitrary style choice.

**Theorem (Birkhoff, 1935 — statement only, standard reference: Burris–Sankappanavar,** ***A Course in Universal Algebra****).* A class $\mathcal K$ of algebras (same signature) is a **variety** — i.e., exactly the class of algebras satisfying some fixed set of equational laws — if and only if $\mathcal K$ is closed under:
- **H**omomorphic images,
- **S**ubalgebras,
- **P**roducts (arbitrary, including infinite).

**Why this matters for the project, concretely.** The two transport theorems already built in [`06-operations.md`](06-operations.md) §6.7.3 are precisely the **P** and (a special case of) **H** halves of this theorem, discovered independently and applied to the four laws the project actually needed:

- *Product transport* (§6.7.3, first `[REWORK]` theorem) = the **P** closure property, applied constructively (not just as an existence/closure statement, but exhibited with an explicit proof recipe).
- *Quotient transport* (§6.7.3, second `[REWORK]` theorem) = a special case of the **H** closure property — a quotient map $\pi_\sim: S\to S/\!\sim$ is a surjective homomorphism (once `Algebra.Models`/`08-morphisms.md`'s vocabulary is in view), and "the quotient inherits the law" is exactly "the homomorphic image inherits the law," specialized to surjections.
- **S** (substructures inherit equational laws) was never stated as its own theorem because it is the trivial direction: restricting the universally-quantified variables to a smaller domain can only make an already-true equation continue to hold — worth naming explicitly here for completeness, but it needs no proof beyond noting $\forall x\in H\,\varphi(x)$ follows from $\forall x\in S\,\varphi(x)$ when $H\subseteq S$.

**The reason this theorem is *false* for anything outside the equational fragment, made concrete.** Trichotomy is not preserved under products: $(\mathbb Z,<)\times(\mathbb Z,<)$ under the coordinatewise order is *not* trichotomous (e.g. $(1,0)$ and $(0,1)$ are incomparable) even though $(\mathbb Z,<)$ itself is — so "trichotomy transports along products" is simply **false**, and no amount of cleverness recovers it, because trichotomy was never in the class of properties Birkhoff's theorem covers. This is the sharpest possible illustration of why the equational restriction is load-bearing rather than fussy: relax it even slightly and the entire transport-theorem program stops working uniformly.

## 3. The Routing Rule

**Binding rule for this and all downstream documents.** When a new property is proposed as a candidate equational fact, check it against the equational template in §1. If it fails:

1. If it's a property of a *single relation* on $S$ (order, trichotomy, density, well-foundedness) → it belongs in `Relations` (`02-relations.md`) or `Order` (`05-order.md`), already built.
2. If it's a property connecting an *operation* to a *relation* on the same $S$ → it belongs in `Operations` §6.7.1's `RespectsRelation`/`RespectsOrder` machinery — already built, and deliberately **not** expressible as an `Equation` in the repo's `SatisfiesEquation` sense, since `RespectsRelation` takes a relation argument that a pure term-equation structurally cannot accommodate.
3. If it involves a *second sort* (a codomain other than $S$ — reals, natural numbers, ordinals) → it belongs to the general `Logic.Signature/Model/Satisfies` layer, using a genuinely many-sorted signature, per the project's own flagged open item ("VolumeIV metric spaces need MANY-SORTED signatures (points+reals)" — `model-theory-ua-roadmap.md`). This is where the triangle inequality, the Archimedean property, and eventually the full metric-space and Riemannian-metric axioms for the torus simulation will live.
4. If it's genuinely second-order (quantifies over *subsets* or *all functions*, as order-completeness does in its classical statement) → it belongs to the Henkin second-order layer already scaffolded in `logic-axiom-reference.md`, not to any first-order `Law` or `Model` construction.

**What this buys, stated plainly.** The equational fragment (`Equation`/`SatisfiesEquation`, per the corrected §6.7.3) stays small, closed, and Birkhoff-safe — every theorem proved about it (the two transport theorems, and any future ones of the same shape) is guaranteed to apply uniformly to every element of the class, with no exceptions to track. Everything that would break that guarantee is identified at the door and routed to a different, already-existing layer of the project rather than being smuggled in as an ad hoc extension of the equational fragment.

## 4. Summary Diagram

```
Property proposed as an equational (SatisfiesEquation) candidate
   |
   v
Is it: forall-x-bar ( term1(x-bar) = term2(x-bar) ), pure operation symbols, no other connective?
   |                                            |
  YES                                          NO
   |                                            |
   v                                            v
Equational fact.                   Which kind of "no"?
Governed by Birkhoff's HSP.        |
Transport theorems (06-operations  +-- single relation on S -> Relations / Order (already built)
  .md sec 6.7.3) apply uniformly.  +-- operation-vs-relation on same S -> Operations RespectsRelation
                                   +-- second sort (reals, naturals) -> Logic.Signature/Model,
                                   |     many-sorted (metric spaces, Archimedean property)
                                   +-- genuinely second-order (quantifies over subsets)
                                         -> Henkin layer (logic-axiom-reference.md)
```
