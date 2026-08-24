namespace LRA.Logic

/--
`updateAssignment` TODO

Predicate logic:

  def updateAssignment
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    Variable -> Domain :=
  fun v' => if v' = v then a else assignment v'

Predicate logic (unfolded):

  def updateAssignment
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    Variable -> Domain :=
  fun v' => if v' = v then a else assignment v' (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def updateAssignment
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    Variable -> Domain :=
  fun v' => if v' = v then a else assignment v'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def updateAssignment
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    Variable -> Domain :=
  fun v' => if v' = v then a else assignment v'

/--
`updatedVariableTakesNewValue` TODO

Predicate logic:

  (∀ v ∈ Variable ∀ a ∈ Domain), updateAssignment assignment v a v = a

Predicate logic (unfolded):

  ∀ {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)]{Domain : Type u} (assignment : Variable → Domain) (v : Variable) (a : Domain), Decidable.rec (fun h => (fun x => assignment v) h) (fun h => (fun x => a) h) (inst v v) = a

Logical form (Lean):

```lean
theorem updatedVariableTakesNewValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    updateAssignment assignment v a v = a
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
theorem updatedVariableTakesNewValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    updateAssignment assignment v a v = a := by
  simp [updateAssignment]

/--
`differentVariableKeepsOldValue` TODO

Predicate logic:

  (∀ v v' ∈ Variable ∀ a ∈ Domain), updateAssignment assignment v a v' = assignment v'

Predicate logic (unfolded):

  ∀ {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)]{Domain : Type u} (assignment : Variable → Domain) (v v' : Variable) (a : Domain), (v' = v → False) → Decidable.rec (fun h => (fun x => assignment v') h) (fun h => (fun x => a) h) (inst v' v) = assignment v'

Logical form (Lean):

```lean
theorem differentVariableKeepsOldValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v v' : Variable) (a : Domain)
    (hv : v' ≠ v) :
    updateAssignment assignment v a v' = assignment v'
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
theorem differentVariableKeepsOldValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v v' : Variable) (a : Domain)
    (hv : v' ≠ v) :
    updateAssignment assignment v a v' = assignment v' := by
  simp [updateAssignment, hv]

end LRA.Logic
