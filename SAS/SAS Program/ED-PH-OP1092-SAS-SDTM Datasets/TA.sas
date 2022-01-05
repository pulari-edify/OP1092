
/**************************************************************
* PROTOCOL ID                    : JP-2266-101-FIH / OP109219.JEI
* SPONSOR                        : JEIL Pharmaceutical Co., Ltd.
* CRO                            : EUROFINS OPTIMED 
* PROGRAM NAME                   : TA.sas
* DESCRIPTION                    : Trial Arms 
* DATE                           : 05-01-2022
* AUTHOR                         : Ivy Mathew
* VALIDATED BY                   : 
* MACROS USED                    : 
* OUTPUT                         : TA.sas7bdat
* PLATFORM                       : SAS 9.4 Windows XP 
* VERSION INFORMATION            : V1.0
* REVISION HISTORY               :   
***************************************************************/

/*clear work library*/
 proc delete data=work._All_;
 run;

/*Creating ARM,ARMCD and TAETORD*/

 data AA;
 	infile datalines;
 	input ARM $1-20 ARMCD $22-27 TAETORD;
 	datalines;
Placebo-JP2266 5mg   P-JP5  1
Placebo-JP2266 5mg   P-JP5  2
Placebo-JP2266 5mg   P-JP5  3
Placebo-JP2266 5mg   P-JP5  4
Placebo-Placebo 5mg  P-P5   1
Placebo-Placebo 5mg  P-P5   2
Placebo-Placebo 5mg  P-P5   3
Placebo-Placebo 5mg  P-P5   4
Placebo-JP2266 10mg  P-JP10 1
Placebo-JP2266 10mg  P-JP10 2
Placebo-JP2266 10mg  P-JP10 3
Placebo-JP2266 10mg  P-JP10 4
Placebo-Placebo 10mg P-P10  1
Placebo-Placebo 10mg P-P10  2
Placebo-Placebo 10mg P-P10  3
Placebo-Placebo 10mg P-P10  4
Placebo-JP2266 20mg  P-JP20 1
Placebo-JP2266 20mg  P-JP20 2
Placebo-JP2266 20mg  P-JP20 3
Placebo-JP2266 20mg  P-JP20 4
Placebo-JP2266 20mg  P-JP20 5
Placebo-JP2266 20mg  P-JP20 6
Placebo-Placebo 20mg P-P20  1
Placebo-Placebo 20mg P-P20  2
Placebo-Placebo 20mg P-P20  3
Placebo-Placebo 20mg P-P20  4
Placebo-Placebo 20mg P-P20  5
Placebo-Placebo 20mg P-P20  6
Placebo-JP2266 40mg  P-JP40 1
Placebo-JP2266 40mg  P-JP40 2
Placebo-JP2266 40mg  P-JP40 3
Placebo-JP2266 40mg  P-JP40 4
Placebo-Placebo 40mg P-P40  1
Placebo-Placebo 40mg P-P40  2
Placebo-Placebo 40mg P-P40  3
Placebo-Placebo 40mg P-P40  4
Placebo-JP2266 80mg  P-JP80 1
Placebo-JP2266 80mg  P-JP80 2
Placebo-JP2266 80mg  P-JP80 3
Placebo-JP2266 80mg  P-JP80 4
Placebo-Placebo 80mg P-P80  1
Placebo-Placebo 80mg P-P80  2
Placebo-Placebo 80mg P-P80  3
Placebo-Placebo 80mg P-P80  4
run;

 data EE;
  set AA;
  length ELEMENT ETCD EPOCH $50 TABRANCH $70;
  STUDYID="OP109219-JP-2266-101-FIH_A";
  DOMAIN="TA";
  TATRANS="";

              /***********************Placebo-JP2266 5mg************************/

 if ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-JP2266 5mg';
			ETCD = 'P-JP5';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-JP2266 5mg';
 end;

 if ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

              /***********************Placebo-Placebo 5mg************************/

 if ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-Placebo 5mg';
			ETCD = 'P-P5';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-Placebo 5mg';
 end;

 if ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

               /***********************Placebo-JP2266 10mg************************/

 if ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-JP2266 10mg';
			ETCD = 'P-JP10';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-JP2266 10mg';
 end;

 if ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

               /***********************Placebo-Placebo 10mg************************/

 if ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-Placebo 10mg';
			ETCD = 'P-P10';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-Placebo 10mg';
 end;

 if ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

              /***********************Placebo-JP2266 20mg************************/

 if ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-JP2266 20mg (Fast)';
			ETCD = 'P-JP20FS';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-JP2266 20mg';
 end;

  if ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' and TAETORD = 4 then do;
			ELEMENT= 'Washout';
			ETCD = 'WASHOUT';
			EPOCH= 'WASHOUT';
 end;

  if ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' and TAETORD = 5 then do;
			ELEMENT= 'Placebo-JP2266 20mg (Fed)';
			ETCD = 'P-JP20FD';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-JP2266 20mg';
 end;

 if ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' and TAETORD = 6 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

 /***********************Placebo-Placebo 20mg************************/

 if ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-Placebo 20mg (Fast)';
			ETCD = 'P-P20FS';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-Placebo 20mg';
 end;

  if ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' and TAETORD = 4 then do;
			ELEMENT= 'Washout';
			ETCD = 'WASHOUT';
			EPOCH= 'WASHOUT';
 end;

  if ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' and TAETORD = 5 then do;
			ELEMENT= 'Placebo-Placebo 20mg (Fed)';
			ETCD = 'P-P20FD';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-Placebo 20mg';
 end;

 if ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' and TAETORD = 6 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

          /***********************Placebo-JP2266 40mg************************/

 if ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-JP2266 40mg';
			ETCD = 'P-JP40';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-JP2266 40mg';
 end;

 if ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

 
          /***********************Placebo-Placebo 40mg************************/

 if ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-Placebo 40mg';
			ETCD = 'P-P40';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-Placebo 40mg';
 end;

 if ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

        /***********************Placebo-JP2266 80mg************************/

 if ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-JP2266 80mg';
			ETCD = 'P-JP80';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-JP2266 80mg';
 end;

 if ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;

      /***********************Placebo-Placebo 80mg************************/

 if ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' and TAETORD = 1 then do;
			ELEMENT= 'Screen';
			ETCD = 'SCRN';
			EPOCH= 'SCREENING';
 end;

 if ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' and TAETORD = 2 then do;
			ELEMENT= 'Inclusion';
			ETCD = 'INCL';
			EPOCH= 'INCLUSION';
 end;

 if ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' and TAETORD = 3 then do;
			ELEMENT= 'Placebo-Placebo 80mg';
			ETCD = 'P-P80';
			EPOCH= 'TREATMENT';
			TABRANCH= 'Randomized to Placebo-Placebo 80mg';
 end;

 if ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' and TAETORD = 4 then do;
			ELEMENT= 'End of Study ';
			ETCD = 'EOS';
			EPOCH= 'END OF STUDY';
 end;
 run;

 /*Final dataset*/

 data SDTM.TA(label= "Trial Arms");
	Retain STUDYID DOMAIN ARMCD ARM TAETORD ETCD ELEMENT TABRANCH TATRANS EPOCH;
	set EE;
	Attrib
	STUDYID     label       =      'Study Identifier'                        
	DOMAIN      label       =      'Domain Abbreviation'                    
	ARMCD       label       =      'Planned Arm Code'                       
	ARM         label       =      'Description of Planned Arm'              
	TAETORD     label       =      'Planned Order of Element within Arm'     
	ETCD        label       =      'Element Code'                            
	ELEMENT     label       =      'Description of Element'                  
	TABRANCH    label       =      'Branch'                                  
	TATRANS     label       =      'Transition Rule'                         
	EPOCH       label       =      'Epoch';
 run;

/*Minimum Length for all variables*/

%minlength(inds=%nrstr(SDTM.TA));

/*converting sas to xpt format*/

/* libname xpt xport "E:\EDIFY PROJECTS\OP1092\SAS\ED-PH-OP1092-SAS-SDTM XPORT Datasets";*/
/*    proc copy in=sdtm out=xpt memtype=data;*/
/*	select TA;*/
/*	run;*/







