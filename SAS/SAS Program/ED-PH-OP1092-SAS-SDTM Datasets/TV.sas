
/**************************************************************
* PROTOCOL ID                    : JP-2266-101-FIH / OP109219.JEI
* SPONSOR                        : JEIL Pharmaceutical Co., Ltd.
* CRO                            : EUROFINS OPTIMED 
* PROGRAM NAME                   : Tv.sas
* DESCRIPTION                    : Trial Visits
* DATE                           : 05-01-2022
* AUTHOR                         : Ivy Mathew
* VALIDATED BY                   : 
* MACROS USED                    : 
* OUTPUT                         : TV.sas7bdat
* PLATFORM                       : SAS 9.4 Windows XP 
* VERSION INFORMATION            : V1.0
* REVISION HISTORY               :   
***************************************************************/

/*clear work library*/
proc delete data=Work._all_;
run;

/*Creating ARM,ARMCD and VISIT*/

data AA;
	infile datalines;
	input ARM $1-20 ARMCD $22-27 VISIT $30-39;
 	datalines;
Placebo-JP2266 5mg   P-JP5   SCREENING
Placebo-JP2266 5mg   P-JP5   P1 D-2
Placebo-JP2266 5mg   P-JP5   P1 D-1
Placebo-JP2266 5mg   P-JP5   P1 D1
Placebo-JP2266 5mg   P-JP5   P1 D2
Placebo-JP2266 5mg   P-JP5   P1 D3
Placebo-JP2266 5mg   P-JP5   P1 D4
Placebo-JP2266 5mg   P-JP5   P1 D5
Placebo-JP2266 5mg   P-JP5   EOS
Placebo-Placebo 5mg  P-P5    SCREENING
Placebo-Placebo 5mg  P-P5    P1 D-2  
Placebo-Placebo 5mg  P-P5    P1 D-1  
Placebo-Placebo 5mg  P-P5    P1 D1 
Placebo-Placebo 5mg  P-P5    P1 D2
Placebo-Placebo 5mg  P-P5    P1 D3
Placebo-Placebo 5mg  P-P5    P1 D4
Placebo-Placebo 5mg  P-P5    P1 D5
Placebo-Placebo 5mg  P-P5    EOS
Placebo-JP2266 10mg  P-JP10  SCREENING 
Placebo-JP2266 10mg  P-JP10  P1 D-2 
Placebo-JP2266 10mg  P-JP10  P1 D-1
Placebo-JP2266 10mg  P-JP10  P1 D1
Placebo-JP2266 10mg  P-JP10  P1 D2
Placebo-JP2266 10mg  P-JP10  P1 D3
Placebo-JP2266 10mg  P-JP10  P1 D4
Placebo-JP2266 10mg  P-JP10  P1 D5
Placebo-JP2266 10mg  P-JP10  EOS
Placebo-Placebo 10mg P-P10   SCREENING
Placebo-Placebo 10mg P-P10   P1 D-2
Placebo-Placebo 10mg P-P10   P1 D-1
Placebo-Placebo 10mg P-P10   P1 D1
Placebo-Placebo 10mg P-P10   P1 D2
Placebo-Placebo 10mg P-P10   P1 D3
Placebo-Placebo 10mg P-P10   P1 D4
Placebo-Placebo 10mg P-P10   P1 D5
Placebo-Placebo 10mg P-P10   EOS
Placebo-JP2266 20mg  P-JP20  SCREENING 
Placebo-JP2266 20mg  P-JP20  P1 D-2
Placebo-JP2266 20mg  P-JP20  P1 D-1
Placebo-JP2266 20mg  P-JP20  P1 D1
Placebo-JP2266 20mg  P-JP20  P1 D2
Placebo-JP2266 20mg  P-JP20  P1 D3
Placebo-JP2266 20mg  P-JP20  P1 D4
Placebo-JP2266 20mg  P-JP20  P1 D5
Placebo-JP2266 20mg  P-JP20  P2 D-2
Placebo-JP2266 20mg  P-JP20  P2 D-1
Placebo-JP2266 20mg  P-JP20  P2 D1
Placebo-JP2266 20mg  P-JP20  P2 D2
Placebo-JP2266 20mg  P-JP20  P2 D3
Placebo-JP2266 20mg  P-JP20  P2 D4
Placebo-JP2266 20mg  P-JP20  P2 D5
Placebo-JP2266 20mg  P-JP20  EOS
Placebo-Placebo 20mg P-P20   SCREENING
Placebo-Placebo 20mg P-P20   P1 D-2
Placebo-Placebo 20mg P-P20   P1 D-1
Placebo-Placebo 20mg P-P20   P1 D1
Placebo-Placebo 20mg P-P20   P1 D2
Placebo-Placebo 20mg P-P20   P1 D3
Placebo-Placebo 20mg P-P20   P1 D4
Placebo-Placebo 20mg P-P20   P1 D5
Placebo-Placebo 20mg P-P20   P2 D-2
Placebo-Placebo 20mg P-P20   P2 D-1
Placebo-Placebo 20mg P-P20   P2 D1
Placebo-Placebo 20mg P-P20   P2 D2
Placebo-Placebo 20mg P-P20   P2 D3
Placebo-Placebo 20mg P-P20   P2 D4
Placebo-Placebo 20mg P-P20   P2 D5
Placebo-Placebo 20mg P-P20   EOS
Placebo-JP2266 40mg  P-JP40  SCREENING 
Placebo-JP2266 40mg  P-JP40  P1 D-2
Placebo-JP2266 40mg  P-JP40  P1 D-1
Placebo-JP2266 40mg  P-JP40  P1 D1
Placebo-JP2266 40mg  P-JP40  P1 D2
Placebo-JP2266 40mg  P-JP40  P1 D3
Placebo-JP2266 40mg  P-JP40  P1 D4
Placebo-JP2266 40mg  P-JP40  P1 D5
Placebo-JP2266 40mg  P-JP40  EOS
Placebo-Placebo 40mg P-P40   SCREENING
Placebo-Placebo 40mg P-P40   P1 D-2
Placebo-Placebo 40mg P-P40   P1 D-1
Placebo-Placebo 40mg P-P40   P1 D1
Placebo-Placebo 40mg P-P40   P1 D2
Placebo-Placebo 40mg P-P40   P1 D3
Placebo-Placebo 40mg P-P40   P1 D4
Placebo-Placebo 40mg P-P40   P1 D5
Placebo-Placebo 40mg P-P40   EOS
Placebo-JP2266 80mg  P-JP80  SCREENING 
Placebo-JP2266 80mg  P-JP80  P1 D-2
Placebo-JP2266 80mg  P-JP80  P1 D-1
Placebo-JP2266 80mg  P-JP80  P1 D1
Placebo-JP2266 80mg  P-JP80  P1 D2
Placebo-JP2266 80mg  P-JP80  P1 D3
Placebo-JP2266 80mg  P-JP80  P1 D4
Placebo-JP2266 80mg  P-JP80  P1 D5
Placebo-JP2266 80mg  P-JP80  EOS
Placebo-Placebo 80mg P-P80   SCREENING
Placebo-Placebo 80mg P-P80   P1 D-2
Placebo-Placebo 80mg P-P80   P1 D-1
Placebo-Placebo 80mg P-P80   P1 D1
Placebo-Placebo 80mg P-P80   P1 D2
Placebo-Placebo 80mg P-P80   P1 D3
Placebo-Placebo 80mg P-P80   P1 D4
Placebo-Placebo 80mg P-P80   P1 D5
Placebo-Placebo 80mg P-P80   EOS
run;

/*Creating VISITNUM VISITDY*/

 data YY;
 	length TVSTRL  EPOCH $50;
	set AA;
	STUDYID="OP109219-JP-2266-101-FIH_A";
    DOMAIN="TV";

	/************************Placebo-JP2266 5mg******************************/

if VISIT='SCREENING' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-JP2266 5mg' and ARMCD = 'P-JP5' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

/************************Placebo-Placebo 5mg******************************/


if VISIT='SCREENING' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-Placebo 5mg' and ARMCD = 'P-P5' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

/************************Placebo-JP2266 10mg******************************/

if VISIT='SCREENING' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-JP2266 10mg' and ARMCD = 'P-JP10' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

/************************Placebo-Placebo 10mg******************************/

if VISIT='SCREENING' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-Placebo 10mg' and ARMCD = 'P-P10' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

 /************************Placebo-JP2266 20mg******************************/

if VISIT='SCREENING' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF PERIOD 1 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF PERIOD 1 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF PERIOD 1 TREATMENT EPOCH ';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;


if VISIT='P2 D-2' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 90;
    VISITDY = 13;
    TVSTRL ='START OF PERIOD 2 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P2 D-1' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 100;
    VISITDY = 14;
    TVSTRL ='START OF PERIOD 2 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P2 D1' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 110;
    VISITDY = 15;
    TVSTRL ='START OF PERIOD 2 TREATMENT EPOCH ';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D2' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 120;
    VISITDY = 16;
    TVSTRL ='1 DAY AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D3' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 130;
    VISITDY = 17;
    TVSTRL ='2 DAYS AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D4' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 140;
    VISITDY = 18;
    TVSTRL ='3 DAYS AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D5' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 150;
    VISITDY = 19;
    TVSTRL ='4 DAYS AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-JP2266 20mg' and ARMCD = 'P-JP20' then do; 
    VISITNUM = 160;
    VISITDY = 24;
    TVSTRL ='';
    EPOCH='END OF STUDY';
end;


 /************************Placebo-Placebo 20mg******************************/

if VISIT='SCREENING' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF PERIOD 1 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF PERIOD 1 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF PERIOD 1 TREATMENT EPOCH ';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF PERIOD 1 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;


if VISIT='P2 D-2' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 90;
    VISITDY = 13;
    TVSTRL ='START OF PERIOD 2 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P2 D-1' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 100;
    VISITDY = 14;
    TVSTRL ='START OF PERIOD 2 INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P2 D1' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 110;
    VISITDY = 15;
    TVSTRL ='START OF PERIOD 2 TREATMENT EPOCH ';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D2' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 120;
    VISITDY = 16;
    TVSTRL ='1 DAY AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D3' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 130;
    VISITDY = 17;
    TVSTRL ='2 DAYS AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D4' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 140;
    VISITDY = 18;
    TVSTRL ='3 DAYS AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P2 D5' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 150;
    VISITDY = 19;
    TVSTRL ='4 DAYS AFTER START OF PERIOD 2 TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-Placebo 20mg' and ARMCD = 'P-P20' then do; 
    VISITNUM = 160;
    VISITDY = 24;
    TVSTRL ='';
    EPOCH='END OF STUDY';
end;

/************************Placebo-JP2266 40mg ******************************/

if VISIT='SCREENING' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='5 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

/************************Placebo-JP2266 40mg ******************************/

if VISIT='SCREENING' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-JP2266 40mg' and ARMCD = 'P-JP40' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

/************************Placebo-Placebo 40mg ******************************/

if VISIT='SCREENING' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-Placebo 40mg' and ARMCD = 'P-P40' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;


/************************Placebo-JP2266 80mg ******************************/

if VISIT='SCREENING' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-JP2266 80mg' and ARMCD = 'P-JP80' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;

/************************Placebo-JP2266 80mg ******************************/

if VISIT='SCREENING' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 10;
    VISITDY = -21;
    TVSTRL ='START OF SCREENING EPOCH';
    EPOCH='SCREENING';
end;

if VISIT='P1 D-2' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 20;
    VISITDY = -2;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D-1' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 30;
    VISITDY = -1;
    TVSTRL ='START OF INCLUSION EPOCH';
    EPOCH='INCLUSION';
end;

if VISIT='P1 D1' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 40;
    VISITDY = 1;
    TVSTRL ='START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D2' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 50;
    VISITDY = 2;
    TVSTRL ='1 DAY AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D3' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 60;
    VISITDY = 3;
    TVSTRL ='2 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D4' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 70;
    VISITDY = 4;
    TVSTRL ='3 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='P1 D5' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 80;
    VISITDY = 5;
    TVSTRL ='4 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='TREATMENT';
end;

if VISIT='EOS' and ARM = 'Placebo-Placebo 80mg' and ARMCD = 'P-P80' then do; 
    VISITNUM = 160;
    VISITDY = 10;
    TVSTRL ='9 DAYS AFTER START OF TREATMENT EPOCH';
    EPOCH='END OF STUDY';
end;
run;


/*Final dataset*/

 data SDTM.TV(label= "Trial Arms");
	Retain STUDYID DOMAIN VISITNUM VISIT VISITDY ARMCD ARM EPOCH TVSTRL;
	set YY;
	Attrib
	STUDYID     label='Study Identifier'
    DOMAIN      label='Domain Abbreviation'
    VISITNUM    label='Visit Number'
    VISIT       label='Visit Name'
    VISITDY     label='Planned Study Day of Visit'
    ARMCD       label='Planned Arm Code'
    ARM         label='Description of Planned Arm'
    EPOCH       label='Epoch'
    TVSTRL      label='Visit Start Rule';
 run;

 /*Minimum Length for all variables*/

%minlength(inds=%nrstr(SDTM.TV));

/*converting sas to xpt format*/

/* libname xpt xport "E:\EDIFY PROJECTS\OP1092\SAS\ED-PH-OP1092-SAS-SDTM XPORT Datasets";*/
/*    proc copy in=sdtm out=xpt memtype=data;*/
/*	select TV;*/
/*	run;*/



















