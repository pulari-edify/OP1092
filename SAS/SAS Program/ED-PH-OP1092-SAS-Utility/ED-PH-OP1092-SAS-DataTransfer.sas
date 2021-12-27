/**************************************************************
* PROTOCOL ID                    : OP1092
* SPONSOR                        :  
* CRO                            : OPTIMED
* PROGRAM NAME                   : ED-PH-OP1092-SAS-DataTransfer
* DATE                           : 27Dec2021
* AUTHOR                         : Pulari S R
* VALIDATED BY                   : 
* PLATFORM                       : SAS 9.2 Windows XP 
* VERSION INFORMATION            : V1.0
***************************************************************/

data WORK.PDPARAM                                  ;
      %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
      infile 'F:\Projects\OP1092\Data Management\pdparam_chk.csv' MISSOVER DSD lrecl=32767 ;
	  		 			 							
         informat VarName $8. ;
         informat VarName_short $4. ;
         informat Condition $7. ;
         informat Condition_short $4. ;
         informat PDTESTCD $8. ;
         informat VarLabel $40. ;
         informat PDTEST $24. ;
		 informat PDNUM 8. ;

         format VarName $8. ;
         format VarName_short $4. ;
         format Condition $7. ;
         format Condition_short $4. ;
         format PDTESTCD $8. ;
         format VarLabel $40. ;
         format PDTEST $24. ;
		 format PDNUM 8. ;

      input 		 							
                  VarName $
                  VarName_short $
                  Condition $
                  Condition_short $
                  PDTESTCD $
                  VarLabel $
                  PDTEST $
				  PDNUM 
      ;
      if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
      run;

	  data sdtm.PDPARAM;
	  	set PDPARAM;
		if _n_=1 then delete;
	  run;
