# Identity Proof Roadmap

This file is organized for handwritten proof work rather than by Lean file order.
It focuses on the Identity layer: primitive setup first, then completed primitive
theorems, then richer notions that are the natural next targets.

Set-theory proofs are intentionally deferred here. The set layer should come after
the identity/equality/equivalence/congruence notes have a clean mathematical spine.

## Level 0. Axioms, Theory, and Definitions

This level is the foundation for the handwritten notes. It should be read in
mathematical order: first the primitive relation symbol, then the axioms governing
it, then the theory that packages those axioms, then the Lean definitions and
interfaces used to build reusable proofs.

### Axiom: `Ax_IdentityRelation`

- Role: primitive relation symbol for the axiomatic construction.
- Mathematical reading: for a carrier `C`, identity is introduced as a binary relation on `C`.
- Formal reading: `Ident_C : C × C → Prop`.
- Lean statement: `axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop`
- Source: [`Constructions/Axiomatic/Axioms/Common.lean#L43`](../LRA/Identity/Constructions/Axiomatic/Axioms/Common.lean#L43)

### Axiom: `Ax_IdentityReflexivity`

- Role: first axiom governing the primitive identity relation.
- Mathematical reading: every object is identical to itself.
- Formal reading: `∀ x : C, Ident_C(x, x)`.
- Lean statement: `axiom Ax_IdentityReflexivity {Carrier : Type u} (x : Carrier) : Ax_IdentityRelation x x`
- Source: [`Constructions/Axiomatic/Axioms/Reflexivity/Axiom.lean#L44`](../LRA/Identity/Constructions/Axiomatic/Axioms/Reflexivity/Axiom.lean#L44)

### Axiom: `Ax_LeibnizLaw`

- Role: second axiom governing the primitive identity relation.
- Mathematical reading: identical objects may be substituted in every predicate.
- Formal reading: `∀ x y : C, Ident_C(x, y) → ∀ P : C → Prop, P(x) → P(y)`.
- Lean statement: `axiom Ax_LeibnizLaw {Carrier : Type u} {x y : Carrier} (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) : Property x → Property y`
- Source: [`Constructions/Axiomatic/Axioms/SecondOrderLeibniz/Axiom.lean#L45`](../LRA/Identity/Constructions/Axiomatic/Axioms/SecondOrderLeibniz/Axiom.lean#L45)

### Theory: `IdentityTheory`

- Role: abstract package for an identity-like binary relation `R`.
- Mathematical reading: an identity theory consists of a relation together with reflexivity and Leibniz substitution principles.
- Lean statement: `structure IdentityTheory (Admissible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop) : Prop`
- Source: [`Interface/Identity.lean#L46`](../LRA/Identity/Interface/Identity.lean#L46)

### Definition: `FullLeibniz`

- Role: says every predicate is admissible for Leibniz substitution.
- Mathematical reading: this is the unrestricted, second-order Leibniz setting.
- Lean statement: `abbrev FullLeibniz (Carrier : Type u) : (Carrier → Prop) → Prop := fun _ => True`
- Source: [`Interface/Identity.lean#L90`](../LRA/Identity/Interface/Identity.lean#L90)

### Definition: `IdentityRelation`

- Role: reusable Lean interface for carriers equipped with identity.
- Mathematical reading: a carrier has a distinguished identity relation satisfying reflexivity and Leibniz substitution.
- Lean reading: this is a class/interface, not itself a theorem; it makes the primitive identity structure available to generic proofs.
- Lean statement: `class IdentityRelation (Carrier : Type u) where`
- Source: [`Interface/Identity.lean#L141`](../LRA/Identity/Interface/Identity.lean#L141)

### Definition: `IsIdentityRelation`

- Role: predicate saying that a binary relation satisfies the full identity theory.
- Mathematical reading: `R` is an identity relation iff it satisfies reflexivity and unrestricted Leibniz substitution.
- Lean statement: `abbrev IsIdentityRelation {Carrier : Type u} (R : Carrier → Carrier → Prop) : Prop := IdentityTheory (FullLeibniz Carrier) R`
- Source: [`Interface/Identity.lean#L187`](../LRA/Identity/Interface/Identity.lean#L187)

### Interpretation: `NativeIdentity`

- Role: Lean-native interpretation of identity.
- Mathematical reading: interprets the project identity relation by Lean's native equality.
- Lean statement: `abbrev NativeIdentity {Carrier : Type u} : Carrier -> Carrier -> Prop := Eq`
- Source: [`Constructions/Mathlib/Primitives.lean#L41`](../LRA/Identity/Constructions/Mathlib/Primitives.lean#L41)

## Level 1. Completed Primitive Theorems

These are the main generic mathematical theorems to translate into handwritten
proofs. They use the `IdentityRelation` interface and avoid construction-specific
wrappers.

### `IdentRfl`

- Theorem: `(x : Carrier) : Ident x x`
- Mathematical reading: identity is reflexive.
- Source: [`Laws/Identity.lean#L46`](../LRA/Identity/Laws/Identity.lean#L46)

### `IdentSymmetric`

- Theorem: `{x y : Carrier} (h : Ident x y) : Ident y x`
- Mathematical reading: identity is symmetric.
- Source: [`Laws/Identity.lean#L127`](../LRA/Identity/Laws/Identity.lean#L127)

### `IdentTransitive`

- Theorem: `{x y z : Carrier} (hxy : Ident x y) (hyz : Ident y z) : Ident x z`
- Mathematical reading: identity is transitive.
- Source: [`Laws/Identity.lean#L170`](../LRA/Identity/Laws/Identity.lean#L170)

### `IndiscernibilityOfIdenticals`

- Theorem: `{x y : Carrier} (h : Ident x y) : forall Property : Carrier -> Prop, Property x <-> Property y`
- Mathematical reading: identical objects have exactly the same properties.
- Source: [`Laws/Identity.lean#L214`](../LRA/Identity/Laws/Identity.lean#L214)

### `IdentityOfIndiscernibles`

- Theorem: `{x y : Carrier} (h : forall Property : Carrier -> Prop, Property x <-> Property y) : Ident x y`
- Mathematical reading: objects with exactly the same properties are identical.
- Source: [`Laws/Identity.lean#L268`](../LRA/Identity/Laws/Identity.lean#L268)

### `IdentLeibnizIff`

- Theorem: `{x y : Carrier} : Ident x y <-> forall Property : Carrier -> Prop, Property x <-> Property y`
- Mathematical reading: identity is equivalent to indiscernibility by all predicates.
- Source: [`Laws/Identity.lean#L314`](../LRA/Identity/Laws/Identity.lean#L314)

## Level 2. Richer Identity Notions

These are definitions rather than completed proof targets. They are the vocabulary
for uniqueness, distinctness, and cardinality-like assertions built out of identity.

### `Distinct`

- Definition: `def Distinct (left right : Carrier) : Prop := ¬ Ident left right`
- Mathematical reading: `left` and `right` are distinct iff they are not identical.
- Source: [`Laws/Distinctness.lean#L46`](../LRA/Identity/Laws/Distinctness.lean#L46)

### `AtLeastTwo`

- Definition: `def AtLeastTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop := ∃ x y : Carrier, Distinct x y`
- Mathematical reading: a carrier has at least two objects iff it has two distinct objects.
- Source: [`Laws/Distinctness.lean#L86`](../LRA/Identity/Laws/Distinctness.lean#L86)

### `AtMostTwo`

- Definition: `def AtMostTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop := ∀ x y z : Carrier, Ident x y ∨ Ident y z ∨ Ident x z`
- Mathematical reading: among any three objects, at least two are identical.
- Source: [`Laws/Distinctness.lean#L126`](../LRA/Identity/Laws/Distinctness.lean#L126)

### `HasWitness`

- Definition: `def HasWitness {Carrier : Type u} (P : Carrier → Prop) : Prop := ∃ x, P x`
- Mathematical reading: predicate `P` has at least one witness.
- Source: [`Laws/Witnesses.lean#L44`](../LRA/Identity/Laws/Witnesses.lean#L44)

### `HasNoWitness`

- Definition: `def HasNoWitness {Carrier : Type u} (P : Carrier → Prop) : Prop := ¬ HasWitness P`
- Mathematical reading: predicate `P` has no witness.
- Source: [`Laws/Witnesses.lean#L84`](../LRA/Identity/Laws/Witnesses.lean#L84)

### `AtMostOne`

- Definition: `def AtMostOne (P : Carrier → Prop) : Prop := ∀ left right, P left → P right → Ident left right`
- Mathematical reading: any two witnesses of `P` are identical.
- Source: [`Laws/Witnesses.lean#L128`](../LRA/Identity/Laws/Witnesses.lean#L128)

### `NotAtMostOne`

- Definition: `def NotAtMostOne (P : Carrier → Prop) : Prop := ∃ left right, P left ∧ P right ∧ Distinct left right`
- Mathematical reading: `P` has two distinct witnesses.
- Source: [`Laws/Witnesses.lean#L168`](../LRA/Identity/Laws/Witnesses.lean#L168)

### `ExactlyOne`

- Definition: `def ExactlyOne (P : Carrier → Prop) : Prop := HasWitness P ∧ AtMostOne P`
- Mathematical reading: `P` has a witness, and all witnesses of `P` are identical.
- Source: [`Laws/Witnesses.lean#L208`](../LRA/Identity/Laws/Witnesses.lean#L208)

## Level 3. Next Rich Theorem Targets

These are mathematically natural next steps, but their Lean files currently still
contain `sorry`, so they are not listed as completed proofs.

### `DistinctIrreflexive`

- Target theorem: `(x : Carrier) : ¬ Distinct x x`
- Mathematical reading: no object is distinct from itself.
- Source: [`Laws/Distinctness.lean#L165`](../LRA/Identity/Laws/Distinctness.lean#L165)

### `DistinctSymmetric`

- Target theorem: `{x y : Carrier} (h : Distinct x y) : Distinct y x`
- Mathematical reading: distinctness is symmetric.
- Source: [`Laws/Distinctness.lean#L204`](../LRA/Identity/Laws/Distinctness.lean#L204)

### `HasNoWitnessNotHasWitness`

- Target theorem: `{Carrier : Type u} {P : Carrier → Prop} (h : HasNoWitness P) : ¬ HasWitness P`
- Mathematical reading: if `P` has no witness, then it does not have a witness.
- Source: [`Laws/Witnesses.lean#L250`](../LRA/Identity/Laws/Witnesses.lean#L250)

### `ExactlyOneNotAtLeastTwoWitnesses`

- Target theorem: `{Carrier : Type u} [IdentityRelation Carrier] {P : Carrier → Prop} (h : ExactlyOne P) : ¬ NotAtMostOne P`
- Mathematical reading: if `P` has exactly one witness, then it cannot have two distinct witnesses.
- Source: [`Laws/Witnesses.lean#L291`](../LRA/Identity/Laws/Witnesses.lean#L291)

### `IdentIsEquivalenceRelation`

- Target theorem: `{Carrier : Type u} [IdentityRelation Carrier] : IsEquivalenceRelation (Ident : Carrier → Carrier → Prop)`
- Mathematical reading: identity is an equivalence relation.
- Source: [`Laws/Equivalence.lean#L47`](../LRA/Identity/Laws/Equivalence.lean#L47)

### `IdentPreservesFunctions`

- Target theorem: `{Codomain : Type u} [IdentityRelation Codomain] {f g : Domain → Codomain} (h : ∀ x, Ident (f x) (g x)) : Ident f g`
- Mathematical reading: pointwise identical functions are identical.
- Source: [`Laws/Congruence.lean#L47`](../LRA/Identity/Laws/Congruence.lean#L47)

### `IdentPreservesRelations`

- Target theorem: `{x x' y y' : Carrier} (hx : Ident x x') (hy : Ident y y') (hR : R x y) : R x' y'`
- Mathematical reading: identity preserves relation instances.
- Source: [`Laws/Congruence.lean#L90`](../LRA/Identity/Laws/Congruence.lean#L90)

### `IdentPreservesOperations`

- Target theorem: `{x x' y y' : Carrier} (hx : Ident x x') (hy : Ident y y') : Ident (op x y) (op x' y')`
- Mathematical reading: identity preserves operation outputs.
- Source: [`Laws/Congruence.lean#L133`](../LRA/Identity/Laws/Congruence.lean#L133)

### `IdentIsCongruence`

- Target theorem: `{signature : AlgebraicSignature} (structure_ : AlgebraicStructure signature) [IdentityRelation structure_.Carrier] : IsCongruence structure_ Ident`
- Mathematical reading: identity is a congruence relation on an algebraic structure.
- Source: [`Laws/UniversalAlgebra.lean#L49`](../LRA/Identity/Laws/UniversalAlgebra.lean#L49)


## Method Used To Build This Roadmap

The roadmap was produced by treating the Lean files as a formal proof inventory,
then reorganizing that inventory around the order in which a mathematician would
write the notes by hand.

### Reference Frame

- Tarski, *Introduction to Logic and to the Methodology of the Deductive Sciences*, Chapter III, "On the Theory of Identity". This is the guiding reference for beginning with identity before set theory, and for treating identity through reflexivity, substitution/Leibniz law, indiscernibility, and identity of indiscernibles.
  - Reference link: [Oxford Academic chapter page](https://academic.oup.com/book/54929/chapter/422750750)
  - User-provided working PDF link: [Google Drive](https://drive.google.com/file/d/1o98AJ7PAh5KMmiSim79q_dmaxvEVYQb9/view?usp=sharing)

- Bourbaki, *Elements of Mathematics: Theory of Sets*. This is the guiding reference for the next phase, especially the transition from formal logic and equality into set-theoretic notions such as membership, extensionality, empty set, pairing, and the early set constructions.
  - Reference link: [Internet Archive PDF](https://ia801500.us.archive.org/31/items/in.ernet.dli.2015.141676/2015.141676.Elements-Of-Mathematics-Theory-Of-Sets.pdf)
  - Supplemental bibliographic/table-of-contents check: [ProofWiki book page](https://proofwiki.org/wiki/Book%3ANicolas_Bourbaki/Theory_of_Sets)

### Extraction Procedure

1. Start from the local proof inventories, especially `LRA/Identity/ProofsToDo.md` and later `LRA/Set/ProofsToDo.md`.
2. Cross-check each candidate against the actual Lean source so the roadmap links to theorem or definition lines, not stale inventory text.
3. Keep only entries that serve the mathematical notes: primitive setup, real theorem statements, definitions needed for the next proof layer, and pending theorem targets.
4. Omit Lean design artifacts: direct wrappers, aliases, instance construction, structure-population theorems, satisfaction certificates, model adapters, duplicate API aliases, and anything whose main role is implementation plumbing.
5. Separate mathematical content from construction-specific plumbing. For Identity, the generic `IdentityRelation` line is the main theorem spine; construction-specific wrappers are omitted from the handwritten-proof list.
6. Mark incomplete Lean statements separately when they are mathematically important. A theorem with `sorry` belongs in "Next Rich Theorem Targets," not in the completed proof list.

### Organization Rule

The list is ordered as a proof-development ladder:

1. Axioms and primitive setup: primitive relation symbol, reflexivity, Leibniz substitution, then the theory/interface definitions that package them.
2. Primitive completed theorems: reflexivity as exposed theorem, symmetry, transitivity, indiscernibility, identity of indiscernibles, and the Leibniz equivalence.
3. Richer definitions: distinctness, witnesses, uniqueness, and related vocabulary.
4. Richer theorem targets: equivalence, congruence, uniqueness consequences, and preservation laws that should become the second layer of handwritten proofs.

### How To Reuse This For Sets

When the Identity layer is done, build the Set roadmap the same way:

1. Begin with Set axioms and primitive symbols first: membership, set object, extensionality, empty set, pairing, union/intersection/complement if present.
2. Then record the theory/interface definitions that package those axioms, separating definitions from proof targets.
3. Promote genuine handwritten-proof statements into the completed theorem section: extensionality consequences, empty-set uniqueness, pair-set existence/uniqueness consequences, Boolean set laws, and complement/De Morgan laws.
4. Keep ZFC construction details separate from the generic Set interface, just as Lean-specific Identity construction wrappers were omitted here.
5. Omit wrappers whose proof is only `exact SomeInteriorTheorem ...`, unless the wrapper is the public mathematical theorem the notes should name.
6. Preserve source links for every theorem and definition so the handwritten proof can always be checked back against the Lean formalization.
