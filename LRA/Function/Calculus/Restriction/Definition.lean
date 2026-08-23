import LRA.Function.Definition
import LRA.Relation.Calculus.Restriction.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Function

open LRA.Set
universe u v w

                                                                               
def RestrictsTo
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : LRA.Function Subdomain Codomain)
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) : Prop :=
  ∀ input, restricted input = original (inclusion input)

                                                            
def Restriction
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) :
    LRA.Function Subdomain Codomain :=
  fun input => original (inclusion input)

                                                                   
def Extends
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (extension : LRA.Function LargeDomain Codomain)
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∀ input, extension (inclusion input) = original input

                                                          
abbrev RestrictDomainGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (source : SetClass Domain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictDomain (Graph function) source

                                                          
abbrev RestrictCodomainGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictCodomain (Graph function) target

                                                                     
abbrev RestrictGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.Restrict (Graph function) source target

end LRA.Function
