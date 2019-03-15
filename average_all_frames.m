function average_img = average_all_frames(video_obj)

    point1 = [40 71];
    point2 = [530 291];
    
    width = point2(1) - point1(1) + 1;
    height = point2(2) - point1(2) + 1;
    cnt = 0;
    average_img = uint16(zeros(height,width,3));
    while hasFrame(video_obj)
        frame = readFrame(video_obj);
        figure(1);
        imshow(frame);
        %output_path = 'C:/Users/qingwei/Desktop/iGEM/SUMMER/US_data/iGEM20181010US/processed/';
        %imwrite(frame,strcat(output_path,'frame.jpg'));
        average_img = average_img + uint16(frame(    point1(2):point2(2)     ,point1(1):point2(1),:));
        cnt = cnt+1;
        fprintf('%d\n',cnt);
    end
    
    average_img = uint8(double(average_img)/cnt);
    %imshow(uint8(average_img));
    
    %average_img = rgb2gray(average_img);

end 
