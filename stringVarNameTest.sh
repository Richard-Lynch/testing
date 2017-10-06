#!/bin/bash
#------------FAILED!!!! ----------------------------
awsLoc="defaultLoc"
awsKey="defaultKey"
awsUser="defaultUser"
option="awsLoc"
value="new value"

options="awsLoc awsKey awsUser"
echo $options
$(printf "%s|" $(echo $options))
case "${option}" in
    $(echo ${options[*]}))
        printf -v $option "$value"
        ;;
    *)
esac

echo "$awsLoc" ; 
# values=$($(echo $options))
echo "$values"
