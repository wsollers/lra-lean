import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.Order.Lattices.Lattice

/--
Statement: Natural divisibility forms a lattice, with `lcm` as join and `gcd`
as meet. The proof is deferred to the arithmetic development.

Logical form: divisibility is an `LRA.Order.Lattice`, every pair has `Nat.lcm`
as a join, and every pair has `Nat.gcd` as a meet.
-/
example :
    LRA.Order.Lattice (fun left right : Nat => left ∣ right) /\
      (forall left right,
        LRA.Order.Join (fun first second : Nat => first ∣ second)
          left right (Nat.lcm left right)) /\
      (forall left right,
        LRA.Order.Meet (fun first second : Nat => first ∣ second)
          left right (Nat.gcd left right)) := by
  sorry

end LRA.Order.Lattices.Lattice
