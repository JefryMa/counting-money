//counting the amount of money and medicines in the pharmacy


# Allocate genesis accounts (cosmos formatted addresses)
$BINARY add-genesis-account $KEY "1000000000000${DENOM}" --keyring-backend $KEYRING --home $HOME

$BINARY add-genesis-account $KEY1 "1000000000000${DENOM}" --keyring-backend $KEYRING --home $HOME

update_test_genesis '.app_state["gov"]["voting_params"]["voting_period"] = "50s"'
update_test_genesis '.app_state["mint"]["params"]["mint_denom"]=$DENOM' $DENOM
update_test_genesis '.app_state["gov"]["deposit_params"]["min_deposit"]=[{"denom": $DENOM,"amount": "1000000"}]' $DENOM
update_test_genesis '.app_state["crisis"]["constant_fee"]={"denom": $DENOM,"amount": "1000"}' $DENOM
update_test_genesis '.app_state["staking"]["params"]["bond_denom"]=$DENOM' $DENOM

counter=1
start=$(date +%s%3N)
while [ $counter -le 50 ]
do
    echo "=================$counter================="
    getTime
    echo "Time:" $result
