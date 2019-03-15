

function my_colormap(img)
    
   imshow(img);
   ax = gca;
   colormap(ax,'hot');
   caxis(ax,[0 50]);
   colorbar;
   
    

end