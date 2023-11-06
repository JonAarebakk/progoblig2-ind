use context essentials2021
include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end

#oppgave 2a) Fikset tabellen ved bruk av "string-sanitizer" for å konvertere alle verdiene i energi-kolonnen til strings.

kWh-wealthy-consumer-data

#oppgave 2b) Laget en funksjon som konvertere string til number i kolonnen energi i tabellen

fun energi-to-number(str :: String) -> Number:
  cases (Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
  energi-to-number("") is 0
  energi-to-number("48") is 48
end

#oppgave 2c) Bruker funksjonen "transform-column" fra dcic-2021. 

transformed-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)
transformed-table

#oppgave 2d)

fun car-energi-per-day(distance-traveled-per-day, distance-per-unit-of-fuel, energi-per-unit-of-fuel):
  ( distance-traveled-per-day / distance-per-unit-of-fuel ) * energi-per-unit-of-fuel
 
where:
  car-energi-per-day(17, 4, 8) is 34
end

distance-per-day = 17
distance-per-liter = 4
energi-per-unit-of-fuel = 8

#Beregner totale energiforbruket for en typisk innbygger i et industriland, sammen med funksjonen "sum og funksjonen ovenfor "car-energi-per-day"

total-energy-per-day = (sum(transformed-table, "energi") + car-energi-per-day(distance-per-day, distance-per-liter, energi-per-unit-of-fuel))


total-energy-per-day

#Lager en graf med dataen fra "transformed-table"

bar-chart(transformed-table, "komponent", "energi")

#Ny funksjon som oppdtaerer dataen i grafen for å få riktig output

fun energi-to-number-with-car(str :: String) -> Number:
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(17, 4, 8)
  end
  where:
   energi-to-number("") is 0
  energi-to-number("48") is 48
end

# Oppdatert versjon av tabellen som inkluderer energiforbruket til bil

  transformed-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

transformed-table-with-car

#Oppgave 2e) oppdatert graf med energiforbruk for bil

bar-chart(transformed-table-with-car, "komponent", "energi")
