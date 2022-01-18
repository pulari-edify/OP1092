
/**************************************************************
* PROTOCOL ID                    : JP-2266-101-FIH / OP109219.JEI
* SPONSOR                        : JEIL Pharmaceutical Co., Ltd.
* CRO                            : EUROFINS OPTIMED 
* PROGRAM NAME                   : SV.sas
* DESCRIPTION                    : Subject Visit- SV 
* DATE                           : 17-01-2022
* AUTHOR                         : Ivy Mathew
* VALIDATED BY                   : 
* MACROS USED                    : 
* OUTPUT                         : SV.sas7bdat
* PLATFORM                       : SAS 9.4 Windows XP 
* VERSION INFORMATION            : V1.0
* REVISION HISTORY               :   
***************************************************************/


/*Clear the work library*/
  proc delete data= work._all_;
  run;

  proc sort data=raw.Rep_alc out=alc( keep=SUBJID ALCDTC SUBJEVENTNAME  rename=(ALCDTC=VSD));
  	by SUBJID ALCDTC SUBJEVENTNAME;
  run;

  proc sort data=raw.Rep_ds out=ds( keep=SUBJID DSDTC SUBJEVENTNAME  rename=(DSDTC=VSD));
  	by SUBJID  DSDTC SUBJEVENTNAME;
  run;

  proc sort data=raw.Rep_eg out=eg( keep=SUBJID EGDTC SUBJEVENTNAME  rename=(EGDTC=VSD));
   by SUBJID EGDTC SUBJEVENTNAME ;
  run;

  proc sort data=raw.Rep_ex out=ex( keep=SUBJID EXDTC SUBJEVENTNAME  rename=(EXDTC=VSD));
    by SUBJID  EXDTC SUBJEVENTNAME  ;
  run;

  proc sort data=raw.Rep_ex out=ex1( keep=SUBJID EXDTC SUBJEVENTNAME  rename=(EXDTC=VSD));
    by SUBJID  EXDTC SUBJEVENTNAME  ;
  run;

  proc sort data=raw.Rep_icf out=icf( keep=SUBJID ICFDTC SUBJEVENTNAME  rename=(ICFDTC=VSD));
   	by SUBJID ICFDTC SUBJEVENTNAME  ;
  run;

/*  proc sort data=raw.Rep_ie out=ie( keep=SUBJID IEDTC SUBJEVENTNAME  rename=(IEDTC=VSD));*/
/*   by SUBJID IEDTC SUBJEVENTNAME  ;*/
/*  run;*/

  proc sort data=raw.Rep_lc out=lc( keep=SUBJID LCDTC SUBJEVENTNAME  rename=(LCDTC=VSD));
    by SUBJID LCDTC SUBJEVENTNAME   ;
  run;

   proc sort data=raw.Rep_lh out=lh( keep=SUBJID LHDTC SUBJEVENTNAME  rename=(LHDTC=VSD));
   by SUBJID LHDTC SUBJEVENTNAME ;
  run;

   proc sort data=raw.Rep_ls out=ls( keep=SUBJID LSDTC SUBJEVENTNAME  rename=(LSDTC=VSD));
   by SUBJID LSDTC SUBJEVENTNAME ;
  run;

   proc sort data=raw.Rep_lt out=lt( keep=SUBJID LTDTC SUBJEVENTNAME  rename=(LTDTC=VSD));
   by SUBJID LTDTC SUBJEVENTNAME ;
  run;

   proc sort data=raw.Rep_ml out=ml( keep=SUBJID MLDTC SUBJEVENTNAME  rename=(MLDTC=VSD));
   by SUBJID MLDTC SUBJEVENTNAME ;
  run;

  proc sort data=raw.Rep_pd out=pd( keep=SUBJID PDADTC SUBJEVENTNAME  rename=(PDADTC=VSD));
   by SUBJID PDADTC SUBJEVENTNAME ;
  run;

  proc sort data=raw.Rep_pe1 out=pe1( keep=SUBJID PEDTC SUBJEVENTNAME  rename=(PEDTC=VSD));
   by SUBJID PEDTC SUBJEVENTNAME  ;
  run;

  proc sort data=raw.Rep_pk out=pk( keep=SUBJID PKADTC SUBJEVENTNAME  rename=(PKADTC=VSD));
   by SUBJID PKADTC SUBJEVENTNAME  ;
  run;

  proc sort data=raw.Rep_pkeg out=pkeg( keep=SUBJID PKEGDTC SUBJEVENTNAME  rename=(PKEGDTC=VSD));
   by SUBJID PKEGDTC SUBJEVENTNAME  ;
  run;

   proc sort data=raw.Rep_sv out=sv( keep=SUBJID SVDTC SUBJEVENTNAME  rename=(SVDTC=VSD));
   by SUBJID SVDTC SUBJEVENTNAME   ;
  run;

/*   proc sort data=raw.Rep_uc out=uc( keep=SUBJID UCSTDTC SUBJEVENTNAME  rename=(UCSTDTC=VSD));*/
/*   by SUBJID UCSTDTC SUBJEVENTNAME ;*/
/*  run;*/

   proc sort data=raw.Rep_uco out=uco( keep=SUBJID UCODTC SUBJEVENTNAME  rename=(UCODTC=VSD));
   by SUBJID UCODTC SUBJEVENTNAME   ;
  run;

  proc sort data=raw.Rep_uds out=uds( keep=SUBJID UDSDTC SUBJEVENTNAME  rename=(UDSDTC=VSD));
   by SUBJID UDSDTC SUBJEVENTNAME   ;
  run;

  proc sort data=raw.Rep_ue out=ue( keep=SUBJID UEDTC SUBJEVENTNAME  rename=(UEDTC=VSD));
   by SUBJID UEDTC SUBJEVENTNAME   ;
  run;

   proc sort data=raw.Rep_ur out=ur( keep=SUBJID URDTC SUBJEVENTNAME  rename=(URDTC=VSD));
   by SUBJID URDTC SUBJEVENTNAME   ;
  run;

   proc sort data=raw.Rep_vs out=vs( keep=SUBJID VSDTC SUBJEVENTNAME  rename=(VSDTC=VSD));
   by SUBJID VSDTC SUBJEVENTNAME  ;
  run;

/*Combining all datasets*/

  data all;
	 length SUBJEVENTNAME $150. ;
	 set alc (in=a) ds(in=b) eg(in=c) ex(in=d) ex1(in=e) icf(in=f) /*ie(in=g)*/ lc(in=h) 
		 lh(in=i) ls(in=j) lt(in=k) ml(in=l) pd(in=m) pe1(in=n) pk(in=o) pkeg(in=p) sv(in=q) /*uc(in=r)*/
	     uco(in=s) uds(in=t) ue(in=u) ur(in=v) vs(in=w);
	 by SUBJID VSD SUBJEVENTNAME;
	 if missing(VSD) then delete;

	 if a then flag_SU="SU";
	 if b then flag_DS="DS";
	 if c then flag_EG="EG";
	 if (d or e) then flag_EX="EX";
	 if (f or q) then flag_SV="SV";
/*	 if g then flag_IE="IE";*/
	 if (h or i or k or S or t or u or v) then flag_LB="LB";
	 if j then flag_IS="IS";
	 if l then flag_ML="ML";
	 if (m or o or p)then flag_PC="PC";
	 if n then flag_PE="PE";
	 if w then flag_VS="VS";

	 VSD=put(input(VSD,date11.), is8601da.);
	 VSD1=input(VSD,yymmdd10.);
	 format VSD1 is8601da.;
	 run;

	 proc sort data =all nodupkey out=unschedul dupout=HH;
		by SUBJID VSD1 SUBJEVENTNAME flag_SU flag_DS flag_EG flag_EX flag_SV /*flag_IE*/ flag_LB flag_IS flag_ML flag_PC flag_PE flag_VS;
		where not missing (SUBJEVENTNAME);
	run;

	%macro flg (out=,var=);
	  data &out;
	  set unschedul;
	  if not missing(&var);
	  run;
	 %mend;

	 %flg(out=flag_SU1,var=flag_SU);
	 %flg(out=flag_DS1,var=flag_DS);
	 %flg(out=flag_EG1,var=flag_EG);
	 %flg(out=flag_EX1,var=flag_EX);
	 %flg(out=flag_SV1,var=flag_SV);
/*	 %flg(out=flag_IE1,var=flag_IE);*/
	 %flg(out=flag_LB1,var=flag_LB);
	 %flg(out=flag_IS1,var=flag_IS);
	 %flg(out=flag_ML1,var=flag_ML);
	 %flg(out=flag_PC1,var=flag_PC);
	 %flg(out=flag_PE1,var=flag_PE);
	 %flg(out=flag_VS1,var=flag_VS);

	 /*Creating SVUPDES*/

     data flag_unsch;
	 	length SVUPDES $100.;
	 	merge flag_SU1 flag_DS1 flag_EG1 flag_EX1 flag_SV1 /*flag_IE1*/ flag_LB1 flag_IS1 flag_ML1 flag_PC1 flag_PE1 flag_VS1;
		by SUBJID VSD1 SUBJEVENTNAME;
		
		if index(upcase(SUBJEVENTNAME),'UNS')>0 then do;
        SVUPDES = "Evaluation of "||catx(',',flag_SU, flag_DS, flag_EG, flag_EX, flag_SV, /*flag_IE,*/ flag_LB, flag_IS, flag_ML, flag_PC, flag_PE, flag_VS);
		end;
		drop flag_SU flag_DS flag_EG flag_EX flag_SV /*flag_IE*/ flag_LB flag_IS flag_ML flag_PC flag_PE flag_VS;
	run;

	proc sort data =flag_unsch nodupkey out=SVDT;
		by SUBJID VSD1 SUBJEVENTNAME;
	run;

	proc sort data=sdtm.dm out=DM1(keep=STUDYID USUBJID SUBJID RFSTDTC ARMCD);
		by subjid;
	run;

	 data SVDT_DM;
	    length VISIT1 $40. ;
		merge SVDT DM1;
		by SUBJID;
		VISIT1=strip(upcase(SUBJEVENTNAME));
		if index(upcase(SUBJEVENTNAME),'UNS')>0 then VISIT1="UNSCHEDULED";
		if SUBJEVENTNAME in("P1 D10","P2 D10") then VISIT1="EOS";
		run;

    proc sort data=SVDT_DM;
		by ARMCD VISIT1;
	run;

	data TV(DROP=STUDYID DOMAIN);
		length VISIT1 $30. ;
		set sdtm.TV;
		VISIT1=VISIT;
	run;

	proc sort data=TV nodupkey ;
		by ARMCD VISIT1;
	run;

	/*Combine with TV*/

	data SVDT_DM_TV;
		length VISIT $50. ;
		merge SVDT_DM(in=a) TV;
		by ARMCD VISIT1;
		if a;
		if index(upcase(SUBJEVENTNAME),'UNS')>0 then VISITNUM=999;
		if missing (VISIT) then VISIT=VISIT1;
		if missing (VISITNUM) and VISIT="SCREENING" then do; VISITNUM=10; VISITDY=-21; EPOCH="SCREENING"; end;
		if missing (VISITNUM) and VISIT="P1 D-1" then do; VISITNUM=30; VISITDY=-1; EPOCH="INCLUSION"; end;
	run;

	proc sort data=SVDT_DM_TV;
		by SUBJID VSD1 VISITNUM SUBJEVENTNAME ;
	run;

	/*Assign visitnum for Unscheduled visit*/

	data VIST_UNCH;
		length SVSTDTC SVENDTC VISIT $50. ;
		set SVDT_DM_TV;
		by SUBJID VSD1 VISITNUM SUBJEVENTNAME  ;

		/*Getting unscheduled visit and number*/

		if index(upcase(VISIT1),'UNSCH')>0 then do;
			VISITNUM=.;
			retain unit_ ;
			if first.SUBJID then unit_=VISITNUM;
			if not missing(unit_) then unit_=unit_+.01;
		end;
		else unit_=VISITNUM;

		if index(upcase(VISIT1),"UNSCH")>0 then VISIT= "UNSCHEDULED "||strip(put(unit_,best.));
		if missing(VISITNUM) then VISITNUM=unit_;

			if missing (EPOCH) and index(upcase(VISIT),"UNSCH")>0 then do;
				if VISITNUM in (10.01, 10.02,10.03) then EPOCH="SCREENING";
				else if VISITNUM in (30.01) then EPOCH="INCLUSION";
				else if VISITNUM in (40.01, 50.01, 60.01, 60.02, 70.01, 80.01, 130.01) then EPOCH="TREATMENT";
                else if VISITNUM in (160.01, 160.02) then EPOCH="END OF STUDY";
				if VISIT="UNSCHEDULED 60.02" then EPOCH="TREATMENT";
				if VISIT="UNSCHEDULED 160.02" then EPOCH="END OF STUDY";
			end;
			    
		if not missing (VSD1) then SVSTDTC=strip(put(VSD1,yymmdd10.));
		if not missing (VSD1) then SVENDTC=strip(put(VSD1,yymmdd10.));
	run;

	proc sort data=VIST_UNCH;
		by SUBJID VSD1 unit_ SUBJEVENTNAME ;
	run;

	data VIST_UNCH1;
		set VIST_UNCH;
		DOMAIN="SV";
		SVSTDT = input(SVSTDTC,yymmdd10.);
		SVENDT = input(SVENDTC,yymmdd10.);
		RFST = input(substr(RFSTDTC,1,10),yymmdd10.);
	
		/*creating SVSTDY variable*/
		if not missing(SVSTDT) and not missing(RFST) then do;
			If (SVSTDT < RFST) then SVSTDY= SVSTDT - RFST; 
			Else if (SVSTDT >= RFST) then SVSTDY=(SVSTDT - RFST)+1;
		end;

		/*creating SVENDY variable*/
		if not missing(SVENDT) and not missing(RFST) then do;
			If (SVENDT < RFST) then SVENDY=SVENDT - RFST; 
			Else if (SVENDT >= RFST) then SVENDY=(SVENDT - RFST)+1;
		end;

		keep STUDYID DOMAIN USUBJID VISITNUM VISIT VISITDY EPOCH SVSTDTC SVENDTC SVSTDY SVENDY SVUPDES;

		if USUBJID="" then delete;  /*Data issue for SUBJID S036 and S037.Bcz they are not in DM.*/
	run;

	proc sort data=VIST_UNCH1;
	by USUBJID VISITNUM VISIT VISITDY SVSTDTC SVENDTC;
	run;

	/*Assigning label */

	data sdtm.SV(label="Subject Visits");
		retain STUDYID DOMAIN USUBJID VISITNUM VISIT VISITDY EPOCH SVSTDTC SVENDTC SVSTDY SVENDY SVUPDES;
			attrib 
				STUDYID   label="Study Identifier"
				DOMAIN	  label="Domain Abbreviation"
				USUBJID	  label="Unique Subject Identifier"
				VISITNUM  label="Visit Number"	
				VISIT	  label="Visit Name"
				VISITDY	  label="Planned Study Day of Visit"
				EPOCH     label="Epoch"
				SVSTDTC   label="Start Date/Time of Visit"
				SVENDTC   label="End Date/Time of Visit"
				SVSTDY	  label="Study Day of Start of Visit"
				SVENDY	  label="Study Day of End of Visit"	
				SVUPDES	  label="Description of Unplanned Visit";
		set VIST_UNCH1;
	run;

	/*To get Minlength for all variables*/
	%minlength(inds=%nrstr(sdtm.SV));




