LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\ffms2.dll")
FFmpegSource2("@", vtrack = -1, atrack = -1 )
ConvertToYV24()
LanczosResize(640, 360)
