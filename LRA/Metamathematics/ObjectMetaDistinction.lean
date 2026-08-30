namespace LRA.Metamathematics

/-!
`ObjectMetaDistinction` states, once and permanently, the single
distinction every later file in `LRA.Logic`, `LRA.Identity`, and every
downstream volume silently relies on: the difference between an OBJECT
THEORY (a formal language and the sentences it lets you write) and the
METATHEORY (the mathematics, done in Lean, used to talk ABOUT that
language and prove things about it).

Concretely, and this is the load-bearing example the whole repository
turns on:

- A value of `LRA.Logic.Syntax.FirstOrder.Formula S Variable` is a
  METATHEORETIC object -- a Lean term, built by Lean's own inductive
  machinery, that you can pattern-match on, compare structurally
  (`StructuralIdentity`), and recurse over.
- The constructor `Formula.equal t1 t2` builds a formula whose intended
  reading is "t1 equals t2" -- but the `=` this names is an OBJECT-
  LANGUAGE SYMBOL, uninterpreted at the point the `Formula` is
  constructed. It carries no meaning until a `Model` (an interpretation)
  says what `Formula.equal` is satisfied by. Before that, `Formula.equal
  t1 t2` is exactly as meaningless, and exactly as meaningful, as any
  other formula built from the same signature's other relation symbols.
- `LRA.Identity.IdentityRelation`'s `Ident`, by contrast, IS a semantic,
  object-language-flavored notion -- it is what a `Model`'s
  interpretation of an equality-flavored relation symbol is required to
  satisfy, and it lives downstream of `LRA.Logic`'s syntax/model
  machinery precisely because it presupposes that machinery already
  exists (`LRA.Identity.Interface.ModelTheory.LStructure` imports
  `LRA.Logic.Language.FirstOrder.Signature` directly).

Failing to keep these separate is the single most common confusion in a
first encounter with formal logic: treating the SYMBOL `=` appearing
inside a formula as if it already meant something, before any model has
been supplied. This file exists so that every later definition can cite
`ObjectMetaDistinction` by name instead of re-explaining the distinction,
or -- worse -- silently blurring it.

This file is intentionally free of new mathematical content: the
distinction is conceptual, not a theorem to prove. The one formal
artifact below exists only to give the distinction a citable name.
-/

/-- A tag-level marker distinguishing "this `Prop`/value is metatheoretic
content" from "this represents an object-language expression, awaiting
interpretation." Carries no data; its only role is to let later
doc-comments and definitions say `ObjectLevel` or `MetaLevel` and mean
something precise, rather than relying on prose alone. -/
inductive DiscourseLevel where
  | ObjectLevel
  | MetaLevel

/-- The defining asymmetry: an object-level formula's meaning is always
RELATIVE TO a supplied interpretation, whereas a metatheoretic fact about
that formula (its shape, whether it is well-formed, whether two formulas
are structurally identical) holds independently of any interpretation.
Stated here as a `Prop`-valued definition schema -- `HasObjectMeaning`
below is instantiated, per formula language, once that language's model
notion exists (`LRA.Logic.FirstOrder.Model`, `LRA.Logic.Model.Propositional`,
etc.) -- not proved generically here, since "meaning" is necessarily
language-specific. -/
def RequiresInterpretation (_level : DiscourseLevel) : Prop :=
  match _level with
  | .ObjectLevel => True
  | .MetaLevel => False

end LRA.Metamathematics
