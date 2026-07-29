/-
Draft module; not yet imported by the active Volume III root.
New namespace/area for this pass: `LRA.VolumeIII.Analysis.Functions.*`.
Standalone — imports only Mathlib's core `Function`/`Set` API (pure
function-theory content, no dependency on the Sequences/Bounding draft
trees), so it can be freely refactored or discarded without touching the
working project.
Source: volume-iii/book-analysis-i/functions/notes/algebra-of-functions/notes-algebra-of-functions.tex
First section read of the `functions` chapter (Chapter 4, "Functions,"
Book I). Per `functions/notes/index.tex`'s own `\input` order this
section actually comes FIRST (`algebra-of-functions` -> `real-valued-
functions` -> `subsets-real-line`), so that's the order this pass is
following, even though the toolkitbox / numbering in `index.tex` lists
it that way too. Structural check: 24/24 balanced remark blocks; 6
`\label{...}` occurrences, but the first (`sec:algebra-of-functions`) is
the section's own label, not a content node, leaving 5 real content
nodes (all propositions/corollaries — no `definition` nodes in this
file, all cited definitions are forward references to `def:function` /
`def:composition`, presumably from an earlier chapter not yet read).

All 5 propositions/corollaries are mathematically CORRECT as theorem
statements: composition preserves injectivity/surjectivity/bijectivity,
a bijection has a bijective inverse, and preimage distributes exactly
over union, intersection, and complement. But this file has three
findings, one of them a real structural corruption:

Finding A (see ISSUES.md #27, 🟠 — likely structural/leftover paste):
immediately after the `\subsection*{Algebra of Functions}` header, before
ANY content node, there's an orphaned `[Interpretation]` remark about
"every open interval consists of cluster points; [a,b] is closed and
bounded" — pure point-set-topology content that has nothing to do with
composition, injectivity, or preimages. It reads like a paragraph that
belongs in the later `subsets-real-line` section and was pasted into the
wrong file's opening. Not fixed here.

Finding B (see ISSUES.md #28, 🟠): `prop:composition-surjective`'s
"Predicate reading" remark is `Surjective(g∘f,A,C) :≡ ∀c∃a: (g∘f)(a)=c`
— it states only the DEFINITION of the conclusion, dropping the
hypothesis `Surjective(f) ∧ Surjective(g)` entirely. Unlike its sibling
`prop:composition-injective` (whose Predicate reading correctly encodes
`Injective(f)∧Injective(g) ⟹ Injective(g∘f)`), this one no longer states
an implication at all — it can't distinguish "g∘f is surjective because
f,g are" from "g∘f is surjective, full stop." This node is also missing
the Negated/Negation-predicate/Failure-modes blocks that its siblings
(`composition-injective`, `composition-bijective`) both have. Not fixed
here.

Finding C (see ISSUES.md #29, 🟠 — structural, matches the Bounds-pass
"duplicated block" corruption pattern): `prop:preimage-union-intersection`
asserts THREE parts (i union, ii intersection, iii complement), but the
"Standard quantified statement" remark only covers (i) and (ii) — part
(iii)'s content is completely absent from it. Instead, the exact same
non-negated derivation of part (iii) (`x not-in f^{-1}(S) <=> f(x)
not-in S <=> x in f^{-1}(S^c)`) is pasted, VERBATIM, into all three of
"Negated quantified statement," "Negation predicate reading," and
"Failure modes" — none of which it actually belongs to (it isn't a
negation of anything; it's the correct positive derivation of (iii),
just in the wrong three slots, tripled). This node is also missing a
"Predicate reading" block entirely. The underlying math (all three parts
of the proposition) is correct; this is a remark-block placement/
corruption bug, not a math error. Not fixed here — flagging for your
call on whether to patch the live `.tex` (with a backup), matching how
the Bounds-pass duplication bugs were handled once you approved it.

Formalized below using project-parallel predicate names (`IsInjectiveOn`
etc.) rather than reusing Mathlib's `Function.Injective`/`Surjective`/
`Bijective` directly, matching this pass's house style of tracking the
corpus's own named predicates as citable content.
-/

import Mathlib.Logic.Function.Basic
import Mathlib.Data.Set.Basic

namespace LRA.VolumeIII.Analysis.Functions

variable {A B C : Type*}

/-- Project-parallel to Mathlib's `Function.Injective`. -/
def IsInjectiveOn (f : A → B) : Prop := ∀ a₁ a₂ : A, f a₁ = f a₂ → a₁ = a₂

/-- Project-parallel to Mathlib's `Function.Surjective`. -/
def IsSurjectiveOn (f : A → B) : Prop := ∀ b : B, ∃ a : A, f a = b

/-- Project-parallel to Mathlib's `Function.Bijective`. -/
def IsBijectiveOn (f : A → B) : Prop := IsInjectiveOn f ∧ IsSurjectiveOn f

/-- Project-parallel notion of "`g` is the inverse function of `f`." -/
def IsInverseFunctionOf (g : B → A) (f : A → B) : Prop :=
  (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b)

/-- `prop:composition-injective`. -/
theorem CompositionInjective {f : A → B} {g : B → C}
    (hf : IsInjectiveOn f) (hg : IsInjectiveOn g) : IsInjectiveOn (g ∘ f) := by
  sorry

/-- `prop:composition-surjective`. See Finding B above — formalized here
with the hypothesis it should have had. -/
theorem CompositionSurjective {f : A → B} {g : B → C}
    (hf : IsSurjectiveOn f) (hg : IsSurjectiveOn g) :
    IsSurjectiveOn (g ∘ f) := by
  sorry

/-- `cor:composition-bijective`. -/
theorem CompositionBijective {f : A → B} {g : B → C}
    (hf : IsBijectiveOn f) (hg : IsBijectiveOn g) : IsBijectiveOn (g ∘ f) := by
  sorry

/-- `prop:inverse-bijection`. -/
theorem InverseBijection {f : A → B} (hf : IsBijectiveOn f) :
    ∃ g : B → A, IsInverseFunctionOf g f ∧ IsBijectiveOn g := by
  sorry

/-- `prop:preimage-union-intersection`. All three parts (i)/(ii)/(iii),
including the complement law that the `.tex`'s own Standard quantified
statement omits — see Finding C above. -/
theorem PreimageUnionIntersection {f : A → B} (S T : Set B) :
    f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T ∧
      f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T ∧
      f ⁻¹' Sᶜ = (f ⁻¹' S)ᶜ := by
  sorry

end LRA.VolumeIII.Analysis.Functions
