# LRA Computable Reals Construction Review

## Scope

Focused mathematical review of `LRA/NumberSystems/RealNumbers/Constructions/Computable`.

The central distinction is essential: **computable reals are a proper countable subfield of the real numbers, not another complete ordered-field construction of all reals.**

Project-wide rule: `sorry` proof bodies are neutral; malformed definitions and false theorem statements are not.

---

# Files reviewed

- `Carrier.lean`
- `Equivalence.lean`
- `Behavior.lean`
- `Instances.lean`

The intervening pipeline files are largely scaffold-level for this construction.

---

# P0 — `EffectiveApproximation.cauchy_effective` does not express effective Cauchy convergence

Current condition says that after `modulus precision`, for two approximation indices there exists some rational `bound` such that

```text
approximate i - approximate j < bound.
```

The `precision` parameter does not appear in the inequality, and `bound` is existentially chosen with no connection to the requested precision.

In an ordered field, for essentially any pair of values one can choose a larger bound. Thus this condition does not force the sequence terms to become close.

It therefore does **not** encode:

- Cauchy convergence;
- a modulus of Cauchy convergence;
- a rate such as `|a_i-a_j| < 2^{-precision}` or `< 1/(precision+1)`;
- effective convergence in any meaningful sense.

### Repair

Use an explicit canonical positive error scale, e.g.

```text
forall p,
  forall i j >= modulus p,
    |a_i-a_j| < 2^{-p}
```

or another project-defined computable rational tolerance sequence tending to zero.

The metric/absolute-value structure must itself be canonical and compatible with the rational ordered field.

**Severity: P0 CORE DEFINITION DEFECT.**

---

# P0 — the carrier does not encode computability

`approximate : Nat -> rational` and `modulus : Nat -> Nat` are arbitrary Lean functions.

An arbitrary function in Lean's logic is not automatically an algorithmically computable function in the recursion-theoretic sense.

Therefore, even if the modulus inequality were repaired, this carrier would still model something closer to "a rational sequence equipped with a modulus witness" than the classical set of computable reals unless the project introduces an explicit notion of effective/program-indexed function.

Possible approaches:

- use an explicit code/program/index type and evaluation relation;
- use a project notion of recursive/computable function;
- or clearly call this a modulus-tracked/constructively presented real rather than claiming recursion-theoretic computability.

**Severity: P0/P1 SEMANTIC IDENTITY DEFECT.**

---

# P0 — standalone `equivalent` is not an equivalence relation

Current definition is

```text
forall precision,
  exists index,
    first.approximate index = second.approximate index.
```

Because `precision` is unused, this is equivalent simply to saying the two sequences agree at at least one index.

It is not transitive.

Concrete example over a rational carrier:

```text
first  = constantly 0
second = 0,1,0,1,...
third  = constantly 1.
```

Then:

- `first` and `second` agree somewhere;
- `second` and `third` agree somewhere;
- `first` and `third` never agree.

So this cannot serve as sameness of represented real value.

The file currently does not form a quotient by this relation, which prevents an even larger formal failure, but the predicate is still mathematically misnamed/misdefined.

### Repair

Use a null-difference/effective-closeness relation, e.g. the difference converges effectively to zero.

**Severity: P0 DEFINITION DEFECT.**

---

# P0 — arithmetic-closure theorem is tautological

`computable_reals_closed_under_arithmetic` existentially chooses three functions named `add`, `mul`, and `neg` (with `neg` itself given binary type), then requires only statements of the form

```text
equivalent (add first second).approximation
           (add first second).approximation
```

and similarly for multiplication and negation.

These are self-equivalence statements. They do not say the chosen output approximates the arithmetic sum/product/negative of the inputs.

Thus the theorem does not formalize closure under arithmetic.

### Repair

Define actual operations on approximation data and prove their represented-value correctness and effective modulus bounds. Negation should be unary.

**Severity: P0 TAUTOLOGICAL THEOREM.**

---

# P0 — countability theorem is false for the current carrier

The classical theorem "computable reals are countable" is true because algorithms/programs have finite descriptions and can be enumerated.

But the current `ComputableReal` carrier contains arbitrary Lean functions

```text
Nat -> rational
```

and its purported effective-Cauchy condition is essentially vacuous.

For any rational carrier with at least two elements, there are uncountably many binary-valued sequences `Nat -> {0,1}` and hence uncountably many such raw approximation structures.

Therefore

```text
computable_reals_are_countable
```

is false for the current formal carrier.

This cannot be repaired merely by proving a better theorem; the carrier must actually restrict to effectively describable sequences/functions.

**Severity: P0 FALSE THEOREM / CARRIER MISMATCH.**

---

# P0 — genuine computable reals are not a `RealModel`

`Instances.lean` comments that `ComputableReal rational_model` realizes the generic complete ordered-field `RealModel` interface.

That is mathematically wrong even for a correctly defined carrier of computable reals.

The computable reals are:

- countable;
- an ordered field;
- Archimedean;
- dense in the ordinary reals;
- **not complete** under the ordinary real metric/order completeness.

If they were a complete Archimedean ordered field, they would have the structural character of the full real field and in particular would not remain the classical countable computable-real field.

So the intended target should be an ordered-field/Archimedean-field certificate, not `RealModel` if `RealModel` includes LUB completeness.

Additionally, as with other construction `Instances.lean` files, the formal declaration merely returns an unconstrained `RealModel` and does not tie its carrier to `ComputableReal rational_model`.

**Severity: P0 CONCEPTUAL TARGET ERROR + DETACHED REALIZATION.**

---

# What should be taught instead

A useful computable-real chapter should emphasize the separators:

1. every rational is computable;
2. computable reals are closed under `+,-,*` and reciprocal away from zero;
3. computable reals are countable;
4. the full real numbers are uncountable;
5. therefore noncomputable reals exist;
6. computable reals are dense in `R`;
7. computable reals are not complete;
8. limits of computable sequences need not be computable unless convergence has sufficient effective control;
9. there are computable sequences of computable rationals/reals whose ordinary limit is noncomputable when no computable modulus is supplied (advanced but illuminating).

This makes computable reals an excellent **failure-mode / contrast chapter** after the ordinary real construction rather than another candidate construction of the full real field.

---

# Choice audit

No new Axiom-of-Choice dependency is involved in the defects above.

Indeed, a correctly developed computability theory should emphasize explicit algorithms/witnesses rather than arbitrary choice.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Effective-Cauchy definition | **P0 INVALID** |
| Formal computability of approximation functions | **NOT ENCODED** |
| Approximation equivalence | **P0 NOT TRANSITIVE** |
| Arithmetic closure theorem | **P0 TAUTOLOGICAL / WRONG SHAPE** |
| Countability theorem | **P0 FALSE FOR CURRENT CARRIER** |
| `RealModel` target | **P0 MATHEMATICALLY WRONG FOR GENUINE COMPUTABLE REALS** |
| Value as pedagogical contrast | **HIGH, AFTER REPAIR** |
| Choice usage | **NO NEW AC** |

---

# Immediate repair order

1. decide whether this chapter means recursion-theoretic computable reals or merely modulus-tracked effective approximations;
2. encode actual computability/effectivity if the former;
3. define a genuine precision scale and effective Cauchy condition;
4. define equality by effective null difference;
5. define unary negation and binary addition/multiplication with modulus proofs;
6. prove countability from enumerable program descriptions, not from arbitrary Lean function spaces;
7. certify an ordered/Archimedean field, not a complete `RealModel`;
8. explicitly prove/demonstrate failure of completeness as a central educational theorem.
