<div style='position:relative'>
    <span style='position:absolute; left:0;'>Student Name: <b>Kristine Cheng (yc4352)</b><br><br>
                                             Accomplished Date: 4/12/2023</span>
    <span style='position:absolute; left:70%;'>
        <img style="width:400px; height:60px;" src="https://z1.ax1x.com/2023/12/05/pi63QFs.png" 
             alt="IEOR_LOGO.png" title="IEOR_LOGO.png" />
    </span>
</div>
<br><br><br>
<div style='text-align:center'><font style='text-align:center; font-size:24px'><b>NYC Apartment Search</b></font></div>

---

<h1 id="h1_0">Abstract</h1>

This project is built upon the NYC public dataset, 
employing `geopandas` for data cleansing.
Leveraging `PosterSQL` and `PostGIS` for data storage and processing, 
it conducts an analysis and study on the apartment rental situation in NYC.

We initiated the project by downloading and cleaning the data, 
followed by writing it into the `PosterSQL` database. 
Subsequently, data analysis was conducted through SQL queries.
Finally, we utilized `Matplotlib` to visually represent the data obtained through queries.

<h1>Menu</h1>

- <a href="#h1_0">Abstract</a></br></br>
- <a href="#h1_1">How to Replicate the Project</a></br></br>
    - <a href="#h2_1">Start From Very Beginning</a></br></br>
    - <a href="#h2_2">Start With Existent Database</a></br></br>
- <a href="#h1_2">Introduction to Each Part</a></br></br>
    - <a href="#h2_2_0">Set Up</a></br></br>
    - <a href="#h2_2_1">Part 1</a></br></br>
    - <a href="#h2_2_2">Part 2</a></br></br>
    - <a href="#h2_2_3">Part 3</a></br></br>
    - <a href="#h2_2_4">Part 4</a></br></br>

<h1 id="h1_1">How to Replicate the Project</h1>

<h2 id="h2_1">Start From Very Beginning</h2>

If it's the first time for you to replicate this project, 
you can follow the instructions here:

- Check out the `requirements.txt` to make sure what packages we need.<br><br>
- Run all the cells of Part1 in order. (It may take you about a hour due to the large data,
and you have to ensure **a stable internet connection** and **a remaining disk space of 
over *12GB*** when downloading the data.)<br><br>
- Before you run the Part2 codes, you need to replace the information about the database with yours,
i.e. you need set `DB_USER` to your user name, and `DB_PASSWORD` to your user password,
and `DB_NAME` to your expected database name.<br><br>
- Run all cells after you finished the initial setting in Part2.

<h2 id="h2_2">Start With Existent Database</h2>

If you already have a database filled with correct data, 
you can follow the instructions here:

- Before you run the codes, 
you need to replace the information about the database with yours in **Part 2**,
i.e. you need set `DB_USER` to your user name, and `DB_PASSWORD` to your user password,
and `DB_NAME` to your expected database name.<br><br>
- Run the cells in **Set Up** to import packages, 
then run the cells in Part 2 until you finish running the
SQL execution function called `execute_SQL`.<br><br>
- Then run all the cells from Part 3.

<h1 id="h1_2">Introduction to Each Part</h1>

<h2 id="h2_2_0">Set Up</h2>

This part is used for importing the packages and initialize some necessary consts.
You should always run this part first to make the codes work.

<h2 id="h2_2_1">Part 1</h2>

This part is used for **Loading and Cleaning the Data**.

In this project, we focus on 4 data sets. 
And we prrovide a function for each of them to load data from online resources 
or from local files. Also, we provide a function to get them all. Now here are the functions:

`download_nyc_geojson_data`
> It's a related function for getting NYC311 and NYC Tree data. 
You can use it with a given geojson file name to downloading an original data.
If you want to filter the data when downloading, you can write a SQL query and 
pass it as `query` argument. It will return a Geopandas datafranme for you.

<br>

`load_and_clean_zipcodes`
> You can get a geopandas dataframe contains zipcodes information by call this function.

<br>

`download_and_clean_311_data`
> You can get a geopandas dataframe contains 311 complaints information
by call this function. And it'll write a local file to store data.<br><br>
P.S. The file's suffix is defaulted by .csv

<br>

`download_and_clean_tree_data`
> You can get a geopandas dataframe contains trees' information
by call this function. And it'll write a local file to store data.<br><br>
P.S. The file's suffix is defaulted by .csv

`load_and_clean_zillow_data`
> You can get a geopandas dataframe contains rents information by call this function.

<br>

`load_all_data`
> You can get four geopandas dataframes by call this function. The order is same to 
the introduction to the functions.

We briefly clean data by dropping rows with NaN(missing value) except for zillow data. 
And due to the relationship in SQL is constructed with attribute 'zip', we drop off 
all rows with zipcodes beyond NYC. Then we replcae the duplicated zipcodes in ZIPCODE data 
by remaining the first one. Subsequently, we drop all rows with zipcodes not in ZIPCODE data.

What's more, we've renamed the columns in data to help build tables and resort the row indexes of them.

<h2 id="h2_2_2">Part 2</h2>

We create the `Schema.sql` file here to construct a related database with four related tables.

We define the information about the database in the head of this Part. 
Another very significant section of this part is a function called `execute_SQL`. 
You can call this function with a string contains the target SQL commands, 
and it will execute the given SQL commands then return the results in a list if there exists.

We've already provide accessible codes to build a database, create tables and insert data.

All these processing are based on a package named `psycopg2`. 
All interactions with the database in this project is based on it.

If you run all cells in this part, then you can see the geographic information in your 
PosterSQL as following:

- Instance for `ZIPCODE`

<img src="https://z1.ax1x.com/2023/12/05/pi6UfDx.png" alt="pi6UfDx.png" border="0" />

- Instance for `NYC311`

It's too large to view all in a map, so here is the instance for all rows in a table.

<img src="https://z1.ax1x.com/2023/12/05/pi6UH8H.png" alt="pi6UH8H.png" border="0" />

- Instance for `TREE`

<img src="https://z1.ax1x.com/2023/12/05/pi6Ub2d.png" alt="pi6Ub2d.png" border="0" />

- Instance for `ZILLOW`

There are no geometry information stored here can be visualized in PostGIS.

<img src="https://z1.ax1x.com/2023/12/05/pi6UXrt.png" alt="pi6UXrt.png" border="0" />

<h2 id="h2_2_3">Part 3</h2>

In this part, we use SQL commands to query information in database to deal with 6 questions.

You can see the SQL queries in `queries/QUERY_X.sql`. Here $X$ refers to the index 
of the question. And the codes will generate the results for each query as a .csv file in 
`queries/`

Note: Question 4 is quite different from others. We use 2 SQL querioes with `JOIN` method 
and get the results. So you can find two files about Question 4 in queries. 
And they are `QUERY_4_1.sql`, `QUERY_4_2.sql`.

Here's why we decide to do that:

If we JOIN nyc311 and tree together for each zipcode, then we need create temporary tables with: 
24,000,000×680,000 rows.

Obviously it's too enormous for a single query. We've tried it at first and the disk is 
filled with temporary files very quickly. And it can't return results in acceptable time.

After split it to two queries, we can get correct results within 3 minutes now.

Here are the results of our queries and you can also find them in the notebook,

- Question 1

| Row Index | code |Number of Complaints |
|:---:|:---:|:-------------------:|
|0|11226|1176|
|1|10467|1091|
|2|10457|1036|
|3|10468|981|
|4|10458|936|
|...|...|...|
|193|10110|1|
|194|10151|1|
|195|10055|1|
|196|10162|1|
|197|10166|1|

- Question 2

| Row Index | Zipcode |	Number of Trees |
|:---:|:---:|:-------------------:|
|0|	10312|22186|
|1|	10314|16905|
|2|	10306|13030|
|3|	10309|12650|
|4|	11234|11253|
|5|	11385|10937|
|6|	11357|9449|
|7|	11207|8634|
|8|	11434|8274|
|9|	11208|8245|

- Question 3

| Row Index | Zipcode |	Average Rent |
|:---:|:---:|:-------------------:|
|0|	10312|	1775.09|
|1|	10314|	2465.47|
|2|	10306|	2331.54|
|3|	10309|	1832.01|
|4|	11234|	2312.31|
|5|	11385|	3064.48|
|6|	11357|	2458.81|
|7|	11207|	3079.09|
|8|	11434|	2645.92|
|9|	11208|	2737.55|

- Question 4


| Row Index | Zipcode |	Average Rent | Tree Count | Complaint Count|
|:---:|:---:|:-------------------:|:---:|:---:|
|0|	10007|	7270.236702|	355|	13837|
|1|	10282|	7143.347680|	234|	1891|
|2|	10013|	5480.106304|	1202|	42520|
|3|	10069|	4959.670333|	119|	1704|
|4|	10011|	4741.866947|	2134|	58411|
|5|	10458|	1883.075801|	3405|	110267|
|6|	11357|	1829.663380|	9449|	38308|
|7|	10453|	1820.234164|	3050|	111967|
|8|	10462|	1801.890987|	4234|	78890|
|9|	10309|	1380.514269|	12650|	31806|

- Question 5

| Row Index | Zipcode |	Number of Trees |
|:---:|:---:|:-------------------:|
|0|	10312|	22186|
|1|	10314|	16905|
|2|	10306|	13030|
|3|	10309|	12650|
|4|	11234|	11253|
|5|	11385|	10937|
|6|	11357|	9449|
|7|	11207|	8635|
|8|	11434|	8274|
|9|	11208|	8246|

- Question 6

| Row Index| ID |	Species | Health | Status |	Coordinate Location |
|:---:|:---:|:-------------------:|:---:|:---:|:---:|
|0|	148556|	pin oak|	Good|	Alive|	POINT(-74.11266044 40.57981772)|
|1|	152598|	pin oak|	Good|	Alive|	POINT(-73.86612265 40.83930438)|
|2|	150392|	pin oak|	Good|	Alive|	POINT(-73.98210183 40.68259714)|
|3|	150409|	pin oak|	Good|	Alive|	POINT(-73.98063752 40.68202742)|
|4|	129234|	red maple|	Good|	Alive|	POINT(-73.74799966 40.71194692)|

<h2 id="h2_2_4">Part 4</h2>
