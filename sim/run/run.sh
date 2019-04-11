#!/bin/sh
file="./signal.rc"

rm -rf csrc simv* ucli.key *.log *.dump #删除当前目录下生成的一些文件

vcs -full64 -debug_all \ #vcs编译命令
-l comp.log -f filelist.f \ #filelist.f包含了所有参加编译的文件，生成编译日志comp.log
-P /opt/synopsys/VERDI3_I_2014_03/share/PLI/VCS/LINUX64/novas.tab \ #生成fsdb文件需要关联verdi库
	 /opt/synopsys/VERDI3_I_2014_03/share/PLI/VCS/LINUX64/pli.a \

./simv -l sim.log #执行仿真，生成仿真日志

if [ -f "$file" ];then #signal.rc为波形文件，如果存在则直接加载
  verdi -f filelist.f -ssf wave.fsdb -sswr signal.rc &
else
  verdi -f filelist.f -ssf wave.fsdb &
fi
