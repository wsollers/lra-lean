-- Proof-ready whole numbers by adjoining zero to a one-based Peano system.

import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace LRA.VolumeII.WholeNumbers

open PeanoSystems

structure Context where
  peano : PeanoSystem
  addition : peano.carrier → peano.carrier → peano.carrier
  multiplication : peano.carrier → peano.carrier → peano.carrier
  strictOrder : peano.carrier → peano.carrier → Prop

variable (context : Context)

abbrev Carrier := Option context.peano.carrier

def zero : Carrier context := none

def one : Carrier context := some context.peano.one

def embed (value : context.peano.carrier) : Carrier context := some value

def successor : Carrier context → Carrier context
  | none => one context
  | some value => some (context.peano.successor value)

def addition : Carrier context → Carrier context → Carrier context
  | none, right => right
  | left, none => left
  | some left, some right => some (context.addition left right)

def multiplication : Carrier context → Carrier context → Carrier context
  | none, _ => none
  | _, none => none
  | some left, some right => some (context.multiplication left right)

def strictOrder : Carrier context → Carrier context → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => context.strictOrder left right

def nonstrictOrder (left right : Carrier context) : Prop :=
  strictOrder context left right ∨ left = right

theorem decomposition (value : Carrier context) :
    value = zero context ∨ ∃ natural, value = embed context natural := by
  sorry

theorem embedded_natural_is_unique
    (value : Carrier context)
    (first second : context.peano.carrier)
    (first_represents : value = embed context first)
    (second_represents : value = embed context second) :
    first = second := by
  sorry

theorem induction
    (predicate : Carrier context → Prop)
    (zero_case : predicate (zero context))
    (successor_case : ∀ value, predicate value → predicate (successor context value)) :
    ∀ value, predicate value := by
  sorry

theorem arithmetic_laws :
    (∀ value, addition context (zero context) value = value) ∧
    (∀ value, multiplication context (one context) value = value) ∧
    (∀ value, multiplication context (zero context) value = zero context) ∧
    (∀ first second third,
      multiplication context first (addition context second third) =
        addition context
          (multiplication context first second)
          (multiplication context first third)) := by
  sorry

theorem order_laws :
    (∀ value, nonstrictOrder context (zero context) value) ∧
    (∀ first second,
      strictOrder context first second ∨ first = second ∨ strictOrder context second first) := by
  sorry

end LRA.VolumeII.WholeNumbers
