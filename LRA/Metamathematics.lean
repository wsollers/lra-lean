import LRA.Metamathematics.Notation
import LRA.Metamathematics.DeclarationKeywords
import LRA.Metamathematics.SyntacticCategory
import LRA.Metamathematics.StructuralIdentity
import LRA.Metamathematics.ObjectMetaDistinction
import LRA.Metamathematics.FiniteSyntacticCollection
import LRA.Metamathematics.SubstitutionSafety
import LRA.Metamathematics.MetatheoremTargets

/-!
Metamathematics aggregate.

`LRA.Metamathematics` collects syntactic/metatheoretic infrastructure that
sits conceptually prior to, and is shared as a root dependency by, every
sub-theory `LRA.Logic` goes on to define (Language/Syntax, Model/
Semantics, and Proof alike) -- it is not a linear predecessor to only one
of them.

Contents:

- `Notation` -- bare symbol-notation types (`LogicalConnective`,
  `LogicalEquality`, `LogicalQuantifier`).
- `DeclarationKeywords` -- the custom `proposition`/`corollary`
  declaration-command macros used throughout the repository.
- `SyntacticCategory` -- the schema that any syntactic category (a type
  of variable, function symbol, relation symbol, ...) must carry
  decidable equality, stated independently of how many such categories
  a given proof system distinguishes (contrast `LRA.Logic.Syntax
  .FirstOrder`'s single `Variable` type against `LRA.Logic.Proof.System
  .Takeuti.Alphabet`'s separate `FreeVar`/`BoundVar`).
- `StructuralIdentity` -- the schema that syntactic identity of an
  inductively-defined expression type is decidable constructor equality;
  flags that no concrete syntax type in `LRA.Logic` currently derives
  this.
- `ObjectMetaDistinction` -- the object-theory/metatheory distinction
  itself: a `Formula` is a metatheoretic (Lean) object; the symbols it
  contains (e.g. `Formula.equal`'s `=`) are uninterpreted until a model
  supplies meaning.
- `FiniteSyntacticCollection` -- `MetaCollection`, a deliberately
  foundation-cheap `List`-backed stand-in for "a finite collection of
  symbols," used so this subject never has to borrow `Mathlib`'s `Set`
  (which presupposes impredicative comprehension) or `LRA.Set` (a full
  object-level theory that itself depends on `LRA.Logic`, which would
  make depending on it here circular in the conceptual sense) just to
  state a free-variable-collection schema.
- `SubstitutionSafety` -- the schema that a substitution operation must
  be paired with both a safety predicate AND a theorem that substituting
  under that predicate avoids variable capture; flags that
  `LRA.Logic.Syntax.FirstOrder.IsSubstitutable` currently supplies only
  the former, disconnected from `substitute` itself.
- `MetatheoremTargets` -- soundness and completeness stated generically,
  parametric over an arbitrary provability/satisfaction pairing, as
  named forward references for whichever proof system (Takeuti or a
  successor) eventually discharges them.

These are metatheoretic in the sense that they describe the language(s)
and proof system(s) `LRA.Logic` defines and their presentation, not facts
stated or proved *within* any one object language.
-/
