# acoustics


SPEAKER DESIGN EQUATIONS

1. Introduction

     This is a library of equations for designing ported and closed-box
     speaker enclosures.  The equations were taken from speaker design books
     and technical papers by Richard Small and Neville Thiele (see references
     in tutorial section).  They are designed for un-stuffed enclosures.
     Refer to the references for more information on stuffing.

     The equations are intended to be used with the HP48GX/SX multiple
     equation solver but can also be run with the solver built into the
     HP48SX.  The binaries are provided in uu-encoded and ->ASC form.  An RPL
     version is also provided, but does not include the binary variable Mpar
     needed by the multiple equation solver.

     The initial default speaker parameters are for the Eminence 18029 18"
     driver.

     I welcome any comments or refinements.


2. Variables

     The main directory is called SPKR and consists of two subdirectories:

     CB		Closed Box Design
     PORTED	Ported Box Design

     Running the multiple equation solver from either subdirectory will
     produce a menu of variables:

     Vas	Volume of air having same acoustic compliance as driver
		suspension
     Qts	Total driver Q at Fs
     Fs 	Resonant frequency of driver
     PEmax	Thermally-limited maximum RMS input power
     SPL	Efficiency of driver in dB SPL at 1W/1m
     Dia	Diameter of driver
     xmax	Peak displacement limit of driver diaphragm (1/2 of "throw")
     Vb 	Inside volume of enclosure
     Fb 	Resonance frequency of enclosure
     F3dB	Half-power (-3 dB) frequency of loudspeaker system response
     Fmax	Upper frequency limit of driver's piston range
     dBpeak	Maximum peak or dip of loudspeaker system response
     Par	Estimated displacement-limited acoustic power rating
     Per	Estimated displacement-limited electrical power rating
     \Gno	Driver efficiency (\Gn is Greek character eta)
     PeakSPL	Thermally-limited RMS sound pressure level in passband
     Sd 	Estimated effective projected surface area of driver diaphragm
     Vd 	Peak displacement volume of driver diaphragm
     K1 	Power rating constant
     K2 	SPL rating constant

     The following additional variables are defined for the closed box case:

     Qb		Total Q of system at Fb
     Amax	Maximum amplitude of loudspeaker frequency response
     Vr		Ratio of Vas to Vb
     Qr		Ratio of Qb to Qts and Fb to Fs

     The following additional variables are defined for the ported box case:

     Dmin       Minimum diameter of tubular vent to prevent excessive vent
     		noise
     Dv		Diameter of tubular vent
     Lv		Length of tubular vent

     For the ported box case, the following apply:

     1. Fb is the tuning frequency for the vent.
     2. To use a square vent, enter the vent width times 1.13 or [2/SQRT(pi)]
        for Dv.


3. Design

     When designing a loudspeaker, two approaches may be followed.  The
     easiest is to select a driver and design an enclosure for it.  The other
     is to design the enclosure first, then select or build a driver that
     matches it.

     The choice between a closed box and ported box depends on several
     factors.  Closed-box systems are the easiest to design and build and
     have the advantages of smaller box size, good low-frequency power
     handling, and superior transient response.  Ported-box systems are more
     difficult to design because they require precise duct tuning.  However,
     ported boxes have the advantages of superior bass response, good
     efficiency, and superior peak power handling in the passband.

  3.1 Closed-Box Systems

	Closed-box systems are designed around one variable, box volume.  Box
	volume is a function of the driver parameters and the system Q, Qb.
	To design a system with minimum peak or droop in the passband, Qb
	must be 0.707.

	The designer has the choice of setting Qb and solving for the box
	volume, or setting the box volume and solving for Qb.  There is also
	the choice of assigning values to both of these variables and solving
	for one of the driver parameters.

	To design a closed-box system, enter the CB subdirectory and run the
	multiple equation solver.  Alternatively, run the built-in HP48SX
	solver and select DESIGN.EQ as the current equation.  Choose one of
	the following variables to solve for and assign values to the rest:
	Vas, Qts, Fs, SPL, Dia, xmax, Qb, and Vb.

	If you don't have all of the parameters available, purge the ones you
	don't know, so they'll be undefined and the solver won't attempt to
	use them.  At a minimum, you will need to supply all but one of Vas,
	Qts, Fs, Qb, and Vb.

	Next, press <- ALL in the multiple equation solver to solve for all
	the unknowns.  If using the built-in HP48SX solver, you will need to
	solve for each unknown individually, using NXEQ to sequence through
	the equations.

  3.2 Ported-Box Systems

	Ported-box systems are a little more difficult than closed box
	systems because there is an additional variable, tuning frequency.
	The optimum tuning frequency depends on the driver parameters and box
	volume.

	To design a ported-box system, enter the PORTED subdirectory.  Run
	the equation solver of your choice as described above and enter the
	driver parameters.  Notice there is no Qb variable.

	At this point solving for the unknowns will automatically create a
	system with optimum passband response.  Alternatively, you can
	specify values for Vb and/or Fb to see what effect they have on the
	system response.

	To find the minimum recommended diameter of a tubular vent for the
	enclosure, solve for Dmin.  This is smallest diameter permissible to
	keep the air velocity below 5% of the speed of sound.  Higher
	velocities can produce audible noise.  To calculate the vent
	dimensions, enter either of Dv and Lv and solve for the other,
	keeping in mind the minimum recommended value of Dv.

  3.3 Cabinet Design

	In the CST menu of the CB and PORTED subdirectories is a key labeled
	BCALC.  Pressing this key runs the box calculator program.  Don't run
	it directly from the SPKR subdirectory, or it will not work
	properly.  The program is rather crude, and does not handle dual
	woofers, but is adequate for most designs.  It works as illustrated
	by modeling the driver as a segment of a solid cone:

                                            _____
                                         /|   ^
                                       /  |   |
                                     /    |   |
                                   /      |   |
                          _____  /        |   |
                            ^   |         |   |
                            |   |         |   |
                          Rdia  |         |  Dia
                            |   |         |   |
                          __v__ |         |   |
                                 \        |   |
                                |  \      |   |
                                |    \    |   |
                                |      \  |   |
                                |        \| __v__
                                |
			        |         |
			        |<-Depth->|
			        |         |


	To use, enter the driver's depth (distance from front of driver to
	back of magnet) and press DEPTH.  Enter the rear (magnet) diameter of
	the driver and press RDIA.  If you want the program to account for
	any extra volume taken up by bracing and other drivers, enter this
	volume and press XVOL.  The program uses the driver's diameter as
	entered previously in the equation solver.

	The dimensions default to English units.  The program will only
	accept real numbers as input; unit objects will cause an error.  (I
	said it was crude.)  To change units, store a value containing the
	new unit by typing 'name' STO, where name is one of Depth, Rdia, or
	Xvol.  The units of the results should make sense based on the units
	of the data, but I won't guarantee it.

	You can also change the ratio of Height:Width:Depth used in the box
	calculation by pressing GOLD, 1.25:1, or CUST.  GOLD selects the
	golden mean, 1.62:1:0.62 ((sqrt(5)+1)/2), which is the most common
	ratio.  1.25:1 selects another common ratio, 1.25:1:0.8.  If you wish
	to use a custom ratio, enter it and press CUST.

	Each time you change a parameter using a menu key, the results will
	be recalculated and redisplayed.  The display shows, from top to
	bottom, the driver's front diameter, the driver's rear diameter, the
	driver's depth, the extra volume taken up by other objects inside the
	cabinet, the total internal volume of the cabinet (including driver
	and extra volume), the ratio used to calculate the box dimensions,
	and the inside height, width, and depth of the cabinet.  FIX 2 is the
	best display format to use with the default units.

  3.4 Equalization of Closed-Box Systems

	There is a subdirectory in CB called EQUALIZER that will find the
	component values for an active equalizer that can extend F3dB of any
	closed box system to any desired lower limit (at the expense of
	efficiency and power handling--watch out!)  See [11] for theory and
	circuit details.

	First, use the equation solver in the CB subdirectory to solve for
	the system as shown above.  Next, enter the EQUALIZER subdirectory.
	Store the new desired cutoff frequency into F3dB, and press CIRCUIT.
	The component values will appear in the display.  The values of R, C,
	N are chosen by the user to make the remaining component values
	realistic (see [11]).


4. Analysis

  4.1 Frequency Response

	The equation solver generates three values related to frequency
	response, F3dB, Fmax, and dBpeak.

	F3dB is the frequency at which the acoustic output power of the
	speaker drops by half.  Below this frequency, the response will drop
	12 dB per octave for the closed box and 24 dB per octave for the
	ported box.

	Fmax is the upper limit of the driver's piston range.  Piston range
	is defined as the range of frequencies for which the wavelength of
	sound is greater than the circumference of the driver's diaphragm.
	In this range, the driver's output is non-directional.

	Since this package models the driver as a piston, it is important to
	note that the equations are only accurate up to Fmax.  In addition,
	because it is difficult to predict the driver's high-frequency
	behavior, it is a good idea to cross over to a smaller driver at or
	below Fmax.

	dBpeak is the magnitude of the frequency response peak or dip.  For
	an optimal design, this value will be zero.

	To examine the frequency response in detail, enter the CB or PORTED
	subdirectory and run the plotter or built-in HP48SX solver.  Select
	FREQresp from the equations catalog.  F is the frequency variable,
	and dBmag is the response at that frequency.  Using the solver you
	can solve for one in terms of the other.

  4.2 Power Handling

	The equation solver generates power ratings called Par and Per.

	Par is the displacement-limited acoustic power rating.  For the
	closed box, Par is the worst-case value for wide-band signals (all
	the way down to DC).  For the ported box, it is an estimate based on
	the characteristics of musical signals.

	Per is the displacement-limited electrical RMS power rating based on
	Par.

	Because displacement-limited power handling is actually a function of
	frequency, the values of Par and Per only give small part of the
	picture.  To examine power handling in detail, enter the CB or PORTED
	subdirectory and run the plotter or built-in HP48SX solver.  Select
	POWresp from the equations catalog.  F is the frequency variable, and
	Pmax is the maximum electrical input power at that frequency.

	Pmax is plotted first, followed by PEmax, the manufacturer's thermal
	RMS power rating.  At some frequencies, Pmax will exceed PEmax.  As
	frequency increases, Pmax can reach thousands of watts.  Exceeding
	PEmax is permissible for short durations, but under no circumstances
	should you exceed Pmax even briefly or the driver may be physically
	damaged.

	Because Pmax is calculated with sine waves in mind, the peak power
	rating at a given frequency will be 2*Pmax.

	Using the ISECT function of the plotter, it is possible to determine
	the frequency range(s) over which it is safe to apply the full rated
	thermal power, PEmax, without damage from excessive displacement.
	Just place the cursor near the intersection of the curves and press
	ISECT in the FCN sub-menu.  In the same manner, you can also use
	ISECT to find frequencies where the curves approach one another but
	don't touch.

  4.3 Sound Pressure Level

	The equation solver generates a value for maximum SPL called
	PeakSPL.  This is the maximum RMS output level of the system in the
	passband when driven by the thermally-limited maximum input power,
	PEmax.

	Like power handling, displacement-limited SPL is a function of
	frequency.  To examine displacement-limited SPL in detail, enter the
	CB or PORTED subdirectory and run the plotter or built-in HP48SX
	solver.  Select SPLresp from the equations catalog.  F is the
	frequency variable and SPLmax is the displacement-limited SPL at that
	frequency.

	SPLmax is plotted first, followed by the thermally-limited RMS sound
	pressure level.  As before, for frequencies where SPLmax exceeds the
	thermally-limited SPL, the maximum SPL may be limited to a value in
	between, depending on the peak-to-average power ratio of the input
	signal.

	Again, ISECT can be used to find the frequency or frequencies at
	which the displacement- and thermally-limited SPL ratings are equal.

  4.4 Analysis of Equalized Closed-Box System

	Using an equalizer to extend the bass response of a closed-box system
	does not come without costs.  For each octave of bass extension, a 12
	dB boost is necessary (and requires 16 times as much power).

	To evaluate these costs, two equations are provided in the EQUALIZER
	subdirectory: FREQresp and POWresp.  These function like their
	counterparts in the CB and PORTED subdirectories, but take into
	account the effects of the equalizer.

	Because I took the equations right out of the article [11] without
	any optimization for speed, these equations run very slowly.
	However, I left out the units wherever possible so the equations
	would run faster.

	FREQresp calculates the response of the equalizer, rather than the
	system, to give you an idea of the amount of boost required to
	equalize the system.  The greatest boost occurs at the new F3dB.

	POWresp calculates the equivalent power handling of the system.  At
	each frequency, Pmax is reduced by the amount of boost the equalizer
	provides.  This is useful to see what the power handling of an
	equivalent, un-equalized system would be.

	There is no equation for maximum SPL vs. frequency because it is the
	same as the un-equalized system.


5. Design Equations

  Here are the equations used by the speaker design library.  All values have
  SI (mks) units.  ^ denotes exponentiation.  LOG() is base 10.

  5.1 Constants

        pi = 3.14159265359
        c = speed of sound in air (345 m/s)
        Ro = density of air (1.18 kg/m^3)

  5.2 Closed-Box Systems

        Vb = Vas/Vr
        Fb = Qr*Fs
        F3dB = Qr*Fs*((1/Qb^2-2+((1/Qb^2-2)^2+4)^0.5)/2)^0.5
        Fmax = c/(pi*0.83*Dia)
        dBpeak = 20*LOG(Amax)
        Par = K1/Amax^2
        Per = Par/(\Gno)
        \Gno = 10^((SPL-112)/10)
        PeakSPL = SPL+10*LOG(PEmax)
        Sd = pi*(Dia*0.83)^2/4
        Vd = Sd*xmax
        Amax = Qb^2/(Qb^2-0.25)^0.5 for Qb >(1/2)^0.5, 1 otherwise
        K1 = (4*pi^3*Ro/c)*Fb^4*Vd^2
        K2 = 112+10*LOG(K1)
        Vr = Qr^2-1
        Qr = (1/Qts)/(1/Qb-0.1)

        Frequency-dependent equations:
        Fr = (F/Fb)^2
        dBmag = 10*LOG(Fr^2/((Fr-1)^2+Fr/Qb^2))
        Pmax = K1*((Fr-1)^2+(Fr/Qb^2))/(\Gno)
        SPLmax = K2+40*LOG(F/Fb)
        Thermally-limited RMS SPL = PeakSPL+dBmag

  5.3 Ported Box Systems

        Vb = 20*Qts^3.3*Vas
        Fb = (Vas/Vb)^0.31*Fs
        F3dB = (Vas/Vb)^0.44*Fs
        Fmax = c/(pi*0.83*Dia)
        dBpeak = 20*LOG(Qts*(Vas/Vb)^0.3/0.4)
        Par = 3*F3dB^4*Vd^2
        Per = Par/(\Gno)
        \Gno = 10^((SPL-112)/10)
        PeakSPL = SPL+10*LOG(PEmax)
        Dmin = (Fb*Vd)^0.5
        Lv = 2362*Dv^2/(Fb^2*Vb)-0.73*Dv
        Sd = pi*(Dia*0.83)^2/4
        Vd = Sd*xmax
        K1 = (4*pi^3*Ro/c)*Fs^4*Vd^2
        K2 = 112+10*LOG(K1)

        Frequency-dependent equations:
        Fn2 = (F/Fs)^2
        Fn4 = Fn2^2
        A = (Fb/Fs)^2
        B = A/Qts+Fb/(7*Fs)
        C = 1+A+(Vas/Vb)+Fb/(7*Fs*Qts)
        D = 1/Qts+Fb/(7*Fs)
        E = (97/49)*A
        dBmag = 10*LOG(Fn4^2/((Fn4-C*Fn2+A)^2+Fn2*(D*Fn2-B)^2))
        Pmax = (K1/\Gno)*((Fn4-C*Fn2+A)^2+Fn2*(D*Fn2-B)^2)/(Fn4-E*Fn2+A^2)
        SPLmax = K2+10*LOG(Fn4^2/(Fn4-E*Fn2+A^2))
        Thermally-limited RMS SPL = PeakSPL+dBmag
