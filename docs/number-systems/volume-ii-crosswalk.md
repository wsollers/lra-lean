# Volume II / Number-Systems Crosswalk

Volume II repo: `F:\repos\lra-volume-ii`
Markdown declaration manifest: `docs/number-systems/declarations.yaml`
Lean root scanned: `LRA/VolumeII`

## Summary

- Volume II chapter labels: `885`
- Number-system Markdown declaration blocks: `683`
- Lean Volume II declarations scanned: `753`
- Exact Lean file metadata matches to Volume II labels: `0`

Volume II label kinds:
- `ax`: 14
- `cor`: 83
- `def`: 218
- `definition`: 15
- `lem`: 74
- `prop`: 50
- `theorem`: 10
- `thm`: 421

Markdown manifest statuses:
- `missing`: 683

Lean declaration kinds:
- `axiom`: 1
- `def`: 247
- `inductive`: 11
- `structure`: 113
- `theorem`: 381

## Subject Coverage Against Markdown

| Subject | Volume II labels | Likely Markdown matches | Likely missing |
| --- | ---: | ---: | ---: |
| `arithmetic-operations-relations` | 77 | 16 | 61 |
| `complex-numbers` | 44 | 1 | 43 |
| `constructing-number-systems` | 25 | 0 | 25 |
| `embedding-number-systems` | 13 | 0 | 13 |
| `extended-real-numbers` | 25 | 0 | 25 |
| `identity-equality-equivalence` | 40 | 12 | 28 |
| `integers` | 153 | 13 | 140 |
| `natural-numbers` | 56 | 6 | 50 |
| `number-lines` | 9 | 1 | 8 |
| `peano-systems` | 43 | 4 | 39 |
| `rationals` | 240 | 13 | 227 |
| `reals` | 117 | 15 | 102 |
| `whole-numbers` | 43 | 5 | 38 |

## Priority Gap Buckets

### Identity/Equality/Equivalence

- Volume II labels found: `110`
- No likely Markdown match: `98`
- No likely Lean declaration/module-label match: `109`

Likely missing from Markdown:
- `def:complex-coordinate-equivalence` — Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:complex-coordinate-equivalence-reflexive` — Complex Coordinate Equivalence Is Reflexive (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:complex-coordinate-equivalence-symmetric` — Complex Coordinate Equivalence Is Symmetric (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:complex-coordinate-equivalence-transitive` — Complex Coordinate Equivalence Is Transitive (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `thm:complex-coordinate-equivalence-relation` — Complex Coordinate Equivalence Is an Equivalence Relation (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:addition-on-c-respects-equivalence` — Addition Respects Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `lem:negation-on-c-respects-equivalence` — Negation Respects Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `lem:multiplication-on-c-respects-equivalence` — Multiplication Respects Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `thm:zero-additive-identity-on-c` — Zero Is an Additive Identity on $\mathbb{C}$ (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `thm:one-multiplicative-identity-on-c` — One Is a Multiplicative Identity on $\mathbb{C}$ (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `thm:rational-additive-identity` — Rational Additive Identity (rationals; `volume-ii/book-continuum/rationals/notes/algebraic-laws-of-rational-arithmetic/notes-algebraic-laws-of-rational-arithmetic.tex`)
- `thm:rational-multiplicative-identity` — Rational Multiplicative Identity (rationals; `volume-ii/book-continuum/rationals/notes/algebraic-laws-of-rational-arithmetic/notes-algebraic-laws-of-rational-arithmetic.tex`)

Likely missing from Lean:
- `def:complex-coordinate-equivalence` — Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:complex-coordinate-equivalence-reflexive` — Complex Coordinate Equivalence Is Reflexive (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:complex-coordinate-equivalence-symmetric` — Complex Coordinate Equivalence Is Symmetric (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:complex-coordinate-equivalence-transitive` — Complex Coordinate Equivalence Is Transitive (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `thm:complex-coordinate-equivalence-relation` — Complex Coordinate Equivalence Is an Equivalence Relation (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `lem:addition-on-c-respects-equivalence` — Addition Respects Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `lem:negation-on-c-respects-equivalence` — Negation Respects Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `lem:multiplication-on-c-respects-equivalence` — Multiplication Respects Complex Coordinate Equivalence (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `thm:zero-additive-identity-on-c` — Zero Is an Additive Identity on $\mathbb{C}$ (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `thm:one-multiplicative-identity-on-c` — One Is a Multiplicative Identity on $\mathbb{C}$ (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `thm:rational-additive-identity` — Rational Additive Identity (rationals; `volume-ii/book-continuum/rationals/notes/algebraic-laws-of-rational-arithmetic/notes-algebraic-laws-of-rational-arithmetic.tex`)
- `thm:rational-multiplicative-identity` — Rational Multiplicative Identity (rationals; `volume-ii/book-continuum/rationals/notes/algebraic-laws-of-rational-arithmetic/notes-algebraic-laws-of-rational-arithmetic.tex`)

### Order And Order Compatibility

- Volume II labels found: `165`
- No likely Markdown match: `148`
- No likely Lean declaration/module-label match: `153`

Likely missing from Markdown:
- `lem:complex-coordinate-equivalence-transitive` — Complex Coordinate Equivalence Is Transitive (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `thm:c-is-not-an-ordered-field` — $\mathbb{C}$ Is Not an Ordered Field (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `def:extended-real-order` — Order on the Extended Reals (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:extended-real-order-well-defined` — Extended Real Order Is Well Defined (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:extended-real-order-is-total` — Extended Real Order Is Total (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:real-order-embeds-in-extended-real-order` — Real Order Embeds in the Extended Real Order (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:extended-interval-order-characterization` — Extended Interval Order Characterization (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/extended-real-intervals/notes-extended-real-intervals.tex`)
- `prop:no-least-positive-rational` — $\mathbb{Q}$ Has No Least Positive Rational (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `lem:fraction-equivalence-transitive` — Fraction Equivalence Is Transitive (rationals; `volume-ii/book-continuum/rationals/notes/construction-of-q/notes-construction-of-q.tex`)
- `def:ordered-subfield` — Ordered subfield (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)
- `def:densely-ordered-system` — Densely ordered system (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)
- `thm:embedding-z-into-q-preserves-order` — Embedding Preserves Order (rationals; `volume-ii/book-continuum/rationals/notes/embedding-z-into-q/notes-embedding-z-into-q.tex`)

Likely missing from Lean:
- `lem:complex-coordinate-equivalence-transitive` — Complex Coordinate Equivalence Is Transitive (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`)
- `thm:c-is-not-an-ordered-field` — $\mathbb{C}$ Is Not an Ordered Field (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `def:extended-real-order` — Order on the Extended Reals (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:extended-real-order-well-defined` — Extended Real Order Is Well Defined (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:extended-real-order-is-total` — Extended Real Order Is Total (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:real-order-embeds-in-extended-real-order` — Real Order Embeds in the Extended Real Order (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/the-extended-real-number-system/notes-the-extended-real-number-system.tex`)
- `thm:extended-interval-order-characterization` — Extended Interval Order Characterization (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/extended-real-intervals/notes-extended-real-intervals.tex`)
- `prop:no-least-positive-rational` — $\mathbb{Q}$ Has No Least Positive Rational (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `lem:fraction-equivalence-transitive` — Fraction Equivalence Is Transitive (rationals; `volume-ii/book-continuum/rationals/notes/construction-of-q/notes-construction-of-q.tex`)
- `def:ordered-integral-domain` — Ordered integral domain (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)
- `def:rational-ordered-field` — Ordered field (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)
- `def:ordered-subfield` — Ordered subfield (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)

### Density And Approximation

- Volume II labels found: `16`
- No likely Markdown match: `16`
- No likely Lean declaration/module-label match: `16`

Likely missing from Markdown:
- `lem:midpoint-between-q` — Midpoint Lies Strictly Between Rationals (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `thm:density-of-q` — Density of $\mathbb{Q}$ in Itself (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `prop:one-sided-rational-approximation` — One-Sided Rational Approximation (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `def:densely-ordered-system` — Densely ordered system (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)
- `thm:dyadic-approximation-error-bound` — Dyadic Approximation Error Bound (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-dyadic-approximation-stubs.tex`)
- `thm:farey-gap` — Gap between Farey neighbors (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-mediant.tex`)
- `thm:between-any-two-rationals-is-a-rational` — Between Any Two Rational Numbers Lies Another Rational (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-rational-density-and-order.tex`)
- `cor:q-dense-in-itself` — $\mathbb{Q}$ Is Dense in Itself (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-rational-density-and-order.tex`)
- `thm:rational-square-approximation-from-above` — Rational Square Approximation from Above (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-square-bracketing-and-nonlinear-approximation.tex`)
- `thm:rational-square-approximation-from-below` — Rational Square Approximation from Below (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-square-bracketing-and-nonlinear-approximation.tex`)
- `def:real-limit-approx` — Real number via rational approximation (reals; `volume-ii/book-continuum/reals/notes/constructions/notes-stern-brocot-construction.tex`)
- `thm:density-of-q-in-r` — Density of $\mathbb{Q}$ in $\mathbb{R}$ (reals; `volume-ii/book-continuum/reals/notes/embedding-q-into-r/notes-embedding-q-into-r.tex`)

Likely missing from Lean:
- `lem:midpoint-between-q` — Midpoint Lies Strictly Between Rationals (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `thm:density-of-q` — Density of $\mathbb{Q}$ in Itself (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `prop:one-sided-rational-approximation` — One-Sided Rational Approximation (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `def:densely-ordered-system` — Densely ordered system (rationals; `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`)
- `thm:dyadic-approximation-error-bound` — Dyadic Approximation Error Bound (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-dyadic-approximation-stubs.tex`)
- `thm:farey-gap` — Gap between Farey neighbors (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-mediant.tex`)
- `thm:between-any-two-rationals-is-a-rational` — Between Any Two Rational Numbers Lies Another Rational (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-rational-density-and-order.tex`)
- `cor:q-dense-in-itself` — $\mathbb{Q}$ Is Dense in Itself (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-rational-density-and-order.tex`)
- `thm:rational-square-approximation-from-above` — Rational Square Approximation from Above (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-square-bracketing-and-nonlinear-approximation.tex`)
- `thm:rational-square-approximation-from-below` — Rational Square Approximation from Below (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-square-bracketing-and-nonlinear-approximation.tex`)
- `def:real-limit-approx` — Real number via rational approximation (reals; `volume-ii/book-continuum/reals/notes/constructions/notes-stern-brocot-construction.tex`)
- `thm:density-of-q-in-r` — Density of $\mathbb{Q}$ in $\mathbb{R}$ (reals; `volume-ii/book-continuum/reals/notes/embedding-q-into-r/notes-embedding-q-into-r.tex`)

### Archimedean And Bounds

- Volume II labels found: `14`
- No likely Markdown match: `10`
- No likely Lean declaration/module-label match: `9`

Likely missing from Markdown:
- `thm:extended-real-line-is-closed-bounded` — The Extended Real Line Is Closed and Bounded (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/extended-real-intervals/notes-extended-real-intervals.tex`)
- `thm:dyadic-approximation-error-bound` — Dyadic Approximation Error Bound (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-dyadic-approximation-stubs.tex`)
- `def:bounded-sequence-q` — Bounded sequence of rational numbers (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-problems-in-q.tex`)
- `thm:convergent-bounded-q` — Convergent sequences are bounded (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-problems-in-q.tex`)
- `thm:cauchy-bounded-q` — Cauchy sequences are bounded (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-problems-in-q.tex`)
- `prop:gap-set-bounded-above-q` — The Gap Set Is Bounded Above in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `def:upper-bound-in-r` — Upper Bound in $\mathbb{R}$ (reals; `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`)
- `lem:union-of-cuts-is-a-cut` — Union of a Bounded Nonempty Family of Cuts Is a Cut (reals; `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`)
- `thm:archimedean-property-of-r` — Archimedean Property of $\mathbb{R}$ (reals; `volume-ii/book-continuum/reals/notes/embedding-q-into-r/notes-embedding-q-into-r.tex`)
- `thm:absolute-value-bounds-on-z` — Bounding by Absolute Value (integers; `volume-ii/book-discrete-algebraic/integers/notes/order-on-z/notes-order-on-z.tex`)

Likely missing from Lean:
- `thm:extended-real-line-is-closed-bounded` — The Extended Real Line Is Closed and Bounded (extended-real-numbers; `volume-ii/book-continuum/extended-real-numbers/notes/extended-real-intervals/notes-extended-real-intervals.tex`)
- `thm:dyadic-approximation-error-bound` — Dyadic Approximation Error Bound (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-dyadic-approximation-stubs.tex`)
- `def:bounded-sequence-q` — Bounded sequence of rational numbers (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-problems-in-q.tex`)
- `thm:convergent-bounded-q` — Convergent sequences are bounded (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-problems-in-q.tex`)
- `thm:cauchy-bounded-q` — Cauchy sequences are bounded (rationals; `volume-ii/book-continuum/rationals/notes/nonlinear-approximation-in-q/notes-problems-in-q.tex`)
- `prop:gap-set-bounded-above-q` — The Gap Set Is Bounded Above in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `def:upper-bound-in-r` — Upper Bound in $\mathbb{R}$ (reals; `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`)
- `cor:glb-property-r` — Greatest-Lower-Bound Property (reals; `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`)
- `thm:absolute-value-bounds-on-z` — Bounding by Absolute Value (integers; `volume-ii/book-discrete-algebraic/integers/notes/order-on-z/notes-order-on-z.tex`)

### Irrationality And Gaps

- Volume II labels found: `30`
- No likely Markdown match: `29`
- No likely Lean declaration/module-label match: `26`

Likely missing from Markdown:
- `thm:farey-gap` — Gap between Farey neighbors (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-mediant.tex`)
- `lem:mediant-gap` — Mediant Gap Lemma (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-mediant.tex`)
- `cor:sb-limit-irrational` — Infinite Stern--Brocot paths converge to irrationals (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/stern-brocot.tex`)
- `thm:no-rational-square-root-of-two` — No Rational Square Root of Two (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `def:gap-set-q` — The Gap Set in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `prop:gap-set-bounded-above-q` — The Gap Set Is Bounded Above in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `thm:gap-set-no-rational-supremum-q` — The Square-Two Gap Has No Rational Supremum (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `cor:q-order-incomplete` — $\mathbb{Q}$ Is Order-Incomplete (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `thm:rational-plus-irrational-is-irrational` — Rational Plus Irrational Is Irrational (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `thm:rational-minus-irrational-is-irrational` — Rational Minus Irrational Is Irrational (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `thm:nonzero-rational-times-irrational-is-irrational` — Nonzero Rational Times Irrational Is Irrational (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `thm:quotient-by-nonzero-rational-preserves-irrationality` — Quotient by Nonzero Rational Preserves Irrationality (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)

Likely missing from Lean:
- `thm:farey-gap` — Gap between Farey neighbors (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-mediant.tex`)
- `lem:mediant-gap` — Mediant Gap Lemma (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-mediant.tex`)
- `cor:sb-limit-irrational` — Infinite Stern--Brocot paths converge to irrationals (rationals; `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/stern-brocot.tex`)
- `def:gap-set-q` — The Gap Set in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `prop:gap-set-bounded-above-q` — The Gap Set Is Bounded Above in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `thm:gap-set-no-rational-supremum-q` — The Square-Two Gap Has No Rational Supremum (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `cor:q-order-incomplete` — $\mathbb{Q}$ Is Order-Incomplete (rationals; `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`)
- `thm:rational-plus-irrational-is-irrational` — Rational Plus Irrational Is Irrational (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `thm:rational-minus-irrational-is-irrational` — Rational Minus Irrational Is Irrational (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `thm:quotient-by-nonzero-rational-preserves-irrationality` — Quotient by Nonzero Rational Preserves Irrationality (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `cor:irrationals-are-not-a-field` — The Irrationals Are Not a Field (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)
- `cor:irrationals-are-not-an-ordered-field` — The Irrationals Are Not an Ordered Field (reals; `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`)

### Division And Reciprocal

- Volume II labels found: `71`
- No likely Markdown match: `68`
- No likely Lean declaration/module-label match: `67`

Likely missing from Markdown:
- `def:multiplicative-inverse-on-c` — Multiplicative Inverse in $\mathbb{C}$ (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `thm:every-complex-has-additive-inverse` — Every Complex Number Has an Additive Inverse (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `thm:every-nonzero-complex-has-inverse` — Every Nonzero Complex Number Has a Multiplicative Inverse (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `cor:reciprocals-arbitrarily-small-q` — Reciprocals Become Arbitrarily Small in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `cor:uniqueness-additive-inverse-on-q` — Uniqueness of Additive Inverses on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:uniqueness-multiplicative-inverse-on-q` — Uniqueness of Multiplicative Inverses on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:inverse-of-one-is-one-on-q` — The Inverse of One Is One on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:inverse-of-product-on-q` — Inverse of a Product on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:inverse-of-inverse-on-q` — Inverse of an Inverse on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `thm:negation-left-additive-inverse-on-q` — Negation Gives a Left Additive Inverse on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/operations-on-q-classes/notes-operations-on-q-classes.tex`)
- `cor:negation-right-additive-inverse-on-q` — Negation Gives a Right Additive Inverse on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/operations-on-q-classes/notes-operations-on-q-classes.tex`)
- `thm:every-rational-has-additive-inverse` — Every Rational Has an Additive Inverse (rationals; `volume-ii/book-continuum/rationals/notes/operations-on-q-classes/notes-operations-on-q-classes.tex`)

Likely missing from Lean:
- `def:multiplicative-inverse-on-c` — Multiplicative Inverse in $\mathbb{C}$ (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/operations-on-c-classes/notes-operations-on-c-classes.tex`)
- `thm:every-complex-has-additive-inverse` — Every Complex Number Has an Additive Inverse (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `thm:every-nonzero-complex-has-inverse` — Every Nonzero Complex Number Has a Multiplicative Inverse (complex-numbers; `volume-ii/book-continuum/complex-numbers/notes/field-structure-of-c/notes-field-structure-of-c.tex`)
- `cor:reciprocals-arbitrarily-small-q` — Reciprocals Become Arbitrarily Small in $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`)
- `cor:uniqueness-additive-inverse-on-q` — Uniqueness of Additive Inverses on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:uniqueness-multiplicative-inverse-on-q` — Uniqueness of Multiplicative Inverses on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:inverse-of-one-is-one-on-q` — The Inverse of One Is One on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:inverse-of-product-on-q` — Inverse of a Product on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `cor:inverse-of-inverse-on-q` — Inverse of an Inverse on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/field-structure-of-q/notes-field-structure-of-q.tex`)
- `thm:negation-left-additive-inverse-on-q` — Negation Gives a Left Additive Inverse on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/operations-on-q-classes/notes-operations-on-q-classes.tex`)
- `cor:negation-right-additive-inverse-on-q` — Negation Gives a Right Additive Inverse on $\mathbb{Q}$ (rationals; `volume-ii/book-continuum/rationals/notes/operations-on-q-classes/notes-operations-on-q-classes.tex`)
- `thm:every-rational-has-additive-inverse` — Every Rational Has an Additive Inverse (rationals; `volume-ii/book-continuum/rationals/notes/operations-on-q-classes/notes-operations-on-q-classes.tex`)

## High-Confidence Crosswalk Candidates

These are fuzzy title/name matches.  They are review candidates, not proof-status claims.

- `def:complex-numbers` — Complex Numbers | Markdown: `gpt-09-complex:1-1-complex-numbers` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/complex-numbers/notes/construction-of-c/notes-construction-of-c.tex`
- `def:closed-interval` — Closed Interval | Markdown: `gpt-06-reals-cantor:1-1-rational-closed-interval` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/number-lines/notes/intervals-on-a-number-line/notes-intervals-on-a-number-line.tex`
- `thm:archimedean-property-of-q` — Archimedean Property of $\mathbb{Q}$ | Markdown: `gpt-03-rationals:6-2-archimedean-property-of` (1.00) | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.archimedean_property` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/arbitrary-closeness-in-q/notes-arbitrary-closeness-in-q.tex`
- `thm:fraction-pair-equivalence` — The Fraction-Pair Relation Is an Equivalence Relation | Markdown: `gpt-03-rationals:1-1-fraction-pair-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/constructing-rational-numbers/notes-constructing-rational-numbers.tex`
- `def:rational-numbers` — Rational numbers | Markdown: `gpt-03-rationals:1-3-rational-numbers` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/constructing-rational-numbers/notes-constructing-rational-numbers.tex`
- `def:fraction-equivalence` — Fraction Equivalence | Markdown: `gpt-03-rationals:1-1-fraction-pair-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/construction-of-q/notes-construction-of-q.tex`
- `thm:fraction-equivalence-relation` — Fraction Equivalence Is an Equivalence Relation | Markdown: `gpt-03-rationals:1-1-fraction-pair-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/construction-of-q/notes-construction-of-q.tex`
- `def:rationals` — Rational Numbers | Markdown: `gpt-03-rationals:1-3-rational-numbers` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/construction-of-q/notes-construction-of-q.tex`
- `def:ordered-integral-domain` — Ordered integral domain | Markdown: `gpt-00-abstract-laws:7-2-a-square-is-zero-only-at-zero-in-an-ordered-integral-domain` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`
- `def:rational-ordered-field` — Ordered field | Markdown: `gpt-00-abstract-laws:6-15-ordered-field` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/defining-order-on-q/notes-defining-order-on-q.tex`
- `thm:archimedean-q` — Archimedean property of $\mathbb{Q}$ | Markdown: `gpt-03-rationals:6-2-archimedean-property-of` (1.00) | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.archimedean_property` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-density-of-rationals.tex`
- `def:dyadic-rational` — Dyadic rational | Markdown: `gpt-08-reals-dyadic:1-1-dyadic-rational` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/linear-approximation-in-q/notes-dyadic-approximation-stubs.tex`
- `def:positive-rational` — Positive Rational | Markdown: `gpt-08b-reals-extensions:4-1-positive-base-rational-power` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/order-on-q/notes-order-on-q.tex`
- `def:order-on-q` — Order on $\mathbb{Q}$ | Markdown: `gpt-04-reals-dedekind:2-5-order-embedding-of` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/order-on-q/notes-order-on-q.tex`
- `thm:reciprocal-reverses-nonstrict-order-on-positives-q` — Reciprocal Reverses Non-Strict Order on Positives in $\mathbb{Q}$ | Markdown: none | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.nonstrict_order` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/order-on-q/notes-order-on-q.tex`
- `thm:reciprocal-reverses-nonstrict-order-on-same-sign-q` — Reciprocal Reverses Non-Strict Order on Same-Sign Rationals | Markdown: none | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.nonstrict_order` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/order-on-q/notes-order-on-q.tex`
- `def:rational-operations` — Addition and multiplication | Markdown: `gpt-01d-divisibility-division:3-5-congruence-respects-addition-and-multiplication` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/rationals/notes/rational-arithmetic-from-representatives/notes-arithmetic-from-representatives.tex`
- `thm:ec-integer-embedding-add` — Integer embedding preserves addition | Markdown: none | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.integer_embedding` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/rational-arithmetic-from-representatives/notes-arithmetic-from-representatives.tex`
- `thm:ec-integer-embedding-mul` — Integer embedding preserves multiplication | Markdown: none | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.integer_embedding` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/rational-arithmetic-from-representatives/notes-arithmetic-from-representatives.tex`
- `thm:no-rational-square-root-of-two` — No Rational Square Root of Two | Markdown: none | Lean: `LRA.VolumeII.Rationals.RationalQuotientFractions.no_rational_square_root_two` (1.00) | Volume file: `volume-ii/book-continuum/rationals/notes/rational-gaps/notes-rational-gaps.tex`
- `def:addition-on-r` — Addition of Cuts | Markdown: `gpt-04-reals-dedekind:3-1-addition-of-cuts` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/addition-on-r/notes-addition-on-r.tex`
- `def:real-ordered-field` — Complete Ordered Field | Markdown: `gpt-00-abstract-laws:6-16-complete-ordered-field` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/characterization-of-r/notes-characterization-of-r.tex`
- `lem:union-of-cuts-is-a-cut` — Union of a Bounded Nonempty Family of Cuts Is a Cut | Markdown: none | Lean: `LRA.VolumeII.Reals.Dedekind.family_union` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`
- `thm:lub-property-r` — Least-Upper-Bound Property | Markdown: `gpt-00-abstract-laws:5-8-least-upper-bound-property` (1.00) | Lean: `LRA.VolumeII.Reals.Dedekind.least_upper_bound_property` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`
- `cor:glb-property-r` — Greatest-Lower-Bound Property | Markdown: `gpt-00-abstract-laws:5-9-greatest-lower-bound-property` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/completeness-of-r/notes-completeness-of-r.tex`
- `def:dedekind-cut` — Dedekind Cut | Markdown: `gpt-04-reals-dedekind:1-1-dedekind-cut` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/construction-of-r/notes-construction-of-r.tex`
- `def:reals` — The Real Numbers | Markdown: `gpt-04-reals-dedekind:1-2-dedekind-real-numbers` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/construction-of-r/notes-construction-of-r.tex`
- `def:rational-cut` — Rational Cut | Markdown: `gpt-03-rationals:7-1-the-rational-square-root-cut-for` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/construction-of-r/notes-construction-of-r.tex`
- `def:dedekind-cut` — Dedekind Cut | Markdown: `gpt-04-reals-dedekind:1-1-dedekind-cut` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/constructions/notes-dedekind-construction.tex`
- `thm:archimedean-property-of-r` — Archimedean Property of $\mathbb{R}$ | Markdown: none | Lean: `LRA.VolumeII.Reals.Dedekind.archimedean_property` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/embedding-q-into-r/notes-embedding-q-into-r.tex`
- `thm:nonzero-rational-times-irrational-is-irrational` — Nonzero Rational Times Irrational Is Irrational | Markdown: none | Lean: `LRA.VolumeII.Reals.Irrationals.irrational_is_nonzero` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`
- `cor:irrationals-not-closed-under-addition` — The Irrationals Are Not Closed Under Addition | Markdown: none | Lean: `LRA.VolumeII.Reals.Irrationals.irrationals_not_closed_under_addition` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`
- `cor:irrationals-not-closed-under-multiplication` — The Irrationals Are Not Closed Under Multiplication | Markdown: none | Lean: `LRA.VolumeII.Reals.Irrationals.irrationals_not_closed_under_multiplication` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/irrationals/notes-irrational-arithmetic.tex`
- `def:product-nonnegative-on-r` — Product of Nonnegative Cuts | Markdown: `gpt-04-reals-dedekind:4-2-product-of-nonnegative-cuts` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `lem:product-nonnegative-is-a-cut` — Product of Nonnegative Cuts Is a Cut | Markdown: none | Lean: `LRA.VolumeII.Reals.Dedekind.nonnegative_product_is_cut` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `thm:triangle-inequality` — Triangle Inequality | Markdown: `gpt-09-complex:5-4-triangle-inequality` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `def:multiplication-on-r` — Multiplication of Cuts | Markdown: `gpt-04-reals-dedekind:4-4-multiplication-of-arbitrary-cuts` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `def:reciprocal-positive-on-r` — Reciprocal of a Positive Cut | Markdown: `gpt-04-reals-dedekind:4-7-reciprocal-of-a-positive-cut` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `def:reciprocal-on-r` — Reciprocal of a Nonzero Cut | Markdown: `gpt-04-reals-dedekind:4-8-reciprocal-of-a-nonzero-cut` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `lem:reciprocal-is-a-cut` — Reciprocal of a Nonzero Cut Is a Cut | Markdown: `gpt-04-reals-dedekind:4-8-reciprocal-of-a-nonzero-cut` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `thm:reciprocal-reverses-nonstrict-order-on-positives-r` — Reciprocal Reverses Non-Strict Order on Positives in $\mathbb{R}$ | Markdown: none | Lean: `LRA.VolumeII.Reals.Dedekind.nonstrict_order` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `thm:reciprocal-reverses-nonstrict-order-on-same-sign-r` — Reciprocal Reverses Non-Strict Order on Same-Sign Reals | Markdown: none | Lean: `LRA.VolumeII.Reals.Dedekind.nonstrict_order` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/multiplication-on-r/notes-multiplication-on-r.tex`
- `def:strict-order-on-r` — Strict Order on $\mathbb{R}$ | Markdown: none | Lean: `LRA.VolumeII.Reals.Dedekind.strict_order` (1.00) | Volume file: `volume-ii/book-continuum/reals/notes/order-on-r/notes-order-on-r.tex`
- `def:square-root` — Square Root | Markdown: `gpt-00-abstract-laws:7-5-a-field-containing-a-square-root-of-is-not-orderable` (1.00) | Lean: none | Volume file: `volume-ii/book-continuum/reals/notes/the-gap-filled/notes-the-gap-filled.tex`
- `def:left-distributivity` — Left Distributivity | Markdown: `gpt-00-abstract-laws:3-1-left-distributivity` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/algebraic-laws/notes-algebraic-laws.tex`
- `def:right-distributivity` — Right Distributivity | Markdown: `gpt-00-abstract-laws:3-2-right-distributivity` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/algebraic-laws/notes-algebraic-laws.tex`
- `def:left-cancellation` — Left Cancellation | Markdown: `gpt-00-abstract-laws:2-7-left-and-right-cancellation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/algebraic-laws/notes-algebraic-laws.tex`
- `def:right-cancellation` — Right Cancellation | Markdown: `gpt-00-abstract-laws:2-7-left-and-right-cancellation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/algebraic-laws/notes-algebraic-laws.tex`
- `prop:invertibility-implies-cancellation` — Invertibility Implies Cancellation | Markdown: `gpt-00-abstract-laws:2-8-invertibility-implies-cancellation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/algebraic-laws/notes-algebraic-laws.tex`
- `def:positive-cone` — Positive cone | Markdown: `gpt-02b-integers-mendelson:4-2-mendelson-positive-cone` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/order-compatibility/notes-order-compatibility.tex`
- `lem:operation-left-respect` — Left Respect | Markdown: `gpt-00-abstract-laws:11-6-left-and-right-respect` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/closure/notes-closure.tex`
- `lem:operation-right-respect` — Right Respect | Markdown: `gpt-00-abstract-laws:11-6-left-and-right-respect` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/closure/notes-closure.tex`
- `thm:induced-operation-well-defined` — Induced Operation | Markdown: `gpt-00-abstract-laws:11-9-induced-binary-operation-on-a-quotient` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/closure/notes-closure.tex`
- `def:strict-partial-order` — Strict Partial Order | Markdown: `gpt-00-abstract-laws:4-1-strict-partial-order` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/composed-relations/notes-composed-relations.tex`
- `def:strict-total-order` — Strict Total Order | Markdown: `gpt-00-abstract-laws:4-2-strict-total-order` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/composed-relations/notes-composed-relations.tex`
- `thm:no-zero-divisors` — No Zero Divisors | Markdown: `gpt-01b-whole-numbers:4-7-no-zero-divisors` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/derived-laws/notes-derived-laws.tex`
- `def:absorbing-element` — Absorbing Element | Markdown: `gpt-00-abstract-laws:3-3-absorbing-element` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/identity-elements/notes-identity-elements.tex`
- `thm:uniqueness-of-identity` — Uniqueness of Identity | Markdown: `gpt-00-abstract-laws:2-4-uniqueness-of-the-identity-element` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/identity-elements/notes-identity-elements.tex`
- `prop:multiplication-order-compatibility` — Multiplication Preserves Order | Markdown: `gpt-00-abstract-laws:7-3-multiplication-by-a-positive-element-preserves-order` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/order-compatibility/notes-order-compatibility.tex`
- `def:abstract-order-embedding` — Order Embedding | Markdown: `gpt-00b-canonical-embeddings:1-2-order-embedding` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/arithmetic-operations-relations/notes/structure-preserving-maps/notes-structure-preserving-maps.tex`
- `def:equivalence-relation` — Equivalence Relation | Markdown: `gpt-00-abstract-laws:11-5-operation-respects-an-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `def:canonical-projection` — Canonical Projection | Markdown: `gpt-00-abstract-laws:11-2-canonical-projection` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `def:operation-respects-equivalence` — Operation Respects an Equivalence | Markdown: `gpt-00-abstract-laws:11-5-operation-respects-an-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `def:left-right-respect-equivalence` — Left and Right Respect | Markdown: `gpt-00-abstract-laws:11-6-left-and-right-respect` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `lem:respect-splits` — Respect Splits | Markdown: `gpt-00-abstract-laws:11-7-respect-splits-by-argument` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `thm:induced-operation-on-quotient` — Induced Operation on a Quotient | Markdown: `gpt-00-abstract-laws:11-9-induced-binary-operation-on-a-quotient` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `thm:induced-unary-operation-on-quotient` — Induced Unary Operation | Markdown: `gpt-00-abstract-laws:11-11-induced-unary-operation-on-a-quotient` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `def:predicate-respects-equivalence` — Predicate Respects an Equivalence | Markdown: `gpt-00-abstract-laws:11-12-predicate-respects-an-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `thm:induced-predicate-on-quotient` — Induced Predicate on a Quotient | Markdown: `gpt-00-abstract-laws:11-13-induced-predicate-on-a-quotient` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `def:relation-respects-equivalence` — Relation Respects an Equivalence | Markdown: `gpt-00-abstract-laws:11-5-operation-respects-an-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `thm:induced-relation-on-quotient` — Induced Relation on a Quotient | Markdown: `gpt-00-abstract-laws:11-15-induced-relation-on-a-quotient` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/equivalence/notes-equivalence.tex`
- `cor:equality-is-equivalence-relation` — Equality Is an Equivalence Relation | Markdown: `gpt-02a-integers-tao:1-3-tao-equality-is-an-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/identity-equality-equivalence/notes/properties-of-equality/notes-properties-of-equality.tex`
- `def:integers` — Integers | Markdown: none | Lean: `LRA.VolumeII.Integers.Polish.LandauWorkup.lt_def` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/construction-of-z/notes-construction-of-z.tex`
- `thm:zero-is-an-integer` — Zero Is an Integer | Markdown: `gpt-02-integers:2-3-zero-integer` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/construction-of-z/notes-construction-of-z.tex`
- `thm:one-is-an-integer` — One Is an Integer | Markdown: `gpt-02-integers:3-3-one-integer` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/construction-of-z/notes-construction-of-z.tex`
- `thm:embedding-w-into-z-injective` — Embedding $\mathbb{W}$ into $\mathbb{Z}$ Is Injective | Markdown: none | Lean: `LRA.VolumeII.Integers.QuotientOrderedPairs.embedding_is_injective` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/embedding-w-into-z/notes-embedding-w-into-z.tex`
- `thm:men-equiv` — Mendelson 1.1 --- $\sim$ is an equivalence relation | Markdown: `gpt-02b-integers-mendelson:1-2-mendelson-s-relation-is-an-equivalence-relation` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `lem:men-add-welld` — Mendelson 2.1 --- Addition well-defined | Markdown: `gpt-02b-integers-mendelson:2-2-mendelson-addition` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `thm:men-add` — Mendelson 2.2 --- Properties of addition | Markdown: `gpt-02b-integers-mendelson:2-2-mendelson-addition` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `lem:men-mul-welld` — Mendelson 2.3 --- Multiplication well-defined | Markdown: `gpt-02b-integers-mendelson:3-2-mendelson-multiplication` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `thm:men-mul` — Mendelson 2.4 --- Properties of multiplication | Markdown: `gpt-08d-interval-arithmetic-over-reals:2-2-multiplication` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `thm:men-order-positivity` — Mendelson 4.2 --- Order and positivity | Markdown: `gpt-06-reals-cantor:4-2-order` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `thm:men-euclid-lemma` — Mendelson 5.6 --- Euclid's lemma | Markdown: `gpt-01d-divisibility-division:5-5-euclid-s-lemma` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/mendelson-construction/notes-int-mendelson-construction.tex`
- `def:positive-integer` — Positive Integer | Markdown: `gpt-02a-integers-tao:5-1-positive-tao-integer` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/order-on-z/notes-order-on-z.tex`
- `def:absolute-value-on-z` — Absolute Value on $\mathbb{Z}$ | Markdown: `gpt-02-integers:5-5-absolute-value-on` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/order-on-z/notes-order-on-z.tex`
- `lem:int-well-defined` — Tao 4.1.3 — Addition and multiplication are well-defined | Markdown: `gpt-01-natural-numbers:4-1-addition` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/tao-construction/notes-int-tao-construction.tex`
- `lem:int-trichotomy` — Tao 4.1.5 — Trichotomy of integers | Markdown: `gpt-02a-integers-tao:1-4-tao-integers` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/integers/notes/tao-construction/notes-int-tao-construction.tex`
- `thm:addition-with-one` — Addition With $1$ | Markdown: `gpt-01-natural-numbers:4-1-addition` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/addition-on-n/notes-addition-on-n.tex`
- `thm:addition-associative` — Addition Is Associative | Markdown: none | Lean: `LRA.VolumeII.NaturalNumbers.Addition.addition_is_associative` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/addition-on-n/notes-addition-on-n.tex`
- `thm:addition-cancellation` — Cancellation for Addition | Markdown: `gpt-01-natural-numbers:4-6-cancellation-for-addition` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/addition-on-n/notes-addition-on-n.tex`
- `thm:n-additive-structure` — $\mathbb{N}$ Is Closed, Associative, and Commutative Under Addition | Markdown: none | Lean: `LRA.VolumeII.NaturalNumbers.Addition.addition_is_associative` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/algebraic-structure-of-n/notes-algebraic-structure-of-n.tex`
- `thm:multiplication-with-one` — Multiplication With $1$ | Markdown: `gpt-01-natural-numbers:5-1-multiplication` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/multiplication-on-n/notes-multiplication-on-n.tex`
- `thm:multiplication-cancellation` — Cancellation for Multiplication | Markdown: `gpt-01-natural-numbers:5-8-cancellation-for-multiplication` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/multiplication-on-n/notes-multiplication-on-n.tex`
- `def:natural-numbers` — The Natural Numbers | Markdown: `gpt-01-natural-numbers:7-1-arithmetic-structure-of-the-one-based-natural-numbers` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/nz-axioms/notes-nz-axioms.tex`
- `thm:well-ordering-principle` — Well-Ordering Principle | Markdown: `gpt-01-natural-numbers:6-8-well-ordering-principle` (1.00) | Lean: `LRA.VolumeII.NaturalNumbers.Order.well_ordering` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/well-ordering-principle/notes-well-ordering-principle.tex`
- `thm:induction-well-ordering-equivalence` — Induction, Strong Induction, and Well-Ordering Are Equivalent | Markdown: none | Lean: `LRA.VolumeII.NaturalNumbers.Order.well_ordering` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/natural-numbers/notes/well-ordering-principle/notes-well-ordering-principle.tex`
- `def:peano-system` — Peano System | Markdown: `gpt-01-natural-numbers:1-1-one-based-peano-system` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-defining-peano-systems.tex`
- `ax:peano-successor-injective` — Injectivity of Successor | Markdown: `gpt-01b-whole-numbers:2-3-injectivity-of-successor-on` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-defining-peano-systems.tex`
- `thm:induction-principle-for-peano-system` — Induction Principle for a Peano System | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Induction.induction_principle` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `def:successor-closed-subset` — Successor-Closed Subset | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.PeanoSystem.successor_closed_subset` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `def:inductive-subset-of-peano-system` — Inductive Subset of a Peano System | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.PeanoSystem.inductive_subset` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `thm:every-element-is-one-or-a-successor` — Every Element Is Either $1$ or a Successor | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.BasicTheorems.every_element_is_one_or_successor` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `cor:predecessor-exists-unique-away-from-one` — Predecessor Existence and Uniqueness Away from $1$ | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.BasicTheorems.unique_predecessor` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `cor:unique-predecessor-characterization-away-from-one` — Unique Predecessor Characterization Away from $1$ | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.BasicTheorems.unique_predecessor` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `cor:one-is-unique-non-successor` — The Distinguished Element Is the Unique Non-Successor | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.BasicTheorems.one_unique_non_successor` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/defining-peano-systems/notes-peano-system-theorems.tex`
- `def:iterator-data-on-peano-system` — Iterator Data | Markdown: `gpt-01-natural-numbers:p-1-iterator-data` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `def:iterator-relation` — Iterator Relation | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Recursion.iterator_relation` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `def:minimal-iterator-relation` — Minimal Iterator Relation | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Recursion.iterator_relation` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `lem:iterator-relation-consistency` — Consistency of the Minimal Iterator Relation | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Recursion.iterator_relation` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `lem:forced-values-are-unique` — Forced Values Are Unique | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Recursion.forced_successor_values_are_unique` (0.60) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `lem:minimal-iterator-relation-deterministic` — Determinism of the Minimal Iterator Relation | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Recursion.iterator_relation` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `lem:minimal-iterator-relation-complete` — Completeness of the Minimal Iterator Relation | Markdown: none | Lean: `LRA.VolumeII.PeanoSystems.Recursion.iterator_relation` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `thm:peano-iterator-theorem` — Peano Iterator Theorem | Markdown: `gpt-01-natural-numbers:p-2-peano-iterator-theorem` (1.00) | Lean: `LRA.VolumeII.PeanoSystems.Recursion.peano_iterator_theorem` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/peano-systems/notes/recursion-on-peano-systems/notes-recursion-on-peano-systems.tex`
- `def:whole-numbers` — Whole Numbers | Markdown: `gpt-01b-whole-numbers:1-1-whole-numbers` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/definition-of-whole-numbers/notes-definition-of-whole-numbers.tex`
- `def:addition-on-w` — Addition on $\mathbb{W}$ | Markdown: `gpt-01b-whole-numbers:3-1-addition-on` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/extending-addition/notes-extending-addition.tex`
- `def:multiplication-on-w` — Multiplication on $\mathbb{W}$ | Markdown: `gpt-01b-whole-numbers:4-1-multiplication-on` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/extending-multiplication/notes-extending-multiplication.tex`
- `def:successor-on-w` — Successor on $\mathbb{W}$ | Markdown: `gpt-01b-whole-numbers:2-1-successor-on` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/extending-successor/notes-extending-successor.tex`
- `thm:zero-is-not-successor-in-w` — $0$ Is Not a Successor in $\mathbb{W}$ | Markdown: none | Lean: `LRA.VolumeII.WholeNumbers.Construction.zero_is_not_successor` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/extending-successor/notes-extending-successor.tex`
- `thm:successor-on-w-injective` — Successor on $\mathbb{W}$ Is Injective | Markdown: none | Lean: `LRA.VolumeII.WholeNumbers.Construction.successor_is_injective` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/extending-successor/notes-extending-successor.tex`
- `def:order-on-w` — Order on $\mathbb{W}$ | Markdown: `gpt-01b-whole-numbers:5-1-order-on` (1.00) | Lean: none | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/order-on-w/notes-order-on-w.tex`
- `thm:well-ordering-principle-for-w` — Well-Ordering Principle for $\mathbb{W}$ | Markdown: none | Lean: `LRA.VolumeII.WholeNumbers.Construction.well_ordering` (1.00) | Volume file: `volume-ii/book-discrete-algebraic/whole-numbers/notes/order-on-w/notes-order-on-w.tex`

## Interpretation

- `lra-volume-ii` remains more granular than the current number-system Markdown package.
- A missing fuzzy match may still be covered by a broader Lean interface or theorem bundle.
- Exact coverage should be established by adding stable Volume II labels to Markdown blocks and Lean declaration metadata.
