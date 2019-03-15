p_lt = [1 1];    % the left top point of ROI
 p_rb = [118 27];  % the right bottom point of ROI
 
 
 mse = zeros(21,21);
 for i=10:-1:0
     collapse_ROI = double(rgb2gray(crop_ROI(collapse_img,p_lt, p_rb)));
     p_lt2 = [p_lt(1) (p_lt(2)+i)];
     p_rb2 = [p_rb(1) (p_rb(2)+i)];
     intact_ROI = double(rgb2gray(crop_ROI(intact_img,p_lt2, p_rb2)));
     subtract_img = (intact_ROI- collapse_ROI);
     
     mse(11-i) = sum(sum(subtract_img.^2));
     
     figure(1)
     subplot(2,1,1);imshow(uint8(intact_ROI));
     subplot(2,1,2);imshow(uint8(collapse_ROI));
     
 end
 
 
 
 for i=1:10
     p_lt2 = [p_lt(1) (p_lt(2)+i)];
     p_rb2 = [p_rb(1) (p_rb(2)+i)];
     intact_ROI = double(rgb2gray(crop_ROI(intact_img,p_lt, p_rb)));
     collapse_ROI = double(rgb2gray(crop_ROI(collapse_img,p_lt2, p_rb2)));
     subtract_img = (intact_ROI- collapse_ROI);
     mse(i+11) = sum(sum(subtract_img.^2));
     
 end
 
 
 figure(2)
 plot(-10:10,mse);
 
