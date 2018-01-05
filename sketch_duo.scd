(
~sr = s.sampleRate;

s.freeAll;
s.newAllocators;

~bf = [

"C:/Users/rafael/Music/wav/elevator_1.wav",
"C:/Users/rafael/Music/wav/elevator_2.wav",
"C:/Users/rafael/Music/wav/elevator_3.wav",
"C:/Users/rafael/Documents/Processing/sketch_dientes_negros/samples/177274.aiff"

].collect({arg thispath;
	 Buffer.readChannel(s, thispath,channels: [0]);
});

)

(
b = Buffer.allocConsecutive(8, s, 4096, 1, { |buf, i|
    buf.sine1Msg((1..((i+1)*10)).reciprocal)});


)



(


SynthDef(\playbuf, {arg outbus=0, gate=1,amp=0.5,rate,pan, bufnum, trig=1, startpos,loop;
    var envv,env,envgen,sig,data2;

    env = Env([3, 0.02, 0.02, 0.02, 0], [1, 0.2, 0.2, 1]);
	sig    = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum);  rate,trig,Phasor.ar(trig,BufRateScale.kr(bufnum),startpos*BufFrames.kr(bufnum),BufFrames.kr(bufnum)),1,2);

	data2 = Pan2.ar(sig, pan);

/*	#w,x,y,z = BFEncode1.ar(sig,azi/**LFNoise1.ar(vpan)*/,0,rho);*/

	Out.ar(outbus,data2*amp)

}).store;



SynthDef(\playbuf_1, {arg outbus = 0, amp = 0.5, loop = 1,
                        pan = 0, rate = 1.0;
        var data, data2;
	data = PlayBuf.ar(1, b, BufRateScale.kr(b) * rate, 0, 0, loop);
        FreeSelfWhenDone.kr(data);

	data2 = Pan2.ar(data, pan);

        Out.ar(outbus, data2*amp);
}).store;



SynthDef(\sine, { |outbus = 0, amp = 0.5, freq = 440, freq2 = 0,rang1,rang2, gain=3, pan = 0|
	var env, data,data2, sine, freqx,sig;


	sig =  MoogFF.ar( Pulse.ar(freq.midicps, 0.5),
        SinOsc.kr(freq2,0,1).range(rang1.midicps, rang2.midicps),
        0.83 * 4);
	data2 = Pan2.ar(sig, pan);


	Out.ar(outbus, data2*amp);
}).store;



SynthDef(\reverb, {arg inbus,outbus=0,mix,room, damp;

/*	a = Resonz.ar(
		In.ar(inbus,2));*/

    Out.ar(outbus, FreeVerb.ar((In.ar(inbus,2)),
        mix,
        room,
		damp));

}).store;


)


(

SynthDef(\diskout, {arg bufnum;
    DiskOut.ar(bufnum, In.ar(0,2));
}).add;


~diskout = Buffer.alloc(s, 65536, 2);
~diskout.write("C:/Users/rafael/Documents/audio/imp/elevator111_131117.aiff".standardizePath, "aiff", "int16", 0, 0, true);
~sdiskout = Synth.tail(nil, \diskout, ["bufnum", ~diskout]);
)

(
~diskout.free;
~sdiskout.free.postln;
)

~diskout.close;


s.plotTree;
