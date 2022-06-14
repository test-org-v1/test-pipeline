isCompleted=false
REQUIRED_STATUS="Completed"
#while [ !isCompleted ]
#do 
#    echo "Checking backup status"
#    CHECK_STATUS=$(az backup item list --resource-group rg-asgardeo-main-dev-eastus2-001 --vault-name rsv-asgardeo-dev-eastus2-001 | jq -r .[0].properties.lastBackupStatus)
#    echo lastBackupStatus:$CHECK_STATUS    
#      if [ "$REQUIRED_STATUS" == "$CHECK_STATUS" ]
#      then
#      echo "Backup is completed"
#      exit 0
#      fi
#done

#CHECK_STATUS=$(az backup item list --resource-group rg-asgardeo-main-dev-eastus2-001 --vault-name rsv-asgardeo-dev-eastus2-001 | jq -r .[0].properties.lastBackupStatus)
#if [ "$REQUIRED_STATUS" == "$CHECK_STATUS" ]
#      then
#      echo "Backup is completed"
#      exit 0
#      fi

for run in {1..5}; do
  echo "Checking backup status"
  CHECK_STATUS=$(az backup item list --resource-group rnd-uvindu --vault-name uvindu-test-vault --query [0].properties.lastBackupStatus -o tsv)
  echo lastBackupStatus:$CHECK_STATUS
  if [ "$REQUIRED_STATUS" == "$CHECK_STATUS" ]
  then
  echo "Backup is completed sucessfully"
  exit 0
  fi
  sleep 5
done
  echo "Backup generation failed"
  exit 0

