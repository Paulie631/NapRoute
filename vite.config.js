/// <reference types="vitest" />
import { defineConfig } from 'vite'

export default defineConfig(({ command, mode }) => {
  const isProduction = mode === 'production'
  
  return {
    // Define global constants
    define: {
      __BUILD_TIME__: JSON.stringify(new Date().toISOString()),
      __APP_VERSION__: JSON.stringify(process.env.npm_package_version || '1.0.0')
    },
    // Build optimizations
    build: {
      // Output directory
      outDir: 'dist',
      // Clean output directory before build
      emptyOutDir: true,
      // Enable code splitting
      rollupOptions: {
        output: {
          manualChunks: {
            // Separate vendor libraries
            'google-maps': ['./src/services/MapRenderer.js', './src/services/RouteCalculator.js'],
            'location-services': ['./src/services/LocationService.js', './src/services/NavigationService.js'],
            'ui-components': [
              './src/components/HomeScreen.js',
              './src/components/ResultsScreen.js',
              './src/components/LoadingIndicator.js',
              './src/components/ErrorDisplay.js'
            ]
          },
          // Optimize chunk file names with cache busting
          chunkFileNames: isProduction ? 'assets/[name]-[hash].js' : 'assets/[name].js',
          entryFileNames: isProduction ? 'assets/[name]-[hash].js' : 'assets/[name].js',
          assetFileNames: isProduction ? 'assets/[name]-[hash].[ext]' : 'assets/[name].[ext]'
        }
      },
      // Minification and compression
      minify: isProduction ? 'terser' : false,
      terserOptions: isProduction ? {
        compress: {
          drop_console: true,
          drop_debugger: true,
          pure_funcs: ['console.log', 'console.info', 'console.debug'],
          passes: 2
        },
        mangle: {
          safari10: true
        },
        format: {
          comments: false
        }
      } : {},
      // Source maps - only in production for debugging
      sourcemap: isProduction ? 'hidden' : true,
      // Target modern browsers for smaller bundles
      target: ['es2020', 'chrome80', 'firefox78', 'safari14', 'edge88'],
      // CSS code splitting
      cssCodeSplit: true,
      // Asset optimization
      assetsInlineLimit: 4096, // 4kb
      // Chunk size warnings
      chunkSizeWarningLimit: 500,
      // Report compressed size
      reportCompressedSize: isProduction,
      // CSS minification
      cssMinify: isProduction
    },
  
  // Development optimizations
  server: {
    // Enable HTTP/2 for development
    https: false,
    // Optimize HMR
    hmr: {
      overlay: true
    }
  },
  
  // Asset optimization
  assetsInclude: ['**/*.svg', '**/*.png', '**/*.jpg', '**/*.jpeg', '**/*.gif', '**/*.webp'],
  
  // Plugin optimizations
  optimizeDeps: {
    include: ['./src/utils/config.js'],
    exclude: ['./src/test/**']
  },
  
  // Test configuration
  test: {
    environment: 'jsdom',
    globals: true,
    setupFiles: ['./src/test/setup.js'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      exclude: [
        'node_modules/',
        'src/test/',
        '**/*.test.js',
        '**/*.config.js',
        'coverage/',
        'dist/'
      ],
      thresholds: {
        global: {
          branches: 80,
          functions: 80,
          lines: 80,
          statements: 80
        }
      }
    },
    testTimeout: 10000,
    hookTimeout: 10000,
    teardownTimeout: 5000,
    isolate: true,
    pool: 'threads',
    poolOptions: {
      threads: {
        singleThread: true
      }
    }
  }
})