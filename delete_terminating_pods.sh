kubectl -n prod get pods -l app=<app-name>  --context wx-prod-002| grep UnexpectedAdmissionError|awk '{print $1}'|while read server
do
kubectl -n prod  delete pod $server --grace-period=0 --force --context wx-prod-002
echo "Deleted $server"
done
