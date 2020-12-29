# Teachers Driver Academy Class Availability

I have been trying to sign up for driving classes at https://www.tds.ms/ since November 14th after I passed my permit exam online. And I could manage to book only 1 class till now on December 30th. Not sure at what time during the day they update the website, but anytime I check during the day, either the info has not been updated or the dates have moved on. So I decided to write a script which will run every 5 minutes and send me an email as soon as a date is available. The shell script was written in bash. For sending the email through my gmail account, I had to turn this setting ON: https://myaccount.google.com/lesssecureapps to allow my script to talk to gmail (note that I still use ssl so its not less secure).

Before running the script, update the ##TDSID##, ##TDSPASSWD##, ##GMAILID##, ##GMAILPASSWD## with your ids and passwords. 

To run the script periodically every 5 minutes, I set it up as a cron job. A good explanation on how to etup cron can be found here: https://medium.com/macoclock/automate-running-a-script-using-crontab-on-macos-88a378e0aeac. I basically used the following cron expression to schedule the 5 min job: */5 * * * * . /Users/adasari2022/Projects/driving-class-availability/DrivingClassCheck.sh 

