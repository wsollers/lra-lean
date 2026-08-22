# LRA First-Order Syntax / Substitution Review

## Scope

Focused review of the first-order substitution and variable-bookkeeping layer supporting the semantics and proof systems.

Files reviewed include:

- `LRA/Logic/Syntax/FirstOrder/Substitute.lean`
- `LRA/Logic/Syntax/FirstOrder/IsSubstitutable.lean`
- `LRA/Logic/Syntax/FirstOrder/SubstitutionFreeVariables.lean`
- `LRA/Logic/Semantics/Substitution.lean`
- related free-variable / closed-formula semantics through their theorem use.

Project rule: `sorry` is neutral; this review concerns definitions and theorem statements.

---

# Term substitution

The term-substitution semantics theorem has the standard shape:

```text
eval(s[x := t], a)
  = eval(s, a[x := eval(t,a)]).
```

This is the correct substitution lemma for terms.

The free-variable extensionality theorem for term evaluation is also correctly stated: assignments agreeing on all free variables of a term give the same evaluation.

**Verdict: PASS.**

---

# Formula substitution

`substitute x t phi` replaces free occurrences of `x` structurally.

At a universal binder `forall v`, it correctly behaves as follows:

```text
if v = x:
  do not recurse into the body
else:
  recurse into the body.
```

This is the essential binding rule: once `x` has been rebound by the quantifier, occurrences below that binder are no longer free occurrences of the outer `x`.

**Verdict: PASS.**

---

# Capture avoidance

`IsSubstitutable phi x t` explicitly records the no-variable-capture side condition.

At a binder `forall v`, when substitution for `x` genuinely crosses the binder, the free variables of the replacement term must not contain `v`.

This is the standard mathematical condition ensuring that syntactic substitution has the expected semantic meaning.

The semantic theorem

```text
Satisfies M a (substitute x t phi)
  <->
Satisfies M (update a x (eval t a)) phi
```

is correctly guarded by `IsSubstitutable`.

**Verdict: PASS.**

---

# Free-variable bounds under substitution

`SubstitutionFreeVariables.lean` already proves the expected inclusion bounds.

For terms:

```text
FV(s[x := t]) ⊆ FV(s) ∪ FV(t).
```

For formulas:

```text
FV(phi[x := t]) ⊆ FV(phi) ∪ FV(t).
```

These are correct unconditional upper bounds and are useful prerequisites for substitution composition, freshness, and alpha-renaming theorems.

A sharper equality formula would require distinguishing whether `x` actually occurs free, so the present subset formulation is a good robust theorem surface.

**Verdict: PASS.**

---

# P3/P2 API note — `IsSubstitutable` is sufficient but stronger than necessary

The binder clause is

```text
(x free in forall v phi -> v not free in t)
and IsSubstitutable phi x t.
```

The unconditional recursive second conjunct can require substitutability inside a body even when `v = x`, despite `substitute` stopping at that binder and never entering the body.

Likewise, if `x` has no free occurrence below a particular branch, some recursive checks can be stronger than mathematically necessary.

This does not threaten correctness: the predicate is a sufficient condition, and stronger side conditions merely reject some substitutions that would in fact be safe.

Possible refinement:

```text
forall v phi:
  if v = x then True
  else
    (x free in phi -> v not free in t)
    and IsSubstitutable phi x t
```

or an equivalent formulation keyed directly to whether substitution actually descends through the binder.

**Severity: low API precision issue, not a false theorem.**

---

# Assignment independence

The semantics layer proves the expected theorem:

```text
assignments agreeing on freeVariables(phi)
=> same satisfaction value.
```

This is the key lemma needed for sentence assignment-independence and for substitution semantics under binders.

The closed-sentence layer then correctly derives assignment independence for sentences.

**Verdict: PASS.**

---

# Alpha-renaming and substitution composition

No dedicated first-order syntax owner for alpha-renaming / alpha-equivalence or substitution composition was located in the reviewed directory.

This is not a correctness defect in the existing substitution layer, but these theorems become important once the proof calculus manipulates eigenvariables and quantified formulas systematically.

Recommended additions:

```text
RenameBoundVariable
AlphaEquivalent
AlphaRenamingPreservesSatisfaction
SubstitutionComposition
SubstitutionIrrelevantWhenNotFree
```

with the standard freshness/capture side conditions.

The current free-variable and semantic-substitution lemmas are strong enough to support this development.

**Severity: P1/P2 theorem-surface gap.**

---

# Recommended theorem surface

Useful additions before a full proof-theory / model-theory curriculum:

1. substitution identity (`phi[x := x] = phi` where formulated via variable term);
2. substitution irrelevance when `x` is not free;
3. composition of substitutions with the standard freshness hypotheses;
4. alpha-renaming / bound-variable renaming theorem;
5. alpha-equivalence or a documented decision not to quotient syntax by alpha-equivalence;
6. term evaluation commuting with model embeddings;
7. quantifier-free satisfaction transport under embeddings;
8. full satisfaction transport under isomorphisms / elementary embeddings.

The free-variable substitution bounds are already present and need not be re-added.

---

# Choice audit

No Choice dependency is inherent in the reviewed substitution definitions or proofs.

---

# Verdict

| Dimension | Verdict |
|---|---|
| term substitution | **PASS** |
| formula substitution binder behavior | **PASS** |
| capture-avoidance concept | **PASS** |
| semantic substitution lemma | **PASS** |
| free-variable substitution bounds | **PASS** |
| assignment depends only on free variables | **PASS** |
| closed sentence assignment independence | **PASS** |
| substitutability exactness | **OVER-STRONG BUT SAFE** |
| alpha-renaming/composition theorem surface | **P1/P2 ADDITIONS** |
| Choice usage | **NONE** |
