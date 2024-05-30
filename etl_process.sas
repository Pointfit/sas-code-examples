/* Extracting data from a database */
libname db_lib odbc dsn='my_dsn' user='my_user' password='my_password';

data work.extracted_data;
    set db_lib.source_table;
run;

/* Transforming data */
data work.transformed_data;
    set work.extracted_data;
    /* Example transformation */
    NewVariable = OldVariable * 1.1;
run;

/* Loading data into a target table */
libname target_lib odbc dsn='target_dsn' user='target_user' password='target_password';

data target_lib.target_table;
    set work.transformed_data;
run;
