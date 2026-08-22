# LRA Function Review

## Scope

Maintained mathematical review of `LRA.Function`, especially the arrow/graph architecture, composition/inverses, image/preimage calculus, and the theorem surface needed later for measurable maps.

Project-wide rules apply: `sorry` is neutral scaffolding; genuine mathematical Choice is distinguished from proof-assistant witness extraction.

---

# Review 1 — arrow functions, composition, inverses, and image/preimage calculus

## Files reviewed

- `LRA/Function/Definition.lean`
- `LRA/Function/Properties/Definition.lean`
- `LRA/Function/Operations/Composition/Definition.lean`
- `LRA/Function/Operations/Composition/Theorems.lean`
- `LRA/Function/Operations/Composition/FailureModes.lean`
- `LRA/Function/Operations/Inverse/Definition.lean`
- `LRA/Function/Operations/Inverse/Theorems.lean`
- `LRA/Function/Calculus.lean`
- `LRA/Function/Calculus/Classes/Definition.lean`
- `LRA/Function/Calculus/Classes/Theorems.lean`
- dependency: `LRA/Set/Interface/RelationLaws.lean`

## Function presentation

The public function presentation is the Lean arrow `Domain -> Codomain`. Its graph is a heterogeneous relation and supplies the bridge to generic relation theory.

This is a good architecture: computational functions remain ordinary arrows, while set-theoretic function encodings are isolated under `LRA.Function.SetTheoretic`.

`SingleValued`, `Total`, `Injective`, and `Surjective` are correctly inherited from graph-relation properties.

**Verdict: PASS.**

## Composition

Composition is the standard `outer (inner x)` operation. Identity laws, associativity, preservation of injectivity/surjectivity/bijectivity, and the one-way converse implications

- injective composite => inner injective;
- surjective composite => outer surjective

are all correct.

The failure-mode predicates correctly record that the omitted converse implications fail in general.

**Verdict: PASS.**

## Inverses

Left, right, and two-sided inverse definitions have the standard orientations.

The theorem family is correct:

- two-sided inverse => bijective;
- left inverse => injective;
- right inverse => surjective;
- two-sided inverse is unique;
- inverse of a composite reverses order;
- preimage under a bijection agrees with image under its inverse.

### Choice classification

The source remarks that constructing an inverse arrow from bijectivity would require a choice principle. This needs qualification.

Mathematically, a bijection has a **uniquely determined** inverse; ordinary set theory does not require the Axiom of Choice to prove that a bijection has an inverse function. Lean may use `Classical.choose` to extract the unique witness from a `Prop`-valued existential, but this should be classified as proof-assistant witness extraction / unique choice, not as the same family-wise AC dependency used to choose unrelated witnesses from arbitrary fibers.

**Choice classification: NOT GENUINE FAMILY-WISE AC MATHEMATICALLY.**

---

# Image/preimage architecture

`ImageClass`, `PreimageClass`, and `FiberClass` specialize the generic relation calculus to `Graph function` rather than redefining the concepts.

This is excellent ownership and is directly reusable for measurable-map theory.

The relation-level layer already proves the laws that do not require functionality:

- image of union;
- image of empty;
- image monotonicity;
- image of arbitrary/countable union;
- preimage of union;
- preimage of empty;
- preimage monotonicity;
- preimage of arbitrary/countable union;
- image/preimage under composition;
- identity image/preimage.

The function layer then adds the genuinely functional laws:

- preimage commutes with intersection;
- difference;
- complement;
- symmetric difference;
- arbitrary/countable intersection;
- preimage of the universal class is universal;
- image-preimage adjunction;
- injectivity upgrades image-intersection/difference laws to equalities;
- surjectivity/injectivity recover target/source from image/preimage.

This decomposition is mathematically very good.

---

# P0 — image of an arbitrary indexed intersection under an injective function

Current theorem:

```lean
theorem ImageClassIndexedIntersectionOfInjective {Index : Type w}
    (injective : Injective function) (family : Index -> SetClass Domain) :
    ImageClass function (fun input => forall index, family index input) =
      (fun output => forall index, ImageClass function (family index) output)
```

is false when `Index` is empty and `function` is injective but not surjective.

For an empty index type:

- the left intersection is the universal source class, so its image is `RangeClass function`;
- the right empty intersection is the universal codomain class.

These are equal iff the function is surjective.

## Required correction

Use one of:

1. require `[Nonempty Index]` / an explicit `Nonempty Index` hypothesis;
2. restrict the theorem to a nonempty family;
3. strengthen the function hypothesis to bijective if the empty-index case is intended.

The `Nat`-indexed countable-intersection theorem does not have this defect because `Nat` is nonempty.

**Severity: P0 — FALSE THEOREM STATEMENT.**

---

# Measurable-map reuse plan

The future measurable-map layer should build directly on this function/set calculus:

```text
Measurable f :=
  forall measurable target set B,
    PreimageClass f B is measurable.
```

Then the first theorems should follow from the already-existing preimage laws:

- identity measurable;
- composition measurable, using `PreimageOfCompositionOf` / the class-level specialization;
- constant maps measurable;
- inverse image of complement is complement;
- inverse image of countable union is countable union;
- hence inverse image of every sigma-algebra-generated expression remains measurable.

This avoids a duplicate preimage implementation in MeasureTheory.

---

# Choice audit

No new genuine family-wise AC dependency was identified in this chunk.

`BijectiveHasTwoSidedInverse` may require Lean-level classical witness extraction to construct an arrow from Prop-level existence, but mathematically the inverse is unique and this is not an independent use of the Axiom of Choice.

---

# Final verdict

| Dimension | Verdict |
|---|---|
| Arrow/graph architecture | **PASS** |
| Composition | **PASS** |
| Inverse definitions/theorems | **PASS** |
| Image/preimage ownership | **PASS — STRONG** |
| Boolean/countable preimage laws | **PASS** |
| `ImageClassIndexedIntersectionOfInjective` | **P0 FALSE FOR EMPTY INDEX TYPE** |
| Choice usage | **NO NEW GENUINE AC IDENTIFIED** |
| Readiness to support measurable maps | **STRONG DEPENDENCY LAYER; MEASURETHEORY BRIDGE STILL MISSING** |

---

# Next review chunk

Review remaining function structures/set-theoretic bridge and then use this established calculus to design/review the missing measurable-map layer without duplicating image/preimage semantics.
