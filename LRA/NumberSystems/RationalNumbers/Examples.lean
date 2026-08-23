import LRA.NumberSystems.Integers.Examples
import LRA.NumberSystems.Integers.Constructions.Tao.Instances
import LRA.NumberSystems.Integers.Constructions.Mendelson.Instances
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.Examples

open LRA.NumberSystems.Integers
open LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

   
                                                                                
                                                                               
                                                 
  

section MathlibIntegers

                                                                           
       

             

       
                                       
                                                  
                          
                                   
                                                                         
                        
   
  
noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

                                                                              

             

       
                                                
                                                  
                          
                                   
                                                                         
                                                                            
                                                                    
   
  
theorem MathlibRationalSystemUsesMathlibIntegers
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    (MathlibRationalSystem rationalData usesMathlibIntegers).IntegerSystem =
      LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem := by

                                                                              

             

       
                                                
                                                  
                          
                                   
                                                                         
                                                                            
                                                                    
   
  
  sorry

end MathlibIntegers

section TaoIntegers

                                                                        
                                                                               
                                                                  

             

       
                                        
                                                                    
                       
   
  
noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem :=
  Classical.choose (Tao.TaoRealizesIntegerNumberSystem wholeData)

                                                                               

             

       
                                   
                                                                  
                                                  
                      
                                                                       
                        
   
  
noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

                                                                               
                        

             

       
                                        
                                                                  
                                                  
                      
                                                                       
                                                                              
                                      
   
  
theorem TaoRationalSystemUsesTaoIntegers
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    (TaoRationalSystem wholeData rationalData usesTaoIntegers).IntegerSystem =
      TaoIntegerNumberSystem wholeData := by

                                                                               
                        

             

       
                                        
                                                                  
                                                  
                      
                                                                       
                                                                              
                                      
   
  
  sorry

end TaoIntegers

section MendelsonIntegers

                                                                         
             

             

       
                                              
                                                                            
   
  
noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem :=
  Classical.choose (Mendelson.MendelsonRealizesIntegerNumberSystem positiveData)

                                                                             
       

             

       
                                         
                                                      
                                                  
                            
                                                                                
                        
   
  
noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

                                                                            
                                       

             

       
                                                    
                                                      
                                                  
                            
                                                                                
                                                      
                                            
                                                 
   
  
theorem MendelsonRationalSystemUsesMendelsonIntegers
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    (MendelsonRationalSystem positiveData rationalData
      usesMendelsonIntegers).IntegerSystem =
        MendelsonIntegerNumberSystem positiveData := by

                                                                            
                                       

             

       
                                                    
                                                      
                                                  
                            
                                                                                
                                                      
                                            
                                                 
   
  
  sorry

end MendelsonIntegers

end LRA.NumberSystems.RationalNumbers.Examples
