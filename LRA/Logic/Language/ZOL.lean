import LRA.Logic.Language.Propositional

namespace LRA.Logic

/--
Thin compatibility spine for zero-order/propositional languages. This gives the
public `LRA.Logic.Language` layer a uniform `ZOL`/`FOL`/`SOL` surface.
-/
abbrev ZOLLanguage := Propositional.PropositionalLanguage

end LRA.Logic
