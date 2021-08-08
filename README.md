# Dice-assignment2b

lambda function dice distribution simulation

dice_summary.py - python script reads json data from the roll_dice.py output files in the s3 bucket and produces summary of the number of simulations and the percentage of each number coming up

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

Give the test event any name and then save this and click on test button again and this will return a summary 
