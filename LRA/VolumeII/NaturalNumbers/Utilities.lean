import LRA.VolumeII.PeanoSystems.Recursion

namespace Peano

noncomputable def is_odd (ps : PeanoSystem) (n : ps.carrier) : Bool :=
  iter ps Bool true Bool.not n

noncomputable def is_even (ps : PeanoSystem) (n : ps.carrier) : Bool :=
  iter ps Bool false Bool.not n

theorem is_odd_base (ps : PeanoSystem) :
    is_odd ps ps.one = true :=
  iter_base ps Bool true Bool.not

theorem is_odd_step (ps : PeanoSystem) (n : ps.carrier) :
    is_odd ps (ps.successor n) = Bool.not (is_odd ps n) :=
  iter_step ps Bool true Bool.not n

theorem is_even_base (ps : PeanoSystem) :
    is_even ps ps.one = false :=
  iter_base ps Bool false Bool.not

theorem is_even_step (ps : PeanoSystem) (n : ps.carrier) :
    is_even ps (ps.successor n) = Bool.not (is_even ps n) :=
  iter_step ps Bool false Bool.not n

theorem is_even_complement (ps : PeanoSystem) (n : ps.carrier) :
    is_even ps n = Bool.not (is_odd ps n) := by
  sorry

noncomputable def string_rep
    (ps : PeanoSystem)
    (s : List Char)
    (n : ps.carrier) : List Char :=
  iter ps (List Char) s (fun prev => prev ++ s) n

theorem string_rep_base (ps : PeanoSystem) (s : List Char) :
    string_rep ps s ps.one = s :=
  iter_base ps (List Char) s (fun prev => prev ++ s)

theorem string_rep_step
    (ps : PeanoSystem) (s : List Char) (n : ps.carrier) :
    string_rep ps s (ps.successor n) = string_rep ps s n ++ s :=
  iter_step ps (List Char) s (fun prev => prev ++ s) n

end Peano
