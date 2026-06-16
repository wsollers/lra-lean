import LRA.VolumeII.PeanoSystems.Recursion

namespace Peano

noncomputable def plus
    (ps : PeanoSystem)
    (left_input right_input : ps.carrier) :
    ps.carrier :=
  iter
    ps
    ps.carrier
    (ps.successor left_input)
    ps.successor
    right_input

theorem plus_base
    (ps : PeanoSystem)
    (left_input : ps.carrier) :
    plus ps left_input ps.one =
      ps.successor left_input :=
  iter_base
    ps
    ps.carrier
    (ps.successor left_input)
    ps.successor

theorem plus_step
    (ps : PeanoSystem)
    (left_input right_input : ps.carrier) :
    plus ps left_input (ps.successor right_input) =
      ps.successor (plus ps left_input right_input) :=
  iter_step
    ps
    ps.carrier
    (ps.successor left_input)
    ps.successor
    right_input

theorem addition_is_associative
    (ps : PeanoSystem)
    (left_input middle_input right_input : ps.carrier) :
    plus ps (plus ps left_input middle_input) right_input =
      plus ps left_input (plus ps middle_input right_input) := by

  exact
    induction_principle
      ps
      (fun current_right_input : ps.carrier =>
        plus ps (plus ps left_input middle_input) current_right_input =
          plus ps left_input (plus ps middle_input current_right_input))
      (by
        change
          plus ps (plus ps left_input middle_input) ps.one =
            plus ps left_input (plus ps middle_input ps.one)
        rw [
          plus_base ps (plus ps left_input middle_input),
          plus_base ps middle_input,
          plus_step ps left_input middle_input
        ])
      (by
        intro current_right_input induction_hypothesis
        change
          plus ps (plus ps left_input middle_input) (ps.successor current_right_input) =
            plus ps left_input
              (plus ps middle_input (ps.successor current_right_input))
        rw [
          plus_step ps (plus ps left_input middle_input) current_right_input,
          plus_step ps middle_input current_right_input,
          plus_step ps left_input (plus ps middle_input current_right_input),
          induction_hypothesis
        ])
      right_input

end Peano
