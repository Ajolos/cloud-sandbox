# cloud-sandbox

1. Logon to CF 
cf l -a https://api.cf.us10-001.hana.ondemand.com/
2. Bind to service and start approuter
cds bind --exec '--' npm start --prefix app
3. Run project
cds watch --profile hybrid
4. Launch at http://localhost:5000/
5. Wake up cloud database (if stopped): 
cf update-service si-parsley -c '{"data": {"serviceStopped": false }}'