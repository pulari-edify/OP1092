

	/**************************************************************
	* PROTOCOL ID                    : OP1092
	* SPONSOR                        : JEIL Pharmaceutical Co.
	* CRO                            : EUROFINS OPTIMED 
	* PROGRAM NAME                   : TS.sas
	* DESCRIPTION					 : Trial Summary
	* DATE                           : 06 Jan 2022
	* AUTHOR                         : Prasanth Menon
	* VALIDATED BY                   : 
	* MACROS USED                    : %minlength
	* OUTPUT                         : TS.sas7bdat
	* PLATFORM                       : SAS 9.2 Windows XP 
	* VERSION INFORMATION            : V1.0
	* REVISION HISTORY               :   
	***************************************************************/
		
	/*Clear the work library*/

	proc delete data=work._all_;
	run;

	proc import 
	  datafile="C:\Edify\OP1092\Data Management\SPEC\SDTM\TS.xlsx"
	  out=TS 
	  dbms=xlsx
	  replace;
	  sheet="TSPARMCD";
	run;

	/*data TS;
		infile datalines missover;
		length TSPARMCD $8. TSPARM $40. TSVAL $300.;
		input TSPARMCD $1-8   TSPARM $12-52 TSVAL $56-356;
		datalines;
ACTSUB     Actual Number of Subjects                    80   
ADAPT	   Adaptive Design							   	N
ADDON	   Added on to Existing Treatments			    N
AGEMAX	   Planned Maximum Age of Subjects			    P50Y
AGEMIN	   lanned Minimum Age of Subjects				P18Y
BLNDSTAT   Blinded Status SDTM Dataset Generation  		Y
CITNSTDY   Citation Used in Study						N
CMSPSTAT   Commercial Sponsor Status					Y
COMPTRT	   Comparative Treatment Name					PLACEBO
CRMDUR	   Confirmed Response Minimum Duration			P49D
CURTRT	   Current Therapy or Treatment					JP-2266
DCUTDESC   Data Cutoff Description						INTERIM ANALYSIS
DMCIND	   Data Monitoring Committee Indicator			Y
DOSE	   Dose per Administration						5 mg, 10mg, 20mg, 40mg, 80mg
DOSFRM	   Dose Form									CAPSULE
DOSFRQ	   Dosing Frequency								ONCE
DOSRGM	   Dose Regimen									Y
DOSU	   Dose Units									mg
EGBLIND	   ECG Reading Blinded 							Y
EGCTMON	   ECG Continuous Monitoring 					N
EGLEADPR   ECG Planned Primary Lead						12
EGLEADS    ECG Used Same Lead							Y
EGRDMETH   ECG Read Method								12 Lead ECG Method
EGREPLBL   ECG Replicates at Baseline					Y
EGREPLTR   ECG Replicates On Treatment					Y
FCNTRY	   Planned Country of Investigational Sites     France
HLTSUBJI   Healthy Subject Indicator					Y
INDIC	   Trial Disease/Condition Indication			Diabetes Mellitus
INTMODEL   Intervention Model							PARALLEL
INTTYPE	   Intervention Type							DRUG
KEYWORD	   Protocol Keyword								JP-2266-101-FIH / OP109219.JEI
LENGTH	   Trial Length									
MNFCNTRY   Country of Manufacture						Republic of Korea
NARMS	   Planned Number of Arms						10
NCOHORT	   Number of Groups/Cohorts						5
NUMSEUST   Number of Trial Sites EU State				1
OBJEXP	   Trial Exploratory Objective					Identifying genes involved in JP-2266 absorption and metabolism.
OBJEXP	   Trial Exploratory Objective					Identifying JP-2266 metabolites in human blood and urine after JP-2266 oral administration.
OBJPRIM	   Trial Primary Objective						To evaluate the safety and tolerability and the impact of food intake on pharmacokinetics of JP-2266 after single oral administration at 5 different doses in fast or fed conditions in healthy male Caucasian subjects.
OBJSEC	   Trial Secondary Objective					To evaluate the pharmacokinetics and pharmacodynamics parameters of JP-2266 after single oral administration at 5 different doses in healthy male Caucasian subjects.
OBJSEC	   Trial Secondary Objective					To evaluate the safety, tolerability and the impact of food on pharmacodynamicsof JP-2266 after single oral administration in fast or fed conditions in healthy male Caucasian subjects.
OBSTPOPD   Obs Study Population Description				Healthy male Caucasian volunteers aged between 18 and 50 years.
OUTMSEXP   Exploratory Outcome Measure					The correlation between pharmacokinetic parameters, including metabolite-to-parent drug exposure ratios, and pharmacokinetics/pharmacodynamics.
OUTMSPRI   Primary Outcome Measure						Adverse Events
OUTMSPRI   Primary Outcome Measure						Physical Examination
OUTMSPRI   Primary Outcome Measure						Vital Signs
OUTMSPRI   Primary Outcome Measure						12-lead ECG
OUTMSPRI   Primary Outcome Measure						Blood : Hematology, Coagulation, Biochemistry Urine : urinalysis, urine electrolyte test
OUTMSPRI   Primary Outcome Measure						Cmax
OUTMSPRI   Primary Outcome Measure						tmax
OUTMSPRI   Primary Outcome Measure						Cmin
OUTMSPRI   Primary Outcome Measure						AUC0-24h
OUTMSPRI   Primary Outcome Measure						AUClast
OUTMSPRI   Primary Outcome Measure						AUCinf
OUTMSPRI   Primary Outcome Measure						%AUCextra
OUTMSPRI   Primary Outcome Measure						t1/2
OUTMSPRI   Primary Outcome Measure						CL/F
OUTMSPRI   Primary Outcome Measure						Vd/F
OUTMSPRI   Primary Outcome Measure						kel
OUTMSPRI   Primary Outcome Measure						CLr
OUTMSPRI   Primary Outcome Measure						Aelast
OUTMSPRI   Primary Outcome Measure						Ae0-24h
OUTMSPRI   Primary Outcome Measure						fe%
OUTMSSEC   Secondary Outcome Measure					AUEC
OUTMSSEC   Secondary Outcome Measure					Emax
OUTMSSEC   Secondary Outcome Measure					emax
OUTMSSEC   Secondary Outcome Measure					Ae
PCLAS	   Pharmacologic Class							
PLANSUB	   Planned Number of Subjects					80
PLNTRDUR   Planned Trial Duration						P49D
PTRTDUR	   Planned Treatment Duration					P49D
PUBMEDID   PubMed ID for Citation Used in Study			N
RANDOM	   Trial is Randomized							Y
RANDQT	   Randomization Quotient						06:02
REGID	   Registry Identifier							NCT05172622
RDIND	   Rare Disease Indicator						N
ROUTE 	   Route of Administration						ORAL
SDTIGVER   SDTM IG Version								3.2
SDTMVER	   SDTM Version									3.2
SENDTC	   Study End Date								
SEXPOP	   Sex of Participants							M
SPONSOR	   Clinical Study Sponsor						JEIL Pharmaceutical Co., Ltd. 343, Sapyeong-daero, Seocho-gu, Seoul, Republic of Korea
SSEUTIND   Single Site EU State Trial Indicator			Y
SSTDTC	   Study Start Date								2020-11-24
STOPRULE   Study Stop Rules								The study is not conducted in accordance with the procedures defined in the approved protocol
STYPE	   Study Type									INTERVENTIONAL
TBLIND	   Trial Blinding Schema 						DOUBLE BLIND
TCNTRL	   Control Type									PLACEBO
THERAREA   Therapeutic Area								PHARMACOKINETICS
TINDTP	   Trial Intent Type 							
TITLE	   Trial Title									A Dose-randomized, Double-blind, Placebo-controlled, Single- and Multiple-dose, Dose-escalation, Phase I Clinical Trial to Investigate the Safety, Tolerability, and Pharmacokinetic and Pharmacodynamic Characteristics of JP-2266 after Oral Administration in Healthy Male Caucasian Subjects
TPHASE	   Trial Phase Classification 					PHASE I TRIAL
TRGFUDUR   Target Follow-Up Duration					
TRT	   	   Investigational Therapy or Treatment			JP-2266
TTYPE	   Trial Type									SAFETY
TTYPE	   Trial Type									TOLERABILITY
TTYPE	   Trial Type									PHARMACOKINETIC
TTYPE	   Trial Type									PHARMACODYNAMIC
;
	run;*/

	data TS1(drop=TSVALF VERSION);
		set TS (rename= (TSVCDVER= VERSION TSVAL= TSVALF));
		if not missing (VERSION) then TSVCDVER= put(VERSION, yymmdd10.);

		if length(TSVALF)>200 then do;
		TSVAL= substr(TSVALF,1,200);
		TSVAL1= substr(TSVALF,201);
		end;

		if length(TSVALF)<200 then TSVAL=TSVALF;
	run;

	proc sql;
		create table TSFINAL as select
			STUDYID 	"Study Identifier",
			DOMAIN 		"Domain Abbreviation",
			TSSEQ 		"Sequence Number",
			TSPARMCD 	"Trial Summary Parameter Short Name",
			TSPARM 		"Trial Summary Parameter",
			TSVAL 		"Parameter Value",
			TSVAL1 		"Parameter Value",
			TSVALNF 	"Parameter Null Flavor",
			TSVALCD 	"Parameter Value Code",
			TSVCDREF 	"Name of the Reference Terminology",
			TSVCDVER 	"Version of the Reference Terminology"
		from TS1;
	quit;

	data sdtm.TS(label="Trial Summary Information") ;
		set TSFINAL;
	run;

	%minlength(inds=%nrstr(sdtm.TS));


















