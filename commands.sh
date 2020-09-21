#ANTHOS PROJECT
GKE_PROJECT_ID=bkauf-cloud-build
ANTHOS_PROJECT_ID=bkauf-sandbox
ANTHOS_PROJECT_SA=anthos-external-cluster

# Enable APIS
 gcloud services enable \
 --project=$GKE_PROJECT_ID \
 container.googleapis.com \
 gkeconnect.googleapis.com \
 gkehub.googleapis.com \
 cloudresourcemanager.googleapis.com
 echo "---APIs Enabled---"

#Create Service Account for GKE Cluster to login to Anthos Project
 gcloud iam service-accounts create $ANTHOS_PROJECT_SA --project=$ANTHOS_PROJECT_ID


 gcloud projects add-iam-policy-binding [PROJECT_ID] \
 --member="serviceAccount:[SERVICE_ACCOUNT_NAME]@[PROJECT_ID].iam.gserviceaccount.com" \
 --role="roles/gkehub.connect"


 gcloud container hub memberships register external-cluster-b \
            --service-account-key-file=anthos-external-service-account.json \
            --gke-uri=https://container.googleapis.com/v1/projects/anthos-test-289715/zones/us-central1-c/clusters/external-cluster-b \
            --project=bkauf-sandbox