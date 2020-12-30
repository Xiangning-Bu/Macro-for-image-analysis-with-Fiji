//  invasion area measurement, nuclear count with or without mask

dir1=getDirectory('');
list1= getFileList (dir1);

       for (i=0; i<(list1.length); i++)
       {

				dir2 = dir1+list1[i]; 
				
				list2 = getFileList(dir2);				
		 
//				setBatchMode(true);
					
										        open(dir2+ "green.tif");
										        
//										         img = getImageID();
										        saveAs("Jpeg", dir2+"green.jpg");
										        open(dir2+ "green.tif");
//										        selectImage( img );
										        setAutoThreshold("Default dark");
												run("Threshold...");
//											manually record the invasion area, percentage
												waitForUser( "Set threshold and click OK." );
												
												saveAs("Jpeg", dir2+"invasion area.jpg");	
																		 
												run("Measure");
												waitForUser( "invasion area" );
												run("Create Mask");
												saveAs("Tiff", dir2+"mask.tif");
												run("Close");
												close();
												run("Close All");

												open(dir2+ "blue.tif");
												run("Brightness/Contrast...");
												waitForUser( "Set contrast" );
												saveAs("Jpeg", dir2+"blue.jpg");
												saveAs("Tiff", dir2+"blue.tif");
												run("TrackMate");
//	select estimated blob diameter, click next till to 	set filter on spots, manually record the cell number, then Ok
												waitForUser( "cell count" );
												saveAs("Jpeg", dir2+"number.jpg");
												
												run("Close");
												close();
												run("Close All");
 
												open(dir2+ "blue.tif");
												open(dir2+ "mask.tif");
											    imageCalculator("Multiply create 32-bit", "blue.tif","mask.tif");
												selectWindow("Result of blue.tif"); 
												saveAs("Jpeg", dir2+ "mask.jpg");
												 run("TrackMate");
//	select estimated blob diameter, click next till to 	set filter on spots, manually record the cell number, then Ok
												waitForUser( "cell count" );
												saveAs("Jpeg", dir2+"mask_number.jpg");
												run("Close");
												close();
												run("Close All");
												
												}
	
											}
		}
