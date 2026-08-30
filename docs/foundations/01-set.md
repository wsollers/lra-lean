# Set (`[RECAP]`, canonical source: `zfc-axioms-l-sentences.md`)

[← Back to Index](00-index.md)

## 1.0 Geometric Intuition Before Symbols

A set is not a bag of things — that metaphor collapses under Russell's Paradox. A set is a **verdict**: for every candidate object $x$, a set $A$ renders a binary verdict, $x \in A$ or $x \notin A$. ZFC is a theory of which verdict-patterns are permitted to reify into objects, closed under a small, deliberately weak menu of construction rules. Every axiom below answers: *given the sets I already have, what new verdict-pattern may I now reify?*

## 1.1 Signature

$\mathcal{L}_\in = \{\in, \varnothing\}$ — one binary relation, one constant. Equality is logical (FOL$^=$), not defined.

$$x \notin y := \neg(x\in y) \qquad x \subseteq y := \forall z(z\in x \to z\in y) \qquad \forall x\in A\,\varphi := \forall x(x\in A \to \varphi) \qquad \exists x \in A\,\varphi := \exists x(x\in A \wedge \varphi)$$

## 1.2 The Axioms and What Each Unlocks

**Extensionality.** $\forall x\,\forall y\,(\forall z(z\in x \leftrightarrow z\in y) \to x=y)$. Unlocks: uniqueness of every subsequent construction — every "the" in this document depends on it.

**Empty Set.** $\forall y\,\neg(y\in\varnothing)$. Unlocks: $\mathrm{IsEmpty}(E) :\equiv \forall w(w\notin E)$; $\exists! E\,\mathrm{IsEmpty}(E)$.

**Pairing.** $\forall a\,\forall b\,\exists c\,\forall x(x\in c \leftrightarrow (x=a\vee x=b))$. Unlocks: $\{a,b\}$, $\{a\}:=\{a,a\}$, Kuratowski pair $(a,b):=\{\{a\},\{a,b\}\}$, and the characterization theorem $(a,b)=(c,d) \leftrightarrow (a=c\wedge b=d)$ — the fact making relations/functions/products constructible from unordered primitives at all.

**Union.** $\forall F\,\exists A\,\forall x(x\in A \leftrightarrow \exists B(B\in F\wedge x\in B))$. Unlocks: $\bigcup F$; binary union $a\cup b := \bigcup\{a,b\}$ (needs Pairing too — Union alone only unions *families*).

**Power Set.** $\forall A\,\exists P\,\forall X(X\in P \leftrightarrow X\subseteq A)$. Unlocks: $\mathcal{P}(A)$.

**Infinity.** $\exists I(\varnothing\in I \wedge \forall x(x\in I \to \exists s(\forall z(z\in s\leftrightarrow(z\in x\vee z=x))\wedge s\in I)))$. Unlocks: successor $S(x):=x\cup\{x\}$, inductive sets.

**Separation** (schema, one instance per formula $\varphi$). $\forall A\,\forall\bar p\,\exists B\,\forall x(x\in B \leftrightarrow (x\in A \wedge \varphi(x,\bar p)))$. Unlocks: $\{x\in A:\varphi(x)\}$, $a\cap b$, $a\setminus b$, $\omega$ (least inductive set), and the tamed version of Russell's Paradox: $\neg\exists R\,\forall x(x\in R \leftrightarrow x\notin x)$ — *fixed* $A$ is fine, unrestricted comprehension is not.

**Replacement** (schema, one instance per formula $\varphi$). $\forall\bar p\,\forall A(\forall x\in A\,\exists!y\,\varphi(x,y,\bar p) \to \exists B\,\forall y(y\in B \leftrightarrow \exists x\in A\,\varphi(x,y,\bar p)))$. Unlocks: definable-class images are sets. Worked example (canonical): $\varphi(x,y):\equiv y=\mathcal P^x(\varnothing)$ over $A=\omega$ produces $B=\{\varnothing,\mathcal P(\varnothing),\mathcal P(\mathcal P(\varnothing)),\dots\}$ as a genuine set — Separation alone cannot do this, since no pre-existing set visibly contains all these terms simultaneously; Replacement builds $B$ directly from $\omega$ used purely as an index/label set. This is the Von Neumann hierarchy pattern and the standard proof that Replacement is strictly stronger than Separation.

**Foundation.** $\forall A(A\neq\varnothing \to \exists y(y\in A \wedge \forall z(z\in y\to z\notin A)))$. Unlocks: $\forall x(x\notin x)$; no infinite $\in$-descending chains; well-founded recursion.

**Choice** (Zermelo disjoint-sets form). Unlocks: choice-function form, Well-Ordering Theorem, Zorn's Lemma — all equivalent given the other axioms.

## 1.3 Basic Definitions/Theorems the Full Axiom Set Unlocks

Boolean operations ($\cup,\cap,\setminus,\triangle$); the lattice laws (idempotence, commutativity, associativity, distributivity, absorption); Cartesian products $A\times B$; relations $R\subseteq A\times B$; functions as relations with $\forall a\,\exists!b\,((a,b)\in f)$; domain/range via Replacement; equinumerosity; ordinals (transitive, well-ordered by $\in$); cardinals.

## 1.4 De Morgan's Laws and Duality

**Theorem (De Morgan).** For $A,B\subseteq U$: $(A\cup B)^c = A^c\cap B^c$, $(A\cap B)^c = A^c\cup B^c$ — a direct transcription of $\neg(P\vee Q)\leftrightarrow(\neg P\wedge\neg Q)$ and its dual, with $P:\equiv x\in A$.

**Theorem (Duality Principle, schematic).** If $\Phi(\cup,\cap,\varnothing,U,\subseteq)$ is a theorem of Boolean set algebra, so is $\Phi^*(\cap,\cup,U,\varnothing,\supseteq)$ — the substitution is syntactic, licensed by $A\cap B = (A^c\cup B^c)^c$.

**Theorem (Generalized De Morgan, family form).** $(\bigcup_{i\in I}A_i)^c = \bigcap_{i\in I}A_i^c$; $(\bigcap_{i\in I}A_i)^c = \bigcup_{i\in I}A_i^c$, for arbitrary index set $I$.

## 1.5 Indexed Families

**Definition.** $\{A_i\}_{i\in I}$ is a function $A: I \to V$; $A_i := A(i)$.

**Definitions.** $\bigcup_{i\in I}A_i := \{x:\exists i\in I(x\in A_i)\}$; $\bigcap_{i\in I}A_i := \{x\in A_{i_0} : \forall i\in I(x\in A_i)\}$ for fixed $i_0\in I$ — **flagged, vacuous truth**: $\bigcap_{i\in\varnothing}A_i$ is undefined (or, relative to a fixed ambient $U$, equals $U$) since $\forall i\in\varnothing\,\varphi(i)$ is vacuously true for every $\varphi$, and treating this as "the set of all $x$" reproduces Russell's Paradox.

**Definition (indexed product).** $\prod_{i\in I}A_i := \{f: I\to\bigcup_i A_i \mid \forall i(f(i)\in A_i)\}$ — nonempty whenever every $A_i\neq\varnothing$ is *exactly* the Axiom of Choice; the indexed product is where Choice's content becomes visible.

**Theorems (statements only).** Generalized distributivity; monotonicity under reindexing (with direction reversal for intersection); Fubini/associativity for double-indexed families; and the **image-preimage asymmetry** (key project learning):
$$f\Big[\bigcup_{i\in I}A_i\Big] = \bigcup_{i\in I}f[A_i] \qquad f\Big[\bigcap_{i\in I}A_i\Big]\subseteq\bigcap_{i\in I}f[A_i]\ (\text{equality can fail})$$
$$f^{-1}\Big[\bigcup_{j\in J}B_j\Big] = \bigcup_{j\in J}f^{-1}[B_j] \qquad f^{-1}\Big[\bigcap_{j\in J}B_j\Big] = \bigcap_{j\in J}f^{-1}[B_j]\ (\text{always equality})$$
Root cause: preimage membership unwinds via one unquantified biconditional; image membership unwinds via $\exists$, which does not distribute over $\wedge$ the way it distributes over $\vee$.

**Summary map.**
```
Extensionality -> uniqueness of everything below
Empty Set -> IsEmpty
Pairing -> {a,b}, (a,b), pair characterization
Union -> big union, (needs Pairing) binary union
Power Set -> P(A)
Infinity -> successor, inductive sets
Separation(schema) -> {x in A : phi}, a cap b, a\b, omega
Replacement(schema) -> definable-class images are sets; Von Neumann hierarchy
Foundation -> x notin x, well-founded recursion
Choice -> indexed products nonempty, Well-Ordering, Zorn
   |
   v (Pairing+Separation+Extensionality)
Relations, Functions, Cartesian Products
   |
   v
Indexed Families {A_i} -> Generalized De Morgan / image-preimage asymmetry
   |
   v
[TARGET: Z^2-coset equivalence classes on R^2, quotient R^2/Z^2 = T^2]
```

## 1.6 `[MISSING FROM DOCS — NET NEW]` Real Repo Backends for Set

This exposition document has, until now, described Set purely as pure ZFC axioms with no note of how the repo actually realizes them in Lean. Round 2 of the three-way audit (`aud-res.md`, project knowledge) found the repo implements **six** distinct backends, not the three ("ZFCSet, TGSet/Grothendieck universes, Mathlib ZFSet wrapper") this project's memory previously described:

- **`ZFCSet`** — the direct, axiom-by-axiom construction.
- **`TGSet`** (Grothendieck universes) — triple-satisfies (ZFCSet export + GrothendieckUniverse + its own ZFC), per prior project notes.
- **`Mathlib`** backends — `ZFSet` and `PredicateSet` wrappers over Mathlib's own set theory.
- **`NBGSet`** (previously undocumented) — von Neumann–Bernays–Gödel class theory, distinguishing classes from sets as separate sorts, avoiding some of ZFC's schema-heaviness. Thin, but **sorry-free**.
- **`TypeSet`** (previously undocumented, and substantial) — sets encoded as predicates, `Alpha → Prop`, closer to how Mathlib's own `Set` type actually works internally. A 1699-line `Operations.lean` plus dedicated `Laws/` files for Union, Intersection, Complement, Difference, SymmetricDifference, Subset (each 100–480 lines), with 73 sorries total — real, usable content, not a stub.

**Why `TypeSet` specifically matters going forward.** Given the eventual computational target (a Vulkan/C++ simulation, with intermediate Lean formalization likely wanting to interoperate with Mathlib), `TypeSet` is the backend most likely to interoperate cleanly with Mathlib's own `Set` for the $\mathbb R^2/\mathbb Z^2$ quotient work — worth deliberately favoring over `ZFCSet` as the "reference" backend if and when this project's Lean work needs to bridge into Mathlib proper, rather than treating `ZFCSet` as automatically primary just because it's axiomatically closest to the ZFC sentences in §1.2 above.

**Sorry counts, for reference (Round 2 audit).** `Set/Constructions/ZFCSet/*`: 123. `TGSet/*`: 97. `TypeSet/*`: 73. `Mathlib/*`: 31. `GrothendieckUniverse/*`: 13. `NBGSet/*`: 0.

---

[← Back to Index](00-index.md)
