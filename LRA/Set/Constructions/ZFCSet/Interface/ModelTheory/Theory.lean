import LRA.Set.Interface.ModelTheory.LStructure
import LRA.Logic.Syntax.FirstOrder.Substitute
import LRA.Logic.Syntax.FirstOrder.AllVariables
import LRA.ModelTheory.Theory

/-!
ZFCSet's exported ZFC theory: the ten axiom formulas and axiom schemas of
Zermelo-Fraenkel set theory with Choice, stated over the generic
`L_∈`-signature, together with the closure lemmas, sentences, and the
`IsZFCAxiom`/`ZFCTheory` package that other constructions (TGSet,
GrothendieckUniverse, Mathlib's `ZFSet`) satisfy against.
-/

namespace LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory

/--
`extensionalityFormula` TODO

Predicate logic:

  def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1)))

Predicate logic (unfolded):

  def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1)))

/--
`emptySetFormula` TODO

Predicate logic:

  def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT))

Predicate logic (unfolded):

  def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT))

/--
`pairingFormula` TODO

Predicate logic:

  def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1))))))

Predicate logic (unfolded):

  def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1)))))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1))))))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1))))))

/--
`unionFormula` TODO

Predicate logic:

  def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3))))))

Predicate logic (unfolded):

  def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3)))))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3))))))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3))))))

/--
`powerSetFormula` TODO

Predicate logic:

  def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0))))))

Predicate logic (unfolded):

  def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0)))))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0))))))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0))))))

/--
`infinityFormula` TODO

Predicate logic:

  def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0))))))

Predicate logic (unfolded):

  def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0)))))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0))))))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0))))))

/--
`foundationFormula` TODO

Predicate logic:

  def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0)))))))

Predicate logic (unfolded):

  def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0))))))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0)))))))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0)))))))

/--
`choiceFormula` TODO

Predicate logic:

  def choiceFormula : Formula MembershipSignature Nat

Predicate logic (unfolded):

  def choiceFormula : Formula MembershipSignature Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def choiceFormula : Formula MembershipSignature Nat
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def choiceFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (Formula.and

      (.forallQ 1 (.impl (memF 1 0) (.neg (.equal (varT 1) emptyT))))

      (.forallQ 1 (.forallQ 2 (.impl
        (Formula.and (Formula.and (memF 1 0) (memF 2 0))
          (.neg (eqF 1 2)))
        (.neg (Formula.existsQ 3
          (Formula.and (memF 3 1) (memF 3 2))))))))

    (Formula.existsQ 4 (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 3 (Formula.and
        (Formula.and (memF 3 1) (memF 3 4))
        (.forallQ 2 (.impl
          (Formula.and (memF 2 1) (memF 2 4))
          (eqF 2 3)))))))))

/--
`SeparationHygienic` TODO

Predicate logic:

  ∀ (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (¬ SetLike.instMembership.mem (LRA.Logic.FirstOrder.freeVariables property) 1 ∧ ¬ SetLike.instMembership.mem (LRA.Logic.FirstOrder.freeVariables property) 2)

Predicate logic (unfolded):

  ∀ (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables property) (instOfNatNat 1).1 → False ∧ SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables property) (instOfNatNat 2).1 → False)

Logical form (Lean):

```lean
def SeparationHygienic (property : Formula MembershipSignature Nat) : Prop :=
  1 ∉ freeVariables property ∧ 2 ∉ freeVariables property
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def SeparationHygienic (property : Formula MembershipSignature Nat) : Prop :=
  1 ∉ freeVariables property ∧ 2 ∉ freeVariables property

/--
`separationInstance` TODO

Predicate logic:

  def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property))))

Predicate logic (unfolded):

  def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property)))) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property))))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property))))

/--
`ReplacementHygienic` TODO

Predicate logic:

  ∀ (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (¬ SetLike.instMembership.mem (LRA.Logic.FirstOrder.freeVariables relation) 2 ∧ (¬ SetLike.instMembership.mem (LRA.Logic.FirstOrder.freeVariables relation) 3 ∧ ¬ SetLike.instMembership.mem (LRA.Logic.FirstOrder.allVariables relation) 4))

Predicate logic (unfolded):

  ∀ (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables relation) (instOfNatNat 2).1 → False ∧ (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables relation) (instOfNatNat 3).1 → False ∧ SetLike.instMembership.1 (LRA.Logic.FirstOrder.allVariables relation) (instOfNatNat 4).1 → False))

Logical form (Lean):

```lean
def ReplacementHygienic (relation : Formula MembershipSignature Nat) : Prop :=
  2 ∉ freeVariables relation ∧ 3 ∉ freeVariables relation ∧
    4 ∉ allVariables relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def ReplacementHygienic (relation : Formula MembershipSignature Nat) : Prop :=
  2 ∉ freeVariables relation ∧ 3 ∉ freeVariables relation ∧
    4 ∉ allVariables relation

/--
`replacementInstance` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
        (Formula.existsQ 0 (Formula.and (memF 0 2) relation)))))) (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`extensionalityIsClosed` TODO

Predicate logic:

  IsClosedFormula extensionalityFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem extensionalityIsClosed : IsClosedFormula extensionalityFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem extensionalityIsClosed : IsClosedFormula extensionalityFormula := by
  sorry

/--
`emptySetIsClosed` TODO

Predicate logic:

  IsClosedFormula emptySetFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem emptySetIsClosed : IsClosedFormula emptySetFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem emptySetIsClosed : IsClosedFormula emptySetFormula := by
  sorry

/--
`pairingIsClosed` TODO

Predicate logic:

  IsClosedFormula pairingFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem pairingIsClosed : IsClosedFormula pairingFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem pairingIsClosed : IsClosedFormula pairingFormula := by
  sorry

/--
`unionIsClosed` TODO

Predicate logic:

  IsClosedFormula unionFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem unionIsClosed : IsClosedFormula unionFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem unionIsClosed : IsClosedFormula unionFormula := by
  sorry

/--
`powerSetIsClosed` TODO

Predicate logic:

  IsClosedFormula powerSetFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem powerSetIsClosed : IsClosedFormula powerSetFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem powerSetIsClosed : IsClosedFormula powerSetFormula := by
  sorry

/--
`infinityIsClosed` TODO

Predicate logic:

  IsClosedFormula infinityFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem infinityIsClosed : IsClosedFormula infinityFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem infinityIsClosed : IsClosedFormula infinityFormula := by
  sorry

/--
`foundationIsClosed` TODO

Predicate logic:

  IsClosedFormula foundationFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem foundationIsClosed : IsClosedFormula foundationFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem foundationIsClosed : IsClosedFormula foundationFormula := by
  sorry

/--
`choiceIsClosed` TODO

Predicate logic:

  IsClosedFormula choiceFormula

Predicate logic (unfolded):

  LRA.Logic.FirstOrder.freeVariables LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula = Finset.instEmptyCollection.1

Logical form (Lean):

```lean
theorem choiceIsClosed : IsClosedFormula choiceFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem choiceIsClosed : IsClosedFormula choiceFormula := by
  sorry

/--
`extensionalitySentence` TODO

Predicate logic:

  def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩

Predicate logic (unfolded):

  def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩

/--
`emptySetSentence` TODO

Predicate logic:

  def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩

Predicate logic (unfolded):

  def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩

/--
`pairingSentence` TODO

Predicate logic:

  def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩

Predicate logic (unfolded):

  def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩

/--
`unionSentence` TODO

Predicate logic:

  def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩

Predicate logic (unfolded):

  def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩

/--
`powerSetSentence` TODO

Predicate logic:

  def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩

Predicate logic (unfolded):

  def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩

/--
`infinitySentence` TODO

Predicate logic:

  def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩

Predicate logic (unfolded):

  def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩

/--
`foundationSentence` TODO

Predicate logic:

  def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩

Predicate logic (unfolded):

  def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩

/--
`choiceSentence` TODO

Predicate logic:

  def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩

Predicate logic (unfolded):

  def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩

/--
`IsZFCAxiom` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      IsZFCAxiom (replacementInstance relation) (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

/--
`ZFCTheory` TODO

Predicate logic:

  ∀ (a : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.IsZFCAxiom a

Predicate logic (unfolded):

  ∀ (a : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.IsZFCAxiom a

Logical form (Lean):

```lean
def ZFCTheory : FormulaTheory MembershipSignature Nat :=
  fun formula => IsZFCAxiom formula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ZFCTheory : FormulaTheory MembershipSignature Nat :=
  fun formula => IsZFCAxiom formula

end LRA.Set.Constructions.ZFCSet.Interface.ModelTheory
