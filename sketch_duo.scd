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
b = Buffer.alloc(s, 4096, 1, { |buf, i|
    buf.sine1Msg((100).reciprocal)});


)




(


SynthDef(\playbuf, {arg outbus=0, amp=0.5,rate =1,pan =0, bufnum, trig=1, startpos;
    var sig,data;


	sig    = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum);  rate,trig,Phasor.ar(trig,BufRateScale.kr(bufnum),startpos*BufFrames.kr(bufnum),BufFrames.kr(bufnum)),1,2);

	data = Pan2.ar(sig, pan);

	Out.ar(outbus,data*amp)

}).store;



SynthDef(\playbuf_1, {arg outbus = 0, amp = 0.5, loop = 1,
                        pan = 0, rate = 1.0;
        var data, data2;
	data = PlayBuf.ar(1, b, BufRateScale.kr(b) * rate, 0, 0, loop);
        FreeSelfWhenDone.kr(data);

	data2 = Pan2.ar(data, pan);

        Out.ar(outbus, data2*amp);
}).store;




SynthDef(\reverb, {arg inbus,outbus=0,mix,room, damp;

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
