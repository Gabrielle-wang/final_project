
CREATE TABLE IF NOT EXISTS ZIPCODE (
            zip INTEGER PRIMARY KEY,
            county VARCHAR(255),
            geometry geometry(POLYGON, 4326)
);

CREATE TABLE IF NOT EXISTS NYC311 (
            unique_key INTEGER PRIMARY KEY,
            zip INTEGER,
            date DATE,
            type VARCHAR(255),
            borough VARCHAR(255),
            geometry geometry(POINT, 4326),
            community VARCHAR(255),
            latitude FLOAT,
            longitude FLOAT,
            FOREIGN KEY(zip) REFERENCES ZIPCODE(zip)
);

CREATE TABLE IF NOT EXISTS TREE (
            tree_id INTEGER PRIMARY KEY,
            zip INTEGER,
            date DATE,
            geometry geometry(POINT, 4326),
            status VARCHAR(255),
            health VARCHAR(255),
            spc_latin VARCHAR(255),
            spc_common VARCHAR(255),
            boroname VARCHAR(255),
            latitude FLOAT,
            longitude FLOAT,
            FOREIGN KEY(zip) REFERENCES ZIPCODE(zip)
);

CREATE TABLE IF NOT EXISTS ZILLOW (
            regionid INTEGER PRIMARY KEY,
            zip INTEGER,
            county VARCHAR(255),
            FOREIGN KEY(zip) REFERENCES ZIPCODE(zip),
            "2015-01" FLOAT,
            "2015-02" FLOAT,
            "2015-03" FLOAT,
            "2015-04" FLOAT,
            "2015-05" FLOAT,
            "2015-06" FLOAT,
            "2015-07" FLOAT,
            "2015-08" FLOAT,
            "2015-09" FLOAT,
            "2015-10" FLOAT,
            "2015-11" FLOAT,
            "2015-12" FLOAT,
            "2016-01" FLOAT,
            "2016-02" FLOAT,
            "2016-03" FLOAT,
            "2016-04" FLOAT,
            "2016-05" FLOAT,
            "2016-06" FLOAT,
            "2016-07" FLOAT,
            "2016-08" FLOAT,
            "2016-09" FLOAT,
            "2016-10" FLOAT,
            "2016-11" FLOAT,
            "2016-12" FLOAT,
            "2017-01" FLOAT,
            "2017-02" FLOAT,
            "2017-03" FLOAT,
            "2017-04" FLOAT,
            "2017-05" FLOAT,
            "2017-06" FLOAT,
            "2017-07" FLOAT,
            "2017-08" FLOAT,
            "2017-09" FLOAT,
            "2017-10" FLOAT,
            "2017-11" FLOAT,
            "2017-12" FLOAT,
            "2018-01" FLOAT,
            "2018-02" FLOAT,
            "2018-03" FLOAT,
            "2018-04" FLOAT,
            "2018-05" FLOAT,
            "2018-06" FLOAT,
            "2018-07" FLOAT,
            "2018-08" FLOAT,
            "2018-09" FLOAT,
            "2018-10" FLOAT,
            "2018-11" FLOAT,
            "2018-12" FLOAT,
            "2019-01" FLOAT,
            "2019-02" FLOAT,
            "2019-03" FLOAT,
            "2019-04" FLOAT,
            "2019-05" FLOAT,
            "2019-06" FLOAT,
            "2019-07" FLOAT,
            "2019-08" FLOAT,
            "2019-09" FLOAT,
            "2019-10" FLOAT,
            "2019-11" FLOAT,
            "2019-12" FLOAT,
            "2020-01" FLOAT,
            "2020-02" FLOAT,
            "2020-03" FLOAT,
            "2020-04" FLOAT,
            "2020-05" FLOAT,
            "2020-06" FLOAT,
            "2020-07" FLOAT,
            "2020-08" FLOAT,
            "2020-09" FLOAT,
            "2020-10" FLOAT,
            "2020-11" FLOAT,
            "2020-12" FLOAT,
            "2021-01" FLOAT,
            "2021-02" FLOAT,
            "2021-03" FLOAT,
            "2021-04" FLOAT,
            "2021-05" FLOAT,
            "2021-06" FLOAT,
            "2021-07" FLOAT,
            "2021-08" FLOAT,
            "2021-09" FLOAT,
            "2021-10" FLOAT,
            "2021-11" FLOAT,
            "2021-12" FLOAT,
            "2022-01" FLOAT,
            "2022-02" FLOAT,
            "2022-03" FLOAT,
            "2022-04" FLOAT,
            "2022-05" FLOAT,
            "2022-06" FLOAT,
            "2022-07" FLOAT,
            "2022-08" FLOAT,
            "2022-09" FLOAT,
            "2022-10" FLOAT,
            "2022-11" FLOAT,
            "2022-12" FLOAT,
            "2023-01" FLOAT,
            "2023-02" FLOAT,
            "2023-03" FLOAT,
            "2023-04" FLOAT,
            "2023-05" FLOAT,
            "2023-06" FLOAT,
            "2023-07" FLOAT,
            "2023-08" FLOAT,
            "2023-09" FLOAT
);