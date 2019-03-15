clear
clc

arg1_top = imread('arg1-top.jpg');
arg1_mid = imread('arg1-1.jpg');

arg1_top_1 = arg1_top(65:165,100:200); sum_top1 = sum(arg1_top_1(:));
arg1_top_2 = arg1_top(65:165,370:470); sum_top2 = sum(arg1_top_2(:));
arg1_top_3 = arg1_top(70:170,690:790); sum_top3 = sum(arg1_top_3(:));

arg1_mid_1 = arg1_mid(185:285,100:200); sum_mid1 = sum(arg1_mid_1(:));
arg1_mid_2 = arg1_mid(190:290,270:370); sum_mid2 = sum(arg1_mid_2(:));
arg1_mid_3 = arg1_mid(200:300,745:845); sum_mid3 = sum(arg1_mid_3(:));

figure(1)
subplot(2,3,1);imshow(arg1_top_1);
subplot(2,3,2);imshow(arg1_top_2);
subplot(2,3,3);imshow(arg1_top_3);
subplot(2,3,4);imshow(arg1_mid_1);
subplot(2,3,5);imshow(arg1_mid_2);
subplot(2,3,6);imshow(arg1_mid_3);

contrast_ratio = (sum_mid1/sum_top1 + sum_mid2/sum_top2 + sum_mid3/sum_top3)/3




