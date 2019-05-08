#!/bin/bash
set timeout 500
echo "Is this the first time after your pi boots? (y/n)"
read ans
while (( "$ans" != 'y' || "$ans" != 'n' )); do
  echo "(y/n)"
  read ans
done

#read ans
#echo "hi $ans"
if [[ $ans == 'y' ]]; then
  xterm -hold -e "~/aruco_maker_script/1_cam.sh" & sleep 5
  xterm -hold -e "~/aruco_maker_script/2x_apm_port.sh" & sleep 35
  xterm -hold -e "~/aruco_maker_script/3_ori_n_rate.sh" & sleep 1
  xterm -hold -e "~/aruco_maker_script/4_script_dir.sh" & sleep 1
else
  xterm -hold -e "~/aruco_maker_script/1_cam.sh" & sleep 5
  xterm -hold -e "~/aruco_maker_script/2_apm.sh" & sleep 35
  xterm -hold -e "~/aruco_maker_script/3_ori_n_rate.sh" & sleep 1
  xterm -hold -e "~/aruco_maker_script/4_script_dir.sh" & sleep 1
fi

echo "Operation done. Please open RVIZ by yourself."
read -n1 -p "Enter any key to escape..." any
