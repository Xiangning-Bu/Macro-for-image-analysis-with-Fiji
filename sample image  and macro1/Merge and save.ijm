// Images process based on step1 ,  smooth, enhance contrast and overlay, need adjust the brightness for each images,
// before run the macro, find out the best brightness and contrast number for each color

dir1=getDirectory('');
list1= getFileList (dir1);
       for (i=0; i<(list1.length); i++)
       {

				dir2 = dir1+list1[i]; 
				list2 = getFileList(dir2);
				firstfile= dir2+list2[1];
		 
				setBatchMode(true);
						for (j=0; j<4; j++) {
		
							    filename = dir2 + list2[j];
								if (endsWith(filename, "tif")) {
			
										        open(dir2+ "blue.tif");
// manually input brightness and contrast number for blue 
										        setMinAndMax(30000, 52129);
								 
										        open(dir2+ "red.tif");
// manually input brightness and contrast number for red 										        
										        setMinAndMax(3000, 50000);
										        
										        open(dir2+ "green.tif");
// manually input brightness and contrast number for red 											        
										        setMinAndMax(3000, 50000);
												run("Merge Channels...", "c1=red.tif c2=green.tif c3=blue.tif create keep ignore");
												saveAs("Jpeg", dir2+"Composite.jpg");
												selectWindow("red.tif");
												saveAs("Jpeg", dir2+"red.jpg");
												selectWindow("green.tif");
												saveAs("Jpeg", dir2+"green.jpg");
												selectWindow("blue.tif");
												saveAs("Jpeg", dir2+"blue.jpg");
												run("Close All");
																}
	
											}
		}
