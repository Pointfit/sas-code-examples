/* Importing text data */
data work.documents;
    infile '/path/to/documents.csv' dlm=',' firstobs=2;
    input DocID $ Text $;
run;

/* Using SAS Text Miner */
proc textmine data=work.documents;
    docid DocID;
    var Text;
    parse;
    textcluster;
    textcategorize out=work.categorized_docs;
run;
