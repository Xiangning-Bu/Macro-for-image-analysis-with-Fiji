// images stack and adjust

dir1=getDirectory('');
list1= getFileList (dir1);
       for (i=0; i<(list1.length); i++)
       {

				dir2 = dir1+list1[i]; 
				list2 = getFileList(dir2);
				firstfile= dir2+list2[1];
		 
				setBatchMode(true);
						for (j=0; j<3; j++) {
		
							    filename = dir2 + list2[j];
								if (endsWith(filename, "tif")) {
//			import nulcear images
										run("Image Sequence...", "open=dir2 file=w0000 sort");
										run("Z Project...", "projection=[Average Intensity]");
										run("Smooth");
										run("Enhance Contrast...", "saturated=0.3 normalize");
//										run("Subtract Background...", "rolling=50");
										saveAs("Tiff", dir2+"blue.tif");
										close();
//	Import 	invasion images								
 										run("Image Sequence...", "open=dir2 file=w0001 sort");
										run("Z Project...", "projection=[Average Intensity]");
										run("Smooth");
										run("Enhance Contrast...", "saturated=0.3 normalize");
										run("Subtract Background...", "rolling=50 light");
										saveAs("Tiff", dir2+"green.tif");
										close();

										
																}
	
											}
		}
