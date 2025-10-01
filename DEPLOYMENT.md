# NapRoute Deployment Guide

## Prerequisites

1. **Google Maps API Key**: Obtain from [Google Cloud Console](https://console.cloud.google.com/)
2. **Domain**: Register your domain (e.g., napRoute.app) - optional
3. **Deployment Platform**: Choose Netlify, Vercel, or AWS

## Environment Variables

Set these environment variables in your deployment platform:

```bash
VITE_GOOGLE_MAPS_API_KEY=your_actual_api_key_here
VITE_APP_ENVIRONMENT=production
VITE_APP_VERSION=1.0.0
```

## Netlify Deployment

### Option 1: Git Integration (Recommended)

1. Connect your GitHub repository to Netlify
2. Set build command: `npm run build:production`
3. Set publish directory: `dist`
4. Add environment variables in Netlify dashboard
5. Configure custom domain in Netlify DNS settings

### Option 2: Manual Deployment

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Build for production
npm run build:production

# Deploy
netlify deploy --prod --dir=dist
```

### Domain Configuration

1. **Custom Domain**: Add your domain in Netlify dashboard
2. **DNS Settings**: Point your domain to Netlify's nameservers
3. **SSL Certificate**: Automatically provisioned by Netlify
4. **CDN**: Automatically enabled with global edge locations

## Vercel Deployment

### Option 1: Git Integration (Recommended)

1. Connect your GitHub repository to Vercel
2. Vercel will auto-detect Vite configuration
3. Add environment variables in Vercel dashboard
4. Configure custom domain in Vercel settings

### Option 2: Manual Deployment

```bash
# Install Vercel CLI
npm install -g vercel

# Build for production
npm run build:production

# Deploy
vercel --prod
```

### Domain Configuration

1. **Custom Domain**: Add domain in Vercel dashboard
2. **DNS Settings**: Configure DNS records as instructed
3. **SSL Certificate**: Automatically provisioned
4. **CDN**: Global Edge Network included

## AWS Deployment

### Prerequisites

- AWS account with billing configured
- AWS CLI installed and configured
- Google Maps API key ready

### Quick Start

```bash
# Set up AWS infrastructure (one-time)
npm run setup:aws

# Configure environment variables
# Edit .env.production with your Google Maps API key

# Deploy application
npm run deploy:aws

# Verify deployment
npm run verify:aws
```

### Detailed AWS Setup

For complete AWS deployment instructions, see:
- [Complete AWS Deployment Guide](docs/aws-deployment-complete-guide.md)
- [AWS Deployment Checklist](AWS_DEPLOYMENT_CHECKLIST.md)
- [Google Maps API Setup](docs/google-maps-api-setup.md)

### AWS Commands

```bash
# Set up AWS infrastructure
npm run setup:aws

# Deploy to AWS
npm run deploy:aws

# Verify AWS deployment
npm run verify:aws

# Validate production readiness for AWS
DEPLOY_TARGET=aws npm run validate:production
```

## Google Maps API Configuration

### API Key Restrictions

1. **HTTP Referrers**: Restrict to your domains
   - `https://napRoute.app/*`
   - `https://www.napRoute.app/*`
   - `https://localhost:*` (for development)

2. **API Restrictions**: Enable only required APIs
   - Maps JavaScript API
   - Directions API
   - Places API (if using autocomplete)

### Quota Management

- Set daily quotas to prevent unexpected charges
- Monitor usage in Google Cloud Console
- Set up billing alerts

## Performance Optimization

### CDN Configuration

Both Netlify and Vercel provide global CDN automatically:

- **Static Assets**: Cached for 1 year with immutable headers
- **HTML Files**: No cache, always fresh
- **Service Worker**: Short cache duration for updates

### Compression

- **Gzip/Brotli**: Automatically enabled
- **Image Optimization**: Use WebP format when possible
- **Code Splitting**: Configured in Vite build

## Security Configuration

### HTTPS Enforcement

- Automatic HTTPS redirect configured
- HSTS headers enabled
- Secure cookie settings

### Content Security Policy

Configured to allow:
- Google Maps API scripts and resources
- Self-hosted assets only
- No inline scripts (except Google Maps)

### Security Headers

- `X-Frame-Options: DENY`
- `X-Content-Type-Options: nosniff`
- `X-XSS-Protection: 1; mode=block`
- `Referrer-Policy: strict-origin-when-cross-origin`

## Monitoring and Analytics

### Performance Monitoring

- Lighthouse CI integration
- Core Web Vitals tracking
- Error reporting via console

### Usage Analytics (Optional)

Consider adding privacy-focused analytics:
- Plausible Analytics
- Simple Analytics
- Google Analytics 4 (with privacy settings)

## Deployment Checklist

- [ ] Google Maps API key configured with restrictions
- [ ] Environment variables set in deployment platform
- [ ] Custom domain configured with SSL
- [ ] DNS records properly configured
- [ ] Security headers verified
- [ ] Performance metrics baseline established
- [ ] Error monitoring configured
- [ ] Backup deployment strategy documented

## Troubleshooting

### Common Issues

1. **Maps Not Loading**
   - Check API key in environment variables
   - Verify API key restrictions
   - Check browser console for errors

2. **Build Failures**
   - Verify Node.js version (18+)
   - Check environment variables
   - Review build logs

3. **Performance Issues**
   - Enable compression
   - Verify CDN configuration
   - Check bundle size analysis

### Support Resources

- [Netlify Documentation](https://docs.netlify.com/)
- [Vercel Documentation](https://vercel.com/docs)
- [Google Maps API Documentation](https://developers.google.com/maps/documentation)

## Rollback Strategy

### Quick Rollback

1. **Netlify**: Use deploy history to rollback
2. **Vercel**: Use deployment history in dashboard
3. **Git**: Revert commits and redeploy

### Emergency Procedures

1. Disable deployment auto-deploy
2. Rollback to last known good version
3. Investigate and fix issues
4. Re-enable auto-deploy after verification