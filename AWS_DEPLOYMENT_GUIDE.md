# 🚀 Deploy NapRoute to AWS

## 🌐 AWS Amplify Deployment (Recommended)

AWS Amplify is perfect for static web applications like NapRoute.

### Prerequisites:
- AWS Account with appropriate permissions
- AWS CLI installed and configured
- Git repository (optional but recommended)

### Step 1: Install AWS CLI
```bash
# macOS
brew install awscli

# Or download from AWS
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

### Step 2: Configure AWS CLI
```bash
aws configure
# Enter your:
# - AWS Access Key ID
# - AWS Secret Access Key  
# - Default region (e.g., us-east-1)
# - Default output format (json)
```

### Step 3: Install Amplify CLI
```bash
npm install -g @aws-amplify/cli
amplify configure
```

### Step 4: Initialize Amplify Project
```bash
amplify init
# Follow prompts:
# - Project name: napRoute
# - Environment: prod
# - Default editor: Visual Studio Code
# - App type: javascript
# - Framework: none
# - Source directory: dist
# - Build command: npm run build
# - Start command: npm start
```

### Step 5: Add Hosting
```bash
amplify add hosting
# Choose: Amazon CloudFront and S3
# Select: DEV (S3 only with HTTP)
# Or: PROD (S3 with CloudFront over HTTPS)
```

### Step 6: Deploy
```bash
npm run build  # Build your app
amplify publish
```

---

## 🌐 AWS S3 + CloudFront (Manual Setup)

### Step 1: Create S3 Bucket
```bash
aws s3 mb s3://napRoute-app-unique-name
```

### Step 2: Configure for Static Website
```bash
aws s3 website s3://napRoute-app-unique-name \
  --index-document index.html \
  --error-document index.html
```

### Step 3: Upload Files
```bash
aws s3 sync dist/ s3://napRoute-app-unique-name --delete
```

### Step 4: Set Public Read Policy
```bash
aws s3api put-bucket-policy \
  --bucket napRoute-app-unique-name \
  --policy file://bucket-policy.json
```

---

## 🔒 Security Considerations

### Environment Variables:
- Store Google Maps API key in AWS Systems Manager Parameter Store
- Use AWS Secrets Manager for sensitive data
- Configure CORS properly for your domain

### API Key Security:
```bash
# Store API key securely
aws ssm put-parameter \
  --name "/napRoute/google-maps-api-key" \
  --value "your-api-key" \
  --type "SecureString"
```

---

## 📊 Monitoring & Analytics

### CloudWatch:
- Monitor website traffic
- Set up alarms for errors
- Track performance metrics

### AWS X-Ray:
- Trace requests (if using Lambda)
- Monitor application performance

---

## 💰 Cost Optimization

### S3 + CloudFront:
- Very low cost for static sites
- Pay only for storage and data transfer
- Free tier available

### Amplify:
- Simple pricing model
- Includes build minutes
- Good for continuous deployment

---

## 🚀 Continuous Deployment

### GitHub Actions + AWS:
```yaml
name: Deploy to AWS
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '18'
      - run: npm install
      - run: npm run build
      - name: Deploy to S3
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        run: aws s3 sync dist/ s3://your-bucket-name --delete
```

---

## 🌍 Custom Domain

### Route 53:
1. Register domain in Route 53
2. Create hosted zone
3. Point to CloudFront distribution
4. Configure SSL certificate with ACM

---

## 🔧 Troubleshooting

### Common Issues:
- **CORS errors**: Configure bucket CORS policy
- **404 errors**: Set up proper error document
- **API key issues**: Check domain restrictions
- **Build failures**: Verify build commands

### Useful Commands:
```bash
# Check AWS configuration
aws sts get-caller-identity

# List S3 buckets
aws s3 ls

# Check CloudFront distributions
aws cloudfront list-distributions

# View Amplify apps
amplify status
```