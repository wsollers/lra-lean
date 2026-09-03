import LRA.Set.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.TGSet.Definition
import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Axioms
import LRA.Set.Constructions.GrothendieckUniverse.Definitions

/-!
TGSet's model-theory interface: the TG carrier as an `L_∈`-structure, plus
TGSet's actual export over ZFCSet's theory — the TG universe axiom and its
associated internal-universe predicate.
-/

namespace LRA.Set.Constructions.TGSet.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

abbrev PureMembershipSignature :=
  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature

abbrev TGSetObject := LRA.Set.Constructions.TGSet

/--
The ambient `L_∈`-structure for TG set theory uses the TG carrier with the
standard membership relation.
-/
abbrev TGAmbientLStructure := TGSetObject

abbrev InternalUniverseLStructure :=
  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure

/--
The TG-specific universe axiom: every set is contained in some Grothendieck
universe.
-/
abbrev TGUniverseAxiom :=
  LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom TGSetObject

/--
`TGUniversePredicate A U` is the internal universe predicate used by TG for a
universe `U` containing the parameter set `A`.
-/
abbrev TGUniversePredicate (A U : TGSetObject) : Prop :=
  LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U

/--
Interface-level notion of satisfying TG: the ambient structure satisfies ZFC and
supports the universe axiom.
-/
def SatisfiesTGTheory (model : Model MembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory ∧ TGUniverseAxiom

end LRA.Set.Constructions.TGSet.Interface.ModelTheory
