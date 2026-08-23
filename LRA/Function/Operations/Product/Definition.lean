import LRA.Function.Definition

namespace LRA.Function

universe u v w

                                                      
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function (Left × Right) Codomain

                                 
abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

                                                  
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => function (left, right)

                                 
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2

                                                 
def FirstProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Left :=
  fun pair => pair.1

                                                  
def SecondProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Right :=
  fun pair => pair.2

                                                                              
def Product
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain) :
    LRA.Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Function
