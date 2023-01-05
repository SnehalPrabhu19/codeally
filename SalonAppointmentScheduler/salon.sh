#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU()
{
  # print available services
  SERVICE_AVAILABLE=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICE_AVAILABLE" | while read ID BAR NAME
  do
  echo -e "$ID) $NAME"
  done
  # get service id
  read SERVICE_ID_SELECTED
  CHECK
} 
CHECK()
{
# if not a number or not available
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
if [[ -z $SERVICE_NAME ]]
then
echo -e "\nI could not find that service. What would you like today?"
MAIN_MENU
else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # CHECK RECORD
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # IF NO RECORD
  if [[ -z $CUSTOMER_NAME ]]
  then
    # ask for name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert into table
    INSERT_INTO_CUSTOMER=$($PSQL "INSERT INTO customers (phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  echo customer check $CUSTOMER_ID $CUSTOMER_NAME $CUSTOMER_PHONE

  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # insert into appointments table
  INSERT_INTO_APP=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

  echo -e "I have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MAIN_MENU

