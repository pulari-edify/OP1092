/**************************************************************
* PROTOCOL ID                    : OP1092
* SPONSOR                        : 
* CRO                            : EUROFINS OPTIMED 
* PROGRAM NAME                   : ED-PH-OP1092-SAS-Initial
* DATE                           : 27Dec2021
* AUTHOR                         : Pulari S.R
* VALIDATED BY                   : 
* PLATFORM                       : SAS 9.2 Windows XP 
* VERSION INFORMATION            : V1.0
***************************************************************/
    options ls = 256 ps = 100 nofmterr nodate ;
    options formchar  = '_';
    options fmtsearch=( Raw SDTM ADaM inter trial);
    options validvarname=any; 
    
    /*Creating Macro Variables*/

    %let pgm=ED-PH-OP1092-SAS-Initial.sas;
    %let pgmfld= SAS\SAS Program\ED-PH-OP1092-SAS-Utility;
    %let dmfld= Data Management;
    %let sasfld= SAS;
    %let progfld= SAS Program;
    %let rawdata =ED-PH-OP1092-DM-Raw Data;

    %let sdtmdata =ED-PH-OP1092-SAS-SDTM Datasets;
    %let adamdata =ED-PH-OP1092-SAS-ADaM Datasets;
    %let trialdata =ED-PH-OP1092-SAS-SDTM Datasets\Trial Design;
    %let qcfld= Quality Control;
    %let qcdat1= ED-PH-OP1092-QC-Parallel Program\SDTM\Output;
    %let qcdat2= ED-PH-OP1092-QC-Parallel Program\ADaM\Output;
    %let clidoc= Client Documents;

    /*Get the Directory where the raw data has to be saved */
        %macro filePath;
        %global fpath maxRef;
        proc sql noprint;
            select xpath into :fPath
            from sashelp.vextfl where xpath ? "&pgm";
        quit;
        %let fpath = %trim(&fpath);
        %put &fpath;

        %global dir1 dir2 dir3 dir4 pgm1 pgmfld1;
        %let pgm1 =%trim(&pgm);
        %let pgmfld1= %trim(&pgmfld);
    
        data _null_;
            y=length("&fpath")-length("&pgm1")-length("&pgmfld1")-1;
            call symput("dir1" ,trim(substr("&fpath",1,y)||trim("&dmfld")));
            call symput("dir2" ,trim(substr("&fpath",1,y)||trim("&sasfld")));
            call symput("dir3" ,trim(substr("&fpath",1,y)||trim("&qcfld")));
            call symput("dir4" ,trim(substr("&fpath",1,y)||trim("&clidoc")));

        run;
    %mend filePath; 

    %filePath;
    %put &dir1;
    %put &dir2;
    %put &dir3;
    %put &dir4;

    /*Assigning raw data directory path for primary data to a macro variable*/
    %let rawDir    = &dir1\&rawdata;
    %let sdtmDir   = &dir2\&sdtmdata;
    %let adamDir   = &dir2\&adamdata;
    %let qcsdtm   = &dir3\&qcdat1;
    %let qcadam   = &dir3\&qcdat2;

    /*Assign SAS Data Library*/
    %macro AssignLib(myLib, libPath);
        %if (%sysfunc(libref(&myLib)) ne 0) %then
            libname &myLib "&libPath";
        %else
            %put NOTE: Library &myLib already exists;
    %mend;

    /*Assigning library name to the primary input datasets*/
    %AssignLib(Raw,&rawDir);
    %AssignLib(SDTM,&sdtmDir);
    %AssignLib(ADaM,&adamDir);
    %AssignLib(QCSDTM,&qcsdtm);
    %AssignLib(QCADAM,&qcadam);

    ods path tempstr.mystore (update)  sashelp.tmplt  (read);

    /*Storing templates*/
    %let store=&dir2.\SAS Program\ED-PH-OP1092-SAS-Utility;
    %AssignLib(tempstr,&store);

    %put &rawdata;
    %inc "&dir2\SAS Program\ED-PH-OP1092-SAS-Utility\ED-PH-OP1092-SAS-Formats.sas";
    %inc "&dir2\SAS Program\ED-PH-OP1092-SAS-Utility\ED-PH-OP1092-SAS-Macros.sas";
    %inc "&dir2\SAS Program\ED-PH-OP1092-SAS-Utility\ED-PH-OP1092-SAS-Templates.sas";
		


