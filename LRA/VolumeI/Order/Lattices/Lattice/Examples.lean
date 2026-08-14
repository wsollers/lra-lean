import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.VolumeI.Order.Lattices.Lattice

/-- Natural divisibility forms a lattice, with `lcm` as join and `gcd` as
meet. The proof is deferred to the arithmetic development. -/
theorem NaturalDivisibilityIsLattice :
    LRA.VolumeI.Order.Lattice (fun left right : Nat => left ∣ right) /\
      (forall left right,
        LRA.VolumeI.Order.Join (fun first second : Nat => first ∣ second)
          left right (Nat.lcm left right)) /\
      (forall left right,
        LRA.VolumeI.Order.Meet (fun first second : Nat => first ∣ second)
          left right (Nat.gcd left right)) := by
  sorry

end LRA.VolumeI.Order.Lattices.Lattice
