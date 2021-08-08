# Dice-assignment2b

lambda function dice distribution simulation

       dice_summary.py - python script reads json data from the roll_dice.py output files in the s3 bucket and produces summary of the number of 
                         simulations and the percentage of each number coming up
       variables.tf - terraform varirables

       main.tf - main terraform file which create a lambda function and deploys the above python script.


Download the repository using git clone into a folder
Ensure you have access to AWS through access keys or token from the cli

Using terraform do the following

       terraform init
       
       terraform plan
       
       terraform apply
       (if it's all clear and there are no errors then say "yes" when prompted to do so)
       
When the above deployment is complete you can run the simlation by logging into the console and goto lambda and click on the function created above and click test with the following details

Give the test event any name and then save this and click on test button again and this will return a summary like the one below


        Response
        {
          "statusCode": 200,
          "body": null
        }

        Function Logs
        START RequestId: 75d536b5-17a3-4403-b7ee-caa5813ae3d1 Version: $LATEST
        TOTAL number of rolls is  3400
        The number  20 was rolled  46 times, which is  1.35 %
        The number  21 was rolled  66 times, which is  1.94 %
        The number  19 was rolled  54 times, which is  1.59 %
        The number  13 was rolled  121 times, which is  3.56 %
        The number  18 was rolled  48 times, which is  1.41 %
        The number  29 was rolled  74 times, which is  2.18 %
        The number  14 was rolled  92 times, which is  2.71 %
        The number  12 was rolled  139 times, which is  4.09 %
        The number  22 was rolled  52 times, which is  1.53 %
        The number  16 was rolled  65 times, which is  1.91 %
        The number  23 was rolled  61 times, which is  1.79 %
        The number  26 was rolled  71 times, which is  2.09 %
        The number  24 was rolled  61 times, which is  1.79 %
        The number  15 was rolled  78 times, which is  2.29 %
        The number  27 was rolled  59 times, which is  1.74 %
        The number  17 was rolled  59 times, which is  1.74 %
        The number  25 was rolled  60 times, which is  1.76 %
        The number  28 was rolled  80 times, which is  2.35 %
        The number  30 was rolled  60 times, which is  1.76 %
        The number  11 was rolled  158 times, which is  4.65 %
        The number  31 was rolled  94 times, which is  2.76 %
        The number  42 was rolled  54 times, which is  1.59 %
        The number  34 was rolled  119 times, which is  3.5 %
        The number  36 was rolled  110 times, which is  3.24 %
        The number  32 was rolled  131 times, which is  3.85 %
        The number  39 was rolled  98 times, which is  2.88 %
        The number  35 was rolled  115 times, which is  3.38 %
        The number  45 was rolled  26 times, which is  0.76 %
        The number  37 was rolled  106 times, which is  3.12 %
        The number  38 was rolled  104 times, which is  3.06 %
        The number  33 was rolled  97 times, which is  2.85 %
        The number  40 was rolled  78 times, which is  2.29 %
        The number  43 was rolled  38 times, which is  1.12 %
        The number  41 was rolled  65 times, which is  1.91 %
        The number  44 was rolled  17 times, which is  0.5 %
        The number  47 was rolled  10 times, which is  0.29 %
        The number  46 was rolled  14 times, which is  0.41 %
        The number  49 was rolled  5 times, which is  0.15 %
        The number  48 was rolled  8 times, which is  0.24 %
        The number  50 was rolled  3 times, which is  0.09 %
        The number  9 was rolled  149 times, which is  4.38 %
        The number  8 was rolled  117 times, which is  3.44 %
        The number  4 was rolled  19 times, which is  0.56 %
        The number  5 was rolled  36 times, which is  1.06 %
        The number  6 was rolled  50 times, which is  1.47 %
        The number  10 was rolled  146 times, which is  4.29 %
        The number  7 was rolled  80 times, which is  2.35 %
        The number  3 was rolled  6 times, which is  0.18 %
        The number  52 was rolled  1 times, which is  0.03 %
        Finished
        END RequestId: 75d536b5-17a3-4403-b7ee-caa5813ae3d1
        REPORT RequestId: 75d536b5-17a3-4403-b7ee-caa5813ae3d1	Duration: 2009.13 ms	Billed Duration: 2010 ms	
        Memory Size: 128 MB	Max Memory Used: 80 MB	Init Duration: 268.42 ms

        Request ID
        75d536b5-17a3-4403-b7ee-caa5813ae3d1
