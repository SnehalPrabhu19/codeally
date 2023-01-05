#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ ! $1 ]]
then
echo "Please provide an element as an argument."
exit
fi

# if atomic number
if [[ $1 =~ ^[0-9]+$ ]]
then
ATOMIC_ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
else
# if name or symbol
ATOMIC_ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
fi

# if not found
if [[ -z $ATOMIC_ELEMENT_INFO ]]
then
echo I could not find that element in the database.
else
# display output
echo $ATOMIC_ELEMENT_INFO | while IFS=" |" read ATOMIC_NUMBER ATOMIC_NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
do
echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
fi
