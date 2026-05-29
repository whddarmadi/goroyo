#!/bin/bash
# ============================================
# GoRoyo — Deploy Script ke Google Cloud Run
# Jalankan perintah ini satu per satu di terminal
# ============================================

# ---- KONFIGURASI (GANTI SESUAI MILIKMU) ----
PROJECT_ID="your-project-id"        # Ganti dengan Project ID Google Cloud kamu
REGION="asia-southeast2"            # Jakarta region
SERVICE_NAME="goroyo"
IMAGE_NAME="gcr.io/$PROJECT_ID/$SERVICE_NAME"
# --------------------------------------------

echo "🚀 Step 1: Login ke Google Cloud"
gcloud auth login

echo "📁 Step 2: Set project"
gcloud config set project $PROJECT_ID

echo "🔧 Step 3: Enable services yang dibutuhkan"
gcloud services enable run.googleapis.com
gcloud services enable containerregistry.googleapis.com

echo "🐳 Step 4: Build Docker image"
docker build -t $IMAGE_NAME .

echo "📤 Step 5: Push image ke Google Container Registry"
docker push $IMAGE_NAME

echo "☁️  Step 6: Deploy ke Cloud Run"
gcloud run deploy $SERVICE_NAME \
  --image $IMAGE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --port 8080 \
  --memory 256Mi \
  --min-instances 0 \
  --max-instances 2

echo "✅ SELESAI! Cek URL di output di atas."
echo "Format URL: https://goroyo-xxxx-as.a.run.app"
