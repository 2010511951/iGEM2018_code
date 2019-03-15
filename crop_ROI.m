

function out = crop_ROI(img,p_lt, p_rb)

   
    out = img( p_lt(2):p_rb(2), p_lt(1):p_rb(1), :  );
   
end