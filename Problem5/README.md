## Problem 5: Time Series

The excel below contains data on the work done by AGI bots who can multi-task and do multiple types of work. They record the start and end time of each task that they undertake along with the name of the activity in this excel file.

[Time Series](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a5d30693-0a11-417a-a01c-078ea10bea91/Untitled.xlsx)

Since the bots can multi-task and therefore can be doing multiple tasks in parallel, it is not possible to directly determine when they were working and when they were idle. You are required to:

1. Perform transformations on the data to output continuous periods (start, end) of work done by each bot and aggregate the activities done during such periods as an array against each period.
2. Solve the problem using python and SQL both


### Solution

Python: Solution can be found in `timeseries.ipynb` file.


SQl: Solution can be found in `queries.sql` file.