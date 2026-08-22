# LRA Differentiation Review

## Scope

Maintained mathematical review of the active `LRA.Analysis.Differentiation` layer, with emphasis on definitions and theorems consumed by continuity and integration: derivatives on subsets of `Real`, algebra/chain rules, extrema and mean-value theorems, inverse differentiation, Darboux's theorem, smoothness classes, Taylor expansion, and the differential viewpoint.

Project-wide rule: `sorry` proof bodies are neutral. Missing hypotheses and concrete semantic placeholder definitions are not neutral.

---

# Active status

`LRA.Analysis.Differentiation.lean` imports all reviewed differentiation modules, and `LRA.Analysis.lean` imports `LRA.Analysis.Differentiation`.

Several source headers still say “not yet imported by the active Volume III root”; that status text is stale relative to the current aggregate import graph.

**Verdict: these statements are part of the active analysis surface.**

---

# Files reviewed in this chunk

- `LRA/Analysis/Differentiation/DerivativeDefinition.lean`
- `LRA/Analysis/Differentiation/MeanValueTheorem.lean`
- `LRA/Analysis/Differentiation/ChainRule.lean`
- `LRA/Analysis/Differentiation/AlgebraOfDerivatives.lean`
- `LRA/Analysis/Differentiation/DerivativeGeometry.lean`
- `LRA/Analysis/Differentiation/GraphReading.lean`
- `LRA/Analysis/Differentiation/OneSidedDerivatives.lean`
- `LRA/Analysis/Differentiation/TaylorExpansion.lean`
- aggregate `LRA/Analysis/Differentiation.lean`

---

# Derivative definition — intended formula is standard, domain qualification is missing

The central predicate is the relative h-form derivative:

```text
Derivative D f A c :=
  forall epsilon > 0,
    exists delta > 0,
      forall h,
        c+h in A -> 0 < |h| -> |h| < delta ->
          |(f(c+h)-f(c))/h - D| < epsilon.
```

As a notion of a derivative **along a subset `A`**, this epsilon-delta formula is standard.

However, the documentation says `c` is a limit point of `A`, while the formal predicate does not require this.

That omission is mathematically consequential: if `c` is isolated in `A`, the quantified difference-quotient condition is vacuous and every real number is a derivative.

Example:

```text
A = {c}.
```

For every `D : Real`, `Derivative D f A c` holds.

There are two legitimate architectural choices:

1. make `Derivative` itself include an accumulation/limit-point condition; or
2. keep the raw relative-limit predicate permissive, but require an accumulation-point hypothesis in every theorem that uses derivative uniqueness or ordinary two-sided differential geometry.

The current code mixes these two conventions.

---

# P0 — unconditional derivative uniqueness is false

Current theorem:

```text
Derivative D1 f A c ->
Derivative D2 f A c ->
D1 = D2.
```

This is false without a condition that `c` is an accumulation point of `A \ {c}`.

Counterexample:

```text
A = {c}.
```

Then both `Derivative 0 f A c` and `Derivative 1 f A c` hold vacuously.

## Required correction

Add a hypothesis expressing that points of `A` distinct from `c` occur arbitrarily close to `c`, or place that property into the canonical derivative definition.

**Severity: P0 FALSE THEOREM STATEMENT.**

This defect also explains several later edge-case failures in derivative-sign characterizations.

---

# Differentiability implies continuity

`IsDifferentiable` is existential over derivative values, and `DifferentiableImpliesContinuous` is correctly shaped for the relative derivative notion.

At isolated points continuity relative to `A` is automatically local/vacuous, so the absence of a limit-point condition does not by itself falsify this implication.

**Verdict: PASS IN SHAPE.**

---

# Equivalent h/topological/sequential derivative formulations

The h-form, relative-neighborhood, and sequential formulations are conceptually appropriate for subsets of `Real`.

The same accumulation-point caveat should be documented: without a limit-point hypothesis these predicates can all become vacuous, and uniqueness is not available.

**Verdict: FORMULATIONS REASONABLE; DOMAIN SEMANTICS MUST BE EXPLICIT.**

---

# One-sided derivatives

`LeftDerivative` and `RightDerivative` use the correct one-sided difference quotients, and the theorem

```text
IsDifferentiable f A c
  iff
exists D, LeftDerivative D f A c and RightDerivative D f A c
```

has the correct structural shape for the project's relative derivative predicate.

The one-sided module is especially useful for stating the correct boundary versions of extremum theorems.

**Verdict: PASS.**

---

# Mean-value and Darboux theorem core

Rolle's theorem, the mean-value theorem, and Cauchy's mean-value theorem are stated on nondegenerate intervals with interior differentiability. Those displayed domains provide the accumulation behavior missing from the raw derivative predicate.

Their mathematical shapes are standard.

The derivative Darboux theorem is likewise stated on a nondegenerate closed interval with differentiability throughout and is conceptually correct, including one-sided endpoint derivative values.

**Verdict: CORE INTERVAL THEOREMS PASS IN SHAPE.**

---

# P0 — derivative-sign characterization fails on degenerate intervals

`NondecreasingIffNonnegDerivative` is stated for an arbitrary `OrdConnected I` with differentiability at every point.

A singleton set is `OrdConnected`. Under the current raw derivative definition, every `D` is a derivative at its only point. Therefore

```text
forall D, Derivative D f I x -> D >= 0
```

is false, while every function on a singleton is monotone.

The analogous nonincreasing/nonpositive theorem in `GraphReading.lean` has the same issue.

## Required correction

Either:

- strengthen the derivative notion globally with an accumulation condition; or
- exclude isolated/degenerate components in sign-characterization theorems and formulate endpoint behavior through one-sided derivatives.

**Severity: P0 EDGE-DOMAIN FALSE THEOREMS.**

---

# P0 — local-extremum necessary condition lacks an interior hypothesis

`NecessaryConditionExtremum` / `RelativeExtremumNecessaryCondition` state that at any relative minimum or maximum,

```text
not differentiable OR derivative 0.
```

No interior-point hypothesis is present.

Counterexample:

```text
A = [0,1]
f(x) = x
c = 0.
```

`c` is a relative minimum of `f` on `A`, and the relative derivative at `0` is the right derivative `1`. Thus the function is differentiable relative to `A`, but derivative `0` does not hold.

The standard theorem needs `c` to be an interior point (or equivalent two-sided local-domain condition).

## Recommended companion theorem

At boundary points, state one-sided necessary inequalities instead:

- left endpoint local minimum -> right derivative, when it exists, is nonnegative;
- left endpoint local maximum -> right derivative is nonpositive;
- dual statements at right endpoints.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# Algebra rules

Constant multiple, sum, product, quotient, finite sums/products, and the chain rule are stated in the standard pointwise forms.

Because they transport a supplied derivative witness rather than infer uniqueness, the isolated-point permissiveness does not itself falsify these closure rules.

**Verdict: PASS IN SHAPE.**

---

# P0 — inverse-function derivative theorem misses `g(V) subset U`

Current theorem assumes:

```text
hf   : forall x in U, Derivative (fD1 x) f U x
hnz  : forall x in U, fD1 x != 0
hinv : forall x in U, g(f x) = x
hinv': forall y in V, f(g y) = y
```

and concludes for every `y in V`:

```text
Derivative (1 / fD1 (g y)) g V y.
```

But there is no hypothesis that `g y in U`.

Counterexample:

```text
U = empty
V = Real
f = identity
g = identity
fD1 = constant 2.
```

The `hf`, `hnz`, and `hinv` hypotheses are vacuous; `hinv'` holds. The conclusion says the identity map has derivative `1/2` at every real point, false.

## Required correction

Require at least

```text
forall y in V, g y in U
```

or package the assumptions as a genuine inverse/bijection relationship between `U` and `V`.

**Severity: P0 FALSE THEOREM STATEMENT.**

The preceding one-variable inverse-function theorem already returns `Set.BijOn f U V`, so the derivative theorem should consume that stronger structure rather than a pair of equations lacking membership control.

---

# Smoothness classes

`IsClassC1` has the expected textbook meaning:

```text
fD1 is a derivative field for f on I
and
fD1 is continuous on I.
```

This is the dependency used by the Riemann-Stieltjes chapter and is conceptually sound.

`IsClassCk` and `IsClassCInfty` use a witnessing derivative sequence. This is a reasonable explicit learning representation.

`IsClassCOmega` encodes local Taylor-series convergence to `f`, which is an appropriate real-analyticity target.

**Verdict: DEFINITIONS GENERALLY SOUND IN INTENT.**

The derivative-sequence semantics should ultimately be tied to a canonical higher-derivative owner rather than retaining both `NthDerivativeAt` and `HigherDerivativeAt` aliases indefinitely.

---

# P0 — Taylor theorem does not connect `fD` to `f`

`TaylorTheoremLagrangeRemainder` assumes continuity of the functions `fD k` for `k <= n` and differentiability of `fD n`, but it never assumes:

```text
fD 0 = f
```

or

```text
fD (k+1) is the derivative of fD k.
```

Consequently the coefficient sequence in `TaylorPoly fD n a` may be unrelated to `f`.

Counterexample: take every `fD k` to be the zero function and take a nonzero continuous `f`. The displayed hypotheses about `fD` hold, but the conclusion forces `f x` to equal a zero Taylor expression plus zero remainder derivative.

## Required correction

Use the already-defined higher-derivative witness predicate, e.g. require a suitable `HigherDerivativeAt`/interval-level derivative-chain hypothesis connecting `f`, `fD`, and all orders through `n+1`.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# P0 — first-order Peano remainder drops the relative domain

`FirstOrderPeanoRemainder` assumes

```text
Derivative D f A c
```

but concludes a filter limit over **all** nonzero `h -> 0`:

```text
Tendsto (...) (nhdsWithin 0 {0}^c) 0.
```

The derivative premise only controls increments satisfying `c+h in A`.

Counterexample: choose `A = {c}`. The derivative premise is vacuous for every `D`, while the unrestricted punctured-neighborhood conclusion places genuine conditions on `f` outside `A`.

## Required correction

The source filter must be restricted to increments for which `c+h in A`, or the theorem must assume an ambient/open-neighborhood derivative such as `A = univ` or `c in interior A` plus an appropriate local extension argument.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# P0 — relative derivative versus unrestricted differential equivalence

`DifferentiableByDifferential f c` is an unrestricted ambient first-order approximation around `c`.

But `DifferentialAndDerivativeAgree` states for arbitrary `A`:

```text
IsDifferentiable f A c
  iff
DifferentiableByDifferential f c.
```

The right side does not mention `A`.

Counterexample:

```text
A = {0}
f(x) = |x|
c = 0.
```

The relative derivative side is vacuously true under the current definition, while absolute value has no ordinary two-sided differential at `0`.

## Required correction

Either define a **relative differential** using `nhdsWithin`/allowed increments from `A`, or specialize the equivalence to ambient differentiability (`A = univ`) / an open neighborhood setting.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# P0 — flat-function theorem quantifies over an arbitrary derivative sequence

`FlatFunctionProperties` currently takes any `fD` satisfying only

```text
fD 0 = FlatFunction
```

and concludes:

```text
IsClassCInfty FlatFunction fD univ
and forall n, fD n 0 = 0
and not IsClassCOmega FlatFunction fD univ.
```

This is false for arbitrary later entries of `fD`. For example choose `fD 1` to be the constant-one function.

## Correct theorem shape

Use one of:

1. existential form: there **exists** a derivative sequence `fD` with the claimed properties; or
2. add the complete derivative-chain hypotheses that force the supplied `fD` to be the actual iterated derivatives.

The pedagogically clean statement is usually existential plus a separately defined canonical derivative sequence if desired.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# Upstream effect on integration

The integration review found several independent errors in partition/oscillation/integral definitions. Those do **not** originate solely in differentiation.

However:

- HK's Fundamental-Theorem-style statement consumes `Derivative`;
- Riemann-Stieltjes consumes `IsClassC1`;
- derivative-based strictness/comparison examples depend on correct derivative semantics.

Therefore differentiation's domain convention must be stabilized before those downstream theorems become trustworthy.

`IsClassC1` itself is not the source of the Riemann-Stieltjes zero-mesh defect.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified in this differentiation chunk.

All issues found here are statement/domain/representation issues, not selection principles.

---

# Current verdict

| Dimension | Verdict |
|---|---|
| Relative derivative epsilon-delta formula | **STANDARD, BUT DOMAIN QUALIFICATION INCOMPLETE** |
| Derivative uniqueness | **P0 FALSE WITHOUT ACCUMULATION HYPOTHESIS** |
| Differentiable -> continuous | **PASS IN SHAPE** |
| One-sided derivative definitions | **PASS** |
| Rolle/MVT/Cauchy MVT | **PASS IN SHAPE** |
| Darboux theorem for derivatives | **PASS IN SHAPE** |
| Derivative-sign monotonicity iff | **P0 ON DEGENERATE/ISOLATED DOMAINS** |
| Local-extremum necessary condition | **P0 MISSING INTERIOR HYPOTHESIS** |
| Algebra and chain rules | **PASS IN SHAPE** |
| Inverse derivative theorem | **P0 MISSING `g(V) subset U`** |
| `IsClassC1` | **PASS IN INTENT** |
| Taylor Lagrange theorem | **P0 MISSING DERIVATIVE-CHAIN HYPOTHESES** |
| First-order Peano remainder | **P0 DROPS RELATIVE DOMAIN** |
| Differential/derivative equivalence | **P0 RELATIVE-vs-AMBIENT MISMATCH** |
| Flat-function theorem | **P0 ARBITRARY `fD` QUANTIFICATION** |
| Choice leakage | **NONE FOUND** |

---

# Recommended repair order

1. decide and document the canonical meaning of `Derivative D f A c`: raw relative derivative vs derivative-with-accumulation-point;
2. repair `DerivativeUnique` accordingly;
3. propagate the domain convention to derivative-sign and extremum theorems;
4. repair `InverseFunctionDerivative` with actual inverse-domain membership/bijection data;
5. repair Taylor hypotheses by consuming the higher-derivative-chain predicate;
6. make Peano remainder relative to `A`, or explicitly specialize to ambient differentiability;
7. split ambient differential equivalence from relative differentiability;
8. repair `FlatFunctionProperties` to existential/canonical derivative-sequence form;
9. only then treat differentiation as a stable upstream dependency for HK and Riemann-Stieltjes theory.
