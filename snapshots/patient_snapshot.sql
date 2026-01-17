{% snapshot patient_snapshot %}

{{
    config(
        target_database='DBT_DB',
        target_schema='PUBLIC',
        unique_key='PATIENT_ID',
        strategy='check',
        check_cols=['PATIENT_NAME','PATIENT_CONTACT_NUMBER','PATIENT_EMAIL_ID','PATIENT_ADDRESS']
    )
}}

SELECT 
    PATIENT_ID,
    PATIENT_NAME,
    PATIENT_CONTACT_NUMBER,
    PATIENT_EMAIL_ID,
    PATIENT_ADDRESS
FROM DBT_DB.PUBLIC.PATIENT_SRC
QUALIFY ROW_NUMBER() OVER (PARTITION BY PATIENT_ID ORDER BY PATIENT_ID) = 1

{% endsnapshot %}