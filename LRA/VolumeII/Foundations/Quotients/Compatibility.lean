-- LRA/VolumeII/Foundations/Quotients/Compatibility.lean
-- Reusable representative-independence statements for quotient constructions.

namespace LRA.NumberSystems.Foundations.Quotients

/-!
Volume II label: quotient-representative-independence
Lean module: LRA.NumberSystems.Foundations.Quotients.Compatibility
Blueprint label: quotient-representative-independence
Verification status: statement-accepted-proof-pending

This module separates compatibility in each argument of a binary operation and
packages the statements used to descend operations, predicates, and relations
to quotient types.
-/

/--
**[Definition — Unary Operation Respects an Equivalence]**

A unary operation respects a setoid when equivalent inputs have equivalent
outputs.

Mathematical statement (Lean): `def unary_operation_respects {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier) : Prop`.


Logical form:

```lean
def unary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    setoid.r
      (operation first_representative)
      (operation second_representative)
```
-/
def unary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    setoid.r
      (operation first_representative)
      (operation second_representative)

/--
**[Definition — Binary Operation Respects an Equivalence on the Left]**

Mathematical statement (Lean): `def binary_operation_respects_left {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) : Prop`.


Logical form:

```lean
def binary_operation_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement second_representative : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_representative)
```
-/
def binary_operation_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement second_representative : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_representative)

/--
**[Definition — Binary Operation Respects an Equivalence on the Right]**

Mathematical statement (Lean): `def binary_operation_respects_right {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) : Prop`.


Logical form:

```lean
def binary_operation_respects_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative second_replacement : Carrier,
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_representative second_replacement)
```
-/
def binary_operation_respects_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative second_replacement : Carrier,
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_representative second_replacement)

/--
**[Definition — Binary Operation Respects an Equivalence]**

Mathematical statement (Lean): `def binary_operation_respects {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) : Prop`.


Logical form:

```lean
def binary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_replacement)
```
-/
def binary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_replacement)

/--
**[Lemma — Binary Respect Splits by Argument]**

Full representative independence is equivalent to representative independence
in each argument separately.

Mathematical statement (Lean): `theorem binary_operation_respects_iff_left_and_right {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) : binary_operation_respects setoid operation ↔ binary_operation_respects_left setoid operation ∧ binary_operation_respe...`.

*Proof status:* proof pending


Logical form:

```lean
theorem binary_operation_respects_iff_left_and_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) :
    binary_operation_respects setoid operation ↔
      binary_operation_respects_left setoid operation ∧
      binary_operation_respects_right setoid operation
```
-/
theorem binary_operation_respects_iff_left_and_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) :
    binary_operation_respects setoid operation ↔
      binary_operation_respects_left setoid operation ∧
      binary_operation_respects_right setoid operation := by
  sorry

/--
**[Corollary — A Commutative Operation Needs One Compatibility Proof]**

For a commutative representative operation, compatibility in either argument
implies full compatibility.

Mathematical statement (Lean): `theorem commutative_operation_respects_of_respects_left {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (operation_is_commutative : ∀ first second : Carrier, operation first second = operation second first) (operation_re...`.

*Proof status:* proof pending


Logical form:

```lean
theorem commutative_operation_respects_of_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier)
    (operation_is_commutative :
      ∀ first second : Carrier,
        operation first second = operation second first)
    (operation_respects_left :
      binary_operation_respects_left setoid operation) :
    binary_operation_respects setoid operation
```
-/
theorem commutative_operation_respects_of_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier)
    (operation_is_commutative :
      ∀ first second : Carrier,
        operation first second = operation second first)
    (operation_respects_left :
      binary_operation_respects_left setoid operation) :
    binary_operation_respects setoid operation := by
  sorry

/--
**[Theorem — An Operation Compatible with Equivalence Descends to the Quotient]**

The theorem states existence and the representative computation rule. The
construction proof may use `Quotient.lift` twice or an equivalent core Lean
quotient eliminator.

Mathematical statement (Lean): `theorem induced_binary_operation_exists {Carrier : Type} (setoid : Setoid Carrier) (representative_operation : Carrier → Carrier → Carrier) (representative_operation_respects : binary_operation_respects setoid representative_operation) : ∃ quotient_operatio...`.

*Proof status:* proof pending


Logical form:

```lean
theorem induced_binary_operation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_operation : Carrier → Carrier → Carrier)
    (representative_operation_respects :
      binary_operation_respects setoid representative_operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first_representative second_representative : Carrier,
        quotient_operation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) =
          Quotient.mk setoid
            (representative_operation
              first_representative
              second_representative)
```
-/
theorem induced_binary_operation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_operation : Carrier → Carrier → Carrier)
    (representative_operation_respects :
      binary_operation_respects setoid representative_operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first_representative second_representative : Carrier,
        quotient_operation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) =
          Quotient.mk setoid
            (representative_operation
              first_representative
              second_representative) := by
  sorry

/--
**[Definition — Predicate Respects an Equivalence]**

Mathematical statement (Lean): `def predicate_respects {Carrier : Type} (setoid : Setoid Carrier) (predicate : Carrier → Prop) : Prop`.


Logical form:

```lean
def predicate_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    (predicate first_representative ↔ predicate second_representative)
```
-/
def predicate_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    (predicate first_representative ↔ predicate second_representative)

/--
**[Definition — Relation Respects an Equivalence]**

Mathematical statement (Lean): `def relation_respects {Carrier : Type} (setoid : Setoid Carrier) (relation : Carrier → Carrier → Prop) : Prop`.


Logical form:

```lean
def relation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    (relation first_representative second_representative ↔
      relation first_replacement second_replacement)
```
-/
def relation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    (relation first_representative second_representative ↔
      relation first_replacement second_replacement)

/--
**[Proposition — A Compatible Predicate Is Representative-Independent]**

Mathematical statement (Lean): `theorem compatible_predicate_has_constant_truth_on_classes {Carrier : Type} (setoid : Setoid Carrier) (predicate : Carrier → Prop) (predicate_is_compatible : predicate_respects setoid predicate) (first_representative second_representative : Carrier) (repres...`.

*Proof status:* proof pending


Logical form:

```lean
theorem compatible_predicate_has_constant_truth_on_classes
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop)
    (predicate_is_compatible : predicate_respects setoid predicate)
    (first_representative second_representative : Carrier)
    (representatives_are_equivalent :
      setoid.r first_representative second_representative) :
    predicate first_representative ↔ predicate second_representative
```
-/
theorem compatible_predicate_has_constant_truth_on_classes
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop)
    (predicate_is_compatible : predicate_respects setoid predicate)
    (first_representative second_representative : Carrier)
    (representatives_are_equivalent :
      setoid.r first_representative second_representative) :
    predicate first_representative ↔ predicate second_representative := by
  sorry

/--
**[Theorem — A Compatible Relation Descends to the Quotient]**

Mathematical statement (Lean): `theorem induced_relation_exists {Carrier : Type} (setoid : Setoid Carrier) (representative_relation : Carrier → Carrier → Prop) (representative_relation_respects : relation_respects setoid representative_relation) : ∃ quotient_relation : Quotient setoid → Q...`.

*Proof status:* proof pending


Logical form:

```lean
theorem induced_relation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_relation : Carrier → Carrier → Prop)
    (representative_relation_respects :
      relation_respects setoid representative_relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first_representative second_representative : Carrier,
        quotient_relation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) ↔
          representative_relation
            first_representative
            second_representative
```
-/
theorem induced_relation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_relation : Carrier → Carrier → Prop)
    (representative_relation_respects :
      relation_respects setoid representative_relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first_representative second_representative : Carrier,
        quotient_relation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) ↔
          representative_relation
            first_representative
            second_representative := by
  sorry

end LRA.NumberSystems.Foundations.Quotients
