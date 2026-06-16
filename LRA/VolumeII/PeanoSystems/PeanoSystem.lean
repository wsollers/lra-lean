namespace Peano

structure PeanoSystem where
  carrier : Type
  one : carrier
  successor : carrier → carrier
  one_not_successor :
    ∀ element : carrier,
      successor element ≠ one
  successor_injective :
    ∀ first_element second_element : carrier,
      successor first_element = successor second_element →
      first_element = second_element
  induction :
    ∀ predicate : carrier → Prop,
      predicate one →
      (∀ element : carrier,
        predicate element →
        predicate (successor element)) →
      ∀ element : carrier,
        predicate element

def successor_closed_subset
    (ps : PeanoSystem)
    (subset : ps.carrier → Prop) : Prop :=
  ∀ element : ps.carrier,
    subset element →
    subset (ps.successor element)

def inductive_subset
    (ps : PeanoSystem)
    (subset : ps.carrier → Prop) : Prop :=
  subset ps.one ∧
    successor_closed_subset ps subset

def is_predecessor
    (ps : PeanoSystem)
    (predecessor element : ps.carrier) : Prop :=
  ps.successor predecessor = element

end Peano
