module.exports = {
  ci: {
    collect: {
      // URL to audit
      url: ['http://localhost:4173'],
      // Number of runs for more accurate results
      numberOfRuns: 3,
      // Settings for the audit
      settings: {
        // Emulate mobile device
        emulatedFormFactor: 'mobile',
        // Throttling settings
        throttling: {
          rttMs: 40,
          throughputKbps: 10240,
          cpuSlowdownMultiplier: 1,
          requestLatencyMs: 0,
          downloadThroughputKbps: 0,
          uploadThroughputKbps: 0
        },
        // Skip certain audits that aren't relevant
        skipAudits: [
          'canonical', // Not applicable for SPA
          'robots-txt', // Not required for this app
          'structured-data' // Not applicable
        ]
      }
    },
    assert: {
      // Performance thresholds
      assertions: {
        'categories:performance': ['error', { minScore: 0.8 }],
        'categories:accessibility': ['error', { minScore: 0.9 }],
        'categories:best-practices': ['error', { minScore: 0.9 }],
        'categories:seo': ['error', { minScore: 0.8 }],
        
        // Core Web Vitals
        'first-contentful-paint': ['error', { maxNumericValue: 2000 }],
        'largest-contentful-paint': ['error', { maxNumericValue: 3000 }],
        'cumulative-layout-shift': ['error', { maxNumericValue: 0.1 }],
        'total-blocking-time': ['error', { maxNumericValue: 300 }],
        
        // Mobile-specific metrics
        'speed-index': ['error', { maxNumericValue: 3000 }],
        'interactive': ['error', { maxNumericValue: 4000 }],
        
        // Accessibility requirements
        'color-contrast': 'error',
        'image-alt': 'error',
        'label': 'error',
        'link-name': 'error',
        
        // Best practices
        'uses-https': 'error',
        'no-vulnerable-libraries': 'error',
        'csp-xss': 'warn' // CSP might not be fully configured in preview
      }
    },
    upload: {
      // Upload results to temporary storage
      target: 'temporary-public-storage'
    },
    server: {
      // Server configuration for CI
      port: 9001,
      storage: {
        storageMethod: 'sql',
        sqlDialect: 'sqlite',
        sqlDatabasePath: './lhci.db'
      }
    }
  }
}