## Problem 4: Streaming

Download and upload the below json files to a cloud storage (Azure, AWS, GCP) manually 

[json_files.zip](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7ea8decf-3497-46c4-8095-25ea0a81a40e/json_files.zip)

You are required to:

1. Ingest json files from the cloud storage using Apache Spark Structured Streaming or Databricks Autoloader (read the documentation if you are not familiar with these topics)
2. Write the ingested data to a table without any transformations
3. Infer the schema of the ingested data automatically instead of providing the schema manually
4. Auto-detection of new files in the cloud folder if more json files are added to it.

## Solution

