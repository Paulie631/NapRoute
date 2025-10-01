# AWS Deployment Checklist for NapRoute

## Pre-Deployment Setup

### Google Maps API Configuration
- [ ] Google Cloud Console project created
- [ ] Maps JavaScript API enabled
- [ ] Directions API enabled
- [ ] API key created and copied
- [ ] API key restrictions configured (HTTP referrers)
- [ ] Usage quotas set to prevent unexpected charges
- [ ] Billing alerts configured

### AWS Account Setup
- [ ] AWS account created with billing configured
- [ ] AWS CLI installed (`aws --version`)
- [ ] AWS credentials configured (`aws configure`)
- [ ] AWS credentials verified (`aws sts get-caller-identity`)
- [ ] Appropriate IAM permissions for S3 and CloudFront

### Development Environment
- [ ] Node.js 18+ installed
- [ ] Project dependencies installed (`npm install`)
- [ ] Application tested locally (`npm run dev`)
- [ ] All tests passing (`npm run test:ci`)

## Environment Configuration

### Environment Variables
- [ ] `.env.production` file created
- [ ] `VITE_GOOGLE_MAPS_API_KEY` set with actual API key
- [ ] `VITE_APP_ENVIRONMENT=production` set
- [ ] `VITE_APP_VERSION` set appropriately
- [ ] AWS configuration variables set (optional)

### Build Configuration
- [ ] Production build successful (`npm run build:production`)
- [ ] Build artifacts verified in `dist/` directory
- [ ] Production validation passed (`npm run validate:production`)

## AWS Infrastructure Setup

### Initial Setup (One-time)
- [ ] AWS setup script executed (`npm run setup:aws`)
- [ ] S3 bucket created successfully
- [ ] S3 static website hosting configured
- [ ] S3 bucket policy applied for public read access
- [ ] CloudFront distribution created
- [ ] CloudFront configuration verified
- [ ] IAM deployment user created (optional)
- [ ] Configuration saved to `.env.production`

### Verification
- [ ] S3 bucket accessible via AWS Console
- [ ] CloudFront distribution status: "Deployed"
- [ ] Website URL accessible (may take 10-15 minutes)

## Application Deployment

### Build and Deploy
- [ ] Latest code committed and pushed to repository
- [ ] Production environment loaded (`source .env.production`)
- [ ] Production validation passed (`DEPLOY_TARGET=aws npm run validate:production`)
- [ ] Application built for production (`npm run build:production`)
- [ ] Deployment script executed (`npm run deploy:aws`)
- [ ] Files uploaded to S3 successfully
- [ ] CloudFront cache invalidated

### Post-Deployment Verification
- [ ] Deployment verification script run (`npm run verify:aws`)
- [ ] S3 website URL accessible
- [ ] CloudFront URL accessible (HTTPS)
- [ ] Application loads without errors
- [ ] Google Maps integration working
- [ ] All core functionality tested

## Security Configuration

### API Key Security
- [ ] Google Maps API key restrictions updated with production domain
- [ ] API key not exposed in client-side code
- [ ] Environment variables properly configured
- [ ] No sensitive data in repository

### AWS Security
- [ ] S3 bucket policy allows only necessary public access
- [ ] CloudFront HTTPS redirect enabled
- [ ] Security headers configured
- [ ] Access logging enabled (optional)

## Performance Optimization

### Caching Configuration
- [ ] Static assets cached with long TTL (1 year)
- [ ] HTML files not cached (immediate updates)
- [ ] CloudFront compression enabled
- [ ] Cache invalidation working properly

### Performance Testing
- [ ] Page load time < 3 seconds
- [ ] Lighthouse performance score > 90
- [ ] Core Web Vitals within acceptable ranges
- [ ] Mobile performance tested

## Domain Configuration (Optional)

### Custom Domain Setup
- [ ] Domain registered or available
- [ ] SSL certificate requested in AWS Certificate Manager
- [ ] CloudFront distribution updated with custom domain
- [ ] DNS records configured (CNAME or ALIAS)
- [ ] Domain propagation verified
- [ ] Google Maps API restrictions updated with custom domain

## Monitoring and Maintenance

### Monitoring Setup
- [ ] CloudWatch monitoring enabled
- [ ] Billing alerts configured
- [ ] Error tracking configured (optional)
- [ ] Performance monitoring setup (optional)

### Documentation
- [ ] Deployment process documented
- [ ] Environment variables documented
- [ ] Rollback procedures documented
- [ ] Team access and permissions documented

## Testing and Validation

### Functional Testing
- [ ] Home screen loads correctly
- [ ] Location detection works
- [ ] Address input and validation working
- [ ] Route calculation functional
- [ ] Map display working correctly
- [ ] Navigation integration working
- [ ] Error handling working properly
- [ ] "Try Again" functionality working

### Cross-Browser Testing
- [ ] Chrome (desktop and mobile)
- [ ] Safari (desktop and mobile)
- [ ] Firefox (desktop and mobile)
- [ ] Edge (desktop)

### Device Testing
- [ ] iPhone (Safari)
- [ ] Android (Chrome)
- [ ] iPad (Safari)
- [ ] Desktop browsers

## Go-Live Checklist

### Final Verification
- [ ] All functionality tested in production
- [ ] Performance metrics acceptable
- [ ] Security configuration verified
- [ ] Monitoring and alerts active
- [ ] Team trained on deployment process
- [ ] Rollback plan tested and documented

### Communication
- [ ] Stakeholders notified of go-live
- [ ] Support team briefed
- [ ] Documentation updated
- [ ] Success metrics defined

## Post-Deployment Tasks

### Immediate (First 24 hours)
- [ ] Monitor application performance
- [ ] Check error logs and metrics
- [ ] Verify all functionality working
- [ ] Monitor Google Maps API usage
- [ ] Check AWS billing and usage

### Short-term (First week)
- [ ] Gather user feedback
- [ ] Monitor performance trends
- [ ] Review and optimize costs
- [ ] Update documentation as needed
- [ ] Plan next iteration or improvements

### Long-term (Ongoing)
- [ ] Regular security updates
- [ ] Performance monitoring and optimization
- [ ] Cost optimization reviews
- [ ] API key rotation (quarterly)
- [ ] Backup and disaster recovery testing

## Troubleshooting Checklist

### Common Issues
- [ ] Maps not loading → Check API key and restrictions
- [ ] 404 errors on refresh → Verify CloudFront error pages
- [ ] Slow loading → Check CloudFront cache hit ratio
- [ ] Build failures → Verify Node.js version and dependencies
- [ ] AWS deployment failures → Check credentials and permissions

### Emergency Procedures
- [ ] Rollback procedure documented and tested
- [ ] Emergency contacts identified
- [ ] Backup hosting option available
- [ ] Communication plan for outages

## Sign-off

### Technical Review
- [ ] Technical lead approval: _________________ Date: _________
- [ ] Security review completed: ______________ Date: _________
- [ ] Performance review completed: __________ Date: _________

### Business Approval
- [ ] Product owner approval: ________________ Date: _________
- [ ] Stakeholder sign-off: __________________ Date: _________

### Deployment Authorization
- [ ] Deployment authorized by: ______________ Date: _________
- [ ] Go-live approved: _____________________ Date: _________

---

**Deployment Date:** _______________
**Deployed by:** ___________________
**Version:** _______________________
**Environment:** Production AWS (S3 + CloudFront)