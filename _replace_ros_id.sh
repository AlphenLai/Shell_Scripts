#!/bin/bash
set timeout 500
echo "Change ros ip to (aa/bb/cc)"
read ans
while (( "$ans" != "aa" || "$ans" != "bb" || "$ans" != "cc" )); do
  echo "(aa/bb/cc)"
  read ans
done


if [[ $ans == 'aa' ]]; then
  echo "replace ros ip for aa"
  pi_addr=
  pc_addr=
elif [[ $ans == 'bb' ]]; then
  echo "replace ros ip for bb"
  pi_addr=
  pc_addr=
else
  echo "replace ros ip for cc"
  pi_addr=
  pc_addr=
fi


file=~/aruco_maker_script/1_cam.sh
sed -i 's/alvin@.*/alvin@'$pi_addr'/' $file
file=~/aruco_maker_script/2_apm.sh
sed -i 's/alvin@.*/alvin@'$pi_addr'/' $file
file=~/aruco_maker_script/2x_apm_port.sh
sed -i 's/alvin@.*/alvin@'$pi_addr'/' $file
file=~/aruco_maker_script/3_ori_n_rate.sh
sed -i 's/alvin@.*/alvin@'$pi_addr'/' $file
file=~/aruco_maker_script/4_script_dir.sh
sed -i 's/alvin@.*/alvin@'$pi_addr'/' $file

file=~/.bashrc
sed -i 's/ROS_HOSTNAME=.*/ROS_HOSTNAME='$pc_addr'/' $file
sed -i 's/ROS_MASTER_URI=.*/ROS_MASTER_URI='$pi_addr':11311/' $file

read -n1 -p "replacement completed. Press any key to exit..." any
