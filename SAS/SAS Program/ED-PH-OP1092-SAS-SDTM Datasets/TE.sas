

    /**************************************************************
	* PROTOCOL ID                    : OP1092
	* SPONSOR                        : JEIL Pharmaceutical Co.
	* CRO                            : EUROFINS OPTIMED 
	* PROGRAM NAME                   : TE.sas
	* DESCRIPTION					 : Trial Elements
	* DATE                           : 05 Jan 2022
	* AUTHOR                         : Prasanth Menon
	* VALIDATED BY                   : 
	* MACROS USED                    : %minlength
	* OUTPUT                         : TE.sas7bdat
	* PLATFORM                       : SAS 9.2 Windows XP 
	* VERSION INFORMATION            : V1.0
	* REVISION HISTORY               :   
	***************************************************************/
		
	/*Clear the work library*/

	proc delete data=_all_;
	run;

	/*Assigning etcd and element values*/

	data ELMNT;
		length ETCD $8. ELEMENT $50.;
		input ETCD $1-8   ELEMENT $10-50;
		cards;
SCRN     Screen
INCL     Inclusion  
P-JP5  	 Placebo-JP2266 5mg
P-P5     Placebo-Placebo 5mg
P-JP10   Placebo-JP2266 10mg
P-P10    Placebo-Placebo 10mg
P-JP20FS Placebo-JP2266 20mg (Fast)
WASHOUT  Washout
P-JP20FD Placebo-JP2266 20mg (Fed)
P-P20FS  Placebo-Placebo 20mg (Fast)
P-P20FD  Placebo-Placebo 20mg (Fed)
P-JP40   Placebo-JP2266 40mg
P-P40    Placebo-Placebo 40mg
P-JP80   Placebo-JP2266 80mg
P-P80    Placebo-Placebo 80mg
EOS      End of Study
;
	run;

	data TE1;
		length TESTRL $100.;
		set ELMNT;
		STUDYID= "OP109219-JP-2266-101-FIH_A";
		DOMAIN= "TE";

		if ETCD ="SCRN" then do;
		   	TESTRL= "Informed Consent";
		   	TEENRL= "Screeing assessments from -21 days to -3";
		   	TEDUR = "P18D";
		end;

		if ETCD ="INCL" then do;
		   	TESTRL= "Inclusion";
		   	TEENRL= "2 Days before Treatment dose taken";
		   	TEDUR = "P2D";
		end;

		if ETCD ="P-JP5" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-JP2266 5mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;
		
		if ETCD ="P-P5" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-Placebo 5mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="P-JP10" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-JP2266 10mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="P-P10" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-Placebo 10mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD in ("P-JP20FS" "P-JP20FD") then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-JP2266 20mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD in ("P-P20FS" "P-P20FD") then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-Placebo 20mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="P-JP40" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-JP2266 40mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="P-P40" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-Placebo 40mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="P-JP80" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-JP2266 80mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="P-P80" then do;
		   	TESTRL= "Dose of study drug, where drug is Placebo-Placebo 80mg";
			TEENRL= "5 days after start of Element";
		  	TEDUR = "P5D";
		end;

		if ETCD ="EOS" then do;
		   	TESTRL= "Last Treatment visit";
			TEENRL= "End of Study";
		  	TEDUR = "P10D";
		end;
	run;

	Proc sql;
		create table TEFINAL as select
			STUDYID "Study Identifier",
			DOMAIN 	"Domain Abbreviation",
			ETCD  	"Element Code",
			ELEMENT "Description of Element",
			TESTRL 	"Rule for Start of Element",
			TEENRL  "Rule for End of Element",
			TEDUR 	"Planned Duration of Element"
		from TE1;
	quit;

	data sdtm.TE(label=Trial Elements);
		set TEFINAL;
	run;

	%minlength(inds=%nrstr(sdtm.TE));








		



			





