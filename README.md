# Massachusetts Teachers Driver Academy Class Availability

I have been trying to sign up for driving classes at https://www.tds.ms/ since November 14th after I passed my permit exam online. And I could manage to book only 1 class till now. Not sure at what time during the day they update the website, but anytime I check during the day, either the info has not been updated or the dates have moved on. So I decided to write a script which will run every 5 minutes and send me an email as soon as a driving class date is available. The shell script was written in bash. For sending the email through my gmail account, I had to turn this setting ON: https://myaccount.google.com/lesssecureapps to allow my script to talk to gmail (note that I still use ssl so its not really less secure - its just that gmail doesnt think my program is an established known client).

Before running the script, update the ##TDSID##, ##TDSPASSWD##, ##GMAILID##, ##GMAILPASSWD## with your own ids and passwords. 

To run the script periodically every 5 minutes, I set it up as a cron job. A good explanation on how to setup cron can be found here: https://medium.com/macoclock/automate-running-a-script-using-crontab-on-macos-88a378e0aeac. I basically used the following cron expression to schedule the 5 min job: _"*/5 * * * * . /Users/adasari2022/Projects/driving-class-availability/DrivingClassCheck.sh"_

When the dates become available, an email gets sent out. The body of the email will look like this and have a list of available dates:

&lt;input type="hidden" id="hdnAvailableDates" value="2021-1-6,2021-1-7,2021-1-8,2021-1-12,2021-1-13,2021-1-14,2021-1-15,2021-1-18,2021-1-20,2021-1-21,2021-1-22,2021-1-26,2021-1-27,2021-1-29" /&gt;

