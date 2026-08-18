-- LRA/VolumeI/Set/ModelTheory/Axioms.lean
-- The ZFC axioms as L_∈ sentences.

import LRA.VolumeI.Set.ModelTheory.Language
import LRA.Logic.Syntax.FirstOrder.Substitute
import LRA.Logic.Syntax.FirstOrder.AllVariables
import LRA.Logic.Theory

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/-!
Volume I label: set-model-theory-axioms
Lean module: LRA.Set.ModelTheory.Axioms
Verification status: checked syntax module (sentences and schemas)

The ZFC axioms transcribed as `L_∈` sentences, following the project
card `claude/zfc-axioms-l-sentences.md` clause for clause: only `∈`,
`∅`, `=`, and pure first-order logic appear; derived notions (`∪`,
`⊆`, `{·}`) are always spelled out as defining biconditionals.

Two axioms are *schemas* — one instance per formula. A schema
instance takes its parameter formula with distinguished variables by
convention (the tested element is variable 0; Replacement's output is
variable 1), guarded by an explicit *hygiene* side condition: the
instance's own bound variables must not occur free in the parameter.
The hygiene condition is not decoration — an unhygienic "property"
mentioning the carved-set variable produces Russell-style formulas
that are FALSE in every model, so admitting them into `ZFCTheory`
would make the theory unsatisfiable. Parameters (the card's `p̄`)
remain free in the instance, and `FormulaTheory` satisfaction — which
quantifies over all assignments — gives exactly the universal closure
`∀p̄` the card writes explicitly. Replacement's uniqueness clause
needs the output formula at a second variable; that is genuine
substitution, `substitute 1 (varT 4)`, capture-free because hygiene
demands 4 not occur in the parameter at all.

Variable budget per axiom (Nat-indexed): 0–4, chosen so each formula
reads off against the card directly.
-/

/-- Extensionality: `∀x ∀y (∀z (z∈x ↔ z∈y) → x = y)`.

Logical form:

```lean
def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1)))
```
-/
def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1)))

/-- Empty Set: `∀y ¬(y ∈ ∅)` — the defining axiom of the constant.

Logical form:

```lean
def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT))
```
-/
def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT))

/-- Pairing: `∀a ∀b ∃c ∀x (x∈c ↔ (x = a ∨ x = b))`.

Logical form:

```lean
def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1))))))
```
-/
def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1))))))

/-- Union: `∀F ∃A ∀x (x∈A ↔ ∃B (B∈F ∧ x∈B))`.

Logical form:

```lean
def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3))))))
```
-/
def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3))))))

/-- Power Set: `∀A ∃P ∀X (X∈P ↔ ∀y (y∈X → y∈A))`.

Logical form:

```lean
def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0))))))
```
-/
def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0))))))

/-- Infinity: `∃I (∅∈I ∧ ∀x (x∈I → ∃s (∀z (z∈s ↔ (z∈x ∨ z=x)) ∧ s∈I)))`
— the successor `s` of `x` written as its defining formula, without `∪`
or `{·}`.

Logical form:

```lean
def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0))))))
```
-/
def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0))))))

/-- Foundation: `∀A (A ≠ ∅ → ∃y (y∈A ∧ ∀z (z∈y → z∉A)))` — every
nonempty set has an `∈`-minimal element.

Logical form:

```lean
def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0)))))))
```
-/
def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0)))))))

/-- Choice (Zermelo's disjoint-sets form): for any family of pairwise
disjoint nonempty sets there is a selector set containing exactly one
element of each member. `∃!` is unfolded as existence plus uniqueness
via a fresh variable.

Logical form:

```lean
def choiceFormula : Formula MembershipSignature Nat
```
-/
def choiceFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (Formula.and
      -- every member is nonempty
      (.forallQ 1 (.impl (memF 1 0) (.neg (.equal (varT 1) emptyT))))
      -- members are pairwise disjoint
      (.forallQ 1 (.forallQ 2 (.impl
        (Formula.and (Formula.and (memF 1 0) (memF 2 0))
          (.neg (eqF 1 2)))
        (.neg (Formula.existsQ 3
          (Formula.and (memF 3 1) (memF 3 2))))))))
    -- then a selector exists
    (Formula.existsQ 4 (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 3 (Formula.and
        (Formula.and (memF 3 1) (memF 3 4))
        (.forallQ 2 (.impl
          (Formula.and (memF 2 1) (memF 2 4))
          (eqF 2 3)))))))))

/-- Hygiene for a Separation property `φ(x, p̄)`: the tested element
is variable 0, and the instance's bound variables 1 (the ambient set)
and 2 (the carved subset) must not occur free in `φ`. Everything else
free in `φ` is a parameter.

Logical form:

```lean
def SeparationHygienic (property : Formula MembershipSignature Nat) : Prop :=
  1 ∉ freeVariables property ∧ 2 ∉ freeVariables property
```
-/
def SeparationHygienic (property : Formula MembershipSignature Nat) : Prop :=
  1 ∉ freeVariables property ∧ 2 ∉ freeVariables property

/-- A Separation instance: `∀A ∃B ∀x (x∈B ↔ (x∈A ∧ φ(x)))`. Bound
variables: 0 = x, 1 = A, 2 = B. Only hygienic properties
(`SeparationHygienic`) are admitted into the theory.

Logical form:

```lean
def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property))))
```
-/
def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property))))

/-- Hygiene for a Replacement relation `φ(x, y, p̄)`: input is
variable 0, output is variable 1; the instance's bound variables 2
(the domain set) and 3 (the image set) must not occur free, and the
fresh uniqueness variable 4 must not occur *at all* (so substituting
it for 1 is capture-free).

Logical form:

```lean
def ReplacementHygienic (relation : Formula MembershipSignature Nat) : Prop :=
  2 ∉ freeVariables relation ∧ 3 ∉ freeVariables relation ∧
    4 ∉ allVariables relation
```
-/
def ReplacementHygienic (relation : Formula MembershipSignature Nat) : Prop :=
  2 ∉ freeVariables relation ∧ 3 ∉ freeVariables relation ∧
    4 ∉ allVariables relation

/-- A Replacement instance: if `φ(x, y)` is functional on `A`, the
image of `A` under `φ` is a set. `∃!` is unfolded as existence plus
uniqueness, the second output-role written by genuine substitution
`φ[1 := 4]`. Bound variables: 0 = x, 1 and 4 = output roles, 2 = A,
3 = B.

Logical form:

```lean
def replacementInstance (relation : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 2 (.impl
    (.forallQ 0 (.impl (memF 0 2)
      (Formula.and
        (Formula.existsQ 1 relation)
        (.forallQ 1 (.forallQ 4 (.impl
          (Formula.and relation (substitute 1 (varT 4) relation))
          (eqF 1 4)))))))
    (Formula.existsQ 3 (.forallQ 1
      (iffF (memF 1 3)
        (Formula.existsQ 0 (Formula.and (memF 0 2) relation))))))
```
-/
def replacementInstance (relation : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 2 (.impl
    (.forallQ 0 (.impl (memF 0 2)
      (Formula.and
        (Formula.existsQ 1 relation)
        (.forallQ 1 (.forallQ 4 (.impl
          (Formula.and relation (substitute 1 (varT 4) relation))
          (eqF 1 4)))))))
    (Formula.existsQ 3 (.forallQ 1
      (iffF (memF 1 3)
        (Formula.existsQ 0 (Formula.and (memF 0 2) relation))))))

/-! ## Closedness: the eight concrete axioms are sentences -/

/--
`extensionalityIsClosed` states extensionality is closed.

Logical form:

```lean
theorem extensionalityIsClosed : IsClosedFormula extensionalityFormula
```
-/
theorem extensionalityIsClosed : IsClosedFormula extensionalityFormula := by
  unfold IsClosedFormula
  decide

/--
`emptySetIsClosed` states empty set is closed.

Logical form:

```lean
theorem emptySetIsClosed : IsClosedFormula emptySetFormula
```
-/
theorem emptySetIsClosed : IsClosedFormula emptySetFormula := by
  unfold IsClosedFormula
  decide

/--
`pairingIsClosed` states pairing is closed.

Logical form:

```lean
theorem pairingIsClosed : IsClosedFormula pairingFormula
```
-/
theorem pairingIsClosed : IsClosedFormula pairingFormula := by
  unfold IsClosedFormula
  decide

/--
`unionIsClosed` states union is closed.

Logical form:

```lean
theorem unionIsClosed : IsClosedFormula unionFormula
```
-/
theorem unionIsClosed : IsClosedFormula unionFormula := by
  unfold IsClosedFormula
  decide

/--
`powerSetIsClosed` states power set is closed.

Logical form:

```lean
theorem powerSetIsClosed : IsClosedFormula powerSetFormula
```
-/
theorem powerSetIsClosed : IsClosedFormula powerSetFormula := by
  unfold IsClosedFormula
  decide

/--
`infinityIsClosed` states infinity is closed.

Logical form:

```lean
theorem infinityIsClosed : IsClosedFormula infinityFormula
```
-/
theorem infinityIsClosed : IsClosedFormula infinityFormula := by
  unfold IsClosedFormula
  decide

/--
`foundationIsClosed` states foundation is closed.

Logical form:

```lean
theorem foundationIsClosed : IsClosedFormula foundationFormula
```
-/
theorem foundationIsClosed : IsClosedFormula foundationFormula := by
  unfold IsClosedFormula
  decide

/--
`choiceIsClosed` states choice is closed.

Logical form:

```lean
theorem choiceIsClosed : IsClosedFormula choiceFormula
```
-/
theorem choiceIsClosed : IsClosedFormula choiceFormula := by
  unfold IsClosedFormula
  decide

/-- Extensionality as a sentence.

Logical form:

```lean
def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩
```
-/
def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩

/-- Empty Set as a sentence.

Logical form:

```lean
def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩
```
-/
def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩

/-- Pairing as a sentence.

Logical form:

```lean
def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩
```
-/
def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩

/-- Union as a sentence.

Logical form:

```lean
def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩
```
-/
def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩

/-- Power Set as a sentence.

Logical form:

```lean
def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩
```
-/
def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩

/-- Infinity as a sentence.

Logical form:

```lean
def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩
```
-/
def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩

/-- Foundation as a sentence.

Logical form:

```lean
def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩
```
-/
def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩

/-- Choice as a sentence.

Logical form:

```lean
def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩
```
-/
def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩

/-! ## The theory -/

/-- Membership in the ZFC axiom list: the eight concrete axioms plus
every instance of the two schemas.

Logical form:

```lean
inductive IsZFCAxiom : Formula MembershipSignature Nat → Prop where
  | extensionality : IsZFCAxiom extensionalityFormula
  | emptySet : IsZFCAxiom emptySetFormula
  | pairing : IsZFCAxiom pairingFormula
  | union : IsZFCAxiom unionFormula
  | powerSet : IsZFCAxiom powerSetFormula
  | infinity : IsZFCAxiom infinityFormula
  | foundation : IsZFCAxiom foundationFormula
  | choice : IsZFCAxiom choiceFormula
  | separation (property : Formula MembershipSignature Nat)
      (hygienic : SeparationHygienic property) :
      IsZFCAxiom (separationInstance property)
  | replacement (relation : Formula MembershipSignature Nat)
      (hygienic : ReplacementHygienic relation) :
      IsZFCAxiom (replacementInstance relation)
```
-/
inductive IsZFCAxiom : Formula MembershipSignature Nat → Prop where
  | extensionality : IsZFCAxiom extensionalityFormula
  | emptySet : IsZFCAxiom emptySetFormula
  | pairing : IsZFCAxiom pairingFormula
  | union : IsZFCAxiom unionFormula
  | powerSet : IsZFCAxiom powerSetFormula
  | infinity : IsZFCAxiom infinityFormula
  | foundation : IsZFCAxiom foundationFormula
  | choice : IsZFCAxiom choiceFormula
  | separation (property : Formula MembershipSignature Nat)
      (hygienic : SeparationHygienic property) :
      IsZFCAxiom (separationInstance property)
  | replacement (relation : Formula MembershipSignature Nat)
      (hygienic : ReplacementHygienic relation) :
      IsZFCAxiom (replacementInstance relation)

/-- ZFC as a formula theory over `L_∈` (formula-level, so the schema
instances — whose parameters remain free — sit alongside the closed
axioms; satisfaction over all assignments is their universal
closure).

Logical form:

```lean
def ZFCTheory : FormulaTheory MembershipSignature Nat :=
  fun formula => IsZFCAxiom formula
```
-/
def ZFCTheory : FormulaTheory MembershipSignature Nat :=
  fun formula => IsZFCAxiom formula

/-! ## Satisfaction helpers for the derived connectives -/

/-- Satisfaction of `iffF` is the expected biconditional.

Logical form:

```lean
theorem satisfiesIffF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (iffF φ ψ) ↔
      (Satisfies M assignment φ ↔ Satisfies M assignment ψ)
```
-/
theorem satisfiesIffF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (iffF φ ψ) ↔
      (Satisfies M assignment φ ↔ Satisfies M assignment ψ) := by
  simp only [iffF, satisfiesAndIffSatisfiesBoth, Satisfies]
  tauto

/-- Satisfaction of `orF` is the expected disjunction.

Logical form:

```lean
theorem satisfiesOrF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (orF φ ψ) ↔
      (Satisfies M assignment φ ∨ Satisfies M assignment ψ)
```
-/
theorem satisfiesOrF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (orF φ ψ) ↔
      (Satisfies M assignment φ ∨ Satisfies M assignment ψ) := by
  simp only [orF, Satisfies]
  tauto

end LRA.Set.ModelTheory
