=begin
quastion: what are your assumptions;
answer:

1)
All the modes(manual,semi auto, auto) requier:
# main faucet status = open
# main pipe status = connect
# at least one sprinkler status != null

2)
semi auto mode also requier :
# Current_date,current_day,current_hour
#watering_days = [].length > 0
#watering_start_time  !=null
#watering_finish_time !=null 


3)
auto mode also requier :
# All the sensor works!
# Computer controling fields below != null:
# Current_date,current_day,current_hour
# One sprinkler at least work.

4)
Min sensors in the system = 0 (for manual && semi auto mode)
Max sensors in the system = 2

- what are the objects you will need to have; 

-Computer_Controling
-Sensor
-Weather_sensor
-Soil_sensor
-Main_Faucet 
-Main_Pipe
-Sprinkler
-Circular_Sprinkler
-Straight_Sprinkler

Additional information exists in the UML file :
-

https://app.diagrams.net/#G1822pwMATlGKqvvioxi9JCo9hD4kKJl8j

-
=end