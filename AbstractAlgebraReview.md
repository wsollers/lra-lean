# LRA Abstract Algebra Review

## Scope

Maintained mathematical review of the reference abstract-algebra definitions under `LRA.Algebra.AbstractAlgebra` and their relationship to the canonical `LRA.Operation` / `LRA.AlgebraicStructures` law-certificate hierarchy.

Project-wide rules apply: `sorry` proof bodies are neutral; genuine definition defects and missing law hypotheses are not.

---

# Files reviewed

- `LRA/Algebra.lean`
- `LRA/Algebra/AbstractAlgebra.lean`
- `LRA/Algebra/AbstractAlgebra/Definition/Structures.lean`
- `LRA/Operation/Laws.lean`
- `LRA/Operation/Laws/Associative/Definition.lean`
- `LRA/Operation/Laws/Identity/Definition.lean`
- `LRA/Operation/Theorems.lean`
- `LRA/AlgebraicStructures.lean`
- `LRA/AlgebraicStructures/Field/Definition.lean`
- `LRA/AlgebraicStructures/Field/Laws/Definition.lean`
- `LRA/AlgebraicStructures/DivisionRing/Laws/Definition.lean`
- `LRA/AlgebraicStructures/NontrivialRing/Laws/Definition.lean`
- `LRA/UniversalAlgebra/Algebra/Definition.lean`

---

# Semigroup / monoid / group / ring reference records

The reference records are mathematically conventional:

- semigroup = associative binary operation;
- monoid = semigroup + two-sided identity;
- group = monoid + a chosen left inverse for every element;
- ring = abelian additive group + unital associative multiplication + both distributive laws.

The economical one-sided inverse/additive-inverse axioms are sufficient because the surrounding monoid/abelian-group laws derive the other side.

**Verdict: PASS as reference definitions.**

---

# P1 defect confined to the duplicate reference `FieldDefinition`

`LRA.Algebra.AbstractAlgebra.Definition.FieldDefinition` extends the reference ring with commutative multiplication and inverses for nonzero elements but omits

```text
0 != 1.
```

Hence the trivial one-element ring satisfies that reference record.

This is not the standard definition of a field.

## Important scope correction

The repository's **canonical** algebraic-structures layer does not have this defect.

`LRA.AlgebraicStructures.FieldLaws` is defined as

```text
DivisionRingLaws R, MultiplicativeCommutativeLaws R
```

and `DivisionRingLaws` explicitly includes `NontrivialityLaw R`. That law states

```text
1 != 0.
```

Therefore the actual machine/certificate field hierarchy correctly excludes the zero ring.

**Revised severity:** **P1 DUPLICATE REFERENCE-LAYER DEFECT**, not a defect in the canonical algebraic foundation.

### Repair

Either:

1. add `zero_ne_one` to the reference `FieldDefinition`; or preferably
2. define/derive the reference record from the canonical `FieldLaws` certificate so the two layers cannot drift.

---

# Canonical operation-law ownership is strong

`LRA.Operation.Laws` already owns independent law families including:

- associativity;
- commutativity;
- identity;
- inverse;
- distributivity;
- cancellation;
- closure;
- absorption/idempotence/etc.

Representative definitions have exactly the desired Landau-style form, e.g.

```text
Associative op := forall a b c, (a op b) op c = a op (b op c)
```

and

```text
TwoSidedIdentity op e := LeftIdentity op e and RightIdentity op e.
```

The theorem layer already proves transfer facts such as associativity/identity/inverses for endomap composition and pointwise lifting.

**Verdict: PASS — this should remain the canonical law owner.**

---

# Canonical `LRA.AlgebraicStructures` architecture is the right structure layer

The current aggregate explicitly follows the intended machine/certificate/bundle design:

```text
operations supplied by Lean classes
        +
small named Prop law certificates
        ->
named algebraic structure law bundles
```

It includes semigroup, monoid, group, ring, nontrivial ring, integral domain, division ring, field, ordered structures, lattices, and Mathlib bridges/adapters.

This is substantially richer and more appropriate than the later orientation-only `AbstractAlgebra` records.

Recommended ownership rule:

> `LRA.Operation` owns individual laws; `LRA.AlgebraicStructures` owns named combinations/certificates; `LRA.UniversalAlgebra` owns signatures, models, equations, homomorphisms, products, quotients, and free/universal constructions; `LRA.Algebra.AbstractAlgebra` should be a thin pedagogical facade or be retired.

---

# Universal algebra relationship

The universal-algebra core is conceptually sound:

- algebraic signatures are first-order signatures with no relation symbols;
- the term algebra has terms as its domain and formal application as operations;
- term evaluation is the canonical map out of the term algebra.

The `Classical.choice` used to obtain one variable from `[Nonempty Variable]` is ordinary single-witness extraction, not family-wise mathematical AC.

Universal algebra should not replace the named operation-law layer; instead, equations such as associativity and distributivity can later be represented semantically/syntactically there and connected by satisfaction theorems.

---

# `AlgebraicStructureDefinition` is mis-modeled for its name

Current shape:

```text
structure AlgebraicStructureDefinition where
  Carrier : Type
  structureData : Carrier -> Prop
```

A unary predicate on elements does not package algebraic operations and laws and cannot distinguish different algebra structures on the same carrier.

Because the canonical `LRA.AlgebraicStructures` machinery already exists, the cleanest fix is probably to remove or rename this wrapper rather than invent another generic packaging mechanism.

**Severity: P1 MODELING/NAMING ISSUE.**

---

# Recommended certification pattern

For every named structure, preserve theorem-level statements of its exact requirements:

```text
SemigroupLaws op
  iff associative op

MonoidLaws op e
  iff associative op and two-sided-identity op e

GroupLaws op e inv
  iff monoid laws and inverse laws

RingLaws (+,*,0,1,-)
  iff additive-group laws
      and multiplicative-monoid laws
      and left/right distributivity

FieldLaws
  iff commutative-ring laws
      and 1 != 0
      and nonzero inverse laws.
```

The canonical certificate hierarchy is already close to this design; continue adding characterizations rather than creating duplicate bundled structures.

---

# Examples and failure modes

High-value examples:

- `Nat` under addition: commutative monoid, not group;
- `Int` under addition: abelian group;
- `Int` with `+` and `*`: commutative ring, not field;
- `Rat` / `Real`: fields;
- matrices: rings, generally noncommutative;
- functions `X -> R`: pointwise algebraic structures inherited from `R`.

High-value separators:

- associative need not imply identity;
- monoid need not imply inverses;
- group need not be commutative;
- ring need not be commutative;
- commutative ring need not be an integral domain;
- integral domain need not be a field;
- the trivial ring demonstrates why field nontriviality is necessary.

---

# Choice audit

No genuine family-wise Choice dependency is inherent in these operation/algebraic-structure definitions.

The universal-algebra term-algebra witness extraction from `[Nonempty Variable]` is not a substantive AC use.

Basis-existence Choice belongs to linear algebra and remains audited separately.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Canonical operation-law families | **PASS — STRONG OWNER** |
| Canonical algebraic-structure certificates | **PASS — STRONG OWNER** |
| Canonical field nontriviality | **PASS (`1 != 0` explicit)** |
| Reference semigroup/monoid/group/ring records | **PASS** |
| Reference `FieldDefinition` | **P1 DUPLICATE DEFECT — omits nontriviality** |
| `AlgebraicStructureDefinition` wrapper | **P1 MIS-MODELED / MISNAMED** |
| Universal-algebra signature/term-algebra core | **PASS** |
| Mathlib bridge in canonical structure layer | **PRESENT** |
| Choice usage | **NO GENUINE AC FOUND IN THIS CHUNK** |

---

# Immediate implementation order

1. make `LRA.Operation` + `LRA.AlgebraicStructures` explicitly canonical in ownership docs;
2. fix or replace the duplicate reference `FieldDefinition` using canonical `FieldLaws`;
3. remove/rename `AlgebraicStructureDefinition` unless a real use is specified;
4. expand characterization theorems saying exactly what laws certify each named structure;
5. continue concrete number-system certification against those canonical bundles;
6. keep universal algebra focused on signatures/equations/homomorphisms/free constructions rather than duplicating named algebraic laws.
