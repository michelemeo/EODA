vis = 0.5 * 10^(-6)
tir = 10 * 10^(-6)
h = 700 * 10^3
D = 0.1
a = 1.6 * 10^(-25)
w = 0.1
e = 0.99

# ex.1
SR = function(lambda, h, D){
  footprint = lambda*h/D
  return(footprint)
}

vis_sr = SR(vis, h, D)
tir_sr = SR(tir, h, D)
vis_sr
tir_sr 

# ex.2
tau_vis = a/vis^4
tau_tir = a/tir^4
tau_vis
tau_tir

t_vis = exp(-tau_vis)
t_tir = exp(-tau_tir)
t_vis
t_tir

# ex.3
planck = function(l, t, 
             h = 6.626*10^(-34), c = 299792458,
             K = 1.38065*10^(-23)){
  i = ((2*h*c*c)/(l^5))*(1/(exp((h*c)/(l*K*t))-1))
  return(i*10^(-6))
}

I_sun = planck(vis, 5777)
I_sun

# ex.4
vis_percentage = (t_vis^2)*w
vis_percentage*100

# ex.5 
I_source = planck(tir, 5777)*(t_tir^2)*w
I_source
I_surface = planck(tir, 290)*t_tir
I_surface
I_medium = planck(tir, 280)*(1-t_tir)
I_medium

I_sat_tir = I_source+I_surface

# ex.6
TBB = function(l, I,
               h = 6.626*10^(-34),  c = 299792458,
               K = 1.38065*10^(-23)){
  num = h*(c/l)/K
  I = I*10^(6)
  den = log((2*h*c*c/l^5)/I + 1)
  return(num/den)
}

TBB(tir, I_sat_tir)

# ex.7
a2 = 1.6 * 10^(-15)
tau2_tir = a2/tir^4
t2_tir = exp(-tau2_tir)
tau2_tir
t2_tir

I_source = planck(tir, 5777)*(t2_tir^2)*w
I_source
I_surface = planck(tir, 290)*t2_tir
I_surface
I_medium = planck(tir, 280)*(1-t2_tir)
I_medium
I_medium_surface = I_medium*w*t2_tir
I_medium_surface

TBB(tir, I_medium)
