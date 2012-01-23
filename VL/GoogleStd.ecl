﻿//---------------------------------------------------------------------------
// Macro to produce a Google chart.  Parameters are:
//   d          : Name of the dataset containing the data to chart.
//   sChartType : [OPTIONAL] The type of chart to display.  Default is 'Line'
//   sOpt       : [OPTIONAL] Any options desired.  Defaults are defined by
//                Google
//
// The dataset is assumed to be a STRING column contianing the x-axis values.
// All subsequent columns are assumed to be numeric and contain the y-values
// for each set.
//
// Options are passed in as a string of name/value pairs in the format
// expected by Google Charts.  E.g. 'title:"blah",width:600,height:400'
//
// A complete list of available options is located here:
//   http://code.google.com/apis/chart/interactive/docs/gallery/barchart.html#Configuration_Options
//---------------------------------------------------------------------------
IMPORT VL;
EXPORT GoogleStd(d,sChartType='Bar',sOpt='\'\''):=FUNCTIONMACRO
  lOutput:={STRING CHARTELEMENTTYPE;STRING s;};

  dData:=PROJECT(VL.ToGoogleTable(d),TRANSFORM(lOutput,SELF.CHARTELEMENTTYPE:='DATA';SELF:=LEFT;));
  dOptions:=DATASET([{'OPTIONS','var options={'+sOpt+'};'}],lOutput);
  #UNIQUENAME(c)
  dChart:=DATASET([{'CHARTCALL','var chart=new google.visualization.'+sChartType+'Chart(document.getElementById(\'GOOGLEStd_'+sChartType+%'c'%+'\'));chart.draw(data,options);'}],lOutput);

  dOutput:=dData+dOptions+dChart;

  RETURN OUTPUT(dOutput,NAMED('GOOGLEStd_'+sChartType+%'c'%));
ENDMACRO;
