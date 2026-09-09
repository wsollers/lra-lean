# Identity IECE Architecture And Migration Analysis

## Status And Scope

This document records the IECE architecture, the first implementation pass
completed on 2026-09-07, and the public-model consolidation completed on
2026-09-09. It is based on direct inspection of the Lean sources, not
`ProofsToDo.md`.

The reorganization is now buildable. Generic identity declarations are owned
by `Interface`, logical and model levels have explicit routes, construction
certificates remain under `Constructions`, derived results remain under
`Laws`, and cross-provider conversions remain under `Interop`. Ordinary
model-relative laws now use `LRA.Identity.IdentityModel`; FOL, Henkin SOL, and
full SOL feed that boundary through named adapters. Proof bodies introduced by
the original migration remain intentionally `sorry` by project-owner direction.

IECE means four related but non-identical notions:

- **Identity**: sameness or indiscernibility at the level currently under
  discussion.
- **Equality**: the equality relation or equality-forming expression supplied
  by a formal system.
- **Congruence**: preservation of a relation by the relevant constructors,
  functions, operations, or contexts.
- **Equivalence**: reflexivity, symmetry, and transitivity, without by itself
  asserting indiscernibility or compatibility with operations.

The logical levels in scope are syntactic, propositional (`ZOL`), first-order
(`FOL`), second-order with Henkin semantics, and second-order with full
semantics.

## Architectural Rule

Logical level and construction are independent dimensions.

```text
ordinary identity law
        ↓ depends only on
IdentityModel
        ↑ named forgetful adapter
FOL model | Henkin SOL model | full SOL model | concrete construction
```

`Axiomatic` and `Mathlib` are constructions/providers. `FOL`, Henkin `SOL`,
and full `SOL` are interfaces or semantic targets. A single construction may
satisfy several targets, so the logical levels must not be represented as
competing top-level implementations or as multiple globally active
`IdentityRelation` instances.

`IdentityModel` is the ordinary theorem boundary, not another logical level.
It is the smallest certified reduct shared by the logical presentations and
concrete constructions: a carrier, identity relation, admissibility policy,
identity theory, and admissibility of both identity fibers. A theorem whose
proof needs only those fields belongs in `Laws/Model.lean` and must not mention
how the model was obtained.

The canonical public interface routes are now deliberately uniform:

```text
Interface/
├── Model.lean
├── ZeroOrder/{LStructure,Model,Theory}.lean
├── FirstOrder/{LStructure,Model,Theory,Adapter}.lean
└── SecondOrder/{LStructure,Model,Theory,Adapter}.lean
```

For second order, `Model.lean` exposes both `HenkinModel` and `FullModel`, and
`Theory.lean` exposes the corresponding `HenkinTheory` and `FullTheory`.
`FirstOrder/Adapter.lean` and `SecondOrder/Adapter.lean` own the forgetful
conversions to `IdentityModel`. Formula definability and Henkin predicate-domain
membership are discharged or supplied at those boundaries rather than repeated
in ordinary law files.
Legacy `Interface/Logic/{ZOL,FOL,SOL}` and `Interface/ModelTheory/**` paths are
compatibility or lower-level vocabulary routes; they are not the canonical
three-level public topology.

The ownership boundary is strict:

- `Interface/**` declares generic language structures, models, theories, and
  named forgetful adapters between its own model levels.
- `Laws/**` contains only construction-independent consequences and the
  relationships between logical levels. It never imports a construction.
- `Constructions/<Provider>/Axioms/**` owns provider assumptions plus only
  definitions and immediate theorems belonging to those assumptions.
- `Constructions/<Provider>/Laws/**` mirrors the public law surface—
  reflexivity, symmetry, transitivity, both Leibniz directions, the Leibniz
  biconditional, equivalence, congruence, and logical-level relationships.
- `Constructions/<Provider>/Satisfies/{ZeroOrder,FirstOrder,SecondOrder}.lean`
  packages the provider as a witness of the corresponding generic interface.
- `Interop/**` owns cross-provider conversions and scoped provider selection;
  it does not own forgetful conversion between identity-owned model levels.

`Laws/ModelTheory.lean` is retained only as a compatibility route. Diagonal
results are generic identity laws, while functions that package a relation as
an exposed model structure live with `Interface/ModelTheory/Model.lean`.

First-order identity is not treated as unrestricted quantification over Lean
predicates. Its Leibniz axiom is restricted to predicates formula-definable in
the selected interpretation. Full SOL quantifies over every predicate; Henkin
SOL quantifies over its selected predicate domain. Consequently, reverse or
cross-level implications are stated only with the required definability,
separation, or all-predicates hypothesis.

## Two Kinds Of Selection

Identity has two selection mechanisms, and they serve different APIs.

| Mechanism | Use | Selection point | Must remain hidden from |
|---|---|---|---|
| Scoped `IdentityRelation` provider | Generic notation and lightweight statements using `Ident x y` | `open scoped LRA.Identity.Interop.Providers.<Provider>` | Other provider scopes and global instance search |
| Explicit `IdentityModel` value | Substantial model-relative laws and developments | A section variable, theorem parameter, or named construction adapter | Ordinary proofs after the model has been selected |

A scoped provider is appropriate when the API is intentionally typeclass-shaped:

```lean
section

open LRA.Identity
open scoped LRA.Identity.Interop.Providers.Mathlib

example {Carrier : Type} {x y : Carrier} (h : Ident x y) : Ident y x :=
  LRA.Identity.Examples.ProviderSwitching.ProviderIdentitySymmetric Carrier h

end
```

An explicit model is the default for reusable model-relative mathematics:

```lean
section

variable (M : LRA.Identity.IdentityModel)
variable {x y : M.Carrier}

example (h : M.Identity x y) : M.Identity y x :=
  M.IdentitySymmetric h

end
```

The model itself may be selected with
`FirstOrder.Model.ToIdentityModel`,
`SecondOrder.HenkinModel.ToIdentityModel`,
`SecondOrder.FullModel.ToIdentityModel`,
`Constructions.Mathlib.NativeIdentityModel`, or
`Constructions.Axiomatic.AxiomaticIdentityModel`. The first-order definability
witness and Henkin fiber-membership witnesses appear only while constructing
that value. They are not parameters of `IdentityModel.IdentitySymmetric` or of
other ordinary model laws.

`Interop.Providers.Default` is a fixed convenience provider backed by native
Lean equality. It is not a dynamically rebindable project variable. Code that
must survive a change of construction quantifies over `IdentityModel` or opens
one provider scope locally; it does not attempt to mutate a global default.

Model selection itself must not be installed as a global instance. Multiple
FOL, Henkin, or full models can legitimately share a carrier, so global model
instances would create ambiguity and make imports change theorem meaning.

## What The Current Code Gets Right

1. `LRA/Identity.lean` retains the four necessary aggregate surfaces:
   `Constructions`, `Interface`, `Laws`, and `Interop`.
2. Generic consequences are grouped under `LRA/Identity/Laws/`, including
   primitive identity results, equality, equivalence, congruence,
   distinctness, witnesses, model theory, and universal algebra.
3. Concrete providers are already separated as
   `Constructions/Axiomatic` and `Constructions/Mathlib`.
4. Provider selection is scoped and re-exported through `Interop/Providers`,
   avoiding unconditional global instance conflicts.
5. `Interface/Model.lean` supplies one construction-independent
   `IdentityModel` boundary for ordinary laws, while model-specific conversion
   obligations live in `FirstOrder/Adapter.lean` and
   `SecondOrder/Adapter.lean`.
6. The FOL syntax surface already contains equality and inequality atoms, and
   the generic model-theory library already distinguishes first-order models,
   Henkin second-order models, and full second-order models.
7. The universal-algebra surface correctly treats congruence as a generic
   equivalence relation compatible with operations, then proves identity to be
   a congruence.

These parts should be preserved and refined rather than replaced.

## Pre-migration Defects And Their Disposition

The numbered findings below motivated the migration. Each now has a Lean-level
resolution; proof bodies remain intentionally `sorry`.

### 1. The generic interface is owned by a construction

Before the migration, `Interface/Identity.lean` imported
`Constructions/Axiomatic/Axioms/SecondOrderLeibniz/Definitions.lean`. That
construction file owned all of the following generic declarations:

- `IdentityRelation`
- `IdentityTheory`
- `FullLeibniz`
- `IsIdentityRelation`

That inversion has been removed. The old construction paths are compatibility
routers, and forbidden-import checks find no `Interface/**` or `Laws/**`
import of `Constructions/**`.

### 2. The advertised logical levels were not actually distinct

The original `IdentityTheory Admissible R` was a useful level-parametric
kernel, but its placement and names obscured that fact:

- `FullLeibniz Carrier := fun _ => True` quantifies over every Lean predicate
  on the carrier. This is a full second-order or ambient type-theoretic
  principle, not a neutral definition of identity at every level.
- `FirstOrderLeibnizAxiom Admissible R` also quantifies at the Lean meta-level
  over predicates `Carrier → Prop`. It becomes genuinely first-order only if
  `Admissible P` is tied to a formula, parameters, an interpretation, and a
  proof that `P` is the formula's definable extension.
- `Interface/Logic/SecondOrder.lean` is only a forwarding import. It does not
  define a second-order language, formula, theory, or satisfaction surface for
  identity.
- There is no identity-owned propositional surface.
- The syntactic surface contains convenient FOL atom constructors but no
  explicit account of syntactic identity, replacement in contexts, or the
  relationship between syntactic equality and semantic equality.

The migration adds `DefinesUnaryPredicate`, `FormulaDefinable`, and
`ModelIdentityTheory` for FOL; an explicit `LeibnizIdentityFormula` for SOL;
and model-indexed Henkin/full satisfaction predicates and theorems. Syntax and
ZOL have their own identity/equivalence surfaces without inventing ZOL object
equality.

The Axiomatic construction also retains genuinely separate assumptions at
these levels. `Ax_FirstOrderLeibnizLaw` is indexed by a selected FOL model and
its formula-definable predicates, while `Ax_LeibnizLaw` is the unrestricted
second-order principle. `SecondOrderLeibnizImpliesFirstOrderLeibniz` records
the implication from the stronger assumption without replacing the independent
FOL axiom.

### 3. Henkin and full second-order semantics are collapsed

Before migration, `EqualityStructure.toHenkinSecondOrderModel` was defined only
by converting a full model to a Henkin model, and therefore still had full
second-order semantics.

This supplies a valid full model viewed through the Henkin API, but it does not
supply a genuinely restricted Henkin model. The missing distinction is
mathematically important:

- under full semantics, Leibniz quantification ranges over every predicate and
  forces identity to be diagonal;
- under Henkin semantics, it ranges only over an admissible predicate domain,
  so Leibniz equivalence need not force diagonal equality unless that domain
  separates points.

The new `HenkinPredicateDomain`, `HenkinPredicatesSeparatePoints`, and
`ModelTheory.SOL.ToHenkinModel` interfaces expose genuinely selectable Henkin
domains. The ambiguous legacy conversion aliases have been removed.

### 4. Identity and equality are duplicated at one strength

Before migration, `IdentityRelation` and `EqualityRelation` contained parallel
relation, reflexivity, and unrestricted Leibniz fields.

This does not express two independently motivated IECE notions. Either:

- equality is the primitive formal relation and identity is its full
  indiscernibility characterization; or
- identity is the primitive generic interface and equality is a designated
  presentation proved equivalent to it at a stated level.

The implemented orientation treats `IdentityTheory` as the generic contract.
`EqualityRelation` now designates a relation and carries one certificate that
it satisfies that contract; equality-specific reflexivity and substitution are
derived laws rather than duplicated class fields.

### 5. Model-level satisfaction is mixed with generic conversion

`Interface/ModelTheory/Model.lean` now contains only generic, explicitly named
`ToFOLModel` and `ToSOLFullModel` conversions. Concrete canonical witnesses
live in `Constructions/Mathlib/Models.lean`; the old root witnesses and
ambiguous conversion names have been removed.

`Interface/ModelTheory/Theory.lean` now routes only to interface-owned FOL and
SOL theories.

### 6. Construction satisfaction is fragmented

Both constructions now expose an auditable `Satisfies/` matrix for generic,
FOL, Henkin-SOL, full-SOL, equality, and universal-algebra targets. Nested
axiom satisfaction modules remain construction-local implementation details;
in particular, the Axiomatic FOL certificate is derived from
`Ax_FirstOrderLeibnizLaw` plus reflexivity, independently of the SOL axiom.

Namespaces now use `LRA.Identity.Constructions.*`, matching the directory.

### 7. The previous audit is stale

`docs/foundations/14-identity-audit.md` describes an older `Definitions` and
`Theorems` layout and reports three unfinished proofs. Direct inspection of the
post-migration tree finds 131 `sorry` occurrences across 54 Lean files. New
proof-bearing declarations are intentionally stubbed. The old audit must not
be used as a current architectural or completion report.

## IECE By Logical Level

Not every cell denotes the same kind of object, and not every cell should
produce a typeclass instance.

| Level | Identity / equality | Equivalence | Congruence | Required distinction |
|---|---|---|---|---|
| Syntactic | Literal AST equality, alpha-equivalence where binders require it, and an equality-forming expression such as `t₁ = t₂` | A chosen syntactic equivalence or rewrite relation | Closure under syntax constructors, substitution, and one-hole contexts | Syntax is manipulated before any model supplies truth |
| Propositional (`ZOL`) | Formula identity is syntactic; there is no object-variable equality predicate in ordinary propositional logic | Logical equivalence means agreement under all valuations | Equivalent formulas remain equivalent under each connective/context | Do not manufacture object equality where the language has no objects |
| First-order (`FOL`) | Equality atoms between terms plus a declared semantic policy, normally diagonal equality | The equality predicate obeys equivalence laws; formulas or structures have their own separate equivalence notions | Functions and relations respect equality; syntactically this is an axiom/rule schema and semantically it follows from diagonal equality | Formula-definable substitution must replace the current ungrounded `Admissible` label |
| Second-order, Henkin | Leibniz quantification ranges over the model's admitted predicate domain | The induced Leibniz relation is an equivalence under suitable closure assumptions | Admitted relations, functions, and operations respect the induced relation when required by the theory | Diagonality requires a point-separation/comprehension hypothesis and is not automatic |
| Second-order, full | Leibniz quantification ranges over every predicate and therefore characterizes diagonal equality | Identity is consequently an equivalence relation | Every definable and ambient operation respects diagonal equality | Full semantics is stronger than a generic Henkin model, not merely another alias |

This table also prevents a common category error: propositional logical
equivalence, FOL object equality, Henkin indiscernibility, and full Leibniz
identity are related, but they are not interchangeable definitions living in
one undifferentiated class.

## Target Module Shape

The target keeps `Constructions`, `Laws`, and `Interop` and makes the logical
level explicit inside the generic interfaces and each construction's
satisfaction certificates.

```text
LRA/Identity.lean
LRA/Identity/
├── Interface.lean
├── Interface/
│   ├── Identity.lean
│   ├── Model.lean
│   ├── Equality.lean
│   ├── FirstOrder/
│   │   ├── LStructure.lean
│   │   ├── Model.lean
│   │   ├── Theory.lean
│   │   └── Adapter.lean
│   ├── SecondOrder/
│   │   ├── LStructure.lean
│   │   ├── Model.lean
│   │   ├── Theory.lean
│   │   └── Adapter.lean
│   ├── Syntax/
│   │   ├── Identity.lean
│   │   └── Congruence.lean
│   ├── Logic/
│   │   ├── ZOL/
│   │   │   ├── Equivalence.lean
│   │   │   └── Congruence.lean
│   │   ├── FOL/
│   │   │   ├── Language.lean
│   │   │   ├── Syntax.lean
│   │   │   └── Theory.lean
│   │   └── SOL/
│   │       ├── Language.lean
│   │       ├── Syntax.lean
│   │       └── Theory.lean
│   ├── ModelTheory/
│   │   ├── FOL/
│   │   │   ├── LStructure.lean
│   │   │   └── Model.lean
│   │   └── SOL/
│   │       ├── Henkin.lean
│   │       ├── Full.lean
│   │       └── Relationships.lean
│   └── UniversalAlgebra/
│       ├── Signature/Definition.lean
│       ├── Congruence.lean
│       ├── Extensionality.lean
│       └── Quotient.lean
├── Laws.lean
├── Laws/
│   ├── Identity.lean
│   ├── Model.lean
│   ├── Equality.lean
│   ├── Equivalence.lean
│   ├── Congruence.lean
│   ├── Distinctness.lean
│   ├── Witnesses.lean
│   ├── ModelTheory/
│   │   ├── FOL.lean
│   │   ├── SOLHenkin.lean
│   │   ├── SOLFull.lean
│   │   └── Relationships.lean
│   └── UniversalAlgebra.lean
├── Constructions.lean
├── Constructions/
│   ├── Axiomatic/
│   │   ├── Primitives.lean
│   │   ├── Model.lean
│   │   ├── Axioms/
│   │   ├── Laws/
│   │   └── Satisfies/
│   │       ├── Generic.lean
│   │       ├── FOL.lean
│   │       ├── SOLHenkin.lean
│   │       ├── SOLFull.lean
│   │       ├── Equality.lean
│   │       └── UniversalAlgebra.lean
│   └── Mathlib/
│       ├── Primitives.lean
│       ├── Model.lean
│       ├── Laws/
│       └── Satisfies/
│           ├── Generic.lean
│           ├── FOL.lean
│           ├── SOLHenkin.lean
│           ├── SOLFull.lean
│           ├── Equality.lean
│           └── UniversalAlgebra.lean
├── Interop.lean
└── Interop/
    ├── Adapters.lean
    ├── Providers/{Default,LRA,Mathlib}.lean
    └── Audit.lean
```

This is a target vocabulary, not a requirement to create empty files. A
construction gets only the satisfaction modules for which it supplies a real
certificate. The ZOL layer probably has no construction-level object-equality
certificate because ordinary propositional logic has no object domain.

## Lean Migration Requirements (Completed)

### Phase 1: Recover a construction-independent kernel

1. Move `IdentityTheory` and the generic relation-facing API out of
   `Constructions/Axiomatic/Axioms/Common.lean` into `Interface/Identity.lean`
   or a directly imported generic interface module.
2. Move `IdentityRelation`, `FullLeibniz`, and `IsIdentityRelation` out of
   `Axiomatic/Axioms/SecondOrderLeibniz/Definitions.lean`.
3. Parameterize the neutral kernel by an explicitly named admissibility policy;
   reserve `FullLeibniz` for the full predicate domain.
4. Remove every `Interface/** → Constructions/**` and
   `Laws/** → Constructions/**` import.

This phase should preserve declarations through temporary aliases where
necessary, but the authoritative owner must change before new logical levels
are added.

### Phase 2: Make the logical presentations genuine

1. **Syntactic:** define or reuse syntax equality, alpha-equivalence where
   relevant, contextual replacement, and constructor congruence. State bridges
   from equality atoms to the generic FOL syntax.
2. **ZOL:** reuse the existing propositional formula and logical-equivalence
   infrastructure. Add only identity-owned results explaining formula identity,
   logical equivalence, and connective congruence; do not invent an
   individual-equality predicate.
3. **FOL:** make the pure equality signature, equality atoms, equality theory,
   and models one coherent package. Replace the meta-level
   `FirstOrderLeibnizAxiom Admissible` label with an actual formula/rule schema
   or with an explicit definability bridge from formulas and assignments to
   admissible predicates.
4. **SOL:** define the identity theory over the repository's actual
   second-order syntax and satisfaction machinery instead of treating a Lean
   quantifier over predicates as the whole syntax layer.

### Phase 3: Separate Henkin and full semantics

1. Define a Henkin identity condition relative to a model's admitted predicate
   and, where needed, function/relation domains.
2. Define the point-separation or comprehension condition under which Henkin
   indiscernibility collapses to diagonal equality.
3. Keep unrestricted `FullLeibniz` as the full-semantics specialization.
4. Provide explicit forgetful and strengthening theorems:
   full model → Henkin model with full-domain certificate; suitably separating
   Henkin model → diagonal identity; and document that an arbitrary Henkin
   model does not receive the latter theorem.
5. Remove the unqualified `toSecondOrderModel` alias. Callers now use
   `EqualityStructure.ToSOLFullModel` for the canonical full model or
   `ModelTheory.SOL.ToHenkinModel` with explicit predicate, relation, and
   function domains for a genuine Henkin model.

### Phase 4: Clarify the IECE relationships

1. Choose whether `EqualityRelation` is a presentation of the generic identity
   contract or whether `IdentityRelation` is derived from a level-specific
   equality theory.
2. Eliminate the current field-for-field duplication between the two classes.
3. Keep equivalence and congruence generic and weaker. State upgrades as named
   theorems with hypotheses rather than inheritance that silently identifies
   the notions.
4. Split model-theoretic laws by level so theorem names and assumptions expose
   whether they use FOL diagonal semantics, Henkin separation, or full
   second-order comprehension.

### Phase 5: Normalize each construction's certificates

For both `Axiomatic` and `Mathlib`:

1. keep primitive data, axioms, and construction-specific proofs under the
   construction;
2. introduce a visible `Satisfies` aggregate;
3. provide named certificates for every supported generic target;
4. use scoped instances only for provider selection and use ordinary named
   theorems/structures for logical-level certificates;
5. move `canonicalEqualityStructure` and other concrete `Eq` witnesses from
   `Interface/ModelTheory` to `Constructions/Mathlib/Satisfies`;
6. expose a named `IdentityModel` value for construction-independent laws;
7. normalize the namespace to `LRA.Identity.Constructions.<Construction>`.

No compatibility aliases were added for the former singular
`LRA.Identity.Construction.*` namespace: direct repository search found no
current Lean consumers after downstream imports were updated. The obsolete
names remain only in the deliberately stale `ProofsToDo.md` snapshot.

The desired result is a construction-by-target audit matrix, not one instance
per logical level:

| Construction | Generic | FOL | SOL Henkin | SOL full | Equality | Universal algebra |
|---|---:|---:|---:|---:|---:|---:|
| Axiomatic | explicit certificate | explicit certificate | only if a genuine predicate domain is supplied | explicit only from the full Leibniz axiom | explicit bridge | derived certificate |
| Mathlib / Lean `Eq` | explicit certificate | canonical diagonal model | canonical full-domain model viewed as Henkin | canonical full model | canonical bridge | derived certificate |

### Phase 6: Preserve and tighten interop

1. Keep `Interop/Adapters`, `Interop/Providers`, and `Interop/Audit`.
2. Let provider modules re-export construction-owned scoped instances rather
   than reproving satisfaction.
3. Keep conversions between `Ident`, `Equal`, and Lean `Eq` in interop only
   when they specifically cross APIs; generic diagonal theorems remain in
   `Laws`.
4. Add import tests demonstrating that choosing the Axiomatic provider does not
   also activate Mathlib identity, and conversely.
5. Keep the project `Default` provider isolated and explicit; opening it is a
   local choice and never rebinds Axiomatic or Mathlib model values.

### Phase 7: Consolidate The Ordinary Model Boundary

1. Use `LRA.Identity.IdentityModel` for laws that need a carrier, identity
   relation, admissibility policy, identity theory, and admissible identity
   fibers but do not care about logical presentation.
2. Place ordinary consequences such as
   `IdentityModel.IdentitySymmetric` in `Laws/Model.lean`.
3. Keep FOL formula-definability proofs in the FOL semantic layer and consume
   them in `FirstOrder/Adapter.lean`.
4. Keep Henkin fiber-membership assumptions and full-SOL admissibility in
   `SecondOrder/Adapter.lean`.
5. Keep verbose construction and switching fixtures private under `test/`;
   production examples should demonstrate only the intended public surface.
6. Do not create FOL- and SOL-specific copies of every ordinary identity law.
   Thin wrappers are justified only when their logical provenance is itself
   part of the theorem being stated.

## Priority And Dependency Order

1. **P0 — ownership:** remove construction imports from interfaces and generic
   laws.
2. **P0 — semantic honesty:** stop calling unrestricted meta-level predicate
   quantification FOL and stop presenting a full-derived model as the general
   Henkin case.
3. **P1 — interfaces:** add the genuine syntactic, ZOL, FOL, SOL-Henkin, and
   SOL-full surfaces.
4. **P1 — IECE factorization:** remove Identity/Equality duplication and state
   level-specific equivalence/congruence relationships.
5. **P1 — construction certificates:** normalize Axiomatic and Mathlib
   `Satisfies` matrices.
6. **P2 — interop and compatibility:** normalize namespaces, aliases, provider
   tests, and downstream imports.
7. **P2 — proof completion:** retain `sorry` proof bodies until the project
   owner separately requests proof completion.

## Verification Gates

Each implementation phase should run:

1. a forbidden-import check confirming that `Interface/**` and subject-level
   `Laws/**` do not import `Constructions/**`;
2. `python scripts/validate_structure.py --path LRA/Identity`;
3. `lake build LRAIdentity`;
4. focused compilation tests for Axiomatic-only, Mathlib-only, FOL, SOL-Henkin,
   SOL-full, default-provider, and `IdentityModel` adapter imports;
5. a regenerated direct-source `sorry` inventory.

The Lean migration and public-model consolidation described by this document
have been performed. FOL identity is tied to formula-definable predicates in a
selected interpretation; SOL owns an explicit Leibniz formula with distinct
Henkin and full satisfaction layers; Identity/Equality is factored through one
generic contract; construction satisfaction matrices include generic, FOL,
Henkin-SOL, full-SOL, equality, and universal-algebra targets; and ordinary
model laws depend only on `IdentityModel`. Scoped providers and explicit model
selection are tested independently. Proof completion is intentionally outside
this migration.

As verified after the `IdentityModel` consolidation on 2026-09-09:

- `python scripts/validate_structure.py --path LRA/Identity` passes;
- native focused Identity builds and `lake build LRATests` pass;
- `build.ps1 docker-build` and the containerized `build.ps1 build-all` pass;
- no `Interface/**` or `Laws/**` module imports an Identity construction;
- no Lean source uses the retired `IdentityContext` or `ToIdentityContext`
  names;
- the FOL, Henkin, full-SOL, native, default, and axiomatic paths all prove the
  same symmetry result after selection; and
- the verbose cross-model construction fixture lives under `test/LRA/Identity`
  rather than the production example surface.
