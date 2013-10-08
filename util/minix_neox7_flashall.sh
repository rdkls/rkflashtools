IFS_SAVE=$IFS
partitions="0x00002000,0x00002000,misc 0x00008000,0x00004000,kernel 0x00008000,0x00012000,boot 0x00010000,0x00020000,recovery 0x00020000,0x00030000,backup 0x00040000,0x00050000,cache 0x00800000,0x00090000,userdata 0x00002000,0x00890000,kpanic 0x00130000,0x00892000,system"

for i in $partitions ; do
	IFS=','
	set $i
	name=$3
	from=$2
	size=$1
	echo "Flashing $name from $from size $size"
	./rkflashtool w $from $size < $name.img 2>/dev/null
done
IFS=$IFS_SAVE

#root@android:/sdcard # cat /proc/mtd
#dev:    size   erasesize  name
#mtd0: 00400000 00004000 "misc"
#mtd1: 01000000 00004000 "kernel"
#mtd2: 01000000 00004000 "boot"
#mtd3: 02000000 00004000 "recovery"
#mtd4: 04000000 00004000 "backup"
#mtd5: 08000000 00004000 "cache"
#mtd6: 100000000 00004000 "userdata" <-----
#mtd7: 00400000 00004000 "kpanic"
#mtd8: 26000000 00004000 "system"
#mtd9: 29ae00000 00004000 "user"

# 0x00800000,0x00090000,userdata 
