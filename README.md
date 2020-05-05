# Protein_Folding
                                    Protein Folding through Monte Carlo Simulations
                                    
Given a protein conformation, I formed a canvas of 40X40 of zeros and inserted my original protein conformation matrix to it and calculated its initial interaction energy .Then with the help of for loop I generated a random no. which means I picked one random residue and checked whether it would perform end move or crank shaft move. After doing the move, I checked whether the move is accepted or not with the help Boltzmann weight.
If for a particular move, Boltzmann weight is greater than 1 then the move is accepted, If it’s less than 1, then we generated a random no. between 0 and 1. If Boltzmann weight is greater than random no. then that move is accepted, if less than random no. then rejected.
Based on above criteria protein gets unfold.   
