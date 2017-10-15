# ============================================================================
#
# Copyright : (c) 2017 SAGEMCOM - ATR-SST
#
# The information and source code contained herein is the exclusive
# property of SAGEMCOM and may not be disclosed, examined, or
# reproduced in whole or in part without explicit written authorization
# of the company.
# Author : BEN CHAABEN Wissem : G507954
# ============================================================================


MESSAGE_IPSTATIC_DISABLE				="MultiNATfunctionality is not available as Static IP has not been enabled"	
VALID_IP_ADDRESS					="217.35.118"
DHCP_ADDRESS						="sudo dhclient -v eno1"
RELEASE_ADDRESS						="sudo dhclient -r en01 "
DEVICE_ADDRESS						="ifconfig eno1 |  grep 'inet ' |  tr -s ' '   |  cut -d ' ' -f3 |  cut -d ':' -f2"
SOURCE_ADDRESS						="curl http://10.64.16.14/BT/BT-HH6/Static_IP > ./curl.txt"
