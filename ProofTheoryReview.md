# LRA Proof Theory / Takeuti Sequent Calculus Review

## Scope

Focused review of the generic proof-system layer and the Takeuti-style LK/LJ sequent calculi.

Files reviewed include:

- `LRA/Logic/Proof/System/Basic.lean`
- `LRA/Logic/Proof/System/Derivation.lean`
- `LRA/Logic/Proof/System/Takeuti/Rule.lean`
- `LRA/Logic/Proof/System/Takeuti/LK.lean`
- `LRA/Logic/Proof/System/Takeuti/LJ.lean`
- `LRA/Logic/Proof/System/Takeuti/Cut.lean`

Project rule: `sorry` is neutral. The review concerns the mathematical shape of definitions/statements and the theorem surface needed for proof readiness.

---

# Generic proof-system abstraction

`ProofSystem` consists of:

```text
Judgement
IsInitial : Judgement -> Prop
Rule : List Judgement -> Judgement -> Prop
```

and `Derivable` is the least inductively generated predicate closed under initial judgements and finite rule applications.

This is a standard and flexible abstraction for Hilbert systems, natural deduction encodings, and sequent calculi.

**Verdict: PASS.**

---

# LK rule layer

The Takeuti `Rule` type contains the expected structural and logical rules:

```text
weakening
contraction
exchange
cut
negation
conjunction
disjunction
implication
universal quantifier
existential quantifier
```

The sequent direction is consistent: a finite list of upper sequents licenses one lower sequent.

The initial sequent shape is

```text
A |- A.
```

The quantifier rules use a separate free-variable/bound-variable syntax and explicit eigenvariable side conditions for `forall`-right and `exists`-left.

At the statement level these are recognizably standard Gentzen-style LK rules.

**Verdict: PASS at the rule-schema level.**

---

# LJ construction

`LJ` reuses the LK rule relation but restricts every premise and conclusion to `IsIntuitionistic`, i.e. sequents with at most one succedent formula.

This is a reasonable and economical implementation of the usual single-succedent intuitionistic restriction.

**Verdict: PASS.**

---

# Cut layer is explicitly scaffold-only

`Cut.lean` currently defines only

```text
IsCutRuleShape
```

and explicitly states that cut-elimination theorem statements are not yet asserted.

This is good honesty in the source: there is no false cut-elimination theorem pretending to exist.

However, it means the current proof-theory layer is not yet ready for metatheoretic use that depends on normalization/subformula properties.

**Severity: P1 readiness gap, not a mathematical defect.**

---

# Missing soundness ladder

No project-facing soundness theorem surface was located in the reviewed proof-system tree.

Before LK/LJ derivability should be used as trusted proof-theoretic evidence, the following ladder should be explicit:

```text
SequentSatisfaction / SequentValidity
InitialSequentsValid
EachLKRulePreservesValidity
EachLJRulePreservesValidity
DerivableImpliesValid
```

The quantifier-rule soundness proofs will depend on the substitution and free-variable/eigenvariable semantics reviewed in `LogicSyntaxReview.md`.

This is the highest-value next theorem layer for the proof calculus.

**Severity: P1 major proof-readiness gap.**

---

# Important distinction: embeddings vs elementary embeddings

The semantic model-comparison layer must not be used to shortcut soundness incorrectly.

Ordinary model embeddings preserve/reflect atomic and quantifier-free structure, but not arbitrary quantified formulas. Full formula preservation belongs to:

- model isomorphisms; or
- elementary embeddings.

This matters later if proof-theoretic model transformations are introduced.

---

# Recommended soundness semantics for sequents

For classical LK, a sequent

```text
Gamma |- Delta
```

should be semantically valid under an assignment iff

```text
(all A in Gamma, M,s |= A) ->
  (exists B in Delta, M,s |= B).
```

Equivalently, not all antecedents are true or at least one succedent formula is true.

For LJ the same semantics works; the single-succedent restriction is syntactic/proof-theoretic rather than a different truth condition.

This provides a direct induction target for `Derivable`.

---

# Quantifier/eigenvariable readiness

The rule statements already expose the relevant freshness hypotheses:

- `forall` right: eigenvariable absent from the conclusion sequent;
- `exists` left: eigenvariable absent from the conclusion sequent.

To make their soundness proofs robust, add/confirm bridge lemmas connecting Takeuti's free-variable occurrence predicates to semantic assignment independence and substitution.

Recommended theorem shapes:

```text
TakeutiTermEvaluationSubstitution
TakeutiFormulaSatisfactionSubstitution
FreeVariableAbsentImpliesAssignmentIrrelevance
EigenvariableRenaming
```

If the Takeuti syntax is intentionally independent from the general first-order syntax, these should be proved locally rather than assumed from the other syntax layer.

---

# Cut elimination roadmap

Once soundness and syntax infrastructure are stable, the appropriate proof-theory progression is:

```text
height / complexity of derivations
cut rank
structural-rule admissibility where desired
principal cut reductions
commutative cut reductions
cut elimination
subformula property
consistency consequences
```

The current `IsCutRuleShape` is only the first syntactic marker in that progression.

---

# Choice audit

No genuine family-wise Axiom-of-Choice use appears in the proof-system definitions reviewed here.

Inverse extraction in model isomorphism infrastructure is unrelated to the sequent calculus and is ordinary single-witness choice.

---

# Verdict

| Dimension | Verdict |
|---|---|
| generic `ProofSystem` | **PASS** |
| generic finite `Derivable` | **PASS** |
| LK rule schemata | **PASS** |
| LJ single-succedent restriction | **PASS** |
| quantifier eigenvariable conditions | **GOOD SHAPE** |
| sequent semantics | **MISSING** |
| soundness of rules/derivations | **P1 MAJOR GAP** |
| cut elimination | **EXPLICIT SCAFFOLD ONLY** |
| proof-theory readiness | **RULE-SYNTAX READY, METATHEORY NOT YET READY** |
| Choice usage | **NONE NEW** |

---

# Immediate repair / development order

1. define sequent satisfaction/validity;
2. prove initial sequents valid;
3. prove soundness of structural/propositional rules;
4. prove Takeuti quantifier substitution/eigenvariable lemmas;
5. prove soundness of quantifier rules;
6. lift rule soundness to `Derivable` soundness;
7. add cut-free derivation predicate / derivation complexity measures;
8. develop cut elimination;
9. derive subformula and consistency consequences;
10. only then move to completeness if desired.
