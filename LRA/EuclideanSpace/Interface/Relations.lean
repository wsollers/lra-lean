namespace LRA.EuclideanSpace

universe u

   
                                                                      
                                                                  
                                                                       
                                                                     
                                                                      
                                                       
  

                                                   
class Between (Point : Type u) where
  between : Point → Point → Point → Prop

                                                          
class Congruent (Point : Type u) where
  congruent : Point → Point → Point → Point → Prop

export Between (between)
export Congruent (congruent)

end LRA.EuclideanSpace
