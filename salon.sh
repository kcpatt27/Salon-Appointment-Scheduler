#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon ~~~~~\n"

MANI_PEDI=$($PSQL "select service_id from services where service_id=1")
HAIR=$($PSQL "select service_id from services where service_id=2")
WAX=$($PSQL "select service_id from services where service_id=3")

SALON_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
    
  echo "How may I help you?"
  echo -e "\n$MANI_PEDI) Mani/Pedi \n$HAIR) Hair \n$WAX) Wax"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) MANI_PEDI ;;
    2) HAIR ;;
    3) WAX ;;
    # If you pick a service that doesn't exist, you should be shown the same list of services again
    *) SALON_MENU "Please enter a valid option." ;;
  esac
}

# 1, 000-000-0000, Fabio, 10:30pm
MANI_PEDI(){ 
  MENU_SELECTION=$MANI_PEDI
  SERVICE_NAME=$($PSQL "select name from services where service_id=$MENU_SELECTION")
  
  echo "Please enter your phone number."
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  # If a phone number entered doesn’t exist, you should get the customers name and enter it, and the phone number, into the customers table
  if [[ -z $CUSTOMER_ID ]]
  then
	echo "Please enter your name."
	read CUSTOMER_NAME
	
	# new customer entry into table
	NEW_CUSTOMER_INSERTED=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
	
    echo "Please enter service time."

    # NEEDS to take 11am AND 10:30 as valid times, USE SED
    read SERVICE_TIME
    # FORMATTED_TIME=$(echo $SERVICE_TIME | sed -E 's/[a-z]*$//; s/://g')
	SERVICE_TIME_ENTRY=$($PSQL "insert into appointments(time) values('$SERVICE_TIME')")
	
	# output success message of "I have put you down for a <service> at <time>, <name>"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
	
  else
    echo "Please enter service time."

    # NEEDS to take 11am AND 10:30 as valid times, USE SED
    read SERVICE_TIME
    # FORMATTED_TIME=$(echo $SERVICE_TIME | sed -E 's/[a-z]*$//; s/://g')
	SERVICE_TIME_ENTRY=$($PSQL "insert into appointments(time) values('$SERVICE_TIME')")
	
    # output success message of "I have put you down for a <service> at <time>, <name>"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}


# 2, 000-000-0000, Fabio, 11am
HAIR(){ 
  MENU_SELECTION=$HAIR
  SERVICE_NAME=$($PSQL "select name from services where service_id=$MENU_SELECTION")
  
  echo "Please enter your phone number."
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  # if phone number isnt in db
  # If a phone number entered doesn’t exist, you should get the customers name and enter it, and the phone number, into the customers table
  if [[ -z $CUSTOMER_ID ]]
  then
	echo "Please enter your name."
	read CUSTOMER_NAME
	
	# new customer entry into table
	NEW_CUSTOMER_INSERTED=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
	
    echo "Please enter service time."

    # NEEDS to take 11am AND 10:30 as valid times, USE SED
    read SERVICE_TIME
    # FORMATTED_TIME=$(echo $SERVICE_TIME | sed -E 's/[a-z]*$//; s/://g')
	  SERVICE_TIME_ENTRY=$($PSQL "insert into appointments(time) values('$SERVICE_TIME')")
	
	# output success message of "I have put you down for a <service> at <time>, <name>"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
	
  else
    echo "Please enter service time."

    # NEEDS to take 11am AND 10:30 as valid times, USE SED
    read SERVICE_TIME
    # FORMATTED_TIME=$(echo $SERVICE_TIME | sed -E 's/[a-z]*$//; s/://g')
	SERVICE_TIME_ENTRY=$($PSQL "insert into appointments(time) values('$SERVICE_TIME')")
	
    # output success message of "I have put you down for a <service> at <time>, <name>"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}


# 3, 000-0000, Fabio, 10:30
WAX(){ 
  MENU_SELECTION=$WAX
  SERVICE_NAME=$($PSQL "select name from services where service_id=$MENU_SELECTION")

  echo "Please enter your phone number."
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  # if phone number isnt in db
  # If a phone number entered doesn’t exist, you should get the customers name and enter it, and the phone number, into the customers table
  if [[ -z $CUSTOMER_ID ]]
  then
	echo "Please enter your name."
	read CUSTOMER_NAME
	
	# new customer entry into table
	NEW_CUSTOMER_INSERTED=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
	
    echo "Please enter service time."

    # NEEDS to take 11am AND 10:30 as valid times, USE SED
    read SERVICE_TIME
    # FORMATTED_TIME=$(echo $SERVICE_TIME | sed -E 's/[a-z]*$//; s/://g')
	SERVICE_TIME_ENTRY=$($PSQL "insert into appointments(time) values('$SERVICE_TIME')")
	
	# output success message of "I have put you down for a <service> at <time>, <name>"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
	
  else
    echo "Please enter service time."

    # NEEDS to take 11am AND 10:30 as valid times, USE SED
    read SERVICE_TIME
    # FORMATTED_TIME=$(echo $SERVICE_TIME | sed -E 's/[a-z]*$//; s/://g')
	SERVICE_TIME_ENTRY=$($PSQL "insert into appointments(time) values('$SERVICE_TIME')")
	
    # output success message of "I have put you down for a <service> at <time>, <name>"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SALON_MENU