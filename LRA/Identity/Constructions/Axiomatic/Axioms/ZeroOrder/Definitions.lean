namespace LRA.Identity.Constructions.Axiomatic.ZeroOrder

/-- Identity at the pure-syntax level is literal syntactic equality. -/
abbrev SyntacticIdentity {Formula : Type} : Formula -> Formula -> Prop := Eq

end LRA.Identity.Constructions.Axiomatic.ZeroOrder
