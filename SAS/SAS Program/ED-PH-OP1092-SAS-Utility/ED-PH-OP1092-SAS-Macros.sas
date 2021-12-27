/**************************************************************
* PROTOCOL ID                    : OP1092 
* SPONSOR                        : 
* CRO                            : EUROFINS OPTIMED 
* PROGRAM NAME                   : ED-PH-OP1092-SAS-Macros
* DATE                           : 27Dec2021
* AUTHOR                         : Pulari S.R
* VALIDATED BY                   : 
* PLATFORM                       : SAS 9.2 Windows XP 
* VERSION INFORMATION            : V1.0
***************************************************************/

%macro convert(indata = ,date = ,time = ,type = ,fmt = ,outdate = ,out =);
data convert2;
    * Convertion of date part only;
    length date_9 date_iso $10 time_ $10 datetime_iso $20 date_new $12;
    set &indata;

    ****  Type A ***;
    if not missing(&date) and &type = 'A' then do;
            if length(&date)= 9 then do;
                if &fmt = '1' then date_9 = strip(&date);
                if &fmt = '2' then date_iso = strip(put(input(&date,date9.),yymmdd10.));
            end;
            if length(&date)= 7 then do;
                date_new = '01'||strip(&date);  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,date9.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,date9.),yymmdd10.)),1,7);
            end;
            if length(&date)= 4 then do;
                date_new = '01Jan'||strip(&date);   
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,date9.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,date9.),yymmdd10.)),1,4);
            end;
        end;

    ****  Type B ***;
    if not missing(&date) and &type = 'B' then do;  
            if length(&date)= 10 then do;
                if &fmt = '1' then date_9 = strip(put(input(&date,ddmmyy10.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,ddmmyy10.),yymmdd10.));
            end;
            if length(&date)= 7 then do;
                date_new = '01/'||strip(&date); 
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,ddmmyy10.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,ddmmyy10.),yymmdd10.)),1,7);
            end;
            if length(&date)= 4 then do;
                date_new = '01/01/'||strip(&date);  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,ddmmyy10.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,ddmmyy10.),yymmdd10.)),1,4);
            end;
        end;

     ****  Type C ***;
     if not missing(&date) and &type = 'C' then do; 
            if length(&date)= 11 then do;
                if &fmt = '1' then date_9 = strip(put(input(&date,date11.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,date11.),yymmdd10.));
            end;
            if length(&date)= 8 then do;
                date_new = '01-'||strip(&date); 
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,date11.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,date11.),yymmdd10.)),1,7);
            end;
            if length(&date)= 4 then do;
                date_new = '01-Jan-'||strip(&date); 
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,date11.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,date11.),yymmdd10.)),1,4);
            end;
       end;

     ****  Type D ***;
     if not missing(&date) and &type = 'D' then do; 
            if length(&date)= 8 then do;
                if &fmt = '1' then date_9 = strip(put(input(&date,mmddyy8.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,mmddyy8.),yymmdd10.));
            end;
            if length(&date)= 6 then do;
                date_new = strip(scan(&date,1,'/'))||'/'||'01/'||strip(scan(&date,2,'/ '));
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,mmddyy8.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,mmddyy8.),yymmdd10.)),1,7);
            end;

            if length(&date)= 2 then do;
                date_new = '01/01/'||strip(&date);  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,mmddyy8.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,mmddyy8.),yymmdd10.)),1,4);
            end;
        end;

    ****  Type E ***;
    if not missing(&date) and &type = 'E' then do;
            if length(&date)= 7 then do;    
                if &fmt = '1' then date_9 = strip(put(input(&date,date7.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,date7.),yymmdd10.));
            end;

            if length(&date)= 5 then do;
                date_new = '01'||strip(&date);  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,date7.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,date7.),yymmdd10.)),1,7);
            end;

            if length(&date)= 2 then do;
                date_new = '01Jan'||strip(&date);   
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,date7.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,date7.),yymmdd10.)),1,4);
            end;
        end;

    ****  Type F ***;
    if not missing(&date) and &type = 'F' then do;
            if length(&date)= 8 then do;    
                if &fmt = '1' then date_9 = strip(put(input(&date,yymmdd8.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,yymmdd8.),yymmdd10.));
            end;
            if length(&date)= 6 then do;
                date_new = strip(&date)||'01';  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,yymmdd8.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,yymmdd8.),yymmdd10.)),1,7);
            end;
            if length(&date)= 4 then do;
                date_new = strip(&date)||'0101';    
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,yymmdd8.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,yymmdd8.),yymmdd10.)),1,4);
            end;
        end;

    ****  Type G ***;
    if not missing(&date) and &type = 'G' then do;
            if length(&date)= 10 then do;   
                if &fmt = '1' then date_9 = strip(put(input(&date,yymmdd10.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,yymmdd10.),yymmdd10.));
            end;
            if length(&date)= 7 then do;
                date_new = strip(&date)||'-01'; 
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,yymmdd10.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,yymmdd10.),yymmdd10.)),1,7);
            end;
            if length(&date)= 4 then do;
                date_new = strip(&date)||'-01-01';  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,yymmdd10.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,yymmdd10.),yymmdd10.)),1,4);
            end;
        end;

    ****  Type H ***;
    if not missing(&date) and &type = 'H' then do;
            if length(&date)= 10 then do;   
                if &fmt = '1' then date_9 = strip(put(input(&date,mmddyy10.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,mmddyy10.),yymmdd10.));
            end;
            if length(&date)= 8 then do;
                date_new = strip(scan(&date,1,'/'))||'/'||'01/'||strip(scan(&date,2,'/ '));
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,mmddyy10.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,mmddyy10.),yymmdd10.)),1,7);
            end;
            if length(&date)= 4 then do;
                date_new ='01/01/'|| strip(&date);  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,mmddyy10.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,mmddyy10.),yymmdd10.)),1,4);
            end;
        end;
    ****  Type I ***;
    if not missing(&date) and &type = 'I' then do;  
            if length(&date)= 8 then do;
                if &fmt = '1' then date_9 = strip(put(input(&date,ddmmyy8.),date9.));
                if &fmt = '2' then date_iso = strip(put(input(&date,ddmmyy8.),yymmdd10.));
            end;
            if length(&date)= 5 then do;
                date_new = '01/'||strip(&date); 
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,ddmmyy8.),date9.)),3);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,ddmmyy8.),yymmdd10.)),1,7);
            end;
            if length(&date)= 2 then do;
                date_new = '01/01/'||strip(&date);  
                if &fmt = '1' then date_9 = substr(strip(put(input(date_new,ddmmyy8.),date9.)),6);
                if &fmt = '2' then date_iso = substr(strip(put(input(date_new,ddmmyy8.),yymmdd10.)),1,4);
            end;
        end;

   * Conversion of time part and combine datet_iso,time variable;
    if &fmt = '2' and not missing(&time) and not missing(date_iso) then do;
            if length(&time)= 8 then datetime_iso = strip(date_iso)||'T'||strip(&time);
            if length(&time) = 6 then do;
                    time_ = strip(substr(&time,1,2))||':'||strip(substr(&time,3,4))||':'||strip(substr(&time,5));
                    datetime_iso = strip(date_iso)||'T'||strip(time_);
                end;
            if length(&time) = 5 then do;
                    time_ = strip(&time)||':00';
                    datetime_iso = strip(date_iso)||'T'||strip(time_);
                end;
            if length(&time) = 4 then do;
                    time_ = strip(substr(&time,1,2))||':'||strip(substr(&time,3,4))||':00';
                    datetime_iso = strip(date_iso)||'T'||strip(time_);
                end;
            if length(&time) = 2 then do;
                    time_ = strip(&time)||':00:00';
                    datetime_iso = strip(date_iso)||'T'||strip(time_);
                end;
        end;
    *if time part is missing;
    if &fmt = '2' and missing(&time) and not missing(date_iso) then datetime_iso = strip(date_iso);
    *if date part is missing;
    if &fmt = '2' and not missing(&time) and missing(date_iso) then datetime_iso = '';
    drop time_ date_new ;
run;

    data &out;
        length &outdate $20;
        set convert2;
        if &fmt = '1' then &outdate = date_9;
        else if &fmt = '2' and missing(&time)then &outdate = date_iso;
        else if &fmt = '2' and not missing(&time) then &outdate = datetime_iso;
        drop date_9 date_iso datetime_iso ;
    run;

%mend convert;

/*Macro for creating final dataset */
%let protocol=OP1092 ;
%let proto = OP1092;

filename servj "&dir1.\servj.sas";

%macro trnz(dt=,vr=);
    proc transpose data=&dt out=&dt._trn (drop=_NAME_);
        id varname;
        var &vr;
    run;
%mend trnz;


%macro di();
data _null_; 
    file servj pad lrecl=120 ;
    put @1 "data _&otdt;";
    put @1 "attrib";
    %do i = 1 %to &nobs;
      put @1 "_&&vr&i label='&&lb&i' length=&&le&i";
    %end;
    put @1 ';set &indt;';
    %do i = 1 %to &nobs;
      put @1 "_&&vr&i=&&vr&i; ";
      put @1 "drop &&vr&i;";
    %end;
    put @1 "run;";
    put @1 "data &otdt;";
    put @1 "set _&otdt;";
    %do i = 1 %to &nobs;
      put @1 "rename _&&vr&i=&&vr&i; ";
      put @1 "keep _&&vr&i;";
    %end;
    put @1 "run;";
run;
%inc servj; run;
%mend di;


%macro di1();
data _null_; 
        set raads1 end=eof;
        file servj pad lrecl=72 ;
        %do i = 1 %to 1;
            if _n_=1 then do;
                put @1 "data stand;";
                put @1 "attrib";
                put @1 "&&vr&i label='%quote(&&lb&i)' length=&&le&i";
            end;
        %end;
        %do i = 2 %to &nobs;
            if _n_=2 then do;           
                put @1 "&&vr&i label='%quote(&&lb&i)' length=&&le&i";
            end;
        %end;
    if eof then put @1 ';set nulst; run;';
run;
    %inc servj; 
%mend di1;

%macro tkattrib(indt=, otdt=, dtnam=);

/*Importing the variables of the dataset as per specification*/
options noxwait noxsync;

data _null_;
    x=sleep(2);
run;
%sysexec "&dir1\ED-PH-&proto.-DM-SDTM-Specification.xlsx"; 
data _null_;
    x=sleep(2);
run;

filename ads dde 
    "Excel|&dir1\[ED-PH-&proto.-DM-SDTM-Specification.xlsx]&dtnam.!R2C1:R80C6" notab;
data raads;
    infile ads dlm='09'x dsd missover;
    informat
        dtname $10.
        varname $30.
        label $60.
        type $60.
        length $60.
    ;
    input
        dtname varname label type length   
    ;
    format
        dtname $10.
        varname $30.
        label $60.
        type $60.
        length $60.
    ;
run;

filename ads dde 'excel|system';
 data _null_;
  file ads;
  put 
  '[FILE-close("&dir1\ED-PH-&proto.-DM-SDTM-Specification.xlsx")]';
 run;


data raads1;
    set raads;
    if not missing(type) ;*and index(TYPE,'N')=0 ;
    if upcase(type)='CHAR' then length="$"||trim(length)||".";
    drop dtname;
run;

/*Identifying the character and numeric variables from spec*/
data num char;
    set raads1;
        if upcase(type)='CHAR' then do;
            rslt=' ';
        output char;
        end;

    else if upcase(type)='NUM' then do;
        rsltn=.;
    output num;
    end;
run;

%trnz (dt=num,vr=rsltn);
%trnz (dt=char,vr=rslt);

data nulst;
    set num_trn char_trn;
run;

/*Identifying the number of variables and number of observations from the spec*/
data _null_;
    set sashelp.vtable;
    if trim(libname) = 'WORK' and trim(memname) ='RAADS1' then do;
        call symput('nobs',trim(left(put(nobs,6.))));
        call symput('nvar',trim(left(put(nvar,6.))));
    end;
run;

data ss1;
    set sashelp.vcolumn; 
    where trim(libname) = 'WORK' and trim(memname) ='RAADS1' ;
run;
    
/*Generating macro variables for all the observations*/
proc sql noprint;
    create table sd as select varname,label,length from raads1;
    select varname into :vr1-:vr&nobs from sd;
    select label into :lb1-:lb&nobs from sd;
    select length into :le1-:le&nobs from sd;
    *select format into :ft1-:ft&nobs from sd;
quit;

/*populating the attribs to an external file and passing the same to the datset*/
%di;

/*****Set of code for comparing the spec and dataset for identifying the descrepencies*****/
%di1;

proc contents data=stand memtype=work out=standout (KEEP=NAME TYPE LABEL LENGTH ) noprint;
run;

proc contents data=&indt. memtype=work out=outdout (KEEP=NAME TYPE LENGTH ) noprint;
run;

data standout;
    set standout;
    name=upcase(name);
run;

data outdout;
    set outdout;
    name=upcase(name);
run;

proc sort data=standout out=standout1(rename=(Type=sTYPE LENGTH=slength )) ;
    by name;
run;

proc sort data=outdout ;
    by name;
run;

data comp;
    merge standout1(in=std) outdout(in=out);
    by name;
    if std and not out then put Name ' is defined in Spec not in Dataset';
    else if out and not std then put Name ' is defined in Dataset not in Spec';
    if length ne slength then put 'Length is different for the variable ' name ;
    if type ne stype then put 'Type is different for the variable ' name;

run;

%mend tkattrib;

%macro merge (a=,b=,c=,d=); 
data &a;
merge &b(in=a) &c(in=b);
by &d;
if b;
run;
%mend;
%macro di_ad();
data _null_; 
    set raads1 end=eof;
    file servj pad lrecl=72 ;
    %do i = 1 %to 1;
        if _n_=1 then do;
                put @1 "data &otdt;";
                
            put @1 "attrib";
            put @1 "&&vr&i label='&&lb&i' length=&&le&i";
        end;
    %end;
    %do i = 2 %to &nobs;
        if _n_=2 then do;           
            put @1 "&&vr&i label='&&lb&i' length=&&le&i";
        end;
    %end;
    if eof then put @1 ';set &indt; run;';
run;
%inc servj; run;
%mend di_ad;
%macro tkattrib_adam(indt=, otdt=, dtnam=);

/*Importing the variables of the dataset as per specification*/
options noxwait noxsync;

data _null_;
    x=sleep(2);
run;
%sysexec "&dir1\ED-PH-&proto.-DM-ADaM-Specification.xlsx"; 
data _null_;
    x=sleep(2);
run;

filename ads dde 
    "Excel|&dir1\[ED-PH-&proto.-DM-ADaM-Specification.xlsx]&dtnam.!R2C1:R150C6" notab;
data raads;
    infile ads dlm='09'x dsd missover;
    informat
        dtname $10.
        varname $30.
        label $60.
        type $60.
        length $60.
    ;
    input
        dtname varname label type length   
    ;
    format
        dtname $10.
        varname $30.
        label $60.
        type $60.
        length $60.
    ;
run;

filename ads dde 'excel|system';
 data _null_;
  file ads;
  put 
  '[FILE-close("&dir1\ED-PH-&proto.-DM-ADaM-Specification.xlsx")]';
 run;


data raads1;
    set raads;
    if not missing(type) ;*and index(TYPE,'N')=0 ;
    if upcase(type)='CHAR' then length="$"||trim(length)||".";
    drop dtname;
run;

/*Identifying the character and numeric variables from spec*/
data num char;
    set raads1;
        if upcase(type)='CHAR' then do;
            rslt=' ';
        output char;
        end;

    else if upcase(type)='NUM' then do;
        rsltn=.;
    output num;
    end;
run;

%trnz (dt=num,vr=rsltn);
%trnz (dt=char,vr=rslt);

data nulst;
    set num_trn char_trn;
run;

/*Identifying the number of variables and number of observations from the spec*/
data _null_;
    set sashelp.vtable;
    if trim(libname) = 'WORK' and trim(memname) ='RAADS1' then do;
        call symput('nobs',trim(left(put(nobs,6.))));
        call symput('nvar',trim(left(put(nvar,6.))));
    end;
run;

data ss1;
    set sashelp.vcolumn; 
    where trim(libname) = 'WORK' and trim(memname) ='RAADS1' ;
run;
    
/*Generating macro variables for all the observations*/
proc sql noprint;
    create table sd as select varname,label,length from raads1;
    select varname into :vr1-:vr&nobs from sd;
    select label into :lb1-:lb&nobs from sd;
    select length into :le1-:le&nobs from sd;
    *select format into :ft1-:ft&nobs from sd;
quit;

/*populating the attribs to an external file and passing the same to the datset*/
%di_ad;

/*****Set of code for comparing the spec and dataset for identifying the descrepencies*****/
%di1;

proc contents data=stand memtype=work out=standout (KEEP=NAME TYPE LABEL LENGTH ) noprint;
run;

proc contents data=&indt. memtype=work out=outdout (KEEP=NAME TYPE LENGTH ) noprint;
run;

data standout;
    set standout;
    name=upcase(name);
run;

data outdout;
    set outdout;
    name=upcase(name);
run;

proc sort data=standout out=standout1(rename=(Type=sTYPE LENGTH=slength )) ;
    by name;
run;

proc sort data=outdout ;
    by name;
run;

data comp;
    merge standout1(in=std) outdout(in=out);
    by name;
    if std and not out then put Name ' is defined in Spec not in Dataset';
    else if out and not std then put Name ' is defined in Dataset not in Spec';
    if length ne slength then put 'Length is different for the variable ' name ;
    if type ne stype then put 'Type is different for the variable ' name;

run;

%mend tkattrib_adam;

/*Sorting macro*/

%macro sort (a=,b=,c=);
proc sort data=&a out=&b;
	by &c;
	run;
%mend;
/*Min length macro*/

%macro minlength(inds=) ; 

proc contents data= &inds. out=attr(keep = type name where = (type = 2)) noprint; run; 
proc sql noprint;
select count(name) into: n from attr;
quit;

%do i=1 %to &n; 

data null; 
  set attr ; 
  if _n_=&i then call symputx("var", name); 
run; 

proc sql noprint;   
  %do; 
     select max(length(&var)) into: len from &inds.; 
  %end; 
  alter table &inds. 
  modify &var char(&len); 
quit; 
%end; 
%mend minlength; 

/*EPOCH MACRO*/
%macro epoch_dev(inds=,outds=,dtn=);
data se;
	set sdtm.se;
	if sestdtc ne "" then sestdtn=input(substr(sestdtc,1,10),e8601da.);
		if seendtc ne "" then seendtn=input(substr(seendtc,1,10),e8601da.);
run;
proc transpose data=se out=se_st(drop=_name_) suffix=_st;
by usubjid;
id etcd;
var sestdtn;
run;
proc transpose data=se out=se_en(drop=_name_) suffix=_en;
by usubjid;
id etcd;
var seendtn;
run;
proc sort data=se_st;by usubjid;run;
proc sort data=se_en;by usubjid;run;
data se_final;
	merge se_st(in=a) se_en(in=b);
	by usubjid;
	if a or b;
proc sort;by usubjid;
run;
proc sort data=&inds.;by usubjid;run;
data &outds.;
length epoch $60.;
	merge &inds. (in=a) se_final(in=b);
by usubjid;
if a;
if nmiss(&dtn.,scrn_st,scrn_en)=0 then do;
	if base_st ne . & (scrn_st<=&dtn.<scrn_en) then epoch="SCREENING";
else if base_st eq . & (scrn_st<=&dtn.<=scrn_en) then epoch="SCREENING";
end; 
else if nmiss(&dtn.,scrn_st)=0 & scrn_en eq . then do;
	if &dtn.>=scrn_st then epoch="SCREENING";
end;

if nmiss(&dtn.,base_st,base_en)=0 then do;
	if trt_st ne . & (base_st<=&dtn.<base_en) then epoch="BASELINE";
else if trt_st eq . & (base_st<=&dtn.<=base_en) then epoch="BASELINE";
end; 
else if nmiss(&dtn.,base_st)=0 & base_en eq . then do;
	if &dtn.>=base_st then epoch="BASELINE";
end;

if nmiss(&dtn.,TRT_st,TRT_en)=0 then do;
	if hosp_st ne . & (TRT_st<=&dtn.<=TRT_en) then epoch="TREATMENT";
else if hosp_st eq . & (TRT_st<=&dtn.<=TRT_en) then epoch="TREATMENT";
end; 
else if nmiss(&dtn.,TRT_st)=0 & TRT_en eq . then do;
	if &dtn.>=TRT_st then epoch="TREATMENT";
end;

if nmiss(&dtn.,hosp_st,hosp_en)=0 then do;
if (hosp_st<=&dtn.<=hosp_en) then epoch="HOSPITALIZATION";
end; 
else if nmiss(&dtn.,hosp_st)=0 & hosp_en eq . then do;
	if &dtn.>=hosp_st then epoch="HOSPITALIZATION";
end;

if &dtn. <scrn_st then epoch="SCREENING";
if &dtn. eq . then epoch="";
run;
%mend;
