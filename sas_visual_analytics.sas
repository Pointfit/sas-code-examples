/* Assuming data is loaded into CAS library */
libname mycaslib cas caslib='casuser';

/* Creating a bar chart */
proc sgplot data=mycaslib.sales;
    vbar Region / response=SalesAmount stat=mean;
    title "Average Sales by Region";
run;

/* Creating a line chart */
proc sgplot data=mycaslib.sales;
    series x=Date y=SalesAmount / group=Region;
    title "Sales Trends by Region";
run;
