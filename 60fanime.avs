# This script was generated by SmoothVideo Project (SVP) Manager.
# Check http://www.svp-team.com for more details.

SetMemoryMax(1024)

global svp_scheduler=true
global threads=15
global svp_cache_fwd=threads+2

SVPPath="C:\Program Files (x86)\SVP\plugins\"
LoadPlugin(SVPPath+"svpflow1.dll")
LoadPlugin(SVPPath+"svpflow2.dll")

SetMTMode(3,threads)
DirectShowSource("@I", fps=@F, convertfps=true).ConvertToYV12()
SetMTMode(2)

global crop_params=""
global resize_string=""
global super_params="{scale:{up:0},gpu:1,rc:false}"
global analyse_params="{main:{search:{coarse:{distance:-10}}}}"
global smoothfps_params="{rate:{num:@N,den:@D},algo:2,scene:{limits:{m1:0,m2:0}}}"

global demo_mode=0
stereo_type=0
stereo_left_selection=""
stereo_right_selection=""

########## BEGIN OF MSMoothFps.avs ##########
# This file is a part of SmoothVideo Project (SVP) 3.1.4
# This is NOT the full AVS script, all used variables are defined via 
# JavaScript code that generates the full script text.

function interpolate(clip src)
{
	input = crop_params=="" ? src : eval("src.crop("+crop_params+")")
	input = resize_string=="" ? input : eval("input."+resize_string)

	super=SVSuper(input, super_params)
	vectors=SVAnalyse(super, analyse_params, src=input)
	smooth=SVSmoothFps(input, super, vectors, smoothfps_params, mt=threads, url="www.svp-team.com")

	return demo_mode==0 ? smooth : demo(input,smooth)
}

input=last

	stereo_type==0 ? eval(""" interpolate(input)
""") : 	stereo_type==1 || stereo_type==3 ? eval("""
		lf = interpolate(input.crop(0,0,input.width/2,0))"""+stereo_left_selection+"""
		rf = interpolate(input.crop(input.width/2,0,0,0))"""+stereo_right_selection+"""
		StackHorizontal(lf, rf)
""") : 	stereo_type==2 || stereo_type==4  ? Eval("""
		lf = interpolate(input.crop(0,0,0,input.height/2))"""+stereo_left_selection+"""
		rf = interpolate(input.crop(0,input.height/2,0,0))"""+stereo_right_selection+"""
		StackVertical(lf, rf)""") : input

########### END OF MSMoothFps.avs ###########

