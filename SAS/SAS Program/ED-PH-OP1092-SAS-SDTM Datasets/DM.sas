
/**************************************************************
* PROTOCOL ID                    : JP-2266-101-FIH / OP109219.JEI
* SPONSOR                        : JEIL Pharmaceutical Co., Ltd.
* CRO                            : EUROFINS OPTIMED 
* PROGRAM NAME                   : DM.sas
* DESCRIPTION                    : Demographics 
* DATE                           : 06-01-2022
* AUTHOR                         : Ivy Mathew
* VALIDATED BY                   : 
* MACROS USED                    : 
* OUTPUT                         : DM.sas7bdat
* PLATFORM                       : SAS 9.4 Windows XP 
* VERSION INFORMATION            : V1.0
* REVISION HISTORY               :   
***************************************************************/

   /*Clear the work library */

	proc delete data= work._all_;
	run;

/* Collecting info from Rep_dm Rep_ex Rep_ex1 Rep_ds Rep_sv Rep_icf Rep_icfeg*/

	proc sort data=Raw.Rep_dm out=dm1(rename=(DMAGE=AGE));
		by SUBJID SUBJRANDNO SUBJEVENTNAME;
	run;

	Data EX;
		length SUBJEVENTNAME1 $11;
		set Raw.Rep_ex;
		SUBJEVENTNAME1=SUBJEVENTNAME;
		if SUBJEVENTNAME="P1 D1" and EXDOSE in(5,10,40) and not missing (EXDTC) then RFENDTC=CATX("T",put(input(EXDTC,date11.), is8601da.),EXTMC);
		If SUBJEVENTNAME="P2 D1" and EXDOSE =20 and not missing (EXDTC) then RFENDTC=CATX("T",put(input(EXDTC,date11.), is8601da.),EXTMC);
  		RFXENDTC=RFENDTC;
		if RFENDTC^="";
		drop SUBJEVENTNAME;
	run;

	Data EX1;
		length SUBJEVENTNAME1 $11;
		set Raw.Rep_ex1;
		SUBJEVENTNAME1=SUBJEVENTNAME;
		If SUBJEVENTNAME="P1 D-1" and EXDOSE in(5,10,40,20) and not missing (EXDTC) then RFSTDTC=CATX("T",put(input(EXDTC,date11.), is8601da.),EXTMC);
		RFXSTDTC=RFSTDTC;
		if RFSTDTC^="";
		drop SUBJEVENTNAME;
	run;

	proc sort data=EX(rename=(SUBJEVENTNAME1=SUBJEVENTNAME));
		by SUBJID SUBJRANDNO;
	run;

	proc sort data=EX1(rename=(SUBJEVENTNAME1=SUBJEVENTNAME));
		by SUBJID SUBJRANDNO;
	run;

	Data EXMER;
		length ARM $50 ARMCD $30;
		merge EX EX1;
		by SUBJID SUBJRANDNO;
		if SUBJEVENTNAME="P1 D1" and EXDOSE=5        then do;ARMCD="P-JP5";  ARM="Placebo-JP2266 5mg";   end;
		else if SUBJEVENTNAME="P1 D-1" and EXDOSE=5  then do;ARMCD="P-P5";   ARM="Placebo-Placebo 5mg";  end;
		else if SUBJEVENTNAME="P1 D1" and EXDOSE=10  then do;ARMCD="P-JP10"; ARM="Placebo-JP2266 10mg";  end;
		else if SUBJEVENTNAME="P1 D-1" and EXDOSE=10 then do;ARMCD="P-P10";  ARM="Placebo-Placebo 10mg"; end;
		else if SUBJEVENTNAME="P1 D1" and EXDOSE=20  then do;ARMCD="P-JP20"; ARM="Placebo-JP2266 20mg";  end;
		else if SUBJEVENTNAME="P1 D-1" and EXDOSE=20 then do;ARMCD="P-P20";  ARM="Placebo-Placebo 20mg"; end;
		else if SUBJEVENTNAME="P2 D1" and EXDOSE=20  then do;ARMCD="P-JP20"; ARM="Placebo-JP2266 20mg";  end;
		else if SUBJEVENTNAME="P2 D-1" and EXDOSE=20 then do;ARMCD="P-P20";  ARM="Placebo-Placebo 20mg"; end;
        else if SUBJEVENTNAME="P1 D1" and EXDOSE=40  then do;ARMCD="P-JP40"; ARM="Placebo-JP2266 40mg";  end;
		else if SUBJEVENTNAME="P1 D-1" and EXDOSE=40 then do;ARMCD="P-P40";  ARM="Placebo-Placebo 40mg"; end;
   run;

   proc sort data=Raw.Rep_ds out=ds1;
		by SUBJID SUBJRANDNO SUBJEVENTNAME;
	run;

	proc sort data=Raw.Rep_icf out=icf1;
		by SUBJID SUBJRANDNO SUBJEVENTNAME ;
	run;

	proc sort data=Raw.Rep_icfeg out=icfeg1(rename=(ICFSTAT=ICFSTAT1 ICFDTC=ICFDTC1));
		by SUBJID SUBJRANDNO SUBJEVENTNAME ;
	run;

	proc sort data=Raw.Rep_sv out=sv1 nodupkey;
		by SUBJID SUBJRANDNO SUBJEVENTNAME;
		where SUBJEVENTNAME="Screening";
	run;

	data DM2;
		merge dm1(in=a) icf1 icfeg1 sv1 ;
		by SUBJID SUBJRANDNO SUBJEVENTNAME ;
		if a;
		DOMAIN= "DM";
		SITEID= "001";
		USUBJID= catx("-",STUDYID,SITEID,SUBJID);
		INVNAM= "Yves DONAZZOLO";
		AGEU= "YEARS";
		SEX= "M";
		RACE= "";
		COUNTRY= "FRA";
		if not missing (ICFDTC) then RFICDTC= put(input(ICFDTC,date11.), is8601da.);
		if not missing (SVDTC)  then DMDTC= put(input(SVDTC,date11.), is8601da.);
		run;
		
	data DM3;
		merge DM2(in=a)EXMER DS1;
		by SUBJID SUBJRANDNO;
		if a;
        ACTARM= STRIP(ARM);
		ACTARMCD= STRIP(ARMCD);
		if not missing (DSDTC)  then RFPENDTC= put(input(DSDTC,date11.), is8601da.);
		if RFPENDTC= "" then RFPENDTC= put(input(SVDTC,date11.), is8601da.);
    	DTHFL= "";
		DTHDTC= "";
    	if ICFSTAT1= "Yes" then EGICYN= "Y";
		else if ICFSTAT1= "No" then EGICYN= "N";
    	if not missing (ICFDTC1) then EGICDT= put(input(ICFDTC1,date11.), is8601da.);
        drop STUDYID;
		if ARM="" then do;ARM= "Not Assigned"; ARMCD= "NOTASSGN"; ACTARMCD="NOTASSGN"; ACTARM="Not Assigned";end;
	run;

	/*Creating DMDY*/

	data DM4;
		set DM3;
		STUDYID= "OP109219-JP-2266-101-FIH_A";
		DMDTC_= input(DMDTC,yymmdd10.);
		RFSTDTC_= input(RFSTDTC,yymmdd10.);

		if missing(DMDTC_) or missing(RFSTDTC_) then DMDY=.;                                    
 		else if not missing(DMDTC_) and not missing(RFSTDTC_) then do;
    	if DMDTC_<RFSTDTC_ then DMDY= DMDTC_-RFSTDTC_; 
    	else if DMDTC_>=RFSTDTC_ then DMDY= DMDTC_-RFSTDTC_+1;
		end;
	run;

/*Assigning label to DM variables*/

	proc sql;
		create table FINAL as 
		select
		STUDYID	   label= "Study Identifier",	                      
    	DOMAIN	   label= "Domain Abbreviation",	                      
    	USUBJID	   label= "Unique Subject Identifier",	              
    	SUBJID	   label= "Subject Identifier for the Study",	      
    	RFSTDTC	   label= "Subject Reference Start Date/Time",	      
    	RFENDTC	   label= "Subject Reference End Date/Time",	          
    	RFXSTDTC   label= "Date/Time of First Study Treatment",      
    	RFXENDTC   label= "Date/Time of Last Study Treatment",	      
    	RFICDTC	   label= "Date/Time of Informed Consent",	          
    	RFPENDTC   label= "Date/Time of End of Participation",	      
		DTHDTC     label= "Date/Time of Death" ,                       
		DTHFL      label= "Subject Death Flag",                        
    	SITEID	   label= "Study Site Identifier",
		INVNAM     label= "Investigator Name",
    	AGE	       label= "Age",	                                      
    	AGEU	   label= "Age Units",	                              
    	SEX	       label= "Sex"	,                                      
		RACE       label= "Race",                                      
    	ARMCD	   label= "Planned Arm Code",	                      
    	ARM	       label= "Description of Planned Arm",	              
    	ACTARMCD   label= "Actual Arm Code"	,                          
    	ACTARM	   label= "Description of Actual Arm",	              
    	COUNTRY	   label= "Country",	                                  
    	DMDTC	   label= "Date/Time of Collection",	                  
    	DMDY	   label= "Study Day of Collection",	                  
    	EGICYN     label= "Written Exploratory Genomic IC Obtained?",
    	EGICDT     label="Exploratory Genomic IC Signed Date"
    	from DM4;
	quit;

	/*Creating final DM*/

	data SDTM.DM(label="Demographics" drop=EGICYN EGICDT);        
		set FINAL;
	run;

					/***********************Creating SUPPDM**************************************/

	data SUPP1(keep=STUDYID USUBJID EGICYN EGICDT);
		set FINAL;
	run;

	proc sort data=supp1;
		by STUDYID USUBJID;
	run;

	/*Transposing supplemental information*/

	proc transpose data=SUPP1 out=SUPP2(rename=(_NAME_=QNAM _LABEL_=QLABEL COL1=QVAL));     
		var EGICYN EGICDT;
		by STUDYID USUBJID;
	run;

	data SUPP3;
 		set SUPP2;
 		IDVAR=" ";
 		IDVARVAL=" ";
 		RDOMAIN="DM";
 		QORIG="CRF";
 		QEVAL=" ";
    	if QVAL^=" ";
	run;

	/*Assigning label to SUPPDM variables*/

	proc sql;
 		create table SUPP4 as
 		select
 		STUDYID  label="Study Identifier",             
 		RDOMAIN  label="Related Domain Abbreviation",  
		USUBJID  label="Unique Subject Identifier",    
 		IDVAR    label="Identifying Variable",         
 		IDVARVAL label="Identifying Variable Value",                 
		QNAM     label="Qualifier Variable Name" ,     
		QLABEL   label="Qualifier Variable Label",     
 		QVAL     label="Data Value",                   
 		QORIG    label="Origin",                       
 		QEVAL    label="Evaluator"                    
 		from SUPP3;
	quit;

	/*Creating final Supplemental dataset*/

	data SDTM.SUPPDM(label="Supplemental Qualifiers - DM");         
		set SUPP4;
	run;

	/*Minimum length for all variables*/

	%minlength(inds=%nrstr(SDTM.DM));

/*converting sas to xpt format*/

/*libname xptfile XPORT "E:\EDIFY PROJECTS\OP1092\SAS\ED-PH-OP1092-SAS-SDTM XPORT Datasets";*/
/*proc copy in = sdtm out = xptfile;*/
/*	select DM;*/
/*run;*/
/* */
/*libname xptfile XPORT "E:\EDIFY PROJECTS\OP1092\SAS\ED-PH-OP1092-SAS-SDTM XPORT Datasets";*/
/*proc copy in = sdtm out = xptfile;*/
/*	select SUPPDM;*/
/*run;*/


    







