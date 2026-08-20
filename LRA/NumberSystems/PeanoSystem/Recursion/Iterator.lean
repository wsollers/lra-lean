import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem.Recursion

open LRA.NumberSystems.PeanoSystem

universe u v w

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Definition - Iterator Data]**

Iterator data for a Peano system consists of a target type, an initial value,
and a step rule on the target type.

Mathematical statement (Lean): `structure IteratorData (ps : PeanoSystem Element SetObject)`.


Logical form:

```lean
structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target
```
-/
structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target

/--
`IteratorDataOnPeanoSystem` abbreviates the displayed type or object for iterator data on peano system.

Logical form:

```lean
abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps
```
-/
abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps

/--
**[Definition - Iterator Function Clauses]**

A function satisfies the iterator clauses exactly when it sends the
distinguished element to the initial value and sends successors according to the
step rule.

Mathematical statement (Lean): `def IteratorFunctionClauses (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) (iterator_function : Element -> target) : Prop`.


Logical form:

```lean
def IteratorFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (iterator_function : Element -> target) : Prop :=
  iterator_function ps.one = initial_value /\
    forall element : Element,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)
```
-/
def IteratorFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (iterator_function : Element -> target) : Prop :=
  iterator_function ps.one = initial_value /\
    forall element : Element,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)

/--
**[Definition - Iterator Relation]**

An iterator relation contains the initial pair and is closed under the iterator
step.

Mathematical statement (Lean): `def IteratorRelation (ps : PeanoSystem Element SetObject) (data : IteratorData ps) (relation : Element -> data.target -> Prop) : Prop`.


Logical form:

```lean
def IteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (relation : Element -> data.Target -> Prop) : Prop :=
  relation ps.one data.InitialValue /\
    forall element : Element,
      forall value : data.Target,
        relation element value ->
        relation (ps.successor element) (data.StepRule value)
```
-/
def IteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (relation : Element -> data.Target -> Prop) : Prop :=
  relation ps.one data.InitialValue /\
    forall element : Element,
      forall value : data.Target,
        relation element value ->
        relation (ps.successor element) (data.StepRule value)

/--
**[Definition - Minimal Iterator Relation]**

The minimal iterator relation contains exactly the pairs forced by every
iterator relation.

Mathematical statement (Lean): `def MinimalIteratorRelation (ps : PeanoSystem Element SetObject) (data : IteratorData ps) (element : Element) (value : data.target) : Prop`.


Logical form:

```lean
def MinimalIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (element : Element)
    (value : data.Target) : Prop :=
  forall relation : Element -> data.Target -> Prop,
    IteratorRelation ps data relation ->
    relation element value
```
-/
def MinimalIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (element : Element)
    (value : data.Target) : Prop :=
  forall relation : Element -> data.Target -> Prop,
    IteratorRelation ps data relation ->
    relation element value

/--
**[Theorem - The Minimal Iterator Relation Is an Iterator Relation]**

The minimal iterator relation contains the initial pair and is closed under the
iterator step.

Mathematical statement (Lean): `theorem MinimalIteratorRelationIsIteratorRelation (ps : PeanoSystem Element SetObject) (data : IteratorData ps) : IteratorRelation ps data (MinimalIteratorRelation ps data)`.


Logical form:

```lean
theorem MinimalIteratorRelationIsIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data
      (MinimalIteratorRelation ps data)
```
-/
theorem MinimalIteratorRelationIsIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data
      (MinimalIteratorRelation ps data) := by
  sorry

/--
`IteratorRelationConsistency` states iterator relation consistency.

Logical form:

```lean
theorem IteratorRelationConsistency
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data)
```
-/
theorem IteratorRelationConsistency
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data) := by
  sorry

/--
**[Theorem - Completeness of the Minimal Iterator Relation]**

Every stage has at least one value in the minimal iterator relation.

Mathematical statement (Lean): `theorem MinimalIteratorRelationComplete (ps : PeanoSystem Element SetObject) (data : IteratorData ps) : forall element : Element, exists value : data.target, MinimalIteratorRelation ps data element value`.


Logical form:

```lean
theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    forall element : Element,
      exists value : data.Target,
        MinimalIteratorRelation ps data element value
```
-/
theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    forall element : Element,
      exists value : data.Target,
        MinimalIteratorRelation ps data element value := by
  sorry

/--
**[Theorem - Determinism of the Minimal Iterator Relation]**

For each element of the Peano system, the minimal iterator relation forces at
most one value.

Mathematical statement (Lean): `theorem MinimalIteratorRelationDeterministic (ps : PeanoSystem Element SetObject) (data : IteratorData ps) : forall element : Element, forall first_value second_value : data.target, MinimalIteratorRelation ps data element first_value -> MinimalIteratorRelation ps data element second_value -> first_value = second_value`.


Logical form:

```lean
theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value
```
-/
theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  sorry

/--
`ForcedValuesAreUnique` states forced values are unique.

Logical form:

```lean
theorem ForcedValuesAreUnique
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value
```
-/
theorem ForcedValuesAreUnique
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  sorry

/--
**[Theorem - Existence of an Iterator Function]**

For every target type, initial value, and step rule, there exists an iterator
function satisfying the iterator clauses.

Mathematical statement (Lean): `theorem ExistenceOfIteratorFunction (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) : exists iterator_function : Element -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function`.


Logical form:

```lean
theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function
```
-/
theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function := by
  sorry

/--
**[Theorem - Uniqueness of Iterator Functions]**

Any two iterator functions satisfying the same iterator clauses are equal.

Mathematical statement (Lean): `theorem UniquenessOfIteratorFunctions (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) (first_iterator second_iterator : Element -> target) : IteratorFunctionClauses ps target initial_value step_rule first_iterator -> IteratorFunctionClauses ps target initial_value step_rule second_iterator -> first_iterator = second_iterator`.


Logical form:

```lean
theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : Element -> target) :
    IteratorFunctionClauses ps target initial_value step_rule first_iterator ->
      IteratorFunctionClauses ps target initial_value step_rule second_iterator ->
      first_iterator = second_iterator
```
-/
theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : Element -> target) :
    IteratorFunctionClauses ps target initial_value step_rule first_iterator ->
      IteratorFunctionClauses ps target initial_value step_rule second_iterator ->
      first_iterator = second_iterator := by
  sorry

/--
**[Theorem - Iterator Function Well-Definedness]**

Iterator data determines exactly one iterator function.

Mathematical statement (Lean): `theorem IteratorFunctionWellDefined`.


Logical form:

```lean
theorem IteratorFunctionWellDefined
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function
```
-/
theorem IteratorFunctionWellDefined
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  sorry

/--
**[Definition - Iterator-Generated Function]**

The iterator-generated function determined by a target type, an initial value,
and a step rule.

Mathematical statement (Lean): `noncomputable def IteratorGeneratedFunction (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) : Element -> target`.


Logical form:

```lean
noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target :=
  Classical.choose
    (ExistenceOfIteratorFunction
      ps
      target
      initial_value
      step_rule)
```
-/
noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target :=
  Classical.choose
    (ExistenceOfIteratorFunction
      ps
      target
      initial_value
      step_rule)

/--
**[Theorem - Iterator Base Clause]**

The iterator-generated function sends the distinguished element to the initial
value.

Mathematical statement (Lean): `theorem IteratorBaseValue (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) : IteratorGeneratedFunction ps target initial_value step_rule ps.one = initial_value`.


Logical form:

```lean
theorem IteratorBaseValue
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    IteratorGeneratedFunction ps target initial_value step_rule ps.one = initial_value
```
-/
theorem IteratorBaseValue
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    IteratorGeneratedFunction ps target initial_value step_rule ps.one = initial_value := by
  sorry

/--
**[Theorem - Iterator Successor Clause]**

The iterator-generated function sends successors according to the step rule.

Mathematical statement (Lean): `theorem IteratorSuccessorStep (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) (element : Element) : IteratorGeneratedFunction ps target initial_value step_rule (ps.successor element) = step_rule (IteratorGeneratedFunction ps target initial_value step_rule element)`.


Logical form:

```lean
theorem IteratorSuccessorStep
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (element : Element) :
    IteratorGeneratedFunction ps target initial_value step_rule (ps.successor element) =
      step_rule (IteratorGeneratedFunction ps target initial_value step_rule element)
```
-/
theorem IteratorSuccessorStep
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (element : Element) :
    IteratorGeneratedFunction ps target initial_value step_rule (ps.successor element) =
      step_rule (IteratorGeneratedFunction ps target initial_value step_rule element) := by
  sorry

/--
`IterationOfASelfMap` defines the displayed object for iteration of a self map.

Logical form:

```lean
noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps Element initial_value step_rule
```
-/
noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps Element initial_value step_rule

/--
**[Theorem - Peano Iterator Theorem]**

For every target type, initial value, and step rule, there exists an iterator
function satisfying the iterator clauses, and any other such function is equal
to it.

Mathematical statement (Lean): `theorem PeanoIteratorTheorem (ps : PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target -> target) : exists iterator_function : Element -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function /\ forall other_iterator : Element -> target, IteratorFunctionClauses ps target initial_value step_rule other_iterator -> other_iterator = iterator_function`.


Logical form:

```lean
theorem PeanoIteratorTheorem
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function
```
-/
theorem PeanoIteratorTheorem
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  sorry

/--
`StageDependentStepRule` defines the displayed object for stage dependent step rule.

Logical form:

```lean
def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target
```
-/
def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target

/--
`GeneralRecursiveFunctionClauses` states the base and stage-dependent
successor clauses for a general recursive function on a Peano system.

Logical form:

```lean
def GeneralRecursiveFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (recursive_function : Element -> target) : Prop
```
-/
def GeneralRecursiveFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (recursive_function : Element -> target) : Prop :=
  recursive_function ps.one = initial_value /\
    forall element : Element,
      recursive_function (ps.successor element) =
        step_rule element (recursive_function element)

/--
`GeneralRecursiveFunction` defines the displayed object for general recursive function.

Logical form:

```lean
def GeneralRecursiveFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w) : Prop
```
-/
def GeneralRecursiveFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w) : Prop :=
  forall initial_value : target,
    forall step_rule : StageDependentStepRule ps target,
      exists recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule recursive_function

/--
`UniquenessOfGeneralRecursiveFunctions` states uniqueness of general recursive functions.

Logical form:

```lean
theorem UniquenessOfGeneralRecursiveFunctions
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (first_recursive_function second_recursive_function : Element -> target) :
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule first_recursive_function ->
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule second_recursive_function ->
    first_recursive_function = second_recursive_function
```
-/
theorem UniquenessOfGeneralRecursiveFunctions
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (first_recursive_function second_recursive_function : Element -> target) :
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule first_recursive_function ->
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule second_recursive_function ->
    first_recursive_function = second_recursive_function := by
  sorry

/--
`GeneralRecursionByStateEncoding` states general recursion by state encoding.

Logical form:

```lean
theorem GeneralRecursionByStateEncoding
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function
```
-/
theorem GeneralRecursionByStateEncoding
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function := by
  sorry

/--
`GeneralRecursionTheoremForPeanoSystem` states general recursion theorem for peano system.

Logical form:

```lean
theorem GeneralRecursionTheoremForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function /\
      forall other_recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule other_recursive_function ->
        other_recursive_function = recursive_function
```
-/
theorem GeneralRecursionTheoremForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function /\
      forall other_recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule other_recursive_function ->
        other_recursive_function = recursive_function := by
  sorry

end LRA.NumberSystems.PeanoSystem.Recursion
