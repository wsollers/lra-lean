# LRA Monadic Second-Order / Henkin Semantics Review

## Scope

Focused audit of the monadic second-order model/semantics layer and how Peano and integer induction are represented model-theoretically.

Files reviewed include:

- `LRA/Logic/Model/SecondOrderMonadic/HenkinModel.lean`
- `LRA/Logic/Semantics/SecondOrderMonadic/SOSatisfaction.lean`
- `LRA/Logic/Theory.lean`
- `LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Theory.lean`
- `LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Theory.lean`

Project rule: `sorry` is neutral. This review concerns the strength and meaning of the definitions/statements.

---

# Henkin semantics core

`HenkinModel S` is correctly defined as a first-order model plus a chosen family

```text
SecondOrderDomain : Set (Set Domain)
```

of admissible subsets.

`SOSatisfies` correctly interprets second-order universal quantification by ranging only over members of that chosen family:

```text
forallSet X phi
  means
forall Y in SecondOrderDomain, phi[X := Y].
```

The source documentation explicitly distinguishes this from full second-order semantics, where second-order quantifiers range over all of `Set Domain`.

This is mathematically correct Henkin semantics.

**Verdict: PASS.**

---

# Important conceptual distinction

The repo now contains three closely related notions:

```text
1. represented-subset induction via an arbitrary SetObject backend;
2. Henkin second-order induction via SecondOrderDomain;
3. full second-order induction over all subsets.
```

These are not equivalent in general.

The earlier Peano/IntegerStructure countermodels are exactly what happens when (1) or (2) is too small: disconnected successor orbits can survive because the separating subset is not represented/admissible.

The second-order semantics layer is therefore the correct conceptual place to make this distinction explicit.

---

# P1/P0 naming-strength mismatch in Peano model theory

`PeanoInductionAxiom M` is defined as induction over

```text
subset in M.SecondOrderDomain.
```

That is a Henkin induction principle.

However `PeanoTheory` is documented/named as

```text
the full second-order Peano theory.
```

This is false terminology unless

```text
M.SecondOrderDomain = Set.univ
```

(where `Set.univ` here is the family of all subsets of `M.Domain`) or unless an adequate comprehension condition is proved that is strong enough for the intended theorem.

The associated `PeanoModel` likewise says it satisfies the "full theory" while carrying only an arbitrary `HenkinModel`.

The predicate itself is valid as a **Henkin Peano theory**. The defect is the claimed strength/name.

**Severity: P1 terminology/specification defect by itself; P0 for any categoricity theorem deduced from it without a full/comprehension hypothesis.**

---

# Same mismatch in IntegerStructure model theory

`IntegerInductionAxiom` also ranges only over `M.SecondOrderDomain`.

Yet `IntegerStructureTheory` is documented as the

```text
full second-order integer-structure theory.
```

Again, this is only full semantics if the admissible subset family is all subsets (or an explicitly adequate family for the result being proved).

The disconnected `Int × Bool` countermodel from `PeanoNaturalNumbersReview.md` can be made a Henkin model by choosing a second-order domain that omits the individual orbits, so Henkin induction alone does not force categoricity.

**Severity: same as Peano.**

---

# Recommended semantic hierarchy

Make the distinction first-class:

```text
HenkinPeanoTheory M
HenkinIntegerStructureTheory M
```

for the current predicates, plus either

```text
FullSecondOrderModel M :=
  M.SecondOrderDomain = Set.univ
```

or a structure/certificate saying every subset of `M.Domain` is admissible.

Then define

```text
FullPeanoModel := PeanoModel + FullSecondOrderModel
FullIntegerStructureModel := IntegerStructureModel + FullSecondOrderModel
```

and put categoricity on those full models.

If the project wants a weaker comprehension-based theorem instead, give the exact closure/comprehension hypotheses needed and state categoricity under those rather than calling arbitrary Henkin semantics full.

---

# Connection to native `SetObject` structures

The generic native structures

```text
PeanoSystem Element SetObject
IntegerStructure Element SetObject
```

have exactly the same issue in a different presentation: induction ranges over represented `SetObject`s.

A useful bridge concept would be:

```text
SubsetRepresentationComplete Element SetObject :=
  forall P : Element -> Prop,
    exists A : SetObject, forall x, x in A <-> P x.
```

Then:

```text
represented-subset induction + SubsetRepresentationComplete
=> full predicate induction.
```

For a Henkin model, the analogous certificate is simply that every subset lies in `SecondOrderDomain`.

This would unify the set-theoretic and model-theoretic stories instead of treating them as separate exceptions.

---

# Full semantics versus proof-theoretic tractability

The `HenkinModel` comments correctly note the standard tradeoff:

- Henkin semantics supports complete proof systems and ordinary first-order-style model theory;
- full second-order semantics is stronger and categorical for full second-order Peano arithmetic, but loses compactness and completeness of any effective proof calculus.

The project should preserve this distinction pedagogically rather than calling the Henkin version "full."

This is particularly valuable for the learning goals around model theory and foundations.

---

# Aperiodicity note

`IntegerAperiodicAxiom` quantifies over Lean `Nat` outside the modeled domain to express all finite positive iterates of successor.

Mathematically this is a meta-level axiom schema/family packaged as one Lean proposition, rather than literally one first-order sentence of the object language.

That is acceptable as a project-facing semantic certificate, but documentation should avoid suggesting the entire Lean predicate is a single first-order formula unless a corresponding object-language schema is constructed.

**Severity: P2 documentation/model-theory precision issue.**

---

# Choice audit

No genuine Axiom-of-Choice use is inherent in Henkin/full semantic distinction.

Choosing or postulating a particular second-order domain is model data, not AC.

---

# Verdict

| Dimension | Verdict |
|---|---|
| `HenkinModel` definition | **PASS** |
| `SOSatisfies` | **PASS** |
| explicit Henkin-vs-full distinction in core docs | **PASS / STRONG** |
| `PeanoInductionAxiom` as Henkin induction | **PASS** |
| `PeanoTheory` called full second-order | **P1 MISLABELED; P0 IF USED FOR CATEGORICITY** |
| `IntegerInductionAxiom` as Henkin induction | **PASS** |
| `IntegerStructureTheory` called full second-order | **P1 MISLABELED; P0 IF USED FOR CATEGORICITY** |
| full-second-order model certificate | **MISSING** |
| native SetObject adequacy bridge | **P1 HIGH-VALUE ADDITION** |
| Choice usage | **NONE NEW** |

---

# Immediate repair order

1. rename current theory predicates as Henkin theories or remove the word `full` from their documentation;
2. define a full-second-order/admissible-all-subsets certificate;
3. place Peano/Integer categoricity only under that certificate (or an explicitly sufficient comprehension hypothesis);
4. add the analogous subset-representation adequacy concept for native `SetObject` structures;
5. prove bridges between native represented-subset induction and Henkin/full model-theory induction;
6. document which results are first-order, schema-level, Henkin-second-order, and full-second-order.
