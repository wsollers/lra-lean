import LRA.VolumeI.Logic.Theory
import LRA.VolumeI.Set.ZFC.Model

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic
open LRA.VolumeI.Logic.FirstOrder

/-!
The theory layer for the active ZFC track.

The active ZFC files now expose the three model-theory pieces explicitly:

* `zfcSignature` is the language,
* `ZFCModel` is an `L`-structure interpreting that language,
* `ZFCFormulaTheory`/`zfcTheory` collect the named axioms and schemas.

The axiom formulas below use the one-symbol language of ZFC, namely binary
membership. Set-forming operations are intentionally not function symbols; they
are characterized by the axioms.
-/

/-- ZFC formulas use natural-number variables. -/
abbrev ZFCVariable := Nat

/-- A first-order formula in the language of ZFC. -/
abbrev ZFCFormula := Formula zfcSignature ZFCVariable

/-- A formula theory in the language of ZFC. -/
abbrev ZFCFormulaTheory := FormulaTheory zfcSignature ZFCVariable

/-- The variable term with index `v`. -/
def variableTerm (v : ZFCVariable) : Term zfcSignature ZFCVariable :=
  Term.var v

/-- Atomic membership, read `x ∈ y`. -/
def memberFormula (x y : ZFCVariable) : ZFCFormula :=
  Formula.relation .member (fun
    | ⟨0, _⟩ => variableTerm x
    | ⟨1, _⟩ => variableTerm y)

/-- Atomic equality, read `x = y`. -/
def equalFormula (x y : ZFCVariable) : ZFCFormula :=
  Formula.equal (variableTerm x) (variableTerm y)

/-- Negation of a ZFC formula. -/
def notFormula (φ : ZFCFormula) : ZFCFormula :=
  Formula.neg φ

/-- Implication between ZFC formulas. -/
def impliesFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  Formula.impl φ ψ

/-- Conjunction between ZFC formulas, derived from the primitive connectives. -/
def andFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  Formula.and φ ψ

/-- Disjunction between ZFC formulas, derived from the primitive connectives. -/
def orFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  Formula.impl (Formula.neg φ) ψ

/-- Biconditional between ZFC formulas, derived as two implications. -/
def iffFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  andFormula (impliesFormula φ ψ) (impliesFormula ψ φ)

/-- Universal quantification over a ZFC variable. -/
def forallVariable (v : ZFCVariable) (φ : ZFCFormula) : ZFCFormula :=
  Formula.forallQ v φ

/-- Existential quantification over a ZFC variable. -/
def existsVariable (v : ZFCVariable) (φ : ZFCFormula) : ZFCFormula :=
  Formula.existsQ v φ

/-- `z` is a subset of `x`: every member of `z` is a member of `x`. -/
def subsetFormula (z x : ZFCVariable) : ZFCFormula :=
  let w : ZFCVariable := 100
  forallVariable w (impliesFormula (memberFormula w z) (memberFormula w x))

/-- `e` is empty: nothing is a member of `e`. -/
def emptyFormula (e : ZFCVariable) : ZFCFormula :=
  let w : ZFCVariable := 101
  forallVariable w (notFormula (memberFormula w e))

/-- `p` has exactly `x` and `y` as members. -/
def pairFormula (p x y : ZFCVariable) : ZFCFormula :=
  let z : ZFCVariable := 102
  forallVariable z
    (iffFormula (memberFormula z p)
      (orFormula (equalFormula z x) (equalFormula z y)))

/-- `u` is the union of `x`. -/
def unionFormula (u x : ZFCVariable) : ZFCFormula :=
  let z : ZFCVariable := 103
  let y : ZFCVariable := 104
  forallVariable z
    (iffFormula (memberFormula z u)
      (existsVariable y (andFormula (memberFormula z y) (memberFormula y x))))

/-- `p` is the powerset of `x`. -/
def powersetFormula (p x : ZFCVariable) : ZFCFormula :=
  let z : ZFCVariable := 105
  forallVariable z
    (iffFormula (memberFormula z p) (subsetFormula z x))

/-- `s` is the successor `x ∪ {x}`. -/
def successorFormula (s x : ZFCVariable) : ZFCFormula :=
  let z : ZFCVariable := 106
  forallVariable z
    (iffFormula (memberFormula z s)
      (orFormula (memberFormula z x) (equalFormula z x)))

/-- Extensionality: sets with exactly the same members are equal. -/
def extensionalityAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let y : ZFCVariable := 1
  let z : ZFCVariable := 2
  forallVariable x
    (forallVariable y
      (impliesFormula
        (forallVariable z (iffFormula (memberFormula z x) (memberFormula z y)))
        (equalFormula x y)))

/-- Empty set: some set has no members. -/
def emptySetAxiom : ZFCFormula :=
  let e : ZFCVariable := 0
  existsVariable e (emptyFormula e)

/-- Pairing: for any `x` and `y`, there is a set whose members are exactly
`x` and `y`. -/
def pairingAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let y : ZFCVariable := 1
  let p : ZFCVariable := 2
  forallVariable x (forallVariable y (existsVariable p (pairFormula p x y)))

/-- Union: every set has a union. -/
def unionAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let u : ZFCVariable := 1
  forallVariable x (existsVariable u (unionFormula u x))

/-- Power set: every set has a powerset. -/
def powerSetAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let p : ZFCVariable := 1
  forallVariable x (existsVariable p (powersetFormula p x))

/-- Foundation: every nonempty set has an `∈`-minimal member. -/
def foundationAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let w : ZFCVariable := 1
  let y : ZFCVariable := 2
  let z : ZFCVariable := 3
  forallVariable x
    (impliesFormula
      (existsVariable w (memberFormula w x))
      (existsVariable y
        (andFormula
          (memberFormula y x)
          (forallVariable z
            (impliesFormula (memberFormula z x) (notFormula (memberFormula z y)))))))

/-- Infinity: there is an inductive set. -/
def infinityAxiom : ZFCFormula :=
  let i : ZFCVariable := 0
  let e : ZFCVariable := 1
  let u : ZFCVariable := 2
  let s : ZFCVariable := 3
  existsVariable i
    (andFormula
      (existsVariable e (andFormula (memberFormula e i) (emptyFormula e)))
      (forallVariable u
        (impliesFormula
          (memberFormula u i)
          (existsVariable s
            (andFormula (memberFormula s i) (successorFormula s u))))))

/-- Separation schema instance for a predicate formula `φ(z)`. -/
def separationAxiomInstance (φ : ZFCFormula) : ZFCFormula :=
  let x : ZFCVariable := 0
  let y : ZFCVariable := 1
  let z : ZFCVariable := 2
  forallVariable x
    (existsVariable y
      (forallVariable z
        (iffFormula (memberFormula z y)
          (andFormula (memberFormula z x) φ))))

/-- Replacement schema instance placeholder for a functional relation formula.

The formula `φ` is intended to relate inputs and outputs. The functional
side-condition is tracked outside this bare formula constructor until the fresh
ZFC syntax has schema-variable metadata.
-/
def replacementAxiomInstance (φ : ZFCFormula) : ZFCFormula :=
  let x : ZFCVariable := 0
  let y : ZFCVariable := 1
  let a : ZFCVariable := 2
  let b : ZFCVariable := 3
  forallVariable x
    (existsVariable y
      (forallVariable b
        (iffFormula (memberFormula b y)
          (existsVariable a (andFormula (memberFormula a x) φ)))))

/-- Choice, in a pairwise-disjoint transversal form. -/
def choiceAxiom : ZFCFormula :=
  let family : ZFCVariable := 0
  let member : ZFCVariable := 1
  let witness : ZFCVariable := 2
  let firstMember : ZFCVariable := 3
  let secondMember : ZFCVariable := 4
  let shared : ZFCVariable := 5
  let choiceSet : ZFCVariable := 6
  let transversalMember : ZFCVariable := 7
  let chosen : ZFCVariable := 8
  let otherChosen : ZFCVariable := 9
  let membersNonempty :=
    forallVariable member
      (impliesFormula (memberFormula member family)
        (existsVariable witness (memberFormula witness member))
      )
  let membersPairwiseDisjoint :=
    forallVariable firstMember
      (forallVariable secondMember
        (impliesFormula
          (andFormula
            (andFormula (memberFormula firstMember family) (memberFormula secondMember family))
            (notFormula (equalFormula firstMember secondMember)))
          (notFormula
            (existsVariable shared
              (andFormula (memberFormula shared firstMember)
                (memberFormula shared secondMember))))))
  let hasTransversal :=
    existsVariable choiceSet
      (forallVariable transversalMember
        (impliesFormula (memberFormula transversalMember family)
          (existsVariable chosen
            (andFormula
              (andFormula (memberFormula chosen transversalMember)
                (memberFormula chosen choiceSet))
              (forallVariable otherChosen
                (impliesFormula
                  (andFormula (memberFormula otherChosen transversalMember)
                    (memberFormula otherChosen choiceSet))
                  (equalFormula otherChosen chosen)))))))
  forallVariable family
    (impliesFormula
      (andFormula membersNonempty membersPairwiseDisjoint)
      hasTransversal)

/-- The named non-schema ZFC axioms, including Choice. -/
def zfcNamedAxioms : ZFCFormulaTheory :=
  {φ | φ = extensionalityAxiom ∨
       φ = emptySetAxiom ∨
       φ = pairingAxiom ∨
       φ = unionAxiom ∨
       φ = powerSetAxiom ∨
       φ = foundationAxiom ∨
       φ = infinityAxiom ∨
       φ = choiceAxiom}

/-- The ZFC formula theory: named axioms plus Separation and Replacement schema
instances. -/
def zfcTheory : ZFCFormulaTheory :=
  {φ | φ ∈ zfcNamedAxioms ∨
       (∃ predicate, φ = separationAxiomInstance predicate) ∨
       (∃ relationPredicate, φ = replacementAxiomInstance relationPredicate)}

/-- A ZFC model satisfies the active formula theory when every axiom/schema
instance holds under every assignment. -/
def SatisfiesZFCTheory (M : ZFCModel) : Prop :=
  M ∈ ModelsOfFormulaTheory zfcTheory

end LRA.VolumeI.Set.ZFC
