# 🗺️ NapRoute

A modern, mobile-first web application that helps users find the optimal route to their destination and then provides navigation assistance for the perfect nap timing during the journey.

## ✨ Features

- **Smart Route Calculation**: Find the best route to your destination
- **Nap Time Optimization**: Calculate optimal nap duration based on travel time
- **Mobile-First Design**: Optimized for smartphones and tablets
- **Real-time Navigation**: Integration with device navigation systems
- **Location Services**: Automatic location detection and address validation
- **Offline Support**: Service worker for basic offline functionality
- **Accessibility**: Full WCAG compliance for all users

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ 
- Google Maps API key
- Modern web browser

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/napRoute.git
cd napRoute

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env.development
# Edit .env.development with your Google Maps API key

# Start development server
npm run dev
```

Visit `http://localhost:5173` to see the app in action!

## 🛠️ Development

### Available Scripts

```bash
# Development
npm run dev              # Start development server
npm run build           # Build for production
npm run preview         # Preview production build

# Testing
npm run test            # Run tests in watch mode
npm run test:run        # Run tests once
npm run test:ci         # Run all tests for CI
npm run test:coverage   # Generate coverage report

# Deployment
npm run deploy:netlify  # Deploy to Netlify
npm run deploy:vercel   # Deploy to Vercel
npm run deploy:aws      # Deploy to AWS
```

### Project Structure

```
napRoute/
├── src/
│   ├── components/     # UI components
│   ├── controllers/    # Application controllers
│   ├── services/       # Business logic services
│   ├── state/         # Application state management
│   ├── styles/        # CSS styles
│   ├── test/          # Test files
│   └── utils/         # Utility functions
├── public/            # Static assets
├── docs/              # Documentation
├── scripts/           # Build and deployment scripts
└── .kiro/             # Kiro IDE specifications
```

## 🌐 Deployment

### Netlify (Recommended)

1. Connect your GitHub repository to Netlify
2. Set environment variables in Netlify dashboard
3. Deploy automatically on push to main branch

### AWS (Enterprise)

```bash
# Set up AWS infrastructure
npm run setup:aws

# Deploy to AWS
npm run deploy:aws
```

### Vercel

```bash
# Deploy to Vercel
npm run deploy:vercel
```

For detailed deployment instructions, see:
- [AWS Deployment Guide](docs/aws-deployment-complete-guide.md)
- [Netlify Deployment Guide](NETLIFY_DEPLOYMENT_GUIDE.md)
- [General Deployment Guide](DEPLOYMENT.md)

## 🔧 Configuration

### Environment Variables

```bash
# Google Maps API Configuration
VITE_GOOGLE_MAPS_API_KEY=your_api_key_here

# Application Environment
VITE_APP_ENVIRONMENT=development
VITE_APP_VERSION=1.0.0
```

### Google Maps API Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing
3. Enable Maps JavaScript API and Directions API
4. Create API key and set restrictions
5. Add key to your environment variables

See [Google Maps API Setup Guide](docs/google-maps-api-setup.md) for detailed instructions.

## 🧪 Testing

The project includes comprehensive testing:

- **Unit Tests**: Component and service testing
- **Integration Tests**: End-to-end workflow testing
- **Performance Tests**: Core Web Vitals monitoring
- **Accessibility Tests**: WCAG compliance validation

```bash
# Run all tests
npm run test:ci

# Run specific test suites
npm run test:unit
npm run test:integration
npm run test:performance
```

## 📱 Mobile Testing

The app is optimized for mobile devices. Test on:

- iOS Safari (iPhone/iPad)
- Android Chrome
- Various screen sizes and orientations

See [Mobile Testing Guide](docs/mobile-testing-guide.md) for detailed testing procedures.

## 🔒 Security

- Environment variables for sensitive data
- Content Security Policy (CSP) headers
- HTTPS enforcement in production
- API key restrictions and quotas
- Input validation and sanitization

## 📊 Performance

- Lighthouse score: 95+ (Performance, Accessibility, Best Practices, SEO)
- Core Web Vitals optimized
- Code splitting and lazy loading
- Service worker for caching
- CDN distribution for global performance

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow existing code style and patterns
- Write tests for new features
- Update documentation as needed
- Ensure accessibility compliance
- Test on multiple devices and browsers

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Google Maps API for mapping and routing services
- Vite for fast development and building
- Vitest for testing framework
- Modern web standards and best practices

## 📞 Support

- **Documentation**: Check the `docs/` folder for detailed guides
- **Issues**: Report bugs and feature requests on GitHub Issues
- **Discussions**: Join community discussions on GitHub Discussions

## 🗺️ Roadmap

- [ ] Offline map caching
- [ ] Multi-language support
- [ ] Advanced route preferences
- [ ] Integration with more navigation apps
- [ ] Real-time traffic updates
- [ ] Social sharing features

---

**Built with ❤️ for better travel experiences**