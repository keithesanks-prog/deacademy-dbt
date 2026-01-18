{{
  config({
    "materialized":'table',
    "pre_hook": "CREATE TABLE IF NOT EXISTS GLUEDB_PRODUCTION.RAW.COUNTRY_DETAILS_CP AS SELECT * FROM GLUEDB.PUBLIC.COUNTRY_DETAILS_CP WHERE 1=0", 
    "schema": 'RAW'
  })
}}

-- Hard-coding the source database to bypass the missing YAML definition
WITH country_details_raw AS (
  SELECT 
    X.VALUE AS SOURCE_DATA,
    CURRENT_TIMESTAMP(6) AS INSERT_DTS
  FROM GLUEDB.PUBLIC.COUNTRY_DETAILS_CP A,
  LATERAL FLATTEN (A.DATA) X
)

SELECT
  CAST(SOURCE_DATA AS VARIANT) AS SOURCE_DATA,
  CAST(INSERT_DTS AS TIMESTAMP(6)) AS INSERT_DTS
FROM country_details_raw