import LRA.VolumeII.NaturalNumbers.Addition

namespace Peano

noncomputable def mul
    (ps : PeanoSystem)
    (left_input right_input : ps.carrier) : ps.carrier :=
  iter
    ps ps.carrier
    left_input
    (fun prev => plus ps prev left_input)
    right_input

theorem mul_base
    (ps : PeanoSystem)
    (left_input : ps.carrier) :
    mul ps left_input ps.one = left_input :=
  iter_base ps ps.carrier left_input
    (fun prev => plus ps prev left_input)

theorem mul_step
    (ps : PeanoSystem)
    (left_input right_input : ps.carrier) :
    mul ps left_input (ps.successor right_input) =
      plus ps (mul ps left_input right_input) left_input :=
  iter_step ps ps.carrier left_input
    (fun prev => plus ps prev left_input)
    right_input

theorem mul_unique
    (ps : PeanoSystem)
    (left_input : ps.carrier)
    (f g : ps.carrier → ps.carrier)
    (hf : satisfies_iterator_clauses
            ps ps.carrier left_input
            (fun prev => plus ps prev left_input) f)
    (hg : satisfies_iterator_clauses
            ps ps.carrier left_input
            (fun prev => plus ps prev left_input) g) :
    ∀ n : ps.carrier, f n = g n :=
  iterator_function_unique
    ps ps.carrier left_input
    (fun prev => plus ps prev left_input) f g hf hg

theorem mul_one_left
    (ps : PeanoSystem) (right_input : ps.carrier) :
    mul ps ps.one right_input = right_input := by
  sorry

theorem mul_associative
    (ps : PeanoSystem) (x y z : ps.carrier) :
    mul ps (mul ps x y) z = mul ps x (mul ps y z) := by
  sorry

theorem mul_distrib_add
    (ps : PeanoSystem) (x y z : ps.carrier) :
    mul ps x (plus ps y z) =
      plus ps (mul ps x y) (mul ps x z) := by
  sorry

theorem mul_commutative
    (ps : PeanoSystem) (x y : ps.carrier) :
    mul ps x y = mul ps y x := by
  sorry

end Peano
