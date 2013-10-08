IFS_SAVE=$IFS

partitions="0x00002000,0x00002000,misc 0x00008000,0x00004000,kernel 0x00008000,0x00012000,boot 0x00010000,0x00020000,recovery 0x00020000,0x00030000,backup 0x00040000,0x00050000,cache 0x00800000,0x00090000,userdata 0x00002000,0x00890000,kpanic 0x00130000,0x00892000,system"
partitions="0x00002000,0x00890000,kpanic 0x00130000,0x00892000,system"

for i in $partitions ; do
	IFS=','
	set $i
	name=$3
	from=$2
	size=$1
	echo "Dumping $name from $from size $size"
	./rkflashtool r $from $size > $name.img 2>/dev/null
done

#./rkflashtool r 0x00012000 0x00008000 > boot.img 

#rkflashtool: info: rkcrc: 0x4d524150
#rkflashtool: info: size:  0x0000025a
#FIRMWARE_VER:4.1.1
#MACHINE_MODEL:rk30sdk
#MACHINE_ID:007
#MANUFACTURER:RK30SDK
#MAGIC: 0x5041524B
#ATAG: 0x60000800
#MACHINE: 3066
#CHECK_MASK: 0x80
#KERNEL_IMG: 0x60408000
#RECOVER_KEY: 1,1,0,20,0
#CMDLINE:console=ttyFIQ0 androidboot.console=ttyFIQ0 init=/init initrd=0x62000000,0x00800000 mtdparts=rk29xxnand:
#0x00002000@0x00002000(misc,
#0x00008000@0x00004000(kernel
#0x00008000@0x00012000(boot
#0x00010000@0x00020000(recovery
#0x00020000@0x00030000(backup
#0x00040000@0x00050000(cache
#0x00800000@0x00090000(userdata
#0x00002000@0x00890000(kpanic
#0x00130000@0x00892000(system
#0x009c5000(user
