% platform: matlab 2016b

clear
clc

avi_path = 'C:/Users/qingwei/Desktop/iGEM/SUMMER/US_data/iGEM2018_10_10/export/';
intact_file_name = 'series1-6.avi';
collapse_file_name = 'series1-8.avi';
output_path = 'C:/Users/qingwei/Desktop/iGEM/SUMMER/US_data/iGEM2018_10_10/processed/';

% to read the video and compress the video into a photo
intact_vid_obj = VideoReader(strcat(avi_path, intact_file_name));
collapse_vid_obj = VideoReader(strcat(avi_path, collapse_file_name));
intact_img = average_all_frames(intact_vid_obj);
collapse_img = average_all_frames(collapse_vid_obj);

% to subtract the ROI of collapse img from that of the intact img
p_lt = [157 51];
p_rb = [204 103];
collapse_ROI = double(rgb2gray(crop_ROI(collapse_img,p_lt, p_rb)));
p_lt2 = [(p_lt(1)) (p_lt(2)+1)];
p_rb2 = [(p_rb(1)) (p_rb(2)+1)];
intact_ROI = double(rgb2gray(crop_ROI(intact_img,p_lt2, p_rb2)));
subtract_img = (intact_ROI- collapse_ROI);


[height, width] = size(subtract_img);
pseudo_color_img = zeros(height, width, 3);
c_min = 0;
c_max = 256;
cmap = colormap(hot(256));
for i = 1:height
    for j = 1:width
        scale = 256.0/(c_max - c_min); 
        if (subtract_img(i,j)<c_min)
            pseudo_color_img(i,j,:) = cmap(1,:); 
        else
            index = uint8( round( (subtract_img(i,j) - c_min )*scale )) + 1;
            pseudo_color_img(i,j,:) = cmap(index,:); 
        end
    end
end
pseudo_color_img = uint8(pseudo_color_img*256);

% to merge the pseudo-color img with the intact img
figure(4)
imshowpair(intact_ROI, pseudo_color_img,'blend');

% p_lt = [1 1];    % the left top point of ROI
% [height, width] = size(intact_img);
% p_rb = [height width];  % the right bottom point of ROI
% intact_ROI = rgb2gray(intact_img);
% collapse_ROI = rgb2gray(collapse_img);
% subtract_img = uint8((intact_ROI - collapse_ROI));

% to add pseudo-color(hot) to the subtract img

% % to show all the imgs
  figure(1)
  imshow(intact_img);
% % 
  figure(2)
  imshow(collapse_img);

figure(3)
imshow(pseudo_color_img);




%imwrite(intact_img,strcat(output_path,'intact.jpg'));
%imwrite(collapse_img,strcat(output_path,'collapse.jpg'));
%imwrite(merge_img,strcat(output_path,'ARG_bac_5_intestine_0.2_pseudo.jpg'));
%  print(4,'-dpng',strcat(output_path,'ARG2_colon_pseudo_color'));
intact_img = rgb2gray(intact_img);
collapse_img = rgb2gray(collapse_img);
[height, width] = size(intact_img);
%x = 157:204;

y_intact = intact_img(94,1:220);
y_collapse = collapse_img(94,1:220);
plot(x,y_intact,'b',x,y_collapse,'r');
legend('intact','collapse')



