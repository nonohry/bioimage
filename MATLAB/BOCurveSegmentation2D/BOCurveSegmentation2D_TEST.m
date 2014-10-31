function BOCurveSegmentation2D_TEST() 
%% RUN
M = curveCircle2('close');
S = BOCurveSegmentation2D(M);
%% Plot
plot(M(:,1), M(:,2),'*'); hold on
plot(M(S(:),1), M(S(:),2),'ro','LineWidth',2,'MarkerEdgeColor','r','MarkerSize',10); 

%% SUB-FUNCTIONS
%% curve
    function M = curveCircleIm(type)
        im = imread('./images/curve.tif');
        [x,y] = BOFindContour2D(im,type);
        M = [y,x];         
    end
%% curve
    function M = curveCircle2(type)
        s = 50;
        im = zeros(s,s);
        im(20,20) = 1;
        imD = imdilate(im,strel('disk',17));
        imE = imerode(imD,strel('disk',1));
        im = imsubtract(imD,imE);
        [x,y] = BOFindContour2D(im,type);
        M = [y,x];         
    end
%% curve
    function M = curve8(type)
        im=zeros(5,5);
        im(1,1) = 1;
        im(2,1) = 1;
        im(3,1) = 1;
        im(4,1) = 1;
        im(5,1) = 1;
        [x,y] = BOFindContour2D(im,type);
        M = [y,x];         
    end
%% curve
    function M = curve9(type)
        im=zeros(5,5);
        im(1,1) = 1;
        im(2,2) = 1;
        im(3,3) = 1;
        im(4,4) = 1;
        im(5,5) = 1;
        [x,y] = BOFindContour2D(im,type);
        M = [y,x];         
    end
%% curve
    function M = curveCircle(type)
        im=zeros(10,10);
        im(3,1) = 1;
        im(4,1) = 1;
        im(5,1) = 1;
        im(2,2) = 1;
        im(6,2) = 1;
        im(1,3) = 1;
        im(7,3) = 1;
        im(1,4) = 1;
        im(7,4) = 1;
        im(1,5) = 1;
        im(7,5) = 1;        
        im(2,6) = 1;        
        im(6,6) = 1;        
        im(3,7) = 1;        
        im(4,7) = 1;        
        im(5,7) = 1;        
        [x,y] = BOFindContour2D(im,type);
        M = [y,x];         
    end
%% curve2
    function M = curve10(type)
        im=zeros(10,10);
        im(1,1) = 1;
        im(2,1) = 1;
        im(3,2) = 1;
        im(4,2) = 1;
        im(5,2) = 1;
        im(6,2) = 1;
        im(7,3) = 1;
        im(8,3) = 1;
        im(9,3) = 1;
        im(10,4) = 1;
        im(11,4) = 1;
        im(12,4) = 1;
        im(13,5) = 1;        
        [x,y] = BOFindContour2D(im,type);
        M = [y,x];         
    end

%%
end