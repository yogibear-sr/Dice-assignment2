import json
import boto3
from collections import Counter

def returnSum(dict):
     sum = 0
     for i in dict.values():
           sum = sum + i
     return sum

def lambda_handler(event, context):

    bucket = 'roll-the-dice0123456789'
    keys = []

    s3 = boto3.client('s3')
    resp = s3.list_objects_v2(Bucket=bucket)
    for obj in resp['Contents']:
        keys.append(obj['Key'])
        
    if len(keys) > 1:
        
        stream = s3.get_object(Bucket=bucket, Key=keys[1])
        contents = stream['Body'].read()
        data = json.loads(contents)
        Rolls=returnSum(data)
        
        d1=data
    
        keys.pop(1)

        for i in range(len(keys)):
            stream = s3.get_object(Bucket=bucket, Key=keys[i])
            contents = stream['Body'].read()
            data = json.loads(contents)
            Rolls = Rolls + returnSum(data)

# now merge the two arrays using Counter
            d1 = Counter(d1)+Counter(data)

        print("TOTAL number of rolls is ", Rolls)

# go through each element in the array summarise and print
        for key,value in d1.items():
            percent = (value / Rolls)*100
            print("The number ",key, "was rolled ",value, "times, which is ", round(percent,2),"%")
                
    else:
        print("Not enough files to compare")
        print("Roll the dice a few more times")

    return {
        'statusCode': 200,
        'body': print("Finished")
    }
