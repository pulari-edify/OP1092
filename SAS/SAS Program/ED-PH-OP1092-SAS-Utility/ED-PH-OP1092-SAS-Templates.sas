/**************************************************************
* PROTOCOL ID                    : OP1092
* SPONSOR                        :  
* CRO                            : OPTIMED
* PROGRAM NAME                   : ED-PH-OP1092-SAS-Templates
* DATE                           : 27Dec2021
* AUTHOR                         : Pulari S R
* VALIDATED BY                   : 
* PLATFORM                       : SAS 9.2 Windows XP 
* VERSION INFORMATION            : V1.0
***************************************************************/


    /*To create new templates in a separate location, use this setting to first search your location*/

	ods path tempstr.mystore (update)  sashelp.tmplmst  (read);

    /* Template for Listings*/
	proc template;
		define style mystore.listingstyle/store=tempstr.mystore;
			parent = styles.rtf;

		replace fonts /
			'TitleFont2' = ("Tahoma",8pt)
			'TitleFont' = ("Tahoma",8pt)
			'StrongFont' = ("Tahoma",8pt)
			'EmphasisFont' = ("Tahoma",8pt)
			'FixedEmphasisFont' = ("Tahoma",8pt)
			'FixedStrongFont' = ("Tahoma",8pt)
			'FixedHeadingFont' = ("Tahoma",8pt)
			'BatchFixedFont' = ("Tahoma",8pt)
			'FixedFont' = ("Tahoma",8pt)
			'headingEmphasisFont' = ("Tahoma",8pt)
			'headingFont' = ("Tahoma",8pt)
			'docFont' = ("Tahoma",8pt)
			'FootFont' = ("Tahoma",8pt);

			style body from document /
			leftmargin = 0.50in
			rightmargin = 0.25in
			topmargin = 0.50in
			bottommargin = 0.50in;

			style pageno from pageno/
			foreground=white
			font_size=0.001pt;

			style SystemFooter from SystemFooter /
			font = fonts("FootFont")
			protectspecialchars=off;

			style systitleandfootercontainer/
			outputwidth=10.1in
			just=left;

			style table from table/
			frame=hsides
			rules=none;			

			style data from data/
			pretext="\li100 "
			font_size=8pt;

			style header from header/
			pretext="\li100 "
            background=white;	
		end;
	run;
	/**************END********************/

	/*Template for Tables*/
	proc template;
		define style mystore.tablestyle/store=tempstr.mystore;
			parent = styles.rtf;

		replace fonts /
			'TitleFont2' = ("Tahoma",8pt)
			'TitleFont' = ("Tahoma",8pt)
			'StrongFont' = ("Tahoma",8pt)
			'EmphasisFont' = ("Tahoma",8pt)
			'FixedEmphasisFont' = ("Tahoma",8pt)
			'FixedStrongFont' = ("Tahoma",8pt)
			'FixedHeadingFont' = ("Tahoma",8pt)
			'BatchFixedFont' = ("Tahoma",8pt)
			'FixedFont' = ("Tahoma",8pt)
			'headingEmphasisFont' = ("Tahoma",8pt)
			'headingFont' = ("Tahoma",8pt)
			'docFont' = ("Tahoma",8pt) 
			'FootFont' = ("Tahoma",8pt) ;

			style body from document /
			leftmargin = 0.50in
			rightmargin = 0.25in
			topmargin = 0.50in
			bottommargin = 0.50in;

			style PageNo from PageNo/
			font_size=0.001pt
			background=white
			foreground=white;

			style SystemFooter from SystemFooter /
			font = fonts("FootFont")
			protectspecialchars=off;

			style systitleandfootercontainer/
			outputwidth=10.1in
			just=left;

		end;
	run;
	/**************END********************/
