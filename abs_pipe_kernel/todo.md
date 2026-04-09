on bank conflicts: 
bank_id  = (byte_addr/4) % bank_size 
not all lanes can cause bank conflict 
the lanes are divided into phases depending on which 
for example, for ds _write_128, the lane phases are 0-7, 8-16 line that 
(contigous 8 groups) if there are no bank conflicts within each phase then we are chill 
but for ds_read_128 the phase groups of lanes are kinda strided 
0:3+20:23

4:7+16:19

8:11+28:31

12:15+24:27

32:35+52:55

36:39+48:51

40:43+60:63

44:47+56:59

ds_read_64 which is basically the only thing we can use cause of the mma layout 
IS NOT EVEN SPOKEN ABOUT... hmm idk lets see, 
maybe m32n32k8 lets us use ds_read_128 from SMEM -> reg as well 
Cause now its ds_write_128 GMEM -> (reg) -> SMEM, and ds_read_64 SMEM -> (reg) 
and also global writes are still chilling at 128 bit so thats perfectly fine (4 float32's) 

The options are 
1. uncover a swizzle pattern that lets us keep 8 bf16 elements contigous and also avoids 
both the write bank conflict and the read one which is a little more of a pain in the ass. 
2. maybe load 128 GMEM -> (reg) - ds_write_64? -> SMEM 
we can do that by taking the first 4 of the 8 vector and the next 4 but that will reduce the smem's effective bandwidth in this kernel. 

