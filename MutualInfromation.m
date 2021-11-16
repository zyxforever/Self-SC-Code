function NMI=MutualInfromation(A,B)
   if length( A ) ~= length( B)
      error('length( A ) must == length( B)');
   end
   total = length(A);
   A_ids = unique(A);
   B_ids = unique(B);
   AL=length(A_ids);
   BL=length(B_ids);
% Mutual information
  MI = 0;
  for i=1:AL
      idA = A_ids(i);
       for j=1:BL         
         idB = B_ids(j);
         idAOccur = find( A==idA );
         idBOccur = find( B==idB );
         idABOccur = intersect(idAOccur,idBOccur); 
         
         px = length(idAOccur)/total;
         py = length(idBOccur)/total;
         pxy = length(idABOccur)/total;
         
         MI = MI + pxy*log2(pxy/(px*py)+eps); % eps : the smallest positive number
       end
  end
  % Normalized Mutual information
  Hx = 0; % Entropies
  for i=1:AL
      idA = A_ids(i);
      idAOccurCount = length( find( A == idA ) );
      Hx = Hx - (idAOccurCount/total) * log2(idAOccurCount/total + eps);
  end
  Hy = 0; % Entropies
  for j=1:BL
      idB = B_ids(j);
      idBOccurCount = length( find( B == idB ) );
      Hy = Hy - (idBOccurCount/total) * log2(idBOccurCount/total + eps);
  end
  NMI = 2 * MI / (Hx+Hy);
end
