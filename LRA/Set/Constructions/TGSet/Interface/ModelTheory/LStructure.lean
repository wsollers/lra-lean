import LRA.Set.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.TGSet.Definition
import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.LStructure

namespace LRA.Set.Constructions.TGSet.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

abbrev MembershipSignature := LRA.Set.ModelTheory.MembershipSignature
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

end LRA.Set.Constructions.TGSet.Interface.ModelTheory
