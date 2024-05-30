/* data_summary.sas */
/* Importing data */
data work.sales;
    infile '/path/to/sales.csv' dlm=',' firstobs=2;
    input OrderID $ Date :mmddyy10. Region $ SalesAmount;
run;

/* Summarizing data */
proc means data=work.sales n mean std min max;
    var SalesAmount;
run;

/* Creating a new variable */
data work.sales;
    set work.sales;
    SalesCategory = ifc(SalesAmount > 1000, 'High', 'Low');
run;
