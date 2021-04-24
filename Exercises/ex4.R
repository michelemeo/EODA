# variables declaration

Re = 6371*10^3   # meters
h = 705*10^3   # meters
g = 9.81   # m/s^2
r0 = 12352*10^3   # meters
day = 24*60*60    # seconds
C = 40000*10^3   # earth circle in meters
swath = 2330   # Km
channels = 36
bits_per_channel = 12
y = 203   # image along-track dimension (Km)
Vsat = 7.5   # Km/s

# ex.2

orbital_period = function(Re, h, g){
  period = sqrt((4*(pi^2)*(Re+h)^3)/(g*Re^2))
  return(period)
}

period = orbital_period(Re, h, g)

# ex.3

i = acos(-((Re+h)/r0)^3.5)
i
i*180/pi  # angle in degree

# ex.4

number_orbits_day = day/period
number_orbits_day

# ex.5

number_orbits_cycle = number_orbits_day*16
number_orbits_cycle

# ex.6

delta = C*period/day
delta

# ex.7

pixels = swath*203
pixels

V = pixels*channels*bits_per_channel
Vmega = V/10^6
Vmega

t = y/Vsat 
t  

rate = Vmega/t
rate
