## About the SQL project
In this repository you can find the dataset file which contains null values in few columns and this dataset has more than 50000+ rows, if you want to download the dataset directly from the source <a href = "https://archive.ics.uci.edu/dataset/352/online%2Bretail"> Link</a> or you can download this dataset from my Github repo <a href = "https://github.com/vishwa-47/Online_retail_sales_analysis_usingSQL/blob/main/Online%20Retail.xlsx"> Link </a>

## Details of the columns available in this dataset:
-1.InvoiceNo -  a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'c', it indicates a cancellation this, column does not contain null values there are duplicate values in this column indicating that there were multiple  items purchased with the same invoice number

-2. StockCode it also can be referred to the product code of the item which is unique but still this column contains duplicate values since the customers have purchased the same items many times and does not contain any null values.

-3. Description this column contains detailed item specification to identify the category of this column so you can create a new column based  on the keywords to identity the type of item and this column contains null values.

-4. Quantity this column does not contain any null values and this column is must because there is no column mentioning about the total sales so you have to multiply this column with the other column to find out the total sales 

-5. InvoiceDate this column contains the date when the order was processed and the best part is that this column even have the item when the orders were processed so you can do a lot  of data exploration by using date functions like extract tochar etc.

-6. UnitPrice This columne contains the price of the each unit and there is no null values in this column

-7. CustomerID this identifies the customers and the id are unique but this column contains null values so make sure not to delete the null values instead replace the values and work with the data

-8. Country this column identifies where the  order was made and it does not contain any null values.


## I have answered few questions on this dataset you can find the <a href = "https://github.com/vishwa-47/Online_retail_sales_analysis_usingSQL/blob/main/sales_project_2025.sql"> SQL File</a>
