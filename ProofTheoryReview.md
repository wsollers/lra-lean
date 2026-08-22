# LRA Proof Theory / Takeuti Sequent Calculus Review

## Scope

Focused review of the generic proof-system layer and the Takeuti-style LK/LJ sequent calculi.

Files reviewed include:

- `LRA/Logic/Proof/System/Basic.lean`
- `LRA/Logic/Proof/System/Derivation.lean`
- `LRA/Logic/Proof/System/Takeuti/Alphabet.lean`
- `LRA/Logic/Proof/System/Takeuti/Term.lean`
- `LRA/Logic/Proof/System/Takeuti/Formula.lean`
- `LRA/Logic/Proof/System/Takeuti/Judgement.lean`
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

However, the bound-variable substitution used to construct quantified formulas has an additional freshness obligation not currently present in the rules; see the P0 below.

---

# P0 — Takeuti quantifier construction permits bound-variable capture

Takeuti syntax deliberately distinguishes:

```text
Term       -- free variables only
FormulaArg -- free variables, bound variables, and function applications
```

A quantified formula is constructed by replacing a chosen free variable `a` in a body by a named bound variable `x`:

```text
body.substFreeByBound a x
```

and then wrapping it in `Formula.all x` or `Formula.ex x`.

But `Formula.substFreeByArg` recursively replaces the free variable throughout the entire formula, including under already-existing quantifiers, and the four quantifier rule constructors do not require

```text
Formula.BoundVarFresh x body.
```

That predicate already exists in `Formula.lean`, but is not used by `allLeft`, `allRight`, `exLeft`, or `exRight`.

## Capture example

Take a schematic body

```text
P(a) ∧ forall x, Q(a,x).
```

Replacing free `a` by bound `x` globally gives

```text
P(x) ∧ forall x, Q(x,x).
```

After wrapping an outer `forall x`, the first occurrence of `x` is bound by the new outer quantifier, but the occurrence replacing `a` inside the inner `forall x` is captured by the inner quantifier instead.

Thus the syntactic transformation does not in general express the intended abstraction of all occurrences of the eigen/free variable into one newly introduced binder.

The same issue affects existential introduction/elimination shapes built through `substFreeByBound`.

## Repair

At minimum, require

```text
Formula.BoundVarFresh x body
```

on every rule that introduces `Formula.all x (body.substFreeByBound a x)` or `Formula.ex x (...)`.

Alternatively, implement alpha-renaming/fresh-bound-variable generation before abstraction, so the rule can always choose a fresh binder.

The free-variable eigencondition on `a` in `forall`-right / `exists`-left is a **different** condition and does not repair bound-variable capture.

**Severity: P0 RULE-SCHEMA SOUNDNESS DEFECT.**

Until this is repaired, the current LK/LJ quantifier rule relation should not be treated as a sound first-order calculus.

---

# P1 — raw Takeuti formulas do not enforce bound-variable scope

`FormulaArg` has a constructor

```text
FormulaArg.bound : BoundVar -> FormulaArg
```

and `Formula.atom` accepts arbitrary `FormulaArg`s.

Therefore a raw formula can contain a bound-variable occurrence with no enclosing `all`/`ex` binder for that variable.

No `WellScoped` / well-formedness predicate was located in the Takeuti subtree.

This matters because the module documentation presents bound variables as variables that appear in argument positions *after a quantifier has promoted selected free-variable occurrences*. The raw datatype does not enforce that invariant.

This is not necessarily inconsistent if future semantics deliberately interprets formulas relative to a separate bound-variable environment, but that would be a different design and should be stated explicitly. Under the current documented intent, malformed/dangling-bound formulas inhabit the same type used by LK/LJ.

Recommended repairs:

1. define `Formula.WellScoped` and use a subtype for judgements/derivations; or
2. prove every rule preserves well-scopedness from well-scoped premises; or
3. replace named bound variables with a scoped representation such as de Bruijn indices / locally nameless syntax.

If retaining named bound variables, also add alpha-renaming and shadowing lemmas.

**Severity: P1 SYNTAX-INVARIANT / PROOF-READINESS GAP.**

It becomes P0 if later semantics/soundness theorems quantify over every raw `Formula` while assuming all bound occurrences have binders.

---

# LJ construction

`LJ` reuses the LK rule relation but restricts every premise and conclusion to `IsIntuitionistic`, i.e. sequents with at most one succedent formula.

This is a reasonable and economical implementation of the usual single-succedent intuitionistic restriction.

Its quantifier fragment inherits the bound-variable-capture P0 from the shared `Rule` relation.

**Verdict: propositional/single-succedent architecture PASS; quantifier rules inherit P0.**

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

# No Takeuti semantics / translation located

No Takeuti-specific term evaluation, formula satisfaction, sequent validity, or translation into the repository's general first-order syntax was located.

Because Takeuti uses a distinct free-variable/bound-variable representation, the already-correct general `LRA.Logic.FirstOrder.Satisfies` layer cannot simply be assumed to apply without an explicit bridge.

Two good architecture choices are possible:

```text
A. give Takeuti syntax its own semantics and prove equivalence to general FOL;
```

or

```text
B. define a capture-safe translation Takeuti.Formula -> FirstOrder.Formula
   and reuse the canonical semantics through the translation.
```

Option B reduces duplicate semantic infrastructure, but only after the binding/capture issues are repaired.

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

The quantifier-rule soundness proofs will depend on Takeuti-local substitution, assignment-independence, and eigenvariable/fresh-bound-variable semantics.

This is the highest-value next theorem layer after the P0 capture repair.

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

There are two distinct freshness requirements and both should be represented explicitly:

1. **free eigenvariable freshness** for `forall`-right and `exists`-left: the chosen free variable must not occur in the surrounding conclusion sequent;
2. **bound-variable freshness** for abstraction: the bound variable introduced by `substFreeByBound` must be fresh in the body, or the body must first be alpha-renamed.

The current rules include (1) but omit (2).

Recommended theorem/definition surface:

```text
TakeutiWellScoped
TakeutiTermEvaluation
TakeutiFormulaSatisfaction
TakeutiTermEvaluationSubstitution
TakeutiFormulaSatisfactionSubstitution
FreeVariableAbsentImpliesAssignmentIrrelevance
BoundVariableRenaming
FreshBoundVariableAbstraction
EigenvariableRenaming
```

If the Takeuti syntax is intentionally independent from the general first-order syntax, these should be proved locally rather than assumed from the other syntax layer.

---

# Variable-supply note

A capture-safe named-variable calculus typically needs enough fresh variables for alpha-renaming/eigenvariable steps.

`Alphabet` currently allows arbitrary `FreeVar` and `BoundVar` types, including finite or empty ones. That is not a defect in the raw syntax, but later completeness/cut-elimination theorems that require always choosing a fresh variable must either:

- assume an infinite/fresh-variable supply;
- carry freshness witnesses as hypotheses; or
- use a representation where freshness is generated structurally.

This is a future hypothesis-discipline item, not an Axiom-of-Choice issue.

---

# Cut elimination roadmap

Once the quantifier rules and soundness infrastructure are stable, the appropriate proof-theory progression is:

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

Fresh-variable generation may require an infinite supply/freshness assumption on the variable types, but that is not inherently the Axiom of Choice.

---

# Verdict

| Dimension | Verdict |
|---|---|
| generic `ProofSystem` | **PASS** |
| generic finite `Derivable` | **PASS** |
| LK structural/propositional rule shapes | **PASS** |
| Takeuti bound/free variable syntax idea | **GOOD BUT NEEDS SCOPE INVARIANT** |
| quantifier abstraction by `substFreeByBound` | **P0 CAPTURE DEFECT WITHOUT BOUND FRESHNESS** |
| raw bound-variable scope | **P1 WELL-SCOPEDNESS GAP** |
| LJ single-succedent restriction | **PASS, INHERITS QUANTIFIER P0** |
| free eigenvariable conditions | **PRESENT** |
| bound-variable freshness condition | **MISSING P0** |
| Takeuti semantics/translation | **MISSING** |
| sequent semantics | **MISSING** |
| soundness of rules/derivations | **P1 MAJOR GAP AFTER P0 REPAIR** |
| cut elimination | **EXPLICIT SCAFFOLD ONLY** |
| proof-theory readiness | **PROPOSITIONAL RULE SYNTAX PROMISING; FIRST-ORDER QUANTIFIER LAYER NOT YET SOUND/SCOPED** |
| Choice usage | **NONE NEW** |

---

# Immediate repair / development order

1. define/enforce well-scoped Takeuti formulas;
2. repair bound-variable capture in all four quantifier rules;
3. add alpha-renaming or fresh-bound-variable abstraction;
4. define a Takeuti-to-general-FOL translation or local semantics;
5. define sequent satisfaction/validity;
6. prove initial sequents valid;
7. prove soundness of structural/propositional rules;
8. prove Takeuti quantifier substitution/eigenvariable lemmas;
9. prove soundness of repaired quantifier rules;
10. lift rule soundness to `Derivable` soundness;
11. add cut-free derivation predicate / derivation complexity measures;
12. develop cut elimination and subformula consequences;
13. only then move to completeness if desired.
