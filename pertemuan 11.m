[bw,num] = bwlabel(bw);
bbox = zeros(num,4);
RGB4 = I;
  
for k = 1:num
    bw2 = bw==k;
    [B,L] = bwboundaries(bw2,'noholes');
    stats = regionprops(L,'All');
    perimeter = cat(1,stats.Perimeter);
    area = cat(1,stats.Area);
    eccentricity = cat(1,stats.Eccentricity);
    metric = 4*pi*area/perimeter^2;
    bbox(k,:) = cat(1,stats.BoundingBox);
      
    boundary = B{1};
    position = [boundary(1,2),boundary(1,1)-60;boundary(1,2),boundary(1,1)-30;...
        boundary(1,2),boundary(1,1);boundary(1,2),boundary(1,1)+30;boundary(1,2),boundary(1,1)+60];
    box_color = {'yellow','red','green','blue','cyan'};
      
    text_str = cell(5,1);
    text_str{1} = ['Label: ' num2str(k)];
    text_str{2} = ['Area: ' num2str(area,'%0.2f')];
    text_str{3} = ['Perimeter: ' num2str(perimeter,'%0.2f')];
    text_str{4} = ['Metric: ' num2str(metric,'%0.2f')];
    text_str{5} = ['Eccentricity: ' num2str(eccentricity,'%0.2f')];
      
    RGB3 = insertShape(RGB4, 'Rectangle', bbox(k,:), 'LineWidth', 4);
    RGB4 = insertText(RGB3,position,text_str,'FontSize',16,'BoxColor',box_color,'BoxOpacity',0.8,'TextColor','white');
      
    figure, imshow(RGB3);
    figure, imshow(RGB4);    
end
  
RGB5 = insertShape(I, 'Rectangle', bbox, 'LineWidth', 4);
figure, imshow(RGB5);
